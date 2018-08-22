view: all_subscribers {
  sql_table_name: PUBLIC.ALL_SUBSCRIBERS ;;

  dimension: bounce_count {
    type: string
    sql: ${TABLE}.BOUNCE_COUNT ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension_group: date_joined {
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
    sql: ${TABLE}.DATE_JOINED ;;
  }

  dimension_group: date_undeliverable {
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
    sql: ${TABLE}.DATE_UNDELIVERABLE ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.DOMAIN ;;
  }

  dimension: email_address {
    type: string
    sql: lower(${TABLE}.EMAIL_ADDRESS) ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.LOCALE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}.SUBSCRIBER_KEY ;;
  }

  dimension: subscriber_type {
    type: string
    sql: ${TABLE}.SUBSCRIBER_TYPE ;;
  }

  dimension_group: unsub {
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
    sql: ${TABLE}.UNSUB_DATE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
