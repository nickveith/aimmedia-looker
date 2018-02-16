view: fb_posts {
  sql_table_name: PUBLIC.FB_POSTS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  measure: actions {
    type: string
    sql: ${TABLE}."Actions" ;;
  }

  dimension: application_canvas_name {
    type: string
    hidden: yes
    sql: ${TABLE}."ApplicationCanvasName" ;;
  }

  dimension: application_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ApplicationId" ;;
  }

  dimension: application_name {
    type: string
    hidden: yes
    sql: ${TABLE}."ApplicationName" ;;
  }

  dimension: application_namespace {
    type: string
    hidden: yes
    sql: ${TABLE}."ApplicationNamespace" ;;
  }

  dimension: caption {
    type: string
    sql: ${TABLE}."Caption" ;;
  }

  dimension: comments_count {
    type: number
    sql: ${TABLE}."CommentsCount" ;;
  }

  dimension: comments_data {
    type: string
    sql: ${TABLE}."CommentsData" ;;
  }

  dimension_group: created_time {
    type: time
    timeframes: [date,day_of_week,day_of_month, month_name, month, year, quarter_of_year]
    sql: ${TABLE}."CreatedTime" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: from_category {
    type: string
    hidden: yes
    sql: ${TABLE}."FromCategory" ;;
  }

  dimension: from_id {
    type: string
    hidden: yes
    sql: ${TABLE}."FromId" ;;
  }

  dimension: from_name {
    type: string
    hidden: yes
    sql: ${TABLE}."FromName" ;;
  }

  dimension: from_picture {
    type: string
    hidden: yes
    sql: ${TABLE}."FromPicture" ;;
  }

  dimension: icon {
    type: string
    hidden: yes
    sql: ${TABLE}."Icon" ;;
  }

  measure: likes_count {
    type: sum
    sql: ${TABLE}."LikesCount" ;;
  }

  dimension: likes_data {
    type: string
    sql: ${TABLE}."LikesData" ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}."Link" ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}."Message" ;;
  }

  dimension: message_tags {
    type: string
    sql: ${TABLE}."MessageTags" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: object_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ObjectId" ;;
  }

  dimension: picture_url {
    type: string
    hidden:  yes
    sql: ${TABLE}."Picture" ;;
  }

  dimension: photo {
    sql: ${TABLE}."Picture";;
    html: <img src="{{ value }}" width="100" height="100"/>;;
  }

  dimension: place_id {
    type: string
    sql: ${TABLE}."PlaceId" ;;
  }

  dimension: place_name {
    type: string
    sql: ${TABLE}."PlaceName" ;;
  }

  measure: shares_count {
    type: sum
    sql: ${TABLE}."SharesCount" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."Source" ;;
  }

  dimension: story {
    type: string
    sql: ${TABLE}."Story" ;;
  }

  dimension: story_tags {
    type: string
    sql: ${TABLE}."StoryTags" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: to_data {
    type: string
    hidden: yes
    sql: ${TABLE}."ToData" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }

  dimension: updated_time {
    type: string
    sql: ${TABLE}."UpdatedTime" ;;
  }

  dimension: with_tags_data {
    type: string
    hidden: yes
    sql: ${TABLE}."WithTagsData" ;;
  }

  measure: post_count {
    type: number
    sql:  count(distinct ${TABLE}."ID") ;;
  }

  measure: likes {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."LikesCount");;
  }

  measure: likes_per_post {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."LikesCount")/count(DISTINCT ${TABLE}."ID");;
  }

  measure: shares_per_post {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."SharesCount")/count(DISTINCT ${TABLE}."ID");;
  }

  measure: shares {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."SharesCount");;
  }

  measure: comments {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."CommentsCount");;
  }

  measure: comments_per_post {
    type: number
    value_format: "#.##"
    sql: sum(${TABLE}."CommentsCount")/count(DISTINCT ${TABLE}."ID");;
  }

  measure: post_frequency {
    view_label: "Daily Post Frequency"
    value_format: "##.#"
    type: number
    sql: count(DISTINCT ${TABLE}."ID")::real /
         ( count(DISTINCT ${TABLE}."CreatedTime"::date) *
           count(DISTINCT ${TABLE}."Target")
          )::real;;
  }

}
