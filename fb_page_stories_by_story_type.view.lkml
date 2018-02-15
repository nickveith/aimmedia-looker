view: fb_page_stories_by_story_type {
  sql_table_name: PUBLIC.FB_PAGE_STORIES_BY_STORY_TYPE ;;

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

measure: story_checkin {
    type: sum
    sql: ${TABLE}."Checkin" ;;
  }

  dimension: story_coupon {
    type: number
    sql: ${TABLE}."Coupon" ;;
  }

  dimension: story_event {
    type: number
    sql: ${TABLE}."Event" ;;
  }

  measure: story_fans {
    type: sum
    sql: ${TABLE}."Fan" ;;
  }

  dimension: insight_name {
    type: string
    sql: ${TABLE}."InsightName" ;;
  }

  measure: story_mentions {
    type: sum
    sql: ${TABLE}."Mention" ;;
  }

  measure: other {
    type: sum
    sql: ${TABLE}."Other" ;;
  }

  measure: page_story_post {
    type: sum
    sql: ${TABLE}."PagePost" ;;
  }

  dimension: story_period {
    type: string
    sql: ${TABLE}."Period" ;;
  }

  dimension: story_question {
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

}
