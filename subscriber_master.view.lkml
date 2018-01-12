view: subscriber_master {
  sql_table_name: PUBLIC.SUBSCRIBER_MASTER ;;

  dimension: address_1 {
    type: string
    sql: ${TABLE}.address_1 ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}.address_2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: contact_permission_status {
    type: string
    sql: ${TABLE}.contact_permission_status ;;
  }

  dimension: contact_preference {
    type: string
    sql: ${TABLE}.contact_preference ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
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
    sql: ${TABLE}.date_downloaded ;;
  }

  dimension: date_modified {
    type: string
    sql: ${TABLE}.date_modified ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: facebook_user_id {
    type: string
    sql: ${TABLE}.Facebook_UserID ;;
  }

  dimension: family_business_association {
    type: string
    sql: ${TABLE}.family_business_association ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: geolocation {
    type: string
    sql: ${TABLE}.geolocation ;;
  }

  dimension: import_date {
    type: string
    sql: ${TABLE}.import_date ;;
  }

  dimension: instagram_user_id {
    type: string
    sql: ${TABLE}.Instagram_UserID ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: modified_by {
    type: string
    sql: ${TABLE}.modified_by ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}.newsletter_id ;;
  }

  dimension: pcd_record {
    type: yesno
    sql: ${TABLE}.pcd_record ;;
  }

  dimension: phone_1 {
    type: string
    sql: ${TABLE}.phone_1 ;;
  }

  dimension: phone_1_type {
    type: string
    sql: ${TABLE}.phone_1_type ;;
  }

  dimension: phone_2 {
    type: string
    sql: ${TABLE}.phone_2 ;;
  }

  dimension: phone_2_type {
    type: string
    sql: ${TABLE}.phone_2_type ;;
  }

  dimension: pinterest_user_id {
    type: string
    sql: ${TABLE}.Pinterest_UserID ;;
  }

  dimension: record_key_alt {
    type: string
    sql: ${TABLE}.record_key_alt ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: snapchat_user_id {
    type: string
    sql: ${TABLE}.Snapchat_UserID ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: subscriber_key {
    type: string
    sql: ${TABLE}."subscriber_key" ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: twitter_user_id {
    type: string
    sql: ${TABLE}.Twitter_UserID ;;
  }

  dimension: update_date {
    type: string
    sql: ${TABLE}.update_date ;;
  }

  dimension: wc_created_date {
    type: string
    sql: ${TABLE}.wc_created_date ;;
  }

  dimension: wc_subscriber_id {
    type: string
    sql: ${TABLE}.wc_subscriber_id ;;
  }

  dimension: yonder_user_id {
    type: string
    sql: ${TABLE}.Yonder_UserID ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zip_postal ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name, full_name]
  }
}
