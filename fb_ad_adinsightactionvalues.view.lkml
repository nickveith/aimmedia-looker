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

  measure: order_value {
    type: sum
    sql: case when ${action_type} = 'offsite_conversion.fb_pixel_purchase'
                then ${TABLE}."Action1dClick"
              else 0
              end ;;
  }

  measure: revenue {
    type: number
    value_format_name: usd
    sql: ${fb_ad_adinsightactionvalues.order_value} ;;
  }

  measure: cost {
    type: number
    value_format_name: usd
    sql: ${fb_ad_adinsights.spend} ;;
  }

  measure: profit {
    type: number
    value_format_name: usd
    sql:case when ${fb_ad_adinsights.spend} = 0 then 0
             else ${fb_ad_adinsightactionvalues.revenue} - ${fb_ad_adinsights.spend}
             end ;;
  }

  measure: ROI {
    type: number
    value_format_name: usd
    sql: case when ${fb_ad_adinsights.spend} = 0 then 0
              else (${revenue} - ${fb_ad_adinsights.spend}) / ${fb_ad_adinsights.spend}
              end ;;
  }

  measure: avg_order_value {
    type: number
    value_format_name: usd
    sql:  case when ${fb_ad_adinsightactions.orders} = 0 then 0
          else ${revenue} / ${fb_ad_adinsightactions.orders}
          end ;;
  }

  measure: ROAS {
    type: number
    value_format: "##.##"
    sql:  case when ${fb_ad_adinsights.spend} = 0 then 0
          else ${revenue} / ${fb_ad_adinsights.spend}
          end ;;
  }

}
