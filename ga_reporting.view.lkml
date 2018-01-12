view: ga_reporting {
  sql_table_name: PUBLIC.GA_REPORTING ;;

  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}.AvgSessionDuration ;;
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}.BounceRate ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.Browser ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.Campaign ;;
  }

  dimension: channel_grouping {
    type: string
    sql: ${TABLE}.ChannelGrouping ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.Date ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.DeviceCategory ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.Medium ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.NewUsers ;;
  }

  dimension: pageviews_per_session {
    type: number
    sql: ${TABLE}.PageviewsPerSession ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}.PROPERTY_ID ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.Sessions ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: transaction_revenue {
    type: number
    sql: ${TABLE}.TransactionRevenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.Transactions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.Users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
