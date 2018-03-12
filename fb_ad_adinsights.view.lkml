view: fb_ad_adinsights {
  sql_table_name: PUBLIC.FB_AD_ADINSIGHTS ;;

  dimension: action_attribution_windows {
    type: string
    sql: ${TABLE}."ActionAttributionWindows" ;;
  }

  dimension: actions {
    type: string
    sql: ${TABLE}."Actions" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."AdAccountId" ;;
  }

  dimension: ad_account_name {
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

  dimension: ad_set_id {
    type: string
    sql: ${TABLE}."AdSetId" ;;
  }

  dimension: ad_set_name {
    type: string
    sql: ${TABLE}."AdSetName" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."CampaignName" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}."Clicks" ;;
  }

  measure: cost_per10_sececond_video_view {
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

  measure: cost_per_inline_link_click {
    type: sum
    sql: case when sum(${TABLE}."InlineLinkClicks") = 0 then 0
              else sum(${TABLE}."Spend")/${TABLE}."InlineLinkClicks" ;;
  }

  measure: cost_per_inline_post_engagement {
    type: sum
    sql:case when sum(${TABLE}."InlinePostEngagement") = 0 then 0
              else sum(${TABLE}."Spend")/${TABLE}."InlinePostEngagement" ;;
  }

  measure: cost_per_total_action {
    type: sum
    sql: case when sum(${TABLE}."TotalActions") = 0 then 0
              else sum(${TABLE}."Spend")/${TABLE}."TotalActions" ;;
  }

  dimension: cost_per_unique_action_type_aggregate {
    type: string
    sql: ${TABLE}."CostPerUniqueActionTypeAggregate"
    ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}."CostPerUniqueClick" ;;
  }

  dimension: cost_per_unique_inline_link_click {
    type: number
    sql: ${TABLE}."CostPerUniqueInlineLinkClick" ;;
  }

  measure: cpc {
    type: number
    sql: case when sum(${TABLE}."Clicks") = 0 then 0
              else sum(${TABLE}."Spend")/sum(${TABLE}."Clicks") ;;
  }

  measure: cpm {
    type: number
    sql: case when sum(${TABLE}."Impressions") = 0 then 0
              else (sum(${TABLE}."Clicks")/sum(${TABLE}."Impressions")) * 1000 ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}."CPP" ;;
  }

  measure: ctr {
    type: number
    sql: case when sum(${TABLE}."Clicks") = 0 then 0
              else sum(${TABLE}."Clicks")/sum(${TABLE}."Impressions")
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
    type: string
    sql: ${TABLE}."DatePreset" ;;
  }

  dimension_group: date_start {
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
    sql: case when sum(${TABLE}."Reach") = 0 then 0
              else sum(${TABLE}."Impressions")/sum(${TABLE}."Reach");;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}."Impressions" ;;
  }

  measure: inline_link_clicks {
    type:sum
    sql: ${TABLE}."InlineLinkClicks" ;;
  }

  dimension: inline_link_clicks_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."InlineLinkClicksCounter" ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}."InlinePostEngagement" ;;
  }

  dimension: level {
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

  dimension: relevance_score {
    type: string
    sql: ${TABLE}."RelevanceScore" ;;
  }

  measure: social_clicks {
    type: sum
    sql: ${TABLE}."SocialClicks" ;;
  }

  measure: social_impressions {
    type: sum
    sql: ${TABLE}."SocialImpressions" ;;
  }

  measure: social_reach {
    type: sum
    sql: ${TABLE}."SocialReach" ;;
  }

  measure: spend {
    type: sum
    sql: ${TABLE}."Spend" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: time_increment {
    type: string
    sql: ${TABLE}."TimeIncrement" ;;
  }

  measure: total_action_value {
    type: number
    sql: ${TABLE}."TotalActionValue" ;;
  }

  measure: total_actions {
    type: sum
    sql: ${TABLE}."TotalActions" ;;
  }

  measure: total_unique_actions {
    type: sum
    sql: ${TABLE}."TotalUniqueActions" ;;
  }

  measure: unique_actions {
    type: sum
    sql: ${TABLE}."UniqueActions" ;;
  }

  measure: unique_clicks {
    type: sum
    sql: ${TABLE}."UniqueClicks" ;;
  }

  measure: unique_ctr {
    type: number
    sql: case when sum(${TABLE}."UniqueClicks") = 0 then 0
              else sum(${TABLE}."UniqueClicks")/sum(${TABLE}."Impressions");;
  }

  dimension: unique_inline_link_click_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."UniqueInlineLinkClickCounter" ;;
  }

  measure: unique_inline_link_clicks {
    type: sum
    sql: ${TABLE}."UniqueInlineLinkClicks" ;;
  }

  dimension: unique_link_clicks_counter {
    type: number
    hidden: yes
    sql: ${TABLE}."UniqueLinkClicksCounter" ;;
  }

  measure: unique_social_clicks {
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
}
