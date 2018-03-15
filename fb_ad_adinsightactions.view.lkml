view: fb_ad_adinsightactions {
  sql_table_name: PUBLIC.FB_AD_ADINSIGHTACTIONS ;;

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
    type: sum
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
    sql: ${TABLE}."CampaignId" ;;
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

  measure: orders {
    type: sum
    value_format: "#"
    sql: case when ${action_type} = 'offsite_conversion.fb_pixel_purchase'
                then ${TABLE}."Action1dClick"
              else 0
              end ;;
  }

  measure: CPA {
    type: number
    value_format: "$##.##"
    sql: case when ${orders} = 0 then 0
            else ${fb_ad_adinsights.spend} / ${orders}
            end ;;
  }

  measure: ROAS {
    type: number
    value_format: "##.##"
    sql:  case when ${fb_ad_adinsights.spend} = 0 then 0
          else ${orders} / ${fb_ad_adinsights.spend}
          end ;;
  }

}
