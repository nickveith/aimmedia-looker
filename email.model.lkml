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

explore: email_detail {
  from: email_event
  view_label: "[Measures] Email Event - Measueres and Metrics"
  description: "For detailed reporting on specific email events (sends, opens, clicks, bounce, spam, unsub). One row per event per user per send. Only use this if you really need that level of detail."
  join: event_date {
    view_label: "[Attributes] Date of Event"
    from: calendar_date
    type:  inner
    sql_on: ${email_detail.event_date} = ${event_date.calendar_date};;
    relationship: many_to_one
  }
  join: send_date {
    view_label: "[Attributes] Date Sent"
    from: calendar_date
    type:  inner
    sql_on: ${email_detail.send_date} = ${send_date.calendar_date} ;;
    relationship: many_to_one
  }
  join:  send_jobs {
    type: left_outer
    view_label: "[Attributes] Email"
    sql_on: ${email_detail.client_id} = ${send_jobs.client_id}
        and ${email_detail.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join: email_send_job_newsletter_bridge {
    type:  left_outer
    sql_on: ${send_jobs.send_id} = ${email_send_job_newsletter_bridge.send_id} ;;
    relationship: one_to_many
  }
  join: newsletter_lookup {
    view_label: "[Attributes] Newsletter (List)"
    type:  left_outer
    sql_on: ${email_send_job_newsletter_bridge.newsletter_id} = ${newsletter_lookup.newsletter_id};;
    relationship: one_to_many
  }
  join: sender_profile {
    type: left_outer
    sql_on: ${send_jobs.from_email} = ${sender_profile.from_email}
        and ${send_jobs.from_name} = ${sender_profile.from_name} ;;
    relationship: many_to_one
  }
  join: brand {
    from: aim_brand
    view_label: "[Attributes] Brand & Group"
    type: left_outer
    sql_on: ${sender_profile.brand_id} = ${brand.brand_id} ;;
    relationship: many_to_one
    fields: [brand.brand_name, brand.active]
  }
  join: group {
    from: aim_group
    view_label: "[Attributes] Brand & Group"
    type: left_outer
    sql_on: ${sender_profile.group_id} = ${group.id} ;;
    relationship: many_to_one
    fields: [group.group_name]
  }
  join: email_summary {
    from: email_summary
    view_label: "[Rollup Measures] Email Send Job"
    type:  left_outer
    sql_on: ${send_jobs.send_id} = ${email_summary.send_id} ;;
    relationship: one_to_one
  }
  join: email_newsletter_summary {
    view_label: "[Rollup Measures] Newsletter by Day"
    type:  left_outer
    sql_on: ${email_send_job_newsletter_bridge.newsletter_id} = ${email_newsletter_summary.newsletter_id}
        and ${email_send_job_newsletter_bridge.newsletter_id} is not null ;;
    relationship: one_to_many
  }
}

explore: email_summary {
  from: email_summary
  description: "For rollup reporting on email sends. One row per email job."
  join:  lists {
    type: left_outer
    sql_on: ${email_summary.list_id} = ${lists.list_id};;
    relationship: many_to_one
  }
  join:  send_jobs {
    type: left_outer
    sql_on: ${email_summary.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join: send_date {
    view_label: "Date [Sent]"
    from: calendar_date
    type:  inner
    sql_on: ${send_jobs.sent_time}::date = ${send_date.calendar_date} ;;
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
}


explore: newsletter_summary {
  from: email_newsletter_summary
  description: "For rollup reporting on newsletter (list) level performace over time. One row per newsletter per day that had sends."
  join: send_date {
    view_label: "Date [Sent]"
    from: calendar_date
    type:  inner
    sql_on: ${newsletter_summary.daydate}::date = ${send_date.calendar_date} ;;
    relationship: many_to_one
  }
  join: email_send_job_newsletter_bridge {
    type:  left_outer
    sql_on: ${newsletter_summary.newsletter_id} = ${email_send_job_newsletter_bridge.newsletter_id} ;;
    relationship: one_to_many
  }
  join:  send_jobs {
    type: left_outer
    sql_on: ${email_send_job_newsletter_bridge.send_id} = ${send_jobs.send_id};;
    relationship: many_to_one
  }
  join: newsletter_lookup {
    type:  left_outer
    sql_on: ${newsletter_summary.newsletter_id} = ${newsletter_lookup.newsletter_id};;
    relationship: one_to_many
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
}

explore: newsletters {
#   persist_with: default
  from: newsletter_lookup
  description: "Information on Newsletters (lists). Includes subscriber counts, list name, list type, etc."
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
