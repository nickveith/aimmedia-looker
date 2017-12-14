view: calendar_date {
  sql_table_name: PUBLIC.DATE_DIM;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.D_DATE_ID ;;
  }

  dimension:day_of_month  {
    type: number
    sql: ${TABLE}.D_DOM ;;
  }

  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.D_DATE ;;
  }

}
