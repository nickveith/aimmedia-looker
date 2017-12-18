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
  from: calendar_date
  view_name: calendar_date
  label: "Subscribers (Over Time)"
  description: "Active contracts by date"
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

explore: current {
  from: pcd_current
  view_name: pcd_current
  label: "Susbcribers (Current)"
  description: "Current subscriber status"
  persist_with: monthly
  join: pcd_publisher {
    type: left_outer
    sql_on: ${pcd_publisher.client_code} = ${pcd_current.client_code}
        and ${pcd_publisher.pub_code} =  ${pcd_current.pub_code} ;;
    relationship: many_to_one
  }
  join: calendar_date {
    type: left_outer
    sql_on: ${pcd_current.original_start_date_date} = ${calendar_date.calendar_date} ;;
    relationship: many_to_one
  }
}
