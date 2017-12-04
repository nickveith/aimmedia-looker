view: email_opens {
  sql_table_name: PUBLIC.EMAIL_OPENS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: batch_id {
    type: number
    sql: ${TABLE}.BATCH_ID ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
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

  dimension: is_unique {
    type: yesno
    sql: ${TABLE}.IS_UNIQUE ;;
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

  dimension: triggered_send_external_id {
    type: string
    sql: ${TABLE}.TRIGGERED_SEND_EXTERNAL_ID ;;
  }

  measure: opens {
    type: count
    drill_fields: [id]
  }

  measure: unique_opens {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }

  measure: open_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_opens} / nullif(${sends.unique_sends},0) ;;
    drill_fields: [id]
  }

}
