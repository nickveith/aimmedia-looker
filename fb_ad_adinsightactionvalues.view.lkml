view: fb_ad_adinsightactionvalues {
  sql_table_name: PUBLIC.FB_AD_ADINSIGHTACTIONVALUES ;;

  dimension: action1d_click {
    hidden: yes
    type: string
    sql: ${TABLE}."Action1dClick" ;;
  }

  dimension: action_attribution_windows {
    hidden: yes
    type: string
    sql: ${TABLE}."ActionAttributionWindows" ;;
  }

  dimension: action_type {
    hidden: yes
    type: string
    sql: ${TABLE}."ActionType" ;;
  }

  measure: action_value {
    type: number
    sql: ${TABLE}."ActionValue" ;;
  }

  dimension: ad_account_id {
    hidden: yes
    type: string
    sql: ${TABLE}."AdAccountId" ;;
  }

  dimension: ad_id {
    hidden: yes
    type: string
    sql: ${TABLE}."AdId" ;;
  }

  dimension: ad_set_id {
    hidden: yes
    type: string
    sql: ${TABLE}."AdSetId" ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}."CampaignId"" ;;
  }

  dimension_group: date_end {
    hidden: yes
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
    sql: ${TABLE}."DateEnd" ;;
  }

  dimension: date_preset {
    hidden: yes
    type: string
    sql: ${TABLE}."DatePreset" ;;
  }

  dimension_group: date_start {
    hidden: yes
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
    sql: ${TABLE}."DateStart" ;;
  }

  dimension: level {
    hidden: yes
    type: string
    sql: ${TABLE}."Level" ;;
  }

  dimension: target {
    hidden: yes
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: time_increment {
    hidden: yes
    type: string
    sql: ${TABLE}."TimeIncrement" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: purchase_value {
    type: sum
    sql: case when ${action_type} = 'offsite_conversion.fb_pixel_purchase'
                then ${TABLE}."ActionValue"
              else 0
              end ;;
  }

}
