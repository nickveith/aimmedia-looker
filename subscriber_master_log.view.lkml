view: subscriber_master_log {
  sql_table_name: PUBLIC.SUBSCRIBER_MASTER_LOG ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: added_by_user {
    type: string
    sql: ${TABLE}."ADDED_BY_USER" ;;
  }

  dimension: address_1 {
    type: string
    sql: ${TABLE}."ADDRESS_1" ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}."ADDRESS_2" ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}."BRAND_CODE" ;;
  }

  dimension: bu_code {
    type: string
    sql: ${TABLE}."BU_CODE" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: contact_permission_status {
    type: string
    sql: ${TABLE}."CONTACT_PERMISSION_STATUS" ;;
  }

  dimension: contact_preference {
    type: string
    sql: ${TABLE}."CONTACT_PREFERENCE" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."COUNTY" ;;
  }

  dimension_group: date_downloaded {
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
    sql: ${TABLE}."DATE_DOWNLOADED" ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}."DOMAIN" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension: facebook_userid {
    type: string
    sql: ${TABLE}."FACEBOOK_USERID" ;;
  }

  dimension: family_business_association {
    type: string
    sql: ${TABLE}."FAMILY_BUSINESS_ASSOCIATION" ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}."FILE_NAME" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}."FULL_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: geolocation {
    type: string
    sql: ${TABLE}."GEOLOCATION" ;;
  }

  dimension: import_date {
    type: string
    sql: ${TABLE}."IMPORT_DATE" ;;
  }

  dimension: import_type {
    type: string
    sql: ${TABLE}."IMPORT_TYPE" ;;
  }

  dimension: instagram_userid {
    type: string
    sql: ${TABLE}."INSTAGRAM_USERID" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}."NEWSLETTER_ID" ;;
  }

  dimension: pcd_record {
    type: yesno
    sql: ${TABLE}."PCD_RECORD" ;;
  }

  dimension: phone_1 {
    type: string
    sql: ${TABLE}."PHONE_1" ;;
  }

  dimension: phone_1_type {
    type: string
    sql: ${TABLE}."PHONE_1_TYPE" ;;
  }

  dimension: phone_2 {
    type: string
    sql: ${TABLE}."PHONE_2" ;;
  }

  dimension: phone_2_type {
    type: string
    sql: ${TABLE}."PHONE_2_TYPE" ;;
  }

  dimension: pinterest_userid {
    type: string
    sql: ${TABLE}."PINTEREST_USERID" ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}."PROCESSED" ;;
  }

  dimension: record_key_alt {
    type: string
    sql: ${TABLE}."RECORD_KEY_ALT" ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}."SALUTATION" ;;
  }

  dimension: snapchat_userid {
    type: string
    sql: ${TABLE}."SNAPCHAT_USERID" ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}."STATE" ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}."SUBSCRIBER_KEY" ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}."SUFFIX" ;;
  }

  dimension: twitter_userid {
    type: string
    sql: ${TABLE}."TWITTER_USERID" ;;
  }

  dimension: upload_description {
    type: string
    sql: ${TABLE}."UPLOAD_DESCRIPTION" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  dimension: wc_created_date {
    type: string
    sql: ${TABLE}."WC_CREATED_DATE" ;;
  }

  dimension: wc_subscriber_id {
    type: string
    sql: ${TABLE}."WC_SUBSCRIBER_ID" ;;
  }

  dimension: yonder_userid {
    type: string
    sql: ${TABLE}."YONDER_USERID" ;;
  }

  dimension: zip_postal {
    type: string
    sql: ${TABLE}."ZIP_POSTAL" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, full_name, file_name]
  }
}
