view: email_lists_staging {
  sql_table_name: PUBLIC.EMAIL_LISTS_STAGING ;;

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: date_created {
    type: string
    sql: ${TABLE}.DATE_CREATED ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: list_type {
    type: string
    sql: ${TABLE}.LIST_TYPE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
