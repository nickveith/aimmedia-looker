connection: "snowflake"

# include all the views
include: "*.view"

######datagroups for caching and PDT rebuilds
datagroup: daily {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "30 hours"
}

datagroup: monthly {
#   sql_trigger: SELECT max(id) from pcd_log ;;
sql_trigger: select DATE_TRUNC('month',CURRENT_DATE()) ;;
max_cache_age: "840 hours"
}

persist_with: daily


explore: pages {
#   persist_with: default
  from: fb_pages
  join:  fb_page_impressions {
    from: fb_page_impressions_by_paid_non_paid
    view_label: "Page Insights"
    fields: [fb_page_impressions.impressions,fb_page_impressions.impressions_paid,fb_page_impressions.impressions_unpaid, fb_page_impressions.report_date]
    type: left_outer
    sql_on: ${pages.id} = ${fb_page_impressions.target};;
    relationship: one_to_many
  }
  join:  fb_posts {
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_posts.target}
    and ${fb_page_impressions.end_date} = ${fb_posts.created_time_date};;
    relationship: one_to_many
  }
  join:  fb_page_consumptions {
    view_label: "Page Insights"
    fields: [fb_page_consumptions.consumptions]
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_consumptions.target}
    and ${fb_page_impressions.end_date} = ${fb_page_consumptions.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_consumptions_by_consumption_type {
    view_label: "Page Insights"
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_consumptions_by_consumption_type.target}
    and ${fb_page_impressions.end_date} = ${fb_page_consumptions_by_consumption_type.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_fan_adds {
    view_label: "Page Insights"
    fields: [fb_page_fan_adds.fan_adds]
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_fan_adds.target}
      and ${fb_page_impressions.end_date} = ${fb_page_fan_adds.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_fan_removes {
    view_label: "Page Insights"
    fields: [fb_page_fan_removes.fan_removes]
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_fan_removes.target}
      and ${fb_page_impressions.end_date} = ${fb_page_fan_removes.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_stories {
    view_label: "Page Insights"
    fields: [fb_page_stories.page_stories]
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_stories.target}
      and ${fb_page_impressions.end_date} = ${fb_page_stories.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_stories_by_story_type {

    view_label: "Page Insights"
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_stories_by_story_type.target}
      and ${fb_page_impressions.end_date} = ${fb_page_stories_by_story_type.end_date};;
    relationship: one_to_many
  }
  join:  fb_page_views {
    view_label: "Page Insights"
    fields: [fb_page_views.page_views]
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_views.target}
      and ${fb_page_impressions.end_date} = ${fb_page_views.end_date};;
    relationship: one_to_many
  }
}

explore: fb_ad_adinsights {
  from: fb_ad_adinsights
  view_label: "Ad Insights"
  join: fb_ad_accounts {
    type: left_outer
    sql_on: ${fb_ad_adinsights.account_id} = ${fb_ad_accounts.account_id};;
    relationship: many_to_one
  }
  join: fb_ad_campaigns {
    type: left_outer
    sql_on: ${fb_ad_adinsights.campaign_id} = ${fb_ad_campaigns.campaign_id};;
    relationship: many_to_one
  }
  join: fb_ad_adsets {
    type: left_outer
    sql_on: ${fb_ad_adinsights.adset_id} = ${fb_ad_adsets.adset_id};;
    relationship: many_to_one
  }
  join: fb_ad_ads {
    type: left_outer
    sql_on: ${fb_ad_adinsights.ad_id} = ${fb_ad_ads.ad_id};;
    relationship: many_to_one
  }
  join: fb_ad_adcreatives {
    type: left_outer
    sql_on: ${fb_ad_adinsights.ad_id} = ${fb_ad_ads.ad_id};;
    relationship: many_to_one
  }
  join: fb_ad_adinsightactions {
    type: left_outer
    view_label: "Ad Insights"
    sql_on: ${fb_ad_adinsights.ad_id} = ${fb_ad_adinsightactions.ad_id}
        and ${fb_ad_adinsights.date_start_date} = ${fb_ad_adinsightactions.date_start_date}
        and ${fb_ad_adinsightactions.action_type} = 'offsite_conversion.fb_pixel_purchase' ;;
    relationship: one_to_one
  }
  join: fb_ad_adinsightactionvalues {
    type: left_outer
    view_label: "Ad Insights"
    sql_on: ${fb_ad_adinsights.ad_id} = ${fb_ad_adinsightactionvalues.ad_id}
        and ${fb_ad_adinsights.date_start_date} = ${fb_ad_adinsightactionvalues.date_start_date}
        and ${fb_ad_adinsightactionvalues.action_type} = 'offsite_conversion.fb_pixel_purchase' ;;
      relationship: one_to_one
  }
}

explore: fb_ad_ads {
  from: fb_ad_ads
  view_label: "Facebook Ads"
  join: fb_ad_adcreatives {
    type:  left_outer
    sql_on: ${fb_ad_ads.ad_id} = ${fb_ad_adcreatives.id};;
    relationship: many_to_many
  }
  join: aim_brand {
    type: left_outer
    view_label: "Facebook Ads"
    sql_on: ${fb_ad_adcreatives.id} = ${aim_brand.facebook_page_id} ;;
    relationship: many_to_one
  }
  join: aim_group {
    type: left_outer
    view_label: "Facebook Ads"
    sql_on: ${aim_brand.brand_id} = ${aim_group.id} ;;
    relationship: many_to_one
  }

}
