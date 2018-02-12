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
  join:  fb_posts {
    type: left_outer
    sql_on: ${pages.id} = ${fb_posts.target};;
    relationship: many_to_one
  }
  join:  fb_page_consumptions {
    type: left_outer
    sql_on: ${pages.id} = ${fb_page_consumptions.target};;
    relationship: many_to_one
  }
}
