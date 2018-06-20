view: ga_users {
  sql_table_name: PUBLIC.GA_USERS ;;

  dimension_group: daydate {
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
    sql: ${TABLE}.DAYDATE ;;
  }

  dimension: property_id {
    type: number
    sql: ${TABLE}.PROPERTY_ID ;;
  }

  measure: unique_users {
    type: number
    value_format_name: decimal_2
    sql: CASE WHEN COUNT(DISTINCT ${TABLE}.DAYDATE) = 0 THEN 0
              ELSE SUM(${TABLE}.UNIQUE_USERS_L28 / 28)
          END;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
