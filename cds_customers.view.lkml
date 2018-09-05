view: cds_customers {
  sql_table_name: PUBLIC.CDS_CUSTOMERS ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER" ;;
  }

  dimension: account_number_check {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER_CHECK" ;;
  }

  dimension: address_1 {
    type: string
    sql: ${TABLE}."ADDRESS_1" ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}."ADDRESS_2" ;;
  }

  dimension_group: address_from {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ADDRESS_FROM_DATE" ;;
  }

  dimension: address_standard_ind {
    type: string
    sql: ${TABLE}."ADDRESS_STANDARD_IND" ;;
  }

  dimension_group: address_through {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ADDRESS_THROUGH_DATE" ;;
  }

  dimension: address_type {
    type: string
    sql: ${TABLE}."ADDRESS_TYPE" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: combined_account_number {
    type: string
    sql: ${TABLE}."COMBINED_ACCOUNT_NUMBER" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}."DIVISION" ;;
  }

  dimension: fax_number {
    type: string
    sql: ${TABLE}."FAX_NUMBER" ;;
  }

  dimension_group: file {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FILE_DATE" ;;
  }

  dimension: foreign_city_with_postal {
    type: string
    sql: ${TABLE}."FOREIGN_CITY_WITH_POSTAL" ;;
  }

  dimension: foreign_country_with_postal {
    type: string
    sql: ${TABLE}."FOREIGN_COUNTRY_WITH_POSTAL" ;;
  }

  dimension: foreign_postal_code {
    type: string
    sql: ${TABLE}."FOREIGN_POSTAL_CODE" ;;
  }

  dimension: is_current {
    type: yesno
    sql: ${TABLE}."IS_CURRENT" ;;
  }

  dimension: is_multi_matchcode {
    type: string
    sql: ${TABLE}."IS_MULTI_MATCHCODE" ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}."JOB_TITLE" ;;
  }

  dimension: matchcode {
    type: string
    sql: ${TABLE}."MATCHCODE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: name_ind_1 {
    type: string
    sql: ${TABLE}."NAME_IND_1" ;;
  }

  dimension: name_ind_2 {
    type: string
    sql: ${TABLE}."NAME_IND_2" ;;
  }

  dimension: name_prefix {
    type: string
    sql: ${TABLE}."NAME_PREFIX" ;;
  }

  dimension: name_type {
    type: number
    sql: ${TABLE}."NAME_TYPE" ;;
  }

  dimension: nielsen_code {
    type: string
    sql: ${TABLE}."NIELSEN_CODE" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."PHONE_NUMBER" ;;
  }

  dimension: postal_carrier_route_code {
    type: string
    sql: ${TABLE}."POSTAL_CARRIER_ROUTE_CODE" ;;
  }

  dimension: postal_delivery_point {
    type: number
    sql: ${TABLE}."POSTAL_DELIVERY_POINT" ;;
  }

  dimension: pref_city_code {
    type: number
    sql: ${TABLE}."PREF_CITY_CODE" ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}."PROVINCE" ;;
  }

  dimension: publisher_code {
    type: string
    sql: ${TABLE}."PUBLISHER_CODE" ;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}."RECORD_TYPE" ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."ZIPCODE" ;;
  }

  dimension: zipcode_plus4 {
    type: string
    sql: ${TABLE}."ZIPCODE_PLUS4" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
