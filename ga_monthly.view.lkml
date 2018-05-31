view: ga_monthly {
  sql_table_name: PUBLIC.GA_MONTHLY ;;

  dimension: property_id {
    hidden: yes
    type: string
    sql: ${TABLE}.PROPERTY_ID ;;
  }

  dimension: month_begin {
    hidden: yes
    type: date
    sql: ${TABLE}.MONTH ;;
  }

  measure: bounces {
    type: sum
    sql: ${TABLE}."Bounces" ;;
  }

  measure: new_users {
    type: sum
    sql: ${TABLE}."NewUsers" ;;
  }

  measure: pageviews {
    type: sum
    sql: ${TABLE}."Pageviews" ;;
  }

  measure: total_session_duration {
    hidden:  yes
    type: sum
    sql: ${TABLE}."SessionDuration" ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}."Sessions" ;;
  }

  measure: transaction_revenue {
    type: sum
    sql: ${TABLE}."TransactionRevenue" ;;
  }

  measure: transactions {
    type: sum
    sql: ${TABLE}."Transactions" ;;
  }

  measure: users {
    type: sum
    sql: ${TABLE}."Users" ;;
  }

  measure: pageviews_per_session {
    type: number
    value_format_name: decimal_2
    sql: CASE WHEN ${sessions} = 0 THEN 0
              ELSE ${pageviews} / ${sessions}
              END;;
  }

  measure: avg_session_duration {
    type: number
    value_format_name: decimal_2
    sql: CASE WHEN ${sessions} = 0 THEN 0
              ELSE ${total_session_duration} / ${sessions}
              END;;
  }

  measure: percent_new_users {
    type: number
    sql: CASE WHEN SUM(${TABLE}."Users") = 0 THEN 0
              ELSE SUM(${TABLE}."NewUsers") / SUM(${TABLE}."Users")
              END;;
  }

  ## Dynamic Measure Select

  parameter: primary_metric_name {
    type: string
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
      value: "pageviews_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "percent_new_users"
      label: "% New Users"
    }
  }

  parameter: second_metric_name {
    type: string
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
      value: "pageviews_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "percent_new_users"
      label: "% New Users"
    }
  }

  measure: primary_metric {
    sql: case when {% parameter primary_metric_name %} = 'pageviews' then ${pageviews}
              when {% parameter primary_metric_name %} = 'users' then ${users}
              when {% parameter primary_metric_name %} = 'sessions' then ${sessions}
              when {% parameter primary_metric_name %} = 'pageviews_per_session' then ${pageviews_per_session}
              when {% parameter primary_metric_name %} = 'percent_new_users' then ${percent_new_users}
          end ;;
    type: number
    label_from_parameter: primary_metric_name
  }
  measure: second_metric {
    sql: case when {% parameter second_metric_name %} = 'pageviews' then ${pageviews}
              when {% parameter second_metric_name %} = 'users' then ${users}
              when {% parameter second_metric_name %} = 'sessions' then ${sessions}
              when {% parameter second_metric_name %} = 'pageviews_per_session' then ${pageviews_per_session}
              when {% parameter second_metric_name %} = 'percent_new_users' then ${percent_new_users}
          end;;
    type: number
    label_from_parameter: second_metric_name
  }


}
