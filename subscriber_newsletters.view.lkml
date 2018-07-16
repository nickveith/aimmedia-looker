view: subscriber_newsletters {
  sql_table_name: PUBLIC.SUBSCRIBER_NEWSLETTERS ;;


  dimension: currently_subscribed {
    type: yesno
    sql: ${TABLE}.currently_subscribed ;;
  }

  dimension_group: import {
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
    sql: ${TABLE}.import_date ;;
  }


  dimension: newsletter_id {
    type: string
    hidden: yes
    sql: UPPER(${TABLE}.newsletter_id) ;;
  }

  dimension: subcriber_newsletters_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.subscriber_key || ' ' || ${TABLE}.newsletter_id;;
  }

  dimension: subscriber_key {
    type: string
    hidden: yes
    sql: ${TABLE}.subscriber_key ;;
  }

  dimension_group: update {
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
    sql: ${TABLE}.update_date ;;
  }

  measure: subscribers {
    type: count
  }

  measure: unique_subscribers {
    type: number
    sql:  count(distinct ${subscriber_key});;
  }

}
