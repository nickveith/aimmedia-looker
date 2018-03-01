view: fb_ad_ads {
  sql_table_name: PUBLIC.FB_AD_ADS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: ad_creative_id {
    type: string
    sql: ${TABLE}.AdCreativeId ;;
  }

  dimension: ad_set_id {
    type: string
    sql: ${TABLE}.AdSetId ;;
  }

  dimension: ad_status {
    type: string
    sql: ${TABLE}.AdStatus ;;
  }

  dimension: bid_info {
    type: string
    sql: ${TABLE}.BidInfo ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: configured_status {
    type: string
    sql: ${TABLE}.ConfiguredStatus ;;
  }

  dimension: conversion_specs {
    type: string
    sql: ${TABLE}.ConversionSpecs ;;
  }

  dimension: created_time {
    type: string
    sql: ${TABLE}.CreatedTime ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: social_prefs {
    type: string
    sql: ${TABLE}.SocialPrefs ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.Target ;;
  }

  dimension: updated_time {
    type: string
    sql: ${TABLE}.UpdatedTime ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, created_time]
  }
}
