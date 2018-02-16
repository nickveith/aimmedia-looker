view: fb_page_impressions_by_paid_non_paid {
  sql_table_name: PUBLIC.FB_PAGE_IMPRESSIONS_BY_PAID_NON_PAID ;;


  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}."Target" || ${TABLE}."EndTime" ;;
  }

  dimension: report_date {
    type: date
    sql: ${TABLE}."EndTime" ;;
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

  measure: impressions {
    type: number
    sql: sum(${TABLE}."Total") ;;
  }

  measure: impressions_paid {
    type: number
    sql: sum(${TABLE}."Paid") ;;
  }

  measure: impressions_unpaid {
    type: number
    sql: sum(${TABLE}."Unpaid") ;;
  }

}
