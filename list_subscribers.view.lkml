view: list_subscribers {
  sql_table_name: PUBLIC.LIST_SUBSCRIBERS ;;

  dimension: add_method {
    type: string
    sql: ${TABLE}.ADD_METHOD ;;
  }

  dimension: added_by {
    type: number
    sql: ${TABLE}.ADDED_BY ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CREATED_DATE ;;
  }

  dimension: email_address {
    type: string
    sql: lower(${TABLE}.EMAIL_ADDRESS) ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}.LIST_NAME ;;
  }

  dimension: list_type {
    type: string
    sql: ${TABLE}.LIST_TYPE ;;
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
    drill_fields: [list_name]
  }
}
