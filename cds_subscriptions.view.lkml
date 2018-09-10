view: cds_subscriptions {
  sql_table_name: PUBLIC.CDS_SUBSCRIPTIONS ;;

  dimension: account_number {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER" ;;
  }

  dimension: account_number_check {
    type: number
    sql: ${TABLE}."ACCOUNT_NUMBER_CHECK" ;;
  }

  dimension: alternative_delivery_indicator {
    type: string
    sql: ${TABLE}."ALTERNATIVE_DELIVERY_INDICATOR" ;;
  }

  dimension: busted {
    type: string
    sql: ${TABLE}."BUSTED" ;;
  }

  dimension: current_email_address {
    type: string
    sql: ${TABLE}."CURRENT_EMAIL_ADDRESS" ;;
  }

  dimension: daily_expire_date {
    type: string
    sql: ${TABLE}."DAILY_EXPIRE_DATE" ;;
  }

  dimension: delivery_status {
    type: string
    sql: ${TABLE}."DELIVERY_STATUS" ;;
  }

  dimension: email_authorization {
    type: string
    sql: ${TABLE}."EMAIL_AUTHORIZATION" ;;
  }

  dimension_group: email_from {
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
    sql: ${TABLE}."EMAIL_FROM_DATE" ;;
  }

  dimension: email_password {
    type: string
    sql: ${TABLE}."EMAIL_PASSWORD" ;;
  }

  dimension_group: email_through {
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
    sql: ${TABLE}."EMAIL_THROUGH_DATE" ;;
  }

  dimension: email_user {
    type: string
    sql: ${TABLE}."EMAIL_USER" ;;
  }

  dimension_group: file {
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
    sql: ${TABLE}."FILE_DATE" ;;
  }

  dimension: future_zipcode_change {
    type: yesno
    sql: ${TABLE}."FUTURE_ZIPCODE_CHANGE" ;;
  }

  dimension: gift_promo_key {
    type: string
    sql: ${TABLE}."GIFT_PROMO_KEY" ;;
  }

  dimension: group_number_or_model_score {
    type: string
    sql: ${TABLE}."GROUP_NUMBER_OR_MODEL_SCORE" ;;
  }

  dimension: issue_label_edition {
    type: string
    sql: ${TABLE}."ISSUE_LABEL_EDITION" ;;
  }

  dimension: last_issue {
    type: number
    sql: ${TABLE}."LAST_ISSUE" ;;
  }

  dimension: list_rental_switch {
    type: string
    sql: ${TABLE}."LIST_RENTAL_SWITCH" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension: marketing_database_account_number {
    type: string
    sql: ${TABLE}."MARKETING_DATABASE_ACCOUNT_NUMBER" ;;
  }

  dimension: non_gift_promo_key {
    type: string
    sql: ${TABLE}."NON_GIFT_PROMO_KEY" ;;
  }

  dimension: non_revenue_issues_extended {
    type: number
    sql: ${TABLE}."NON_REVENUE_ISSUES_EXTENDED" ;;
  }

  dimension: number_of_copies {
    type: number
    sql: ${TABLE}."NUMBER_OF_COPIES" ;;
  }

  dimension: overall_expiration_issue {
    type: number
    sql: ${TABLE}."OVERALL_EXPIRATION_ISSUE" ;;
  }

  dimension: permission_0 {
    type: string
    sql: ${TABLE}."PERMISSION_0" ;;
  }

  dimension: permission_1 {
    type: string
    sql: ${TABLE}."PERMISSION_1" ;;
  }

  dimension: permission_2 {
    type: string
    sql: ${TABLE}."PERMISSION_2" ;;
  }

  dimension: permission_3 {
    type: string
    sql: ${TABLE}."PERMISSION_3" ;;
  }

  dimension: permission_4 {
    type: string
    sql: ${TABLE}."PERMISSION_4" ;;
  }

  dimension: permission_5 {
    type: string
    sql: ${TABLE}."PERMISSION_5" ;;
  }

  dimension: permission_6 {
    type: string
    sql: ${TABLE}."PERMISSION_6" ;;
  }

  dimension: permission_7 {
    type: string
    sql: ${TABLE}."PERMISSION_7" ;;
  }

  dimension: permission_8 {
    type: string
    sql: ${TABLE}."PERMISSION_8" ;;
  }

  dimension: permission_9 {
    type: string
    sql: ${TABLE}."PERMISSION_9" ;;
  }

  dimension: promotion_restriction_codes {
    type: string
    sql: ${TABLE}."PROMOTION_RESTRICTION_CODES" ;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}."RECORD_TYPE" ;;
  }

  dimension: resumed_issue {
    type: number
    sql: ${TABLE}."RESUMED_ISSUE" ;;
  }

  dimension: service_status {
    type: string
    sql: ${TABLE}."SERVICE_STATUS" ;;
  }

  dimension: special_handling_code {
    type: string
    sql: ${TABLE}."SPECIAL_HANDLING_CODE" ;;
  }

  dimension: special_product_code {
    type: string
    sql: ${TABLE}."SPECIAL_PRODUCT_CODE" ;;
  }

  dimension: start_issue {
    type: number
    sql: ${TABLE}."START_ISSUE" ;;
  }

  dimension: sweeps_responder {
    type: string
    sql: ${TABLE}."SWEEPS_RESPONDER" ;;
  }

  dimension: times_subscriber_renewed {
    type: number
    sql: ${TABLE}."TIMES_SUBSCRIBER_RENEWED" ;;
  }


  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."ZIPCODE" ;;
  }
}
