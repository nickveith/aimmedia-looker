connection: "snowflake"

# include all the views
include: "*.view"

######datagroups for caching and PDT rebuilds
datagroup: daily {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "30 hours"
}

datagroup: monthly {
#   sql_trigger: SELECT max(id) from pcd_log ;;
sql_trigger: select DATE_TRUNC('month',CURRENT_DATE()) ;;
max_cache_age: "840 hours"
}

explore: snapshots {
  from: pcd_subscriber_rollup
  label: "Subscribers (Over Time)"
  description: "Active contracts by date"
  persist_with: monthly
  join: pcd_publisher {
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${snapshots.client_code}
      and ${pcd_publisher.pub_code} =  ${snapshots.pub_code} ;;
    relationship: many_to_one
  }
}

explore: pcd_contracts {
  from: pcd_contracts
  label: "Contracts (Over Time)"
  description: "Active contracts by date"
  persist_with: monthly
  join: calendar_date {
    type: inner
    sql_on: ${calendar_date.calendar_date} >= ${pcd_contracts.start_date}
        and ${calendar_date.calendar_date} <  ${pcd_contracts.expiration_date}
        and ${calendar_date.day_of_month} = 1
        and ${calendar_date.calendar_year} >= 2008
        and ${calendar_date.calendar_year} <= 2028;;
    relationship: many_to_one
  }
  join: pcd_publisher {
    type: inner
    sql_on: ${pcd_publisher.client_code} = ${pcd_contracts.client_code}
      and ${pcd_publisher.pub_code} =  ${pcd_contracts.pub_code} ;;
    relationship: many_to_one
  }
  join: pcd_pub_source {
    type: left_outer
    sql_on: ${pcd_contracts.client_code} = ${pcd_pub_source.client_code}
        and ${pcd_contracts.pub_code} = ${pcd_pub_source.pub_code}
        and ${pcd_contracts.source_code} = ${pcd_pub_source.source_code} ;;
    relationship: many_to_one
  }
  join: pcd_current {
    type: left_outer
    sql_on: ${pcd_current.account_id} = ${pcd_contracts.account_id};;
    relationship: many_to_one
  }
  join: expiration_date {
    from: calendar_date
    type: left_outer
    sql_on: ${expiration_date.calendar_date} >= ${pcd_contracts.expiration_date}
        and ${expiration_date.calendar_date} <  dateadd(months, 1, ${pcd_contracts.expiration_date}) ;;
    relationship: many_to_one
  }
}

explore: contracts_over_time {
  from: calendar_date
  label: "Expirations (Over Time)"
  description: "Active contracts by date"
  persist_with: monthly
  always_filter: {
    filters: {
      field: day_of_month
      value: "1"
      }
  }
  join: pcd_issues {
    type: inner
    sql_on: ${contracts_over_time.day_of_month} = 1
        and ${pcd_issues.date_onsale_date} >= dateadd(months, -6 - 12, ${contracts_over_time.calendar_date})
        and ${pcd_issues.date_onsale_date} <  dateadd(months, -6   , ${contracts_over_time.calendar_date}) ;;
    relationship: one_to_many
  }
  join: pcd_publisher {
    type: inner
    sql_on: ${pcd_publisher.client_code} = ${pcd_issues.client_code}
      and ${pcd_publisher.pub_code} =  ${pcd_issues.pub_code} ;;
    relationship: many_to_one
  }
  join: expirations {
    from:  pcd_expirations
    type: left_outer
    sql_on: ${pcd_issues.issue} = ${expirations.expiration_issue}
        and ${pcd_issues.client_code} = ${expirations.client_code}
        and ${pcd_issues.pub_code} = ${expirations.pub_code};;
    relationship: one_to_many
  }
  join: renewals {
      from:  pcd_renewals
      type: left_outer
      sql_on: ${expirations.account_id} = ${renewals.account_id}
          and ${expirations.contract_number} + 1 = ${renewals.contract_number};;
      relationship: one_to_many
    }
  join: expiration_source {
    from: pcd_pub_source
    type: left_outer
    sql_on: ${expiration_source.client_code} = ${expirations.client_code}
        and ${expiration_source.pub_code} = ${expirations.pub_code}
        and ${expiration_source.source_code} = ${expirations.source_code} ;;
    relationship: many_to_one
  }
  join: renewal_source {
    from: pcd_pub_source
    type: left_outer
    sql_on: ${renewal_source.client_code} = ${renewals.client_code}
        and ${renewal_source.pub_code} = ${renewals.pub_code}
        and ${renewal_source.source_code} = ${renewals.source_code} ;;
    relationship: many_to_one
  }
}

explore: current {
  from: pcd_current
  view_name: pcd_current
  view_label: "Subscribers"
  label: "Subscribers (Current)"
  description: "Current subscriber status"
  persist_with: monthly
  join: pcd_publisher {
    view_label: "Publication"
    type: inner
    sql_on: ${pcd_publisher.client_code} = ${pcd_current.client_code}
        and ${pcd_publisher.pub_code} =  ${pcd_current.pub_code} ;;
    relationship: many_to_one
  }
  join: current_source {
    from: pcd_pub_source
    type: left_outer
    sql_on: ${current_source.client_code} = ${pcd_current.client_code}
        and ${current_source.pub_code} = ${pcd_current.pub_code}
        and ${pcd_current.source_code} = ${current_source.source_code} ;;
    relationship: many_to_one
  }
  join: pcd_contracts {
    view_label: "Contracts"
    type: left_outer
    fields: [measures*]
    sql_on: ${pcd_current.pcd_account_number} = ${pcd_contracts.pcd_account_number}
        and ${pcd_current.client_code} = ${pcd_contracts.client_code}
        and ${pcd_current.pub_code} = ${pcd_contracts.pub_code} ;;
    relationship: one_to_many
  }
  join: pcd_contract_original {
    view_label: "Subscribers"
    from: pcd_contracts
    type: left_outer
    fields: [pcd_contract_original.start_date]
    sql_on: ${pcd_current.pcd_account_number} = ${pcd_contracts.pcd_account_number}
        and ${pcd_current.client_code} = ${pcd_contracts.client_code}
        and ${pcd_current.pub_code} = ${pcd_contracts.pub_code}
        and ${pcd_contracts.contract_number} = 1;;
    relationship: one_to_many
  }
  join: pcd_current_extended {
    view_label: "Subscribers"
    from: pcd_current_extended
    type: left_outer
    fields: [pcd_current_extended.name
            ,pcd_current_extended.email_addr_1
            ,pcd_current_extended.company_name
            ,pcd_current_extended.street_address
            ,pcd_current_extended.city
            ,pcd_current_extended.stateprovince
            ,pcd_current_extended.country
            ,pcd_current_extended.zip
            ]
    sql_on: ${pcd_current.record_id} = ${pcd_current_extended.record_id};;
    relationship: one_to_one
  }
}

explore: print_pub_overlap {
  from: pcd_current
  view_name:  pcd_current
  view_label: "Publication"
  hidden: yes
  persist_with: monthly
  join: pcd_publisher {
    view_label: "Publication"
    type: inner
    sql_on: ${pcd_publisher.client_code} = ${pcd_current.client_code}
      and ${pcd_publisher.pub_code} =  ${pcd_current.pub_code}
      and ${pcd_current.subscription_status} = 'ACTIVE'
      and ${pcd_current.subcriber_type} != '3'
      and ${pcd_publisher.active} = True;;
    relationship: many_to_one
    fields: [pcd_publisher.group, pcd_publisher.publication, pcd_publisher.active]
  }
  join: pcd_subscriber_overlap {
    from: pcd_subscriber_overlap
    view_label: "Overlap"
    type: left_outer
    sql_on: ${pcd_current.pcd_match_code} = ${pcd_subscriber_overlap.pcd_match_code} ;;
    relationship: one_to_many
    fields: [pcd_subscriber_overlap.overlapping_subscribers, pcd_subscriber_overlap.subscription_status, pcd_subscriber_overlap.is_subscriber]
  }
  join: overlap_publisher {
    from: pcd_publisher
    view_label: "Overlap"
    type: inner
    sql_on: ${pcd_subscriber_overlap.client_code} = ${overlap_publisher.client_code}
      and ${pcd_subscriber_overlap.pub_code} =  ${overlap_publisher.pub_code}
      and ${pcd_subscriber_overlap.subscription_status} = 'ACTIVE'
      and ${pcd_subscriber_overlap.subcriber_type} != '3'
      and ${overlap_publisher.active} = True;;
    relationship: many_to_one
    fields: [overlap_publisher.group, overlap_publisher.publication, overlap_publisher.active]
  }
}
