view: pcd_issues {
  sql_table_name: PUBLIC.PCD_ISSUES ;;

  dimension: issue_id {
    type: string
    primary_key: yes
    sql: ${client_code}||'-'||${pub_code}||'-'||${issue} ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension_group: date_offsale {
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
    sql: ${TABLE}.DATE_OFFSALE ;;
  }

  dimension_group: date_onsale {
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
    sql: ${TABLE}.DATE_ONSALE ;;
  }

  dimension: days_per_issue {
    type: number
    sql: ${TABLE}.DAYS_PER_ISSUE ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.FREQUENCY ;;
  }

  dimension: issue {
    type: string
    sql: ${TABLE}.ISSUE ;;
  }

  dimension: issue_number {
    type: number
    sql: ${TABLE}.ISSUE_NUMBER ;;
  }

  dimension: issue_year {
    type: number
    sql: ${TABLE}.ISSUE_YEAR ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: first_onsale {
    type: date
    sql: MIN(${date_onsale_date}) ;;
    drill_fields: []
  }

  measure: last_onsale {
    type: date
    sql: MAX(${date_onsale_date}) ;;
    drill_fields: []
  }
}
