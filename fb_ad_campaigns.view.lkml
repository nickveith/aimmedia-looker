view: fb_ad_campaigns {
  sql_table_name: PUBLIC.FB_AD_CAMPAIGNS ;;

  dimension: campaign_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: buying_type {
    type: string
    sql: ${TABLE}."BuyingType" ;;
  }

  dimension: configured_status {
    type: string
    sql: ${TABLE}."ConfiguredStatus" ;;
  }

  dimension: created_time {
    type: string
    sql: ${TABLE}."CreatedTime" ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}."EffectiveStatus" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}."Objective" ;;
  }

  dimension: spend_cap {
    type: number
    sql: ${TABLE}."SpendCap" ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}."StartTime" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."Status" ;;
  }

  dimension: stop_time {
    type: string
    sql: ${TABLE}."StopTime" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: updated_time {
    type: string
    sql: ${TABLE}."UpdatedTime" ;;
  }

}
