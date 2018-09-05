view: cds_subscription_issues {
  sql_table_name: PUBLIC.CDS_SUBSCRIPTION_ISSUES ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER" ;;
  }

  dimension: gross_value_for_agency_order {
    type: number
    sql: ${TABLE}."GROSS_VALUE_FOR_AGENCY_ORDER" ;;
  }

  dimension: issue_number {
    type: string
    sql: ${TABLE}."ISSUE_NUMBER" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension: net_value {
    type: number
    sql: ${TABLE}."NET_VALUE" ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}."ORDER_NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
