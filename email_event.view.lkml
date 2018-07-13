view: email_event {
  derived_table: {
    sql: select id as event_id
             , client_id
             , send_id
             , subscriber_id
             , list_id
             , event_date
             , event_type
             , batch_id::int as batch_id
             , triggered_send_external_id
             , campaign_id
          from email_sends
        UNION ALL
        select o.id as event_id
             , o.client_id
             , o.send_id
             , o.subscriber_id
             , o.list_id
             , o.event_date
             , o.event_type
             , o.batch_id::int as batch_id
             , o.triggered_send_external_id
             , s.campaign_id as campaign_id
          from email_opens o
               left join email_sends s on ( s.client_id = o.client_id
                                       and s.send_id = o.send_id
                                       and s.subscriber_id = o.subscriber_id
                                       and s.list_id = o.list_id
                                       and s.batch_id = o.batch_id
                                       and s.triggered_send_external_id = o.triggered_send_external_id
                                       )
        UNION ALL
        select c.id as event_id
             , c.client_id
             , c.send_id
             , c.subscriber_id
             , c.list_id
             , c.event_date
             , c.event_type
             , c.batch_id::int as batch_id
             , c.triggered_send_external_key as triggered_send_external_id
             , s.campaign_id
          from email_clicks c
               left join email_sends s on ( s.client_id = c.client_id
                                       and s.send_id = c.send_id
                                       and s.subscriber_id = c.subscriber_id
                                       and s.list_id = c.list_id
                                       and s.batch_id = c.batch_id
                                       and s.triggered_send_external_id = c.triggered_send_external_key
                                       )
        UNION ALL
        select b.id as event_id
             , b.client_id
             , b.send_id
             , b.subscriber_id
             , b.list_id
             , b.event_date
             , b.event_type
             , s.batch_id::int as batch_id
             , s.triggered_send_external_id
             , s.campaign_id
          from email_bounce b
               left join email_sends s on ( s.client_id = b.client_id
                                     and s.send_id = b.send_id
                                     and s.subscriber_id = b.subscriber_id
                                     and s.list_id = b.list_id
                                     )
        UNION ALL
        select u.id as event_id
             , u.client_id
             , u.send_id
             , u.subscriber_id
             , u.list_id
             , u.event_date
             , u.event_type
             , u.batch_id::int as batch_id
             , s.triggered_send_external_id
             , s.campaign_id
          from email_unsubs u
               left join email_sends s on ( s.client_id = u.client_id
                                     and s.send_id = u.send_id
                                     and s.subscriber_id = u.subscriber_id
                                     and s.list_id = u.list_id
                                     )
        UNION ALL
        select c.id as event_id
             , c.client_id
             , c.send_id
             , c.subscriber_id
             , c.list_id
             , c.event_date
             , c.event_type
             , c.batch_id::int as batch_id
             , s.triggered_send_external_id
             , s.campaign_id
          from email_complaints c
               left join email_sends s on ( s.client_id = c.client_id
                                     and s.send_id = c.send_id
                                     and s.subscriber_id = c.subscriber_id
                                     and s.list_id = c.list_id
                                     )
                                    ;;
    persist_for: "24 hours"
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: batch_id {
    type: number
    sql: ${TABLE}.BATCH_ID ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.CAMPAIGN_ID ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: event_date {
    type: date_time
    sql: ${TABLE}.EVENT_DATE::date ;;
  }

  dimension: event_datetime {
    type: date_time
    sql: ${TABLE}.EVENT_DATE::date ;;
  }

  dimension: send_datetime {
    type: date_time
    sql: ${TABLE}.EVENT_DATE ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.EVENT_TYPE ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.LIST_ID ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID ;;
  }

  dimension: triggered_send_external_id {
    type: string
    sql: ${TABLE}.TRIGGERED_SEND_EXTERNAL_ID ;;
  }

}
