view: send_jobs {
  sql_table_name: PUBLIC.EMAIL_SEND_JOBS ;;

  dimension: additional {
    type: string
    sql: ${TABLE}.ADDITIONAL ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: email_name {
    type: string
    sql: ${TABLE}.EMAIL_NAME ;;
  }

  dimension: from_email {
    type: string
    sql: ${TABLE}.FROM_EMAIL ;;
  }

  dimension: from_name {
    type: string
    sql: ${TABLE}.FROM_NAME ;;
  }

  dimension: is_multipart {
    type: yesno
    sql: ${TABLE}.IS_MULTIPART ;;
  }

  dimension: job_status {
    type: string
    sql: ${TABLE}.JOB_STATUS ;;
  }

  dimension: preview_url {
    type: string
    sql: ${TABLE}.PREVIEW_URL ;;
  }

  dimension: scheduled_time {
    type: date_time
    sql: ${TABLE}.SCHEDULED_TIME ;;
  }

  dimension: send_definition_external_key {
    type: string
    sql: ${TABLE}.SEND_DEFINITION_EXTERNAL_KEY ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: sent_time {
    type: date_time
    sql: ${TABLE}.SENT_TIME ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.SUBJECT ;;
  }

  dimension: triggered_send_external_key {
    type: string
    sql: ${TABLE}.TRIGGERED_SEND_EXTERNAL_KEY ;;
  }

  measure: count {
    type: count
    drill_fields: [from_name, email_name]
  }
}
