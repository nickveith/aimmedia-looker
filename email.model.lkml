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

persist_with: daily


explore: sends {
#   persist_with: default
  from: sends
  join:  lists {
    type: left_outer
    sql_on: ${sends.list_id} = ${lists.list_id};;
    relationship: many_to_one
  }
  join:  send_jobs {
    type: left_outer
    sql_on: ${sends.client_id} = ${send_jobs.client_id}
        and ${sends.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join:  opens {
    type: left_outer
    sql_on: ${sends.client_id} = ${opens.client_id}
        and ${sends.send_id} = ${opens.send_id}
        and ${sends.subscriber_id} = ${opens.subscriber_id} ;;
    relationship: one_to_many
    }
  join:  clicks {
    type: left_outer
    sql_on: ${sends.client_id} = ${clicks.client_id}
        and ${sends.send_id} = ${clicks.send_id}
        and ${sends.subscriber_id} = ${clicks.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  unsubs {
    type: left_outer
    sql_on: ${sends.client_id} = ${unsubs.client_id}
        and ${sends.send_id} = ${unsubs.send_id}
        and ${sends.subscriber_id} = ${unsubs.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  bounces {
    type: left_outer
    sql_on: ${sends.client_id} = ${bounces.client_id}
        and ${sends.send_id} = ${bounces.send_id}
        and ${sends.subscriber_id} = ${bounces.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  complaints {
    type: left_outer
    sql_on: ${sends.client_id} = ${complaints.client_id}
        and ${sends.send_id} = ${complaints.send_id}
        and ${sends.subscriber_id} = ${complaints.subscriber_id} ;;
    relationship: one_to_many
  }
  }

explore: snapshots {
  from: calendar_date
  view_name: calendar_date
  label: "Contract Snapshots"
  persist_with: monthly
  join: pcd_contracts {
    type: left_outer
    sql_on: ${calendar_date.calendar_date} >= ${pcd_contracts.start_date}
        and ${calendar_date.calendar_date} < ${pcd_contracts.expiration_date} ;;
    relationship: one_to_many
  }
  join: pcd_publisher {
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${pcd_contracts.client_code}
        and ${pcd_publisher.pub_code} =  ${pcd_contracts.pub_code} ;;
    relationship: one_to_many
  }
}


explore: contracts {
  from: pcd_log
  label: "Contracts (Current)"
  description: "Current status of all contracts"
}
