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
    sql: MIN(${TABLE}.UNIQUE_USERS_L28)::int ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
