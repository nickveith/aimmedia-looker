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

explore: sends {
#   persist_with: default
  from: sends
  join:  lists {
    type: left_outer
    sql_on: ${sends.list_id} = ${lists.list_id};;
    relationship: many_to_one
  }
  join:  send_jobs {
    type: left_outer
    sql_on: ${sends.client_id} = ${send_jobs.client_id}
        and ${sends.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join:  opens {
    type: left_outer
    sql_on: ${sends.client_id} = ${opens.client_id}
        and ${sends.send_id} = ${opens.send_id}
        and ${sends.subscriber_id} = ${opens.subscriber_id} ;;
    relationship: one_to_many
    }
  join:  clicks {
    type: left_outer
    sql_on: ${sends.client_id} = ${clicks.client_id}
        and ${sends.send_id} = ${clicks.send_id}
        and ${sends.subscriber_id} = ${clicks.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  unsubs {
    type: left_outer
    sql_on: ${sends.client_id} = ${unsubs.client_id}
        and ${sends.send_id} = ${unsubs.send_id}
        and ${sends.subscriber_id} = ${unsubs.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  bounces {
    type: left_outer
    sql_on: ${sends.client_id} = ${bounces.client_id}
        and ${sends.send_id} = ${bounces.send_id}
        and ${sends.subscriber_id} = ${bounces.subscriber_id} ;;
    relationship: one_to_many
  }
  join:  complaints {
    type: left_outer
    sql_on: ${sends.client_id} = ${complaints.client_id}
        and ${sends.send_id} = ${complaints.send_id}
        and ${sends.subscriber_id} = ${complaints.subscriber_id} ;;
    relationship: one_to_many
  }
  }

explore: newsletters {
#   persist_with: default
  from: newsletter_lookup
  view_label: "Newsletter (Newsletter Lookup)"
  join:  subscriber_newsletters {
    view_label: "Email Opt-Ins (Sub News)"
    type: left_outer
    sql_on: ${newsletters.newsletter_id} = ${subscriber_newsletters.newsletter_id};;
    relationship: one_to_many
  }
  join:  subscriber_master {
    type: left_outer
    view_label: "Customer (Sub Master)"
    sql_on: ${subscriber_newsletters.subscriber_key} = ${subscriber_master.subscriber_key};;
    relationship: one_to_many
  }
  join:  subscriber_newsletters2 {
    from: subscriber_newsletters
    view_label: "Overlap"
    type: left_outer
    sql_on: ${subscriber_newsletters.subscriber_key} = ${subscriber_newsletters2.subscriber_key};;
    fields: [subscriber_newsletters2.unique_subscribers, subscriber_newsletters2.subscribers]
    relationship: one_to_many
  }
  join:  newsletter_lookup2 {
    from: newsletter_lookup
    view_label: "Overlap"
    type: left_outer
    sql_on: ${subscriber_newsletters2.newsletter_id} = ${newsletter_lookup2.newsletter_id};;
    fields: [newsletter_lookup2.brand_code, newsletter_lookup2.newsletter,newsletter_lookup2.list_type]
    relationship: many_to_one
  }
  }
