view: newsletter_lookup {
  sql_table_name: PUBLIC.NEWSLETTER_LOOKUP ;;

  dimension: associated_print_title {
    type: string
    sql: ${TABLE}.ASSOCIATED_PRINT_TITLE ;;
  }

  dimension: associated_website {
    type: string
    sql: ${TABLE}.ASSOCIATED_WEBSITE ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}.BRAND_CODE ;;
  }

  dimension: bu_code {
    type: string
    sql: ${TABLE}.BU_CODE ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}.BUSINESS_UNIT ;;
  }

  dimension: de_external_key {
    type: string
    sql: ${TABLE}.DE_EXTERNAL_KEY ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: id_index {
    type: string
    sql: ${TABLE}.ID_INDEX ;;
  }

  dimension: import_date {
    type: string
    sql: ${TABLE}.IMPORT_DATE ;;
  }

  dimension: list_id {
    type: string
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: list_number {
    type: number
    sql: ${TABLE}.LIST_NUMBER ;;
  }

  dimension: list_or_data_extension {
    type: string
    sql: ${TABLE}.LIST_OR_DATA_EXTENSION ;;
  }

  dimension: list_type {
    type: string
    sql: ${TABLE}.LIST_TYPE ;;
  }

  dimension: newsletter {
    type: string
    sql: ${TABLE}.NEWSLETTER ;;
  }

  dimension: newsletter_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.NEWSLETTER_ID ;;
  }

  dimension: pcd_abbreviation {
    type: string
    sql: ${TABLE}.PCD_ABBREVIATION ;;
  }

  dimension: preference_code {
    type: string
    sql: ${TABLE}.PREFERENCE_CODE ;;
  }

  dimension: pub_list_id {
    type: number
    sql: ${TABLE}.PUB_LIST_ID ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.PUBLIC ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
