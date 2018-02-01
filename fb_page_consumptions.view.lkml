view: fb_page_consumptions {
  sql_table_name: PUBLIC.FB_PAGE_CONSUMPTIONS ;;

  dimension_group: end {
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
    sql: ${TABLE}.EndTime ;;
  }

  dimension: insight_name {
    type: string
    sql: ${TABLE}.InsightName ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}.RowNumber ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.Target ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }

  measure: count {
    type: count
    drill_fields: [insight_name]
  }
}
