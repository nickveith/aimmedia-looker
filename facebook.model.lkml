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
  join: fb_ad_accounts {
    type: left_outer
    sql_on: ${fb_ad_adinsights.account_id} = ${fb_ad_accounts.account_id};;
    relationship: many_to_one
  }

}
