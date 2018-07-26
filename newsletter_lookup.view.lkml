view: newsletter_lookup {
  sql_table_name: PUBLIC.NEWSLETTER_LOOKUP ;;

  dimension: associated_print_title {
    type: string
    hidden:  yes
    sql: ${TABLE}.ASSOCIATED_PRINT_TITLE ;;
  }

  dimension: associated_website {
    type: string
    hidden:  yes
    sql: ${TABLE}.ASSOCIATED_WEBSITE ;;
  }

  dimension: brand_code {
    type: string
    hidden:  yes
    sql: ${TABLE}.BRAND_CODE ;;
  }

  dimension: bu_code {
    type: string
    hidden:  yes
    sql: ${TABLE}.BU_CODE ;;
  }

  dimension: group {
    type: string
    hidden:  yes
    sql: case when ${bu_code} = 'OG' then 'Outdoor Group'
              when ${bu_code} = 'MG' then 'Marine Group'
              when ${bu_code} = 'HL' then 'Healthy Living Group'
              when ${bu_code} = 'EQ' then 'Equine Group'
              when ${bu_code} = 'HG' then 'Home Group'
              else 'Unknown'
              end;;
  }


  dimension: business_unit {
    type: string
    hidden:  yes
    sql: CASE WHEN ${TABLE}.BUSINESS_UNIT = 'HG' then 'home' else lower(trim(${TABLE}.BUSINESS_UNIT)) end;;
  }

  dimension: de_external_key {
    type: string
    hidden:  yes
    sql: ${TABLE}.DE_EXTERNAL_KEY ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: id_index {
    type: string
    hidden:  yes
    sql: ${TABLE}.ID_INDEX ;;
  }

  dimension: import_date {
    type: string
    hidden:  yes
    sql: ${TABLE}.IMPORT_DATE ;;
  }

  dimension: list_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: list_number {
    type: number
    hidden:  yes
    sql: ${TABLE}.LIST_NUMBER ;;
  }

  dimension: list_or_data_extension {
    type: string
    hidden:  yes
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
    hidden:  yes
    sql: ${TABLE}.PCD_ABBREVIATION ;;
  }

  dimension: preference_code {
    type: string
    sql: ${TABLE}.PREFERENCE_CODE ;;
  }

  dimension: pub_list_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.PUB_LIST_ID ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.PUBLIC ;;
  }

  filter: overlap_brand_code {
    sql: {% condition overlap_brand_code %} newsletters.brand_code {% endcondition %} AND {% condition overlap_brand_code %} newsletter_lookup2.brand_code {% endcondition %};;
  }

}
