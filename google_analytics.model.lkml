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

persist_with: daily


explore: analytics {
#   persist_with: default
  from: ga_accounts
  view_name: account
  join: profile {
    from:  ga_profiles
    sql_on: ${account.id} = ${profile.account_id};;
    relationship: one_to_many
  }
  join: reporting {
    from:  ga_traffic_by_source
    sql_on: ${profile.id} = ${reporting.property_id};;
    relationship: one_to_many
  }
  join: report_date {
    from: calendar_date
    sql_on: ${reporting.report_date} = ${report_date.calendar_date};;
    relationship: one_to_one
  }
  join: brand {
    from: aim_brand
    sql_on: ${profile.id} = ${brand.ga_property} ;;
    relationship: one_to_one
  }
  join: group {
    from: aim_group
    sql_on: ${brand.group_id} = ${group.id} ;;
    relationship: one_to_one
  }
  always_filter: {
    filters: {
      field: profile.is_primary
      value: "True"
    }
  }
}

explore: analytics_monthly {
#   persist_with: default
  from: ga_accounts
  view_name: account
  join: profile {
    from:  ga_profiles
    sql_on: ${account.id} = ${profile.account_id};;
    relationship: one_to_many
  }
  join: reporting {
    from:  ga_monthly
    sql_on: ${profile.id} = ${reporting.property_id};;
    relationship: one_to_many
  }
  join: report_date {
    from: calendar_date
    sql_on: ${reporting.month_begin} = ${report_date.calendar_date};;
    relationship: one_to_one
  }
  join: brand {
    from: aim_brand
    sql_on: ${profile.id} = ${brand.ga_property} ;;
    relationship: one_to_one
  }
  join: group {
    from: aim_group
    sql_on: ${brand.group_id} = ${group.id} ;;
    relationship: one_to_one
  }
}

explore: analytics_by_channel {
#   persist_with: default
  from: ga_accounts
  view_name: account
  join: profile {
    from:  ga_profiles
    sql_on: ${account.id} = ${profile.account_id};;
    relationship: one_to_many
  }
  join: reporting {
    from:  ga_traffic_by_channel
    sql_on: ${profile.id} = ${reporting.property_id};;
    relationship: one_to_many
  }
  join: report_date {
    from: calendar_date
    sql_on: ${reporting.report_date} = ${report_date.calendar_date};;
    relationship: one_to_one
  }
  join: brand {
    from: aim_brand
    sql_on: ${profile.id} = ${brand.ga_property} ;;
    relationship: one_to_one
  }
  join: group {
    from: aim_group
    sql_on: ${brand.group_id} = ${group.id} ;;
    relationship: one_to_one
  }
}

explore: analytics_unique {
#   persist_with: default
  from: ga_accounts
  view_name: account
  join: profile {
    from:  ga_profiles
    sql_on: ${account.id} = ${profile.account_id};;
    relationship: one_to_many
  }
  join: users {
    from:  ga_users
    sql_on: ${profile.id} = ${users.property_id};;
    relationship: one_to_many
  }
  join: report_date {
    from: calendar_date
    sql_on: ${users.daydate_date} = ${report_date.calendar_date};;
    relationship: one_to_one
  }
  join: brand {
    from: aim_brand
    sql_on: ${profile.id} = ${brand.ga_property} ;;
    relationship: one_to_one
  }
  join: group {
    from: aim_group
    sql_on: ${brand.group_id} = ${group.id} ;;
    relationship: one_to_one
  }
}
