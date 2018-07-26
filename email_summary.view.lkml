view: email_summary {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:select j.send_id
             , s.list_id
             , sum(s.total_sends) as total_sends
             , sum(o.total_opens) as total_opens
             , sum(o.total_unique_opens) as total_unique_opens
             , sum(c.total_clicks) as total_clicks
             , sum(c.total_unique_clicks) as total_unique_clicks
             , sum(b.total_bounces) as total_bounces
             , sum(b.total_unique_bounces) as total_unique_bounces
             , sum(u.total_unsubs) as total_unsubs
             , sum(u.total_unique_unsubs) as total_unique_unsubs
             , sum(x.total_spam_complaints) as total_spam_complaints
             , sum(x.total_unique_spam_complaints) as total_unique_spam_complaints
          from email_send_jobs j
               left join (select send_id, list_id, count(1) as total_sends from email_sends group by 1,2) s on (j.send_id = s.send_id)
               left join (select send_id, list_id, count(1) as total_opens, count(distinct subscriber_key) as total_unique_opens from email_opens o group by 1,2) o on (s.send_id = o.send_id and s.list_id = o.list_id)
               left join (select send_id, list_id, count(1) as total_clicks, count(distinct subscriber_key) as total_unique_clicks from email_clicks c group by 1,2) c on (s.send_id = c.send_id and s.list_id = c.list_id)
               left join (select send_id, list_id, count(1) as total_unsubs, count(distinct subscriber_key) as total_unique_unsubs  from email_unsubs group by 1,2) u on (s.send_id = u.send_id and s.list_id = u.list_id)
               left join (select send_id, list_id, count(1) as total_bounces, count(distinct subscriber_key) as total_unique_bounces  from email_bounce group by 1,2) b on (s.send_id = b.send_id and s.list_id = b.list_id)
               left join (select send_id, list_id, count(1) as total_spam_complaints, count(distinct subscriber_key) as total_unique_spam_complaints  from email_complaints group by 1,2) x on (s.send_id = x.send_id and s.list_id = x.list_id)
        group by 1,2;;
    persist_for: "24 hour"
  }

  # Define your dimensions and measures here, like this:
  dimension: email_summary_pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.send_id || ' ' || ${TABLE}.list_id   ;;
  }

  dimension: send_id {
    type: number
    hidden: yes
    sql: ${TABLE}.send_id ;;
  }

  dimension: list_id {
    type: number
    hidden: yes
    sql: ${TABLE}.list_id ;;
  }

  measure: sends {
    type: sum
    sql: ${TABLE}.total_sends ;;
  }

  measure: opens {
    type: sum
    sql: ${TABLE}.total_opens ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.total_clicks ;;
  }

  measure: bounces {
    type: sum
    sql: ${TABLE}.total_bounces ;;
  }

  measure: unsubs {
    type: sum
    sql: ${TABLE}.total_unsubs ;;
  }
  measure: opens_unique {
    type: sum
    sql: ${TABLE}.total_unique_opens ;;
  }

  measure: clicks_unique {
    type: sum
    sql: ${TABLE}.total_unique_clicks ;;
  }

  measure: bounces_unique {
    type: sum
    sql: ${TABLE}.total_unique_bounces ;;
  }

  measure: unsubs_unique {
    type: sum
    sql: ${TABLE}.total_unique_unsubs ;;
  }

  measure: spam_complaints {
    type: sum
    sql: ${TABLE}.total_spam_complaints ;;
  }

  measure: spam_complaints_unique {
    type: sum
    sql: ${TABLE}.total_unique_spam_complaints ;;
  }

  # EMAIL_OPENS #################################################################

  measure: open_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${opens_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_CLICKS #################################################################

  measure: click_through_rate {
    type: number
    label:"CTR"
    value_format_name: percent_2
    sql:  1.0 * ${clicks_unique} / nullif(${sends},0) ;;
  }

  measure: click_to_open_rate_unique {
    type: number
    label: "CTOR"
    value_format_name: percent_2
    sql:  1.0 * ${clicks_unique} / nullif(${opens_unique},0) ;;
  }

  # EMAIL_BOUNCE #################################################################

  measure: bounce_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${bounces_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_UNSUBS #################################################################

  measure: unsub_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unsubs_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_COMPLAINTS #################################################################

  measure: complaint_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${spam_complaints_unique} / nullif(${sends},0) ;;
  }


}
