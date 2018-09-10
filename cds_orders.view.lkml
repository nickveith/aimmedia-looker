view: cds_orders {
  sql_table_name: PUBLIC.CDS_ORDERS ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER" ;;
  }

  dimension: account_number_check {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER_CHECK" ;;
  }

  dimension: agency_number {
    type: number
    sql: ${TABLE}."AGENCY_NUMBER" ;;
  }

  dimension: arrears_reclaimed {
    type: number
    sql: ${TABLE}."ARREARS_RECLAIMED" ;;
  }

  dimension: audit_data {
    type: string
    sql: ${TABLE}."AUDIT_DATA" ;;
  }

  dimension: billing_key {
    type: string
    sql: ${TABLE}."BILLING_KEY" ;;
  }

  dimension_group: clearing {
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
    sql: ${TABLE}."CLEARING_DATE" ;;
  }

  dimension: clearingdt {
    type: string
    sql: ${TABLE}."CLEARINGDT" ;;
  }

  dimension: credit_status {
    type: string
    sql: ${TABLE}."CREDIT_STATUS" ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}."EMPLOYEE_ID" ;;
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

  measure: gross_value_for_agency_order {
    type: sum
    sql: ${TABLE}."GROSS_VALUE_FOR_AGENCY_ORDER" ;;
  }

  dimension: group_order_number {
    type: number
    sql: ${TABLE}."GROUP_ORDER_NUMBER" ;;
  }

  dimension: is_bulk_sale {
    type: yesno
    sql: ${TABLE}."IS_BULK_SALE" ;;
  }

  dimension: is_cancelled_order {
    type: yesno
    sql: ${TABLE}."IS_CANCELLED_ORDER" ;;
  }

  dimension: is_changed_offer {
    type: yesno
    sql: ${TABLE}."IS_CHANGED_OFFER" ;;
  }

  dimension: is_multi_copy {
    type: yesno
    sql: ${TABLE}."IS_MULTI_COPY" ;;
  }

  dimension: is_tax_exempt {
    type: string
    sql: ${TABLE}."IS_TAX_EXEMPT" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension: magazine_category {
    type: string
    sql: ${TABLE}."MAGAZINE_CATEGORY" ;;
  }

  dimension: medium_code {
    type: string
    sql: ${TABLE}."MEDIUM_CODE" ;;
  }

  dimension: net_value {
    type: number
    sql: ${TABLE}."NET_VALUE" ;;
  }

  dimension: new_renewal_code {
    type: string
    sql: ${TABLE}."NEW_RENEWAL_CODE" ;;
  }

  dimension: offline_audit_number {
    type: string
    sql: ${TABLE}."OFFLINE_AUDIT_NUMBER" ;;
  }

  dimension_group: order_complete {
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
    sql: ${TABLE}."ORDER_COMPLETE_DATE" ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}."ORDER_DATE" ;;
  }

  dimension: order_document_key {
    type: string
    sql: ${TABLE}."ORDER_DOCUMENT_KEY" ;;
  }

  dimension: order_entry_type {
    type: string
    sql: ${TABLE}."ORDER_ENTRY_TYPE" ;;
  }

  dimension: order_ind_1 {
    type: string
    sql: ${TABLE}."ORDER_IND_1" ;;
  }

  dimension: order_ind_2 {
    type: string
    sql: ${TABLE}."ORDER_IND_2" ;;
  }

  dimension: order_ind_3 {
    type: string
    sql: ${TABLE}."ORDER_IND_3" ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}."ORDER_NUMBER" ;;
  }

  dimension: order_set_code {
    type: string
    sql: ${TABLE}."ORDER_SET_CODE" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."ORDER_STATUS" ;;
  }

  dimension: order_term {
    type: number
    sql: case when coalesce(${TABLE}."ORDER_TERM",0) = 0 then 1
              else ${TABLE}."ORDER_TERM"
          end ;;
  }

  dimension: prior_expiration {
    type: string
    sql: ${TABLE}."PRIOR_EXPIRATION" ;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}."RECORD_TYPE" ;;
  }

  dimension: source_code {
    type: string
    sql: ${TABLE}."SOURCE_CODE" ;;
  }

  dimension: special_order_information {
    type: string
    sql: ${TABLE}."SPECIAL_ORDER_INFORMATION" ;;
  }

  dimension: start_issue {
    type: number
    sql: ${TABLE}."START_ISSUE" ;;
  }

  dimension: tax_collected {
    type: number
    sql: ${TABLE}."TAX_COLLECTED" ;;
  }

  dimension: tax_value {
    type: number
    sql: ${TABLE}."TAX_VALUE" ;;
  }

  measure: order_count {
    type:  count
  }

}
