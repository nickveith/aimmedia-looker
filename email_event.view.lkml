view: email_event {
  derived_table: {
    sql:SELECT s.id AS event_id,
               s.client_id,
               s.send_id,
               s.subscriber_id,
               s.list_id,
               s.event_date AS send_date,
               s.event_date,
               s.event_type,
               s.batch_id::int AS batch_id,
               s.triggered_send_external_id,
               s.campaign_id,
               s.email_address AS email_address,
               NULL AS url,
               NULL AS url_id,
               NULL AS bounce_category,
               NULL AS bounce_reason,
               NULL AS smtp_code,
               NULL AS unsub_reason,
               NULL AS spam_domain
        FROM email_sends s
        UNION ALL
        SELECT o.id AS event_id,
               o.client_id,
               o.send_id,
               o.subscriber_id,
               o.list_id,
               s.event_date AS send_date,
               o.event_date,
               o.event_type,
               o.batch_id::int AS batch_id,
               o.triggered_send_external_id,
               s.campaign_id AS campaign_id,
               s.email_address AS email_address,
               NULL AS url,
               NULL AS url_id,
               NULL AS bounce_category,
               NULL AS bounce_reason,
               NULL AS smtp_code,
               NULL AS unsub_reason,
               NULL AS spam_domain
        FROM email_opens o
          LEFT JOIN email_sends s
                 ON (s.client_id = o.client_id
                AND s.send_id = o.send_id
                AND s.subscriber_id = o.subscriber_id
                AND s.list_id = o.list_id
                AND s.batch_id = o.batch_id
                AND s.triggered_send_external_id = o.triggered_send_external_id)
        UNION ALL
        SELECT c.id AS event_id,
               c.client_id,
               c.send_id,
               c.subscriber_id,
               c.list_id,
               s.event_date AS send_date,
               c.event_date,
               c.event_type,
               c.batch_id::int AS batch_id,
               c.triggered_send_external_key AS triggered_send_external_id,
               s.campaign_id,
               s.email_address AS email_address,
               c.url AS url,
               c.url_id AS url_id,
               NULL AS bounce_category,
               NULL AS bounce_reason,
               NULL AS smtp_code,
               NULL AS unsub_reason,
               NULL AS spam_domain
        FROM email_clicks c
          LEFT JOIN email_sends s
                 ON (s.client_id = c.client_id
                AND s.send_id = c.send_id
                AND s.subscriber_id = c.subscriber_id
                AND s.list_id = c.list_id
                AND s.batch_id = c.batch_id
                AND s.triggered_send_external_id = c.triggered_send_external_key)
        UNION ALL
        SELECT b.id AS event_id,
               b.client_id,
               b.send_id,
               b.subscriber_id,
               b.list_id,
               s.event_date AS send_date,
               b.event_date,
               b.event_type,
               s.batch_id::int AS batch_id,
               s.triggered_send_external_id,
               s.campaign_id,
               s.email_address AS email_address,
               NULL AS url,
               NULL AS url_id,
               b.bounce_category AS bounce_category,
               b.bounce_reason AS bounce_reason,
               b.smtp_code AS smtp_code,
               NULL AS unsub_reason,
               NULL AS spam_domain
        FROM email_bounce b
          LEFT JOIN email_sends s
                 ON (s.client_id = b.client_id
                AND s.send_id = b.send_id
                AND s.subscriber_id = b.subscriber_id
                AND s.list_id = b.list_id)
        UNION ALL
        SELECT u.id AS event_id,
               u.client_id,
               u.send_id,
               u.subscriber_id,
               u.list_id,
               s.event_date AS send_date,
               u.event_date,
               u.event_type,
               u.batch_id::int AS batch_id,
               s.triggered_send_external_id,
               s.campaign_id,
               s.email_address AS email_address,
               NULL AS url,
               NULL AS url_id,
               NULL AS bounce_category,
               NULL AS bounce_reason,
               NULL AS smtp_code,
               u.unsub_reason AS unsub_reason,
               NULL AS spam_domain
        FROM email_unsubs u
          LEFT JOIN email_sends s
                 ON (s.client_id = u.client_id
                AND s.send_id = u.send_id
                AND s.subscriber_id = u.subscriber_id
                AND s.list_id = u.list_id)
        UNION ALL
        SELECT c.id AS event_id,
               c.client_id,
               c.send_id,
               c.subscriber_id,
               c.list_id,
               s.event_date AS send_date,
               c.event_date,
               c.event_type,
               c.batch_id::int AS batch_id,
               s.triggered_send_external_id,
               s.campaign_id,
               s.email_address AS email_address,
               NULL AS url,
               NULL AS url_id,
               NULL AS bounce_category,
               NULL AS bounce_reason,
               NULL AS smtp_code,
               NULL AS unsub_reason,
               c.domain AS spam_domain
        FROM email_complaints c
          LEFT JOIN email_sends s
                 ON (s.client_id = c.client_id
                AND s.send_id = c.send_id
                AND s.subscriber_id = c.subscriber_id
                AND s.list_id = c.list_id);;
    persist_for: "24 hours"
  }

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: send_id {
    type: number
    hidden: yes
    sql: ${TABLE}.send_id ;;
  }

  dimension: subscriber_id {
    type: number
    hidden: yes
    sql: ${TABLE}.subscriber_id ;;
  }

  dimension: list_id {
    type: number
    hidden: yes
    sql: ${TABLE}.list_id ;;
  }

  dimension: send_date {
    type: date
    hidden: yes
    sql: ${TABLE}.send_date::date ;;
  }

  dimension: send_datetime {
    type: date_time
    hidden: yes
    sql: ${TABLE}.send_date ;;
  }

  dimension: event_date {
    type: date
    hidden: yes
    sql: ${TABLE}.event_date::date ;;
  }

  dimension: event_datetime {
    type: date_time
    hidden: yes
    sql: ${TABLE}.event_date ;;
  }

  dimension: event_type {
    type: string
    hidden: yes
    sql: ${TABLE}.event_type ;;
  }

  dimension: batch_id {
    type: number
    hidden: yes
    sql: ${TABLE}.batch_id ;;
  }

  dimension: triggered_send_external_id {
    type: string
    hidden: yes
    sql: ${TABLE}.triggered_send_external_id ;;
  }

  dimension: campaign_id {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: email_domain {
    type: string
    sql: lower(rtrim(substring(${TABLE}.email_address, regexp_instr(${TABLE}.email_address, '@') + 1,length(${TABLE}.email_address))));;
  }

  dimension: event_time_delta {
    type: number
    sql:  datediff(minute, ${send_datetime}, ${event_datetime}) ;;
  }

  # EMAIL_SENDS #################################################################

  measure: sends {
    type: count_distinct
    sql: case when ${event_type} = 'Sent' then ${id} end  ;;
  }

  measure: user_initiated_jobs {
    type: count_distinct
    sql: case when ${event_type} = 'Sent' and ${triggered_send_external_id} is null then ${send_id} end;;
  }

  measure: triggered_journey_jobs {
    type: count_distinct
    sql: case when ${event_type} = 'Sent' and ${triggered_send_external_id} is not null then ${send_id} end;;
  }

  measure: unique_sent_subscribers {
    type: count_distinct
    sql: ${subscriber_id}  ;;
    drill_fields: [id]
  }

  measure: send_frequency {
    type: number
    sql: case when ${unique_sent_subscribers} = 0 then 0 else ${sends}/${unique_sent_subscribers}
      end / count(distinct ${event_date});;
    drill_fields: [id]
  }

  # EMAIL_OPENS #################################################################

  measure: opens {
    type: count_distinct
    sql: case when ${event_type} = 'Open' then ${id} end  ;;
  }

  measure: opens_unique {
    type: count_distinct
    sql: case when ${event_type} = 'Open' then ${client_id}||'|'||${send_id}||'|'||${batch_id}||'|'||${client_id}||'|'||${subscriber_id} end  ;;
  }

  measure: open_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${opens_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_CLICKS #################################################################

  dimension: full_url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: url {
    type: string
    sql: substring(regexp_substr(${TABLE}.URL, '^https?://[^\?]+'),1,100) ;;
  }

  dimension: url_id {
    type: number
    sql: ${TABLE}.URL_ID ;;
  }

  measure: clicks {
    type: count_distinct
    sql: case when ${event_type} = 'Click' then ${id} end  ;;
  }

  measure: clicks_unique {
    type: count_distinct
    sql: case when ${event_type} = 'Click' then ${client_id}||'|'||${send_id}||'|'||${batch_id}||'|'||${client_id}||'|'||${subscriber_id} end  ;;
  }

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

  dimension: bounce_category {
    type: string
    sql: ${TABLE}.BOUNCE_CATEGORY ;;
  }

  dimension: bounce_reason {
    type: string
    sql: ${TABLE}.BOUNCE_REASON ;;
  }

  dimension: smtp_code {
    type: string
    sql: ${TABLE}.SMTP_CODE ;;
  }

  measure: bounces {
    type: count_distinct
    sql: case when ${event_type} = 'Bounce' then ${id} end  ;;
  }

  measure: bounces_unique {
    type: count_distinct
    sql: case when ${event_type} = 'Bounce' then ${client_id}||'|'||${send_id}||'|'||${batch_id}||'|'||${client_id}||'|'||${subscriber_id} end  ;;
  }

  measure: bounce_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${bounces_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_UNSUBS #################################################################

  dimension: unsub_reason {
    type: string
    sql: ${TABLE}.UNSUB_REASON ;;
  }

  measure: unsubs {
    type: count_distinct
    sql: case when ${event_type} = 'Unsubscribe' then ${id} end  ;;
  }

  measure: unsubs_unique {
    type: count_distinct
    sql: case when ${event_type} = 'Unsubscribe' then ${client_id}||'|'||${send_id}||'|'||${batch_id}||'|'||${client_id}||'|'||${subscriber_id} end  ;;
  }

  measure: unsub_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${unsubs_unique} / nullif(${sends},0) ;;
  }

  # EMAIL_COMPLAINTS #################################################################

  dimension: spam_domain {
    type: string
    sql: ${TABLE}.spam_domain ;;
  }

  measure: spam_complaints {
    type: count_distinct
    sql: case when ${event_type} = 'SpamComplaint' then ${id} end  ;;
  }

  measure: spam_complaints_unique {
    type: count_distinct
    sql: case when ${event_type} = 'SpamComplaint' then ${client_id}||'|'||${send_id}||'|'||${batch_id}||'|'||${client_id}||'|'||${subscriber_id} end  ;;
  }

  measure: complaint_rate {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${spam_complaints_unique} / nullif(${sends},0) ;;
  }

}
