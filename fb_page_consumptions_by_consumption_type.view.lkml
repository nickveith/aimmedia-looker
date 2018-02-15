view: fb_page_consumptions_by_consumption_type {
  sql_table_name: PUBLIC.FB_PAGE_CONSUMPTIONS_BY_CONSUMPTION_TYPE ;;

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

  measure: button_clicks {
    type: number
    sql: ${TABLE}."ButtonClicks" ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}."EndTime" ;;
  }

  dimension: insight_name {
    type: string
    sql: ${TABLE}."InsightName" ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${TABLE}."LinkClicks" ;;
  }

  dimension: other_clicks {
    type: number
    sql: ${TABLE}."OtherClicks" ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."Period" ;;
  }

  dimension: photo_view {
    type: number
    sql: ${TABLE}."PhotoView" ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}."RowNumber" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: video_play {
    type: number
    sql: ${TABLE}."VideoPlay" ;;
  }

  measure: consumptions_by_type {
    type: number
    sql: sum(${TABLE}."Value"::INT) ;;
  }

}
