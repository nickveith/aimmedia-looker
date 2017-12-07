connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# datagroup: default {
#   sql_trigger: SELECT CURRENT_DATE ;;
#   max_cache_age: "30 hours"
# }
# persist_with: default

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

explore: pcd_log {
  hidden: yes
}

explore: pcd_snapshots {
  label: "Accounts"
  join: pcd_publisher {
    view_label: "Publisher"
    type: left_outer
    sql_on: ${pcd_snapshots.client_code} = ${pcd_publisher.client_code}
      AND ${pcd_snapshots.pub_code} = ${pcd_publisher.pub_code}
      AND ${pcd_publisher.frequency} is not null;;
      relationship: many_to_one
  }
}
