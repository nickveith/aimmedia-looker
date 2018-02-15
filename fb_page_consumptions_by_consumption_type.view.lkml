view: fb_page_consumptions_by_consumption_type {
  sql_table_name: PUBLIC.FB_PAGE_CONSUMPTIONS_BY_CONSUMPTION_TYPE ;;

  dimension: id {
    type: string
    primary_key: yes
    hidden: yes
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
    type: sum
    sql: ${TABLE}."ButtonClicks" ;;
  }

  dimension: end_time {
    type: string
    hidden: yes
    sql: ${TABLE}."EndTime" ;;
  }

  dimension: insight_name {
    type: string
    hidden: yes
    sql: ${TABLE}."InsightName" ;;
  }

  measure: link_clicks {
    type: sum
    sql: ${TABLE}."LinkClicks" ;;
  }

 measure: other_clicks {
    type: sum
    sql: ${TABLE}."OtherClicks" ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."Period" ;;
  }

  measure: photo_view {
    type: sum
    sql: ${TABLE}."PhotoView" ;;
  }

  dimension: row_number {
    type: number
    hidden: yes
    sql: ${TABLE}."RowNumber" ;;
  }

  dimension: target {
    type: string
    hidden: yes
    sql: ${TABLE}."Target" ;;
  }

  measure: video_play {
    type: sum
    sql: ${TABLE}."VideoPlay" ;;
  }

}
