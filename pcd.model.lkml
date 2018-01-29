connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"



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
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${pcd_contracts.client_code}
      and ${pcd_publisher.pub_code} =  ${pcd_contracts.pub_code} ;;
    relationship: many_to_one
  }
  join: pcd_pub_source {
    type: left_outer
    sql_on: ${pcd_contracts.client_code} = ${pcd_pub_source.client_code}
        and ${pcd_contracts.pub_code} = ${pcd_pub_source.pub_code}
        and case when substring(${pcd_contracts.source_key_code},1,2) = ${pcd_pub_source.source_code} then true
                 when substring(${pcd_contracts.source_key_code},1,1) = ${pcd_pub_source.source_code} then true
                 else false end ;;
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
        and (
              (  ${pcd_issues.date_offsale_date} >= dateadd(months, -6 - 3, ${contracts_over_time.calendar_date})
             and ${pcd_issues.date_offsale_date} <  dateadd(months, -6   , ${contracts_over_time.calendar_date}) )
              OR
              (  ${pcd_issues.date_onsale_date} <= dateadd(months, -6 - 3 , ${contracts_over_time.calendar_date})
             and ${pcd_issues.date_offsale_date} > dateadd(months, -6 - 3 , ${contracts_over_time.calendar_date}) )
            ) ;;
    relationship: one_to_many
  }
  join: pcd_publisher {
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${pcd_issues.client_code}
      and ${pcd_publisher.pub_code} =  ${pcd_issues.pub_code} ;;
    relationship: many_to_one
  }
  join: contracts {
    from:  pcd_contracts
    type:  left_outer
    sql_on: ${contracts_over_time.calendar_date} >= ${contracts.start_date}
        and ${contracts_over_time.calendar_date} <  ${contracts.expiration_date} ;;
    relationship: many_to_one
  }
  join: expirations {
    from:  pcd_contracts
    type: left_outer
    sql_on: ${pcd_issues.issue} = ${expirations.expiration_issue}
        and ${pcd_issues.client_code} = ${expirations.client_code}
        and ${pcd_issues.pub_code} = ${expirations.pub_code};;
    relationship: one_to_many
  }
  join: renewals {
      from:  pcd_contracts
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
        and case when substring(${expirations.source_key_code},1,2) = ${expiration_source.source_code} then true
                 when substring(${expirations.source_key_code},1,1) = ${expiration_source.source_code} then true
                 else false end ;;
    relationship: many_to_one
  }
  join: renewal_source {
    from: pcd_pub_source
    type: left_outer
    sql_on: ${renewal_source.client_code} = ${expirations.client_code}
        and ${renewal_source.pub_code} = ${expirations.pub_code}
        and case when substring(${expirations.source_key_code},1,2) = ${renewal_source.source_code} then true
                 when substring(${expirations.source_key_code},1,1) = ${renewal_source.source_code} then true
                 else false end ;;
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
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${pcd_current.client_code}
        and ${pcd_publisher.pub_code} =  ${pcd_current.pub_code} ;;
    relationship: many_to_one
  }
  join: current_source {
    from: pcd_pub_source
    type: left_outer
    sql_on: ${current_source.client_code} = ${pcd_current.client_code}
        and ${current_source.pub_code} = ${pcd_current.pub_code}
        and case when substring(${pcd_current.source_key_code},1,2) = ${current_source.source_code} then true
                 when substring(${pcd_current.source_key_code},1,1) = ${current_source.source_code} then true
                 else false end ;;
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
