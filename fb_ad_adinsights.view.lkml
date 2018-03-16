view: fb_ad_adinsights {
  sql_table_name: PUBLIC.FB_AD_ADINSIGHTS ;;

  dimension: action_attribution_windows {
    hidden: yes
    type: string
    sql: ${TABLE}."ActionAttributionWindows" ;;
  }

  dimension: actions {
    hidden: yes
    type: string
    sql: ${TABLE}."Actions" ;;
  }

  dimension: account_id {
    hidden: yes
    type: string
    sql: ${TABLE}."AdAccountId" ;;
  }

  dimension: ad_account_name {
    hidden: yes
    type: string
    sql: ${TABLE}."AdAccountName" ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}."AdId" ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}."AdName" ;;
  }

  dimension: adset_id {
    hidden: yes
    type: string
    sql: ${TABLE}."AdSetId" ;;
  }

  dimension: ad_set_name {
    hidden: yes
    type: string
    sql: ${TABLE}."AdSetName" ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    hidden: yes
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}."Clicks" ;;
  }

  measure: cost_per10_sececond_video_view {
    hidden: yes
    type: number
    sql: case when sum(${TABLE}."Spend") = 0 then 0
              else sum(${TABLE}."CostPer10SececondVideoView" * ${TABLE}."Spend")/sum(${TABLE}."Spend")
              end;;
  }

  dimension: cost_per_action_type {
    hidden: yes
    type: string
    sql: ${TABLE}."CostPerActionType" ;;
  }

  dimension: cost_per_estimated_ad_recallers {
    hidden: yes
    type: number
    sql: ${TABLE}."CostPerEstimatedAdRecallers" ;;
  }

  measure: cost_per_link_click {
    type: sum
    sql: case when ${TABLE}."InlineLinkClicks" = 0 then 0
              else ${TABLE}."Spend"/${TABLE}."InlineLinkClicks"
              end ;;
  }

  measure: cost_per_post_engagement {
    type: sum
    sql:case when ${TABLE}."InlinePostEngagement" = 0 then 0
              else ${TABLE}."Spend"/${TABLE}."InlinePostEngagement"
              end ;;
  }

  measure: cost_per_total_action {
    hidden: yes
    type: sum
    sql: case when sum(${TABLE}."TotalActions") = 0 then 0
              else sum(${TABLE}."Spend")/${TABLE}."TotalActions"
              end;;
  }

  dimension: cost_per_unique_action_type_aggregate {
    hidden: yes
    type: string
    sql: ${TABLE}."CostPerUniqueActionTypeAggregate"
    ;;
  }

  dimension: cost_per_unique_click {
    hidden: yes
    type: number
    sql: ${TABLE}."CostPerUniqueClick" ;;
  }

  dimension: cost_per_unique_inline_link_click {
    hidden: yes
    type: number
    sql: ${TABLE}."CostPerUniqueInlineLinkClick" ;;
  }

  measure: cpc {
    type: number
    value_format_name: usd
    sql: case when sum(${TABLE}."Clicks") = 0 then 0
              else sum(${TABLE}."Spend")/sum(${TABLE}."Clicks")
              end;;
  }

  measure: cpm {
    type: number
    value_format_name: usd
    sql: case when sum(${TABLE}."Impressions") = 0 then 0
              else (sum(${TABLE}."Clicks")/sum(${TABLE}."Impressions")) * 1000
              end;;
  }

  dimension: cpp {
    type: number
    value_format_name: usd
    hidden: yes
    sql: ${TABLE}."CPP" ;;
  }

  measure: ctr {
    type: number
    value_format: "##.##%"
    sql: case when sum(${TABLE}."Clicks") = 0 then 0
              else sum(${TABLE}."Clicks")/sum(${TABLE}."Impressions")
              end;;
  }

  dimension_group: date_end {
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
    type: time
    timeframes: [
      raw,
      date,
      week,
      day_of_week,
      month,
      quarter,
      quarter_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DateStart" ;;
  }

  dimension: estimated_ad_recall_rate {
    type: number
    hidden:yes
    sql: ${TABLE}."EstimatedAdRecallRate" ;;
  }

  dimension: estimated_ad_recallers {
    type: number
    hidden:yes
    sql: ${TABLE}."EstimatedAdRecallers" ;;
  }

  measure: frequency {
    type: number
    value_format: "##.###"
    sql: case when sum(${TABLE}."Reach") = 0 then 0
              else sum(${TABLE}."Impressions")/sum(${TABLE}."Reach")
              end;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}."Impressions" ;;
  }

  measure: link_clicks {
    type:sum
    sql: ${TABLE}."InlineLinkClicks" ;;
  }

  dimension: inline_link_clicks_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."InlineLinkClicksCounter" ;;
  }

  measure: post_engagements {
    type: sum
    sql: ${TABLE}."InlinePostEngagement" ;;
  }

  dimension: level {
    hidden: yes
    type: string
    sql: ${TABLE}."Level" ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}."Objective" ;;
  }

  measure: reach {
    type: sum
    sql: ${TABLE}."Reach" ;;
  }

  measure: relevance_score {
    hidden: yes
    type: number
    sql: ${TABLE}."RelevanceScore" ;;
  }

  measure: social_clicks {
    hidden: yes
    type: sum
    sql: ${TABLE}."SocialClicks" ;;
  }

  measure: social_impressions {
    hidden: yes
    type: sum
    sql: ${TABLE}."SocialImpressions" ;;
  }

  measure: social_reach {
    hidden: yes
    type: sum
    sql: ${TABLE}."SocialReach" ;;
  }

  measure: spend {
    type: sum
    value_format_name: usd
    sql: ${TABLE}."Spend" ;;
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

  measure: total_action_value {
    hidden: yes
    type: number
    sql: ${TABLE}."TotalActionValue" ;;
  }

  measure: total_actions {
    hidden: yes
    type: sum
    sql: ${TABLE}."TotalActions" ;;
  }

  measure: total_unique_actions {
    hidden: yes
    type: sum
    sql: ${TABLE}."TotalUniqueActions" ;;
  }

  measure: unique_actions {
    hidden: yes
    type: sum
    sql: ${TABLE}."UniqueActions" ;;
  }

  measure: unique_clicks {
    type: sum
    sql: ${TABLE}."UniqueClicks" ;;
  }

  measure: unique_ctr {
    hidden: yes
    type: number
    sql: ${TABLE}."UniqueClicks";;
  }

  dimension: unique_inline_link_click_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."UniqueInlineLinkClickCounter" ;;
  }

  measure: unique_inline_link_clicks {
    hidden: yes
    type: sum
    sql: ${TABLE}."UniqueInlineLinkClicks" ;;
  }

  dimension: unique_link_clicks_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."UniqueLinkClicksCounter" ;;
  }

  measure: unique_social_clicks {
    hidden: yes
    type: sum
    sql: ${TABLE}."UniqueSocialClicks" ;;
  }

  dimension: video100_percent_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video100PercentWatchedActions" ;;
  }

  dimension: video15_second_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video15SecondWatchedActions" ;;
  }

  dimension: video25_percent_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video25PercentWatchedActions" ;;
  }

  dimension: video30_second_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video30SecondWatchedActions" ;;
  }

  dimension: video50_percent_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video50PercentWatchedActions" ;;
  }

  dimension: video75_percent_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video75PercentWatchedActions" ;;
  }

  dimension: video95_percent_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."Video95PercentWatchedActions" ;;
  }

  dimension: video_avg_percent_watched_per_session {
    type: string
    hidden: yes
    sql: ${TABLE}."VideoAvgPercentWatchedPerSession" ;;
  }

  dimension: video_avg_time_watched_actions {
    type: string
    hidden: yes
    sql: ${TABLE}."VideoAvgTimeWatchedActions" ;;
  }


  measure: call_to_action_clicks {
    type: sum
    sql: ${TABLE}."CallToActionClicks" ;;
  }

  measure: active_ads {
    type: count_distinct
    sql: ${TABLE}."AdId" ;;
  }

  measure: conversion_rate {
    type: number
    value_format: "##.##%"
    sql: case when sum(${TABLE}."InlineLinkClicks") = 0 then 0
         else ${fb_ad_adinsightactions.orders} / ${link_clicks}
         end ;;
  }

  measure: cost_per_order {
    type: number
    value_format_name: usd
    sql: case when ${fb_ad_adinsightactions.orders} = 0 then 0
         else ${spend} / ${fb_ad_adinsightactions.orders}
         end ;;

  }

}
