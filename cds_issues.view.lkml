view: cds_issues_vw {
  derived_table: {
    sql: select magazine_abbreviation
              , issue_number
              , onsale_date
              , onsale_date as from_date
              , lead(onsale_date) over (partition by magazine_abbreviation order by onsale_date) as until_date
              , count(1) over (partition by  magazine_abbreviation, date_trunc("year", cover_date)) as frequency
           from cds_issues
          order by onsale_date ;;
    }

  dimension_group: cover {
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
    sql: ${TABLE}."COVER_DATE" ;;
  }

  dimension: issue_description {
    type: string
    sql: ${TABLE}."ISSUE_DESCRIPTION" ;;
  }

  dimension: issue_number {
    type: string
    sql: ${TABLE}."ISSUE_NUMBER" ;;
  }

  dimension_group: latest_abc_issue {
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
    sql: ${TABLE}."LATEST_ABC_ISSUE" ;;
  }

  dimension: magazine_abbreviation {
    type: string
    sql: ${TABLE}."MAGAZINE_ABBREVIATION" ;;
  }

  dimension: from_date {
    type: date
    sql: ${TABLE}.from_date;;
  }

  dimension: until_date {
    type: date
    sql: ${TABLE}.until_date;;
  }


  dimension_group: onsale {
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
    sql: ${TABLE}."ONSALE_DATE" ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
