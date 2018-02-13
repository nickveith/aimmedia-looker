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
    type: left_outer
    sql_on: ${fb_page_impressions.target} = ${fb_page_consumptions.target}
    and ${fb_page_impressions.end_date} = ${fb_page_consumptions.end_date};;
    relationship: one_to_many
  }
}
