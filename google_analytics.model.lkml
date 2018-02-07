connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

view: ga_reporting_extended {
  sql_table_name: PUBLIC.GA_TRAFFIC ;;
  extends: [ga_reporting]
  label: "reporting"


  parameter: primary_metric_name {
    type: unquoted
    default_value: "pageviews"
    allowed_value: {
      value: "pageviews"
      label: "Pageviews"
    }
    allowed_value: {
      value: "users"
      label: "Users"
    }
    allowed_value: {
      value: "sessions"
      label: "Sessions"
    }
    allowed_value: {
      value: "pages_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "pct_new_visitor"
      label: "% New Visitor"
    }

  }

  parameter: second_metric_name {
    type: string
    allowed_value: {
      value: "pageviews"
      label: "Pageviews"
    }
    allowed_value: {
      value: "Users"
      label: "Users"
    }
    allowed_value: {
      value: "sessions"
      label: "Sessions"
    }
    allowed_value: {
      value: "pages_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "pct_new_visitor"
      label: "% New Visitor"
    }
  }


  measure: pageviews {
    label: "Pageviews"
    type: sum
  }
  measure: sessions {
    label: "Sessions"
    type: sum
  }


#
#   measure: pages_per_session {
#     sql: ${pageviews}/${sessions} ;;
#     type: number
#     value_format_name: decimal_2
#   }

  measure: primary_metric {
    sql: ${TABLE}.{% parameter primary_metric_name %};;
    type: sum
    label_from_parameter: primary_metric_name
  }
  measure: second_metric {
    sql: ${TABLE}.{% parameter second_metric_name %};;
    type: sum
    label_from_parameter: second_metric_name
  }


}


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
  join: ga_reporting_extended {
    sql_on: ${profile.id} = ${ga_reporting_extended.property_id};;
    relationship: one_to_many
  }
  join: report_date {
    from: calendar_date
    sql_on: ${ga_reporting_extended.date} = ${report_date.calendar_date};;
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
}
