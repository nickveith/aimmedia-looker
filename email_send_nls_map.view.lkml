view: email_send_nls_map {
  sql_table_name: PUBLIC.EMAIL_SEND_NLS_MAP ;;

  dimension: newsletter_id {
    hidden:  yes
    type: string
    sql: ${TABLE}."NEWSLETTER_ID" ;;
  }

  dimension: send_id {
    hidden:  yes
    type: number
    sql: ${TABLE}."SEND_ID" ;;
  }
}
