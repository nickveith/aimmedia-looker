view: pcd_pub_source {
  sql_table_name: PUBLIC.PCD_PUB_SOURCE ;;

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  dimension: publication {
    type: string
    sql: ${TABLE}.PUBLICATION ;;
  }

  dimension: source_type {
    type: string
    sql: COALESCE(${TABLE}.SOURCE_TYPE, 'Other') ;;
  }

  dimension: source_code {
    type: string
    sql: ${TABLE}.SOURCE_CODE ;;
  }
}
