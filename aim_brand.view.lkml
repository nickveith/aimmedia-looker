view: aim_brand {
  sql_table_name: PUBLIC.AIM_BRAND ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}."BRAND_CODE" ;;
  }

  dimension: brand_id {
    type: number
    hidden: yes
    sql: ${TABLE}."BRAND_ID" ;;
  }

  dimension: facebook_page_id {
    type: string
    sql: ${TABLE}."FACEBOOK_PAGE_ID" ;;
  }

  dimension: ga_property {
    type: string
    sql: ${TABLE}."GA_PROPERTY" ;;
  }

  dimension: google_ua {
    type: string
    sql: ${TABLE}."GOOGLE_UA" ;;
  }

  dimension: googleplus_user_id {
    type: string
    sql: ${TABLE}."GOOGLEPLUS_USER_ID" ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: instagram_user_id {
    type: string
    sql: ${TABLE}."INSTAGRAM_USER_ID" ;;
  }

  dimension: linkedin_company_id {
    type: string
    sql: ${TABLE}."LINKEDIN_COMPANY_ID" ;;
  }

  dimension: main_url {
    type: string
    sql: ${TABLE}."MAIN_URL" ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  dimension: pcd_abbreviation {
    type: string
    sql: ${TABLE}."PCD_ABBREVIATION" ;;
  }

  dimension: pcd_client_code {
    type: string
    sql: ${TABLE}."PCD_CLIENT_CODE" ;;
  }

  dimension: pcd_pub_code {
    type: string
    sql: ${TABLE}."PCD_PUB_CODE" ;;
  }

  dimension: pinterest_user_id {
    type: string
    sql: ${TABLE}."PINTEREST_USER_ID" ;;
  }

  dimension: twitter_user_id {
    type: string
    sql: ${TABLE}."TWITTER_USER_ID" ;;
  }

  dimension: youtube_handle {
    type: string
    sql: ${TABLE}."YOUTUBE_HANDLE" ;;
  }

}
