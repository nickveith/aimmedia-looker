view: fb_page_stories_by_story_type {
  sql_table_name: PUBLIC.FB_PAGE_STORIES_BY_STORY_TYPE ;;

  dimension: checkin {
    type: number
    sql: ${TABLE}."Checkin" ;;
  }

  dimension: coupon {
    type: number
    sql: ${TABLE}."Coupon" ;;
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

  dimension: event {
    type: number
    sql: ${TABLE}."Event" ;;
  }

  dimension: fan {
    type: number
    sql: ${TABLE}."Fan" ;;
  }

  dimension: insight_name {
    type: string
    sql: ${TABLE}."InsightName" ;;
  }

  dimension: mention {
    type: number
    sql: ${TABLE}."Mention" ;;
  }

  dimension: other {
    type: number
    sql: ${TABLE}."Other" ;;
  }

  dimension: page_post {
    type: number
    sql: ${TABLE}."PagePost" ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}."Period" ;;
  }

  dimension: question {
    type: number
    sql: ${TABLE}."Question" ;;
  }

  dimension: row_number {
    type: number
    sql: ${TABLE}."RowNumber" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: user_post {
    type: number
    sql: ${TABLE}."UserPost" ;;
  }

  measure: count {
    type: count
    drill_fields: [insight_name]
  }
}
