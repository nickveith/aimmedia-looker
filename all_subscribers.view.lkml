view: all_subscribers {

  derived_table: {
    sql: select sub.*
    , case when i.medium = 'scrub' then 'InfoGroup Scrub' when i.medium = 'append' then 'InfoGroup Append' else 'House File' end as subscriber_source
 from PUBLIC.ALL_SUBSCRIBERS  sub
 left join (select email_address
                 , max(snl.medium) as medium
                 , max(1) as infogroup
              from PUBLIC.SUBSCRIBER_NEWSLETTERS_LOG snl
            where snl.source = 'infogroup'
              and snl.medium in ('scrub','append')
            group by 1
            ) i on (lower(sub.EMAIL_ADDRESS) = lower(i.email_address))
            ;;
  }

  dimension: bounce_count {
    type: string
    sql: ${TABLE}.BOUNCE_COUNT ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension_group: date_joined {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE_JOINED ;;
  }

  dimension_group: date_undeliverable {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE_UNDELIVERABLE ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.DOMAIN ;;
  }

  dimension: email_address {
    type: string
    sql: lower(${TABLE}.EMAIL_ADDRESS) ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.LOCALE ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: subscriber_id {
    type: number
    sql: ${TABLE}.SUBSCRIBER_ID ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}.SUBSCRIBER_KEY ;;
  }

  dimension: subscriber_type {
    type: string
    sql: ${TABLE}.SUBSCRIBER_TYPE ;;
  }

  dimension: subscriber_source {
    type: string
    sql: ${TABLE}.subscriber_source;;
  }

  dimension_group: unsub {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.UNSUB_DATE ;;
  }

    measure: count {
    type: count
    drill_fields: []
  }
}
