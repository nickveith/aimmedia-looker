view: pcd_subscriber_rollup {
  sql_table_name: PUBLIC.PCD_SUBSCRIBER_ROLLUP ;;

  dimension: active_contracts {
    type: number
    sql: ${TABLE}.ACTIVE_CONTRACTS ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension: copies {
    type: number
    sql: ${TABLE}.COPIES ;;
  }

  dimension_group: d {
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
    sql: ${TABLE}.D_DATE ;;
  }

  dimension: price_copies {
    type: number
    sql: ${TABLE}.PRICE_COPIES ;;
  }

  dimension: primary_source {
    type: string
    sql: ${TABLE}.PRIMARY_SOURCE ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  dimension: remit_rate {
    type: number
    sql: ${TABLE}.REMIT_RATE ;;
  }

  dimension: source_key_code {
    type: string
    sql: ${TABLE}.SOURCE_KEY_CODE ;;
  }

  measure: active_subscribers {
    type: number
    sql: SUM(${active_contracts})  ;;
    drill_fields: []
  }
}
