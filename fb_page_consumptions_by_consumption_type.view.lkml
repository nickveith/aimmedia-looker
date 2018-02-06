view: fb_page_consumptions_by_consumption_type {
  sql_table_name: PUBLIC.FB_PAGE_CONSUMPTIONS_BY_CONSUMPTION_TYPE ;;

  dimension: button_clicks {
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

  measure: count {
    type: count
    drill_fields: [insight_name]
  }
}
