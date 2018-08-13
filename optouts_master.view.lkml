view: optouts_master {
  sql_table_name: PUBLIC.OPTOUTS_MASTER ;;

  dimension: bu_code {
    type: string
    sql: ${TABLE}.bu_code ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EventDate ;;
  }

  dimension: job_id {
    type: number
    sql: ${TABLE}.JobID ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}.newsletter_id ;;
  }

  dimension: optout_source {
    type: string
    sql: ${TABLE}.optout_source ;;
  }

  dimension: optout_type {
    type: string
    sql: ${TABLE}.optout_type ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}.SubscriberKey ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
