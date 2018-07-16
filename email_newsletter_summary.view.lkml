view: email_newsletter_summary {

  derived_table: {
    sql:select UPPER(lkp.newsletter_id) as newsletter_id
             , j.SENT_TIME::date as daydate
             , sum(s.total_sends) as total_sends
             , sum(o.total_opens) as total_opens
             , sum(o.total_unique_opens) as total_unique_opens
             , sum(c.total_clicks) as total_clicks
             , sum(c.total_unique_clicks) as total_unique_clicks
             , sum(b.total_bounces) as total_bounces
             , sum(b.total_unique_bounces) as total_unique_bounces
             , sum(u.total_unsubs) as total_unsubs
             , sum(u.total_unique_unsubs) as total_unique_unsubs
             , sum(com.total_complaints) as total_complaints
             , sum(com.total_unique_complaints) as total_unique_complaints
          from email_send_jobs j
               join  (select j.send_id,
                             lkp.newsletter_id
                        FROM PUBLIC.EMAIL_SEND_JOBS j,
                             LATERAL flatten (split (replace (trim (regexp_substr (email_name,'\\[[A-Za-z0-9_ ]+\\]'),'[] '),' ',','),',')) f
                        JOIN newsletter_lookup lkp ON (lkp.newsletter_id = UPPER(trim (f.value,'"')))
                      ) lkp on (j.send_id = lkp.send_id)
               left join (select send_id, list_id, count(1) as total_sends from email_sends group by 1,2) s on (j.send_id = s.send_id)
               left join (select send_id, list_id, count(1) as total_opens, count(distinct subscriber_key) as total_unique_opens from email_opens o group by 1,2) o on (s.send_id = o.send_id and s.list_id = o.list_id)
               left join (select send_id, list_id, count(1) as total_clicks, count(distinct subscriber_key) as total_unique_clicks from email_clicks c group by 1,2) c on (s.send_id = c.send_id and s.list_id = c.list_id)
               left join (select send_id, list_id, count(1) as total_unsubs, count(distinct subscriber_key) as total_unique_unsubs  from email_unsubs group by 1,2) u on (s.send_id = u.send_id and s.list_id = u.list_id)
               left join (select send_id, list_id, count(1) as total_bounces, count(distinct subscriber_key) as total_unique_bounces  from email_bounce group by 1,2) b on (s.send_id = b.send_id and s.list_id = b.list_id)
               left join (select send_id, list_id, count(1) as total_complaints, count(distinct subscriber_key) as total_unique_complaints  from email_complaints group by 1,2) com on (s.send_id = com.send_id and s.list_id = com.list_id)

        group by 1,2;;
    persist_for: "24 hour"
  }

  # Define your dimensions and measures here, like this:
  dimension: email_summary_pk {
    primary_key: yes
    type: string
    sql: ${TABLE}.newsletter_id || ' ' || ${TABLE}.daydate   ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}.newsletter_id ;;
  }

  dimension: daydate {
    type: date
    sql: ${TABLE}.daydate ;;
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

  measure: complaints {
    type: sum
    sql: ${TABLE}.total_complaints ;;
  }

  measure: unique_complaints {
    type: sum
    sql: ${TABLE}.total_unique_complaints ;;
  }

  measure: unsubs {
    type: sum
    sql: ${TABLE}.total_unsubs ;;
  }
  measure: unique_opens {
    type: sum
    sql: ${TABLE}.total_unique_opens ;;
  }

  measure: unique_clicks {
    type: sum
    sql: ${TABLE}.total_unique_clicks ;;
  }

  measure: unique_bounces {
    type: sum
    sql: ${TABLE}.total_unique_bounces ;;
  }

  measure: unique_unsubs {
    type: sum
    sql: ${TABLE}.total_unique_unsubs ;;
  }

  measure: open_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_opens} / nullif(${sends},0) ;;
  }

  measure: click_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_clicks} / nullif(${sends},0) ;;
  }

  measure: unsub_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_unsubs} / nullif(${sends},0) ;;
  }

  measure: bounce_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_bounces} / nullif(${sends},0) ;;
  }

  measure: complaint_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unique_complaints} / nullif(${sends},0) ;;
  }


}
