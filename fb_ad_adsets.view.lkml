view: fb_ad_adsets {
  sql_table_name: PUBLIC.FB_AD_ADSETS ;;

  dimension: adset_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: ad_set_status {
    type: string
    sql: ${TABLE}."AdSetStatus" ;;
  }

  dimension: billing_event {
    type: string
    sql: ${TABLE}."BillingEvent" ;;
  }

  measure: budget_remaining {
    type: number
    sql: ${TABLE}."BudgetRemaining" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."CampaignId" ;;
  }

  dimension: created_time {
    type: string
    sql: ${TABLE}."CreatedTime" ;;
  }

  measure: daily_budget {
    type: sum
    sql: ${TABLE}."DailyBudget" ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}."EndTime" ;;
  }

  dimension: lifetime_budget {
    type: number
    sql: ${TABLE}."LifetimeBudget" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: recommendations {
    type: string
    sql: ${TABLE}."Recommendations" ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}."StartTime" ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}."Target" ;;
  }

  dimension: targeting_age_max {
    type: number
    sql: ${TABLE}."TargetingAgeMax" ;;
  }

  dimension: targeting_age_min {
    type: number
    sql: ${TABLE}."TargetingAgeMin" ;;
  }

  dimension: targeting_behaviors {
    type: string
    sql: ${TABLE}."TargetingBehaviors" ;;
  }

  dimension: targeting_cities {
    type: string
    sql: ${TABLE}."TargetingCities" ;;
  }

  dimension: targeting_countries {
    type: string
    sql: ${TABLE}."TargetingCountries" ;;
  }

  dimension: targeting_custom_locations {
    type: string
    sql: ${TABLE}."TargetingCustomLocations" ;;
  }

  dimension: targeting_genders {
    type: number
    sql: ${TABLE}."TargetingGenders" ;;
  }

  dimension: targeting_geo_markets {
    type: string
    sql: ${TABLE}."TargetingGeoMarkets" ;;
  }

  dimension: targeting_interests {
    type: string
    sql: ${TABLE}."TargetingInterests" ;;
  }

  dimension: targeting_location_types {
    type: string
    sql: ${TABLE}."TargetingLocationTypes" ;;
  }

  dimension: targeting_page_types {
    type: string
    sql: ${TABLE}."TargetingPageTypes" ;;
  }

  dimension: targeting_regions {
    type: string
    sql: ${TABLE}."TargetingRegions" ;;
  }

  dimension: targeting_zips {
    type: string
    sql: ${TABLE}."TargetingZips" ;;
  }

  dimension: updated_time {
    type: string
    sql: ${TABLE}."UpdatedTime" ;;
  }

  measure: count {
    type: count
    drill_fields: [adset_id, created_time, name]
  }
}
