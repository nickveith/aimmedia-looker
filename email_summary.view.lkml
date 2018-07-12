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
          from email_send_jobs j
               left join (select send_id, list_id, count(1) as total_sends from email_sends group by 1,2) s on (j.send_id = s.send_id)
               left join (select send_id, list_id, count(1) as total_opens, count(distinct subscriber_key) as total_unique_opens from email_opens o group by 1,2) o on (s.send_id = o.send_id and s.list_id = o.list_id)
               left join (select send_id, list_id, count(1) as total_clicks, count(distinct subscriber_key) as total_unique_clicks from email_clicks c group by 1,2) c on (s.send_id = c.send_id and s.list_id = c.list_id)
               left join (select send_id, list_id, count(1) as total_unsubs, count(distinct subscriber_key) as total_unique_unsubs  from email_unsubs group by 1,2) u on (s.send_id = u.send_id and s.list_id = u.list_id)
               left join (select send_id, list_id, count(1) as total_bounces, count(distinct subscriber_key) as total_unique_bounces  from email_bounce group by 1,2) b on (s.send_id = b.send_id and s.list_id = b.list_id)
        group by 1,2
                ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: email_summary_pk {
    primary_key: yes
    type: string
    sql: ${TABLE}.send_id || ' ' || ${TABLE}.list_id   ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.list_id ;;
  }

  measure: total_sends {
    type: sum
    sql: ${TABLE}.total_sends ;;
  }

  measure: total_opens {
    type: sum
    sql: ${TABLE}.total_opens ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${TABLE}.total_clicks ;;
  }

  measure: total_bounces {
    type: sum
    sql: ${TABLE}.total_bounces ;;
  }

  measure: total_unsubs {
    type: sum
    sql: ${TABLE}.total_unsubs ;;
  }
  measure: total_unique_opens {
    type: sum
    sql: ${TABLE}.total_unique_opens ;;
  }

  measure: total_unique_clicks {
    type: sum
    sql: ${TABLE}.total_unique_clicks ;;
  }

  measure: total_unique_bounces {
    type: sum
    sql: ${TABLE}.total_unique_bounces ;;
  }

  measure: total_unique_unsubs {
    type: sum
    sql: ${TABLE}.total_unique_unsubs ;;
  }

}