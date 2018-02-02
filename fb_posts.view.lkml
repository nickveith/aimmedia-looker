view: fb_posts {
  sql_table_name: PUBLIC.FB_POSTS" ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: actions {
    type: string
    sql: ${TABLE}."Actions" ;;
  }

  dimension: application_canvas_name {
    type: string
    sql: ${TABLE}."ApplicationCanvasName" ;;
  }

  dimension: application_id {
    type: string
    sql: ${TABLE}."ApplicationId" ;;
  }

  dimension: application_name {
    type: string
    sql: ${TABLE}."ApplicationName" ;;
  }

  dimension: application_namespace {
    type: string
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

  dimension: created_time {
    type: string
    sql: ${TABLE}."CreatedTime" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: from_category {
    type: string
    sql: ${TABLE}."FromCategory" ;;
  }

  dimension: from_id {
    type: string
    sql: ${TABLE}."FromId" ;;
  }

  dimension: from_name {
    type: string
    sql: ${TABLE}."FromName" ;;
  }

  dimension: from_picture {
    type: string
    sql: ${TABLE}."FromPicture" ;;
  }

  dimension: icon {
    type: string
    sql: ${TABLE}."Icon" ;;
  }

  dimension: likes_count {
    type: number
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
    sql: ${TABLE}."ObjectId" ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}."Picture" ;;
  }

  dimension: place_id {
    type: string
    sql: ${TABLE}."PlaceId" ;;
  }

  dimension: place_name {
    type: string
    sql: ${TABLE}."PlaceName" ;;
  }

  dimension: shares_count {
    type: number
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
    sql: ${TABLE}."WithTagsData" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      from_name,
      name,
      place_name,
      application_name,
      application_canvas_name,
      created_time
    ]
  }
}
