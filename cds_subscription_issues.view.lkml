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
  measure: subscribers {
    type: count_distinct
    sql: ${TABLE}.account_number ;;
  }

  dimension: order_term {
    type: number
    sql: ${cds_orders.order_term};;
  }

  dimension: frequency {
    type: number
    sql: ${cds_issues.frequency};;
  }

  measure: cds_average_order_price {
    type: number
    value_format_name: usd
    sql: case when sum( ${order_term} * ${frequency} ) = 0 then 0
              else sum(${gross_value_for_agency_order})
                 / sum( ${order_term} * ${frequency} )
          end ;;
  }

}
