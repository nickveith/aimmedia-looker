view: complaints {
  sql_table_name: PUBLIC.EMAIL_COMPLAINTS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: batch_id {
    type: string
    sql: ${TABLE}.BATCH_ID ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.DOMAIN ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.EMAIL_ADDRESS ;;
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.EVENT_DATE ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.EVENT_TYPE ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}.SUBSCRIBER_KEY ;;
  }

  dimension: triggered_send_external_key {
    type: string
    sql: ${TABLE}.TRIGGERED_SEND_EXTERNAL_KEY ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: complaints {
    type: count
    drill_fields: [id]
  }

  measure: unique_complaints {
    type: count_distinct
    sql: ${client_id}||' '||${send_id}||' '||${subscriber_id};;
    drill_fields: [id]
  }

  measure: complaint_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_complaints} / nullif(${sends.unique_sends},0) ;;
    drill_fields: [id]
  }
}
