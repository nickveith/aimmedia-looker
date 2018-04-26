view: pcd_contract_issues {
  sql_table_name: PUBLIC.PCD_CONTRACT_ISSUES ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.ACCOUNT_ID ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension: contract_issue_number {
    type: number
    sql: ${TABLE}.CONTRACT_ISSUE_NUMBER ;;
  }

  dimension: contract_number {
    type: number
    sql: ${TABLE}.CONTRACT_NUMBER ;;
  }

  dimension: issue {
    type: string
    sql: ${TABLE}.ISSUE ;;
  }

  dimension_group: issue {
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
    sql: ${TABLE}.ISSUE_DATE ;;
  }

  dimension: issue_price {
    type: number
    sql: ${TABLE}.ISSUE_PRICE ;;
  }

  dimension: match_code {
    type: string
    sql: ${TABLE}.MATCH_CODE ;;
  }

  dimension: overall_issue_number {
    type: number
    sql: ${TABLE}.OVERALL_ISSUE_NUMBER ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.ISSUE_PRICE ;;
  }
}
