view: cds_pub {
  sql_table_name: PUBLIC.CDS_PUB ;;

  dimension: customer_care_url {
    type: string
    sql: ${TABLE}."CUSTOMER_CARE_URL" ;;
  }

  dimension: live_url {
    type: string
    sql: ${TABLE}."LIVE_URL" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
