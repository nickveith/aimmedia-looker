view: subscriber_newsletters {
  sql_table_name: PUBLIC.SUBSCRIBER_NEWSLETTERS ;;

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: bu_code {
    type: string
    sql: ${TABLE}.bu_code ;;
  }

  dimension: currently_subscribed {
    type: yesno
    sql: ${TABLE}.currently_subscribed ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
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

  dimension: jobid {
    type: number
    value_format_name: id
    sql: ${TABLE}.jobid ;;
  }

  dimension: list_number {
    type: number
    sql: ${TABLE}.list_number ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}."newsletter_id" ;;
  }

  dimension: subcriber_newsletters_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."subscriber_key" || ' ' || ${TABLE}."newsletter_id";;
  }


  dimension: newsletter_name {
    type: string
    sql: ${TABLE}."newsletter_name" ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}."subscriber_key" ;;
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
    drill_fields: ["newsletter_name"]
  }

  measure: unique_subscribers {
    type: number
    sql:  count(distinct ${subscriber_key});;
    drill_fields: [newsletter_name]
  }

}
