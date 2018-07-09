view: clicks {
  sql_table_name: PUBLIC.EMAIL_CLICKS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.ALIAS ;;
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

  dimension_group: click_date {
    type: time
    timeframes: [date, day_of_week, week, day_of_month, month_name, month, year, quarter_of_year]
    sql: ${TABLE}.EVENT_DATE ;;
  }


  dimension: event_timestamp {
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

  dimension: is_unique_for_url {
    type: yesno
    sql: ${TABLE}.IS_UNIQUE_FOR_URL ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: send_url_id {
    type: number
    sql: ${TABLE}.SEND_URL_ID ;;
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

  dimension: full_url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: url {
    type: string
    sql: substring(regexp_substr(${TABLE}.URL, '^https?://[^\?]+'),1,100) ;;
  }

  dimension: url_id {
    type: number
    sql: ${TABLE}.URL_ID ;;
  }

  measure: clicks {
    type: count
    drill_fields: [id]
  }

  measure: unique_clicks {
    type: count_distinct
    sql: ${client_id}||' '||${send_id}||' '||${subscriber_id};;
    drill_fields: [id]
  }

  measure: click_through_rate {
    type: number
    label:"CTR"
    value_format_name: percent_2
    sql:  1.0 * ${clicks} / nullif(${sends.sends},0) ;;
    drill_fields: [id]
  }

  measure: click_to_open_rate {
    type: number
    label:"CTOR"
    value_format_name: percent_2
    sql:  1.0 * ${clicks} / nullif(${opens.opens},0) ;;
    drill_fields: [id]
  }

  measure: click_through_rate_unique {
    type: number
    label:"CTR (Unique)"
    value_format_name: percent_2
    sql:  1.0 * ${unique_clicks} / nullif(${sends.unique_sends},0) ;;
    drill_fields: [id]
  }

  measure: click_to_open_rate_unique {
    type: number
    label: "CTOR (Unique)"
    value_format_name: percent_2
    sql:  1.0 * ${unique_clicks} / nullif(${opens.unique_opens},0) ;;
    drill_fields: [id]
  }
}
