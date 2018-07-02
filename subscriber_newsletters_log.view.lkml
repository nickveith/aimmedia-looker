view: subscriber_newsletters_log {

  derived_table: {
    sql: select *
              , rank() over (partition by address order by import_date desc) as rnk
              , case when rank() over (partition by address order by import_date desc) = 1 then true else false end as is_current
           from PUBLIC.SUBSCRIBER_NEWSLETTERS_LOG
              ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: added_by_user {
    type: string
    sql: ${TABLE}."ADDED_BY_USER" ;;
  }

  dimension: automation_or_api {
    type: string
    sql: ${TABLE}."AUTOMATION_OR_API" ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}."BRAND_CODE" ;;
  }

  dimension: bu_code {
    type: string
    sql: ${TABLE}."BU_CODE" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}."CAMPAIGN" ;;
  }

  dimension: currently_subscribed {
    type: yesno
    sql: ${TABLE}."CURRENTLY_SUBSCRIBED" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension: filename_or_url {
    type: string
    sql: ${TABLE}."FILENAME_OR_URL" ;;
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
    sql: ${TABLE}."IMPORT_DATE" ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}."IP_ADDRESS" ;;
  }

  dimension: jobid {
    type: number
    value_format_name: id
    sql: ${TABLE}."JOBID" ;;
  }

  dimension: list_number {
    type: number
    sql: ${TABLE}."LIST_NUMBER" ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}."MEDIUM" ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}."NEWSLETTER_ID" ;;
  }

  dimension: newsletter_name {
    type: string
    sql: ${TABLE}."NEWSLETTER_NAME" ;;
  }

  dimension: processed {
    type: string
    sql: ${TABLE}."PROCESSED" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}."SUBSCRIBER_KEY" ;;
  }

  dimension: upload_description {
    type: string
    sql: ${TABLE}."UPLOAD_DESCRIPTION" ;;
  }

  dimension: record_rank {
    type: number
    sql: ${TABLE}.RNK ;;
  }

  dimension: is_current {
    type: yesno
    sql: ${TABLE}.IS_CURRENT ;;
  }
}
