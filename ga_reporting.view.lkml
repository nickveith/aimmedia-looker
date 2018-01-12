view: ga_reporting {
  sql_table_name: PUBLIC.GA_REPORTING ;;

  dimension: property_id {
    type: number
    sql: ${TABLE}."PROPERTY_ID" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."Browser" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."ChannelGrouping" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}."Campaign" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."Source" ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}."Medium" ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}."DeviceCategory" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."Date"::date ;;
  }

  ####################################

  measure: new_users {
    type: number
    sql: SUM(${TABLE}."NewUsers") ;;
  }

  measure: pageviews_per_session {
    type: number
    sql: SUM(${TABLE}."PageviewsPerSession" * ${TABLE}."Sessions") / ${TABLE}."Sessions" ;;
  }

  measure: avg_session_duration {
    type: number
    sql: SUM(${TABLE}."AvgSessionDuration") ;;
  }

  measure: bounces {
    type: number
    sql: SUM(${TABLE}."BounceRate" * ${TABLE}."Sessions") ;;
  }

  measure: bounce_rate {
    type: number
    sql: ${bounces} / ${sessions} ;;
  }

  measure: transaction_revenue {
    type: number
    sql: SUM(${TABLE}."TransactionRevenue") ;;
  }

  measure: transactions {
    type: number
    sql: SUM(${TABLE}."Transactions") ;;
  }

  measure: sessions {
    type: number
    sql: SUM(${TABLE}."Sessions") ;;
    drill_fields: [channel, campaign, source, medium]
  }

  measure: users {
    type: number
    sql: SUM(${TABLE}."Users") ;;
  }

  measure: pageviews {
    type: number
    sql: SUM(${TABLE}."PageviewsPerSession" * ${TABLE}."Sessions") ;;
  }

  measure: avg_pageviews {
    type: number
    sql: ${pageviews} / ${sessions} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

}
