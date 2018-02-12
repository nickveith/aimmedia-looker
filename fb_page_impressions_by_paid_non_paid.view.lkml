view: fb_page_impressions_by_paid_non_paid {
  sql_table_name: PUBLIC.FB_PAGE_IMPRESSIONS_BY_PAID_NON_PAID ;;


  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}."Target" || ${TABLE}."EndTime" ;;
  }

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
    sql: ${TABLE}."EndTime" ;;
  }

  dimension: insight_name {
    type: string
    sql: ${TABLE}."InsightName" ;;
  }

  dimension: paid {
    type: number
    value_format_name: id
    sql: ${TABLE}."Paid" ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."Period" ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}."RowNumber" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."Total" ;;
  }

  dimension: unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}."Unpaid" ;;
  }

  measure: count {
    type: count
    drill_fields: [insight_name]
  }
}
