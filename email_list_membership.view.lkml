view: email_list_membership {
  sql_table_name: PUBLIC.EMAIL_LIST_MEMBERSHIP ;;

  dimension: client_id {
    type: number
    sql: ${TABLE}."CLIENT_ID" ;;
  }

  dimension_group: joined {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE_JOINED" ;;
  }

  dimension_group: unsubscribed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE_UNSUBSCRIBED" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension: join_type {
    type: string
    sql: ${TABLE}."JOIN_TYPE" ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}."LIST_ID" ;;
  }

  dimension: list_name {
    type: string
    sql: ${TABLE}."LIST_NAME" ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}."SUBSCRIBER_ID" ;;
  }

  dimension: susbcriber_key {
    type: string
    sql: ${TABLE}."SUSBCRIBER_KEY" ;;
  }

  dimension: unsubscribe_reason {
    type: string
    sql: ${TABLE}."UNSUBSCRIBE_REASON" ;;
  }

}
