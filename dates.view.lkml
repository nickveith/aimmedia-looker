view: calendar_date {
  derived_table: {
    sql:   SELECT
          dateadd(day,(
          p0.n
          + p1.n*2
          + p2.n * POWER(2,2)
          + p3.n * POWER(2,3)
          + p4.n * POWER(2,4)
          + p5.n * POWER(2,5)
          + p6.n * POWER(2,6)
          + p7.n * POWER(2,7)
          + p8.n * POWER(2,8)
          + p9.n * POWER(2,9)
          + p10.n * POWER(2,10)
          )::integer,TO_DATE('2014-01-01'))
          as date
        FROM
          (SELECT 0 as n UNION SELECT 1) p0,
          (SELECT 0 as n UNION SELECT 1) p1,
          (SELECT 0 as n UNION SELECT 1) p2,
          (SELECT 0 as n UNION SELECT 1) p3,
          (SELECT 0 as n UNION SELECT 1) p4,
          (SELECT 0 as n UNION SELECT 1) p5,
          (SELECT 0 as n UNION SELECT 1) p6,
          (SELECT 0 as n UNION SELECT 1) p7,
          (SELECT 0 as n UNION SELECT 1) p8,
          (SELECT 0 as n UNION SELECT 1) p9,
          (SELECT 0 as n UNION SELECT 1) p10  ;;
    persist_for: "5000 hours"

  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension_group: calendar {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.date ;;
  }

}
