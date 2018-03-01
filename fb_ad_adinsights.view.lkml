view: fb_ad_adinsights {
  sql_table_name: PUBLIC.FB_AD_ADINSIGHTS ;;

  dimension: action_attribution_windows {
    type: string
    sql: ${TABLE}.ActionAttributionWindows ;;
  }

  dimension: actions {
    type: string
    sql: ${TABLE}.Actions ;;
  }

  dimension: ad_account_id {
    type: string
    sql: ${TABLE}.AdAccountId ;;
  }

  dimension: ad_account_name {
    type: string
    sql: ${TABLE}.AdAccountName ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.AdId ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.AdName ;;
  }

  dimension: ad_set_id {
    type: string
    sql: ${TABLE}.AdSetId ;;
  }

  dimension: ad_set_name {
    type: string
    sql: ${TABLE}.AdSetName ;;
  }

  dimension: call_to_action_clicks {
    type: number
    sql: ${TABLE}.CallToActionClicks ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.CampaignName ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: cost_per10_sececond_video_view {
    type: string
    sql: ${TABLE}.CostPer10SececondVideoView ;;
  }

  dimension: cost_per_action_type {
    type: string
    sql: ${TABLE}.CostPerActionType ;;
  }

  dimension: cost_per_estimated_ad_recallers {
    type: number
    sql: ${TABLE}.CostPerEstimatedAdRecallers ;;
  }

  dimension: cost_per_inline_link_click {
    type: number
    sql: ${TABLE}.CostPerInlineLinkClick ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    sql: ${TABLE}.CostPerInlinePostEngagement ;;
  }

  dimension: cost_per_total_action {
    type: number
    sql: ${TABLE}.CostPerTotalAction ;;
  }

  dimension: cost_per_unique_action_type_aggregate {
    type: string
    sql: ${TABLE}.CostPerUniqueActionTypeAggregate ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}.CostPerUniqueClick ;;
  }

  dimension: cost_per_unique_inline_link_click {
    type: number
    sql: ${TABLE}.CostPerUniqueInlineLinkClick ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.CPC ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}.CPM ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}.CPP ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
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
    sql: ${TABLE}.DateEnd ;;
  }

  dimension: date_preset {
    type: string
    sql: ${TABLE}.DatePreset ;;
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
    sql: ${TABLE}.DateStart ;;
  }

  dimension: estimated_ad_recall_rate {
    type: number
    sql: ${TABLE}.EstimatedAdRecallRate ;;
  }

  dimension: estimated_ad_recallers {
    type: number
    sql: ${TABLE}.EstimatedAdRecallers ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.Frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    sql: ${TABLE}.InlineLinkClicks ;;
  }

  dimension: inline_link_clicks_counter {
    type: number
    sql: ${TABLE}.InlineLinkClicksCounter ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}.InlinePostEngagement ;;
  }

  dimension: level {
    type: string
    sql: ${TABLE}.Level ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.Objective ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.Reach ;;
  }

  dimension: relevance_score {
    type: string
    sql: ${TABLE}.RelevanceScore ;;
  }

  dimension: social_clicks {
    type: number
    sql: ${TABLE}.SocialClicks ;;
  }

  dimension: social_impressions {
    type: number
    sql: ${TABLE}.SocialImpressions ;;
  }

  dimension: social_reach {
    type: number
    sql: ${TABLE}.SocialReach ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.Spend ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.Target ;;
  }

  dimension: time_increment {
    type: string
    sql: ${TABLE}.TimeIncrement ;;
  }

  dimension: total_action_value {
    type: number
    sql: ${TABLE}.TotalActionValue ;;
  }

  dimension: total_actions {
    type: number
    sql: ${TABLE}.TotalActions ;;
  }

  dimension: total_unique_actions {
    type: number
    sql: ${TABLE}.TotalUniqueActions ;;
  }

  dimension: unique_actions {
    type: string
    sql: ${TABLE}.UniqueActions ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}.UniqueClicks ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${TABLE}.UniqueCTR ;;
  }

  dimension: unique_inline_link_click_counter {
    type: number
    sql: ${TABLE}.UniqueInlineLinkClickCounter ;;
  }

  dimension: unique_inline_link_clicks {
    type: number
    sql: ${TABLE}.UniqueInlineLinkClicks ;;
  }

  dimension: unique_link_clicks_counter {
    type: number
    sql: ${TABLE}.UniqueLinkClicksCounter ;;
  }

  dimension: unique_social_clicks {
    type: number
    sql: ${TABLE}.UniqueSocialClicks ;;
  }

  dimension: video100_percent_watched_actions {
    type: string
    sql: ${TABLE}.Video100PercentWatchedActions ;;
  }

  dimension: video15_second_watched_actions {
    type: string
    sql: ${TABLE}.Video15SecondWatchedActions ;;
  }

  dimension: video25_percent_watched_actions {
    type: string
    sql: ${TABLE}.Video25PercentWatchedActions ;;
  }

  dimension: video30_second_watched_actions {
    type: string
    sql: ${TABLE}.Video30SecondWatchedActions ;;
  }

  dimension: video50_percent_watched_actions {
    type: string
    sql: ${TABLE}.Video50PercentWatchedActions ;;
  }

  dimension: video75_percent_watched_actions {
    type: string
    sql: ${TABLE}.Video75PercentWatchedActions ;;
  }

  dimension: video95_percent_watched_actions {
    type: string
    sql: ${TABLE}.Video95PercentWatchedActions ;;
  }

  dimension: video_avg_percent_watched_per_session {
    type: string
    sql: ${TABLE}.VideoAvgPercentWatchedPerSession ;;
  }

  dimension: video_avg_time_watched_actions {
    type: string
    sql: ${TABLE}.VideoAvgTimeWatchedActions ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_account_name, campaign_name, ad_set_name, ad_name]
  }
}
