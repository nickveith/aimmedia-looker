view: cds_issues {
  sql_table_name: PUBLIC.CDS_ISSUES ;;

  dimension_group: cover {
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
    sql: ${TABLE}."COVER_DATE" ;;
  }

  dimension: issue_description {
    type: string
    sql: ${TABLE}."ISSUE_DESCRIPTION" ;;
  }

  dimension: issue_number {
    type: string
    sql: ${TABLE}."ISSUE_NUMBER" ;;
  }

  dimension_group: latest_abc_issue {
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
    sql: ${TABLE}."LATEST_ABC_ISSUE" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension_group: onsale {
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
    sql: ${TABLE}."ONSALE_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
