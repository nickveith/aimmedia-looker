view: ga_traffic_by_channel {
  sql_table_name: PUBLIC.GA_TRAFFIC_BY_CHANNEL ;;

  dimension: property_id {
    hidden: yes
    type: string
    sql: ${TABLE}.PROPERTY_ID ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."ChannelGrouping" ;;
  }

  dimension: report_date {
    type: date
    sql: ${TABLE}."Date" ;;
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

}
