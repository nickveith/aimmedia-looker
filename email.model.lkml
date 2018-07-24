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

explore: email {
  from: email_event
  join: event_date {
    view_label: "Date [Event]"
    from: calendar_date
    type:  inner
    sql_on: ${email.event_date} = ${event_date.calendar_date};;
    relationship: many_to_one
  }
  join: send_date {
    view_label: "Date [Sent]"
    from: calendar_date
    type:  inner
    sql_on: ${email.send_date} = ${send_date.calendar_date} ;;
    relationship: many_to_one
  }
  join:  lists {
      type: left_outer
      sql_on: ${email.list_id} = ${lists.list_id};;
      relationship: many_to_one
  }
  join:  send_jobs {
    type: left_outer
    sql_on: ${email.client_id} = ${send_jobs.client_id}
        and ${email.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join: email_send_job_newsletter_bridge {
    type:  left_outer
    sql_on: ${send_jobs.send_id} = ${email_send_job_newsletter_bridge.send_id} ;;
    relationship: one_to_many
  }
  join: newsletter_lookup {
    type:  left_outer
    sql_on: ${email_send_job_newsletter_bridge.newsletter_id} = ${newsletter_lookup.newsletter_id};;
    relationship: one_to_many
  }
  join: subscriber_newsletters {
    type: left_outer
    sql_on: ${newsletter_lookup.newsletter_id} = ${subscriber_newsletters.newsletter_id} ;;
    relationship: many_to_one
  }
  join: sender_profile {
    type: left_outer
    sql_on: ${send_jobs.from_email} = ${sender_profile.from_email}
        and ${send_jobs.from_name} = ${sender_profile.from_name} ;;
    relationship: many_to_one
  }
  join: brand {
    from: aim_brand
    type: left_outer
    sql_on: ${sender_profile.brand_id} = ${brand.brand_id} ;;
    relationship: many_to_one
  }
  join: group {
    from: aim_group
    type: left_outer
    sql_on: ${sender_profile.group_id} = ${group.id} ;;
    relationship: many_to_one
  }
  join: email_summary {
    from: email_summary
    type:  left_outer
    sql_on: ${send_jobs.send_id} = ${email_summary.send_id} ;;
    relationship: one_to_one
  }
  join: email_newsletter_summary {
    type:  left_outer
    sql_on: ${email_send_job_newsletter_bridge.newsletter_id} = ${email_newsletter_summary.newsletter_id}
        and ${email_send_job_newsletter_bridge.newsletter_id} is not null ;;
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
    sql_on: lower(${subscriber_newsletters.subscriber_key}) = lower(${subscriber_master.subscriber_key});;
    relationship: one_to_many
  }
  join:  subscriber_newsletters2 {
    from: subscriber_newsletters
    view_label: "Overlap"
    type: left_outer
    sql_on: lower(${subscriber_newsletters.subscriber_key}) = lower(${subscriber_newsletters2.subscriber_key});;
    fields: [subscriber_newsletters2.unique_subscribers, subscriber_newsletters2.subscribers]
    relationship: one_to_many
  }
  join:  newsletter_lookup2 {
    from: newsletter_lookup
    view_label: "Overlap"
    type: left_outer
    sql_on: ${subscriber_newsletters2.newsletter_id} = ${newsletter_lookup2.newsletter_id};;
    fields: [newsletter_lookup2.brand_code, newsletter_lookup2.newsletter,newsletter_lookup2.list_type, newsletter_lookup2.newsletter_id]
    relationship: many_to_one
  }
  join: brand {
    from: aim_brand
    type: left_outer
    sql_on: ${newsletters.brand_code} = ${brand.brand_code} ;;
    relationship: many_to_one
  }
  join: group {
    from: aim_group
    type: left_outer
    sql_on: ${brand.group_id} = ${group.id} ;;
    relationship: many_to_one
  }
}
