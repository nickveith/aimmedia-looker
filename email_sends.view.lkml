view: sends {
  sql_table_name: PUBLIC.EMAIL_SENDS ;;

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

  dimension: email_address {
    type: string
    sql: ${TABLE}.EMAIL_ADDRESS

    ;;
  }

  dimension: email_domain {
  type: string
  sql: lower(rtrim(substring(${TABLE}.subscriber_key, regexp_instr(${TABLE}.subscriber_key, '@') + 1,length(${TABLE}.subscriber_key))))
  ;;
  }


  dimension_group: event_date {
    type: time
    timeframes: [date,day_of_week,day_of_month, month_name, month, year, quarter_of_year]
    drill_fields: [group]
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

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}.SUBSCRIBER_KEY ;;
  }

  dimension: triggered_send_external_id {
    type: string
    sql: ${TABLE}.TRIGGERED_SEND_EXTERNAL_ID ;;
  }

  dimension: group {
    type: string
    sql: case when ${client_id} = 7231929 then 'AIM Parent'
              when ${client_id} = 7233488 then 'Equine Group'
              when ${client_id} = 7233491 then 'Healthy Living Group'
              when ${client_id} = 7233492 then 'Home Group'
              when ${client_id} = 7237799 then 'Marine Group'
              when ${client_id} = 7233494 then 'Outdoor Group'
              else 'Other'
          end;;
  }

  measure: sends {
    type: count
    drill_fields: [id]
  }

  measure: unique_sends {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id]
  }

  measure: unique_sent_subscribers {
    type: count_distinct
    sql: ${subscriber_key}  ;;
    drill_fields: [id]
  }

  measure: send_frequency {
    type: number
    sql: case when ${unique_sent_subscribers} = 0 then 0 else ${unique_sends}/${unique_sent_subscribers}
    end / count(distinct ${event_date_date});;
    drill_fields: [id]
  }



}
