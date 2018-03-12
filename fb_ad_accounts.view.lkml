view: fb_ad_accounts {
  sql_table_name: PUBLIC.FB_AD_ACCOUNTS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."AccountId" ;;
  }

  dimension: account_status {
    type: number
    sql: ${TABLE}."AccountStatus" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."Age" ;;
  }

  measure: amount_spent {
    type: sum
    sql: ${TABLE}."AmountSpent" ;;
  }

  measure: balance {
    type: number
    sql: ${TABLE}."Balance" ;;
  }

  dimension: business_city {
    type: string
    sql: ${TABLE}."BusinessCity" ;;
  }

  dimension: business_country_code {
    type: string
    sql: ${TABLE}."BusinessCountryCode" ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}."BusinessName" ;;
  }

  dimension: business_state {
    type: string
    sql: ${TABLE}."BusinessState" ;;
  }

  dimension: business_street {
    type: string
    sql: ${TABLE}."BusinessStreet" ;;
  }

  dimension: business_street2 {
    type: string
    sql: ${TABLE}."BusinessStreet2" ;;
  }

  dimension: business_zip {
    type: string
    sql: ${TABLE}."BusinessZip" ;;
  }

  dimension: capabilities {
    type: string
    sql: ${TABLE}."Capabilities" ;;
  }

  dimension: created_time {
    type: string
    sql: ${TABLE}."CreatedTime" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."Currency" ;;
  }

  dimension: min_campaign_group_spend_cap {
    type: string
    sql: ${TABLE}."MinCampaignGroupSpendCap" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: offsite_pixels_tos_accepted {
    type: string
    sql: ${TABLE}."OffsitePixelsTosAccepted" ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}."OwnerId" ;;
  }

  dimension: spend_cap {
    type: number
    sql: ${TABLE}."SpendCap" ;;
  }

  dimension: timezone_id {
    type: string
    sql: ${TABLE}."TimezoneId" ;;
  }

  dimension: timezone_name {
    type: string
    sql: ${TABLE}."TimezoneName" ;;
  }

  dimension: timezone_offset_hours_utc {
    type: number
    sql: ${TABLE}."TimezoneOffsetHoursUTC" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, business_name, created_time, name, timezone_name]
  }
}
