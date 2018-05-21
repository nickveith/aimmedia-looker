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

  dimension_group: filter_daydate {
    type: time
    sql: ${TABLE}.D_DATE ;;
  }

  dimension: month_description {
    type: string
    sql: UPPER(TO_CHAR(${TABLE}.D_DATE, 'MON YYYY')) ;;
  }


  measure: period_start {
    type: date
    sql: min(${calendar_date}) ;;
  }

  measure: period_end {
    type: date
    sql: max(${calendar_date}) ;;
  }

  measure: period_days {
    type: number
    sql: count(distinct ${calendar_date}) ;;
  }

####################################

  filter: previous_period_filter {
    type: date
    description: "Use this filter for period analysis"
  }

  # For Amazon Redshift
  # ${created_raw} is the timestamp dimension we are building our reporting period off of
  dimension: previous_period {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */ THEN
        CASE WHEN ${TABLE}.D_DATE >=  {% date_start previous_period_filter %}
              AND ${TABLE}.D_DATE < {% date_end previous_period_filter %}
             THEN '1 - This Period'
             WHEN ${TABLE}.D_DATE >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ), {% date_start previous_period_filter %} )
              AND ${TABLE}.D_DATE < {% date_start previous_period_filter %}
             THEN '2 - Previous Period'
             WHEN ${TABLE}.D_DATE >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ) -365, {% date_start previous_period_filter %} )
              AND ${TABLE}.D_DATE < DATEADD(day, -365, {% date_start previous_period_filter %} )
             THEN '3 - Prior Year'
        END
      END ;;
  }

####################################

  filter: full_month_period_filter {
    type: date
    description: "Use this filter for period analysis"
  }

  # For Amazon Redshift
  # ${created_raw} is the timestamp dimension we are building our reporting period off of
  dimension: full_month_period {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE WHEN {% date_start full_month_period_filter %} is not null AND {% date_end full_month_period_filter %} is not null /* date ranges or in the past x days */ THEN
        CASE WHEN ${TABLE}.D_DATE >=  {% date_start full_month_period_filter %}
              AND ${TABLE}.D_DATE < {% date_end full_month_period_filter %}
             THEN '1 - This Period'
             WHEN ${TABLE}.D_DATE >= DATEADD(month,-1*DATEDIFF(month,{% date_start full_month_period_filter %}, {% date_end full_month_period_filter %} ), {% date_start full_month_period_filter %} )
              AND ${TABLE}.D_DATE < {% date_start full_month_period_filter %}
             THEN '2 - Previous Period'
             WHEN ${TABLE}.D_DATE >= DATEADD(month,-1*DATEDIFF(month,{% date_start full_month_period_filter %}, {% date_end full_month_period_filter %} )-12, {% date_start full_month_period_filter %} )
              AND ${TABLE}.D_DATE < DATEADD(month, -12, {% date_start full_month_period_filter %} )
             THEN '3 - Prior Year'
        END
      END ;;
  }

####################################

  filter: date_filter {
    type: date
  }

  dimension: scaling_dimension {
    type: string
    sql:
      case when ${TABLE}.D_DATE >=  {% date_start date_filter %} and ${TABLE}.D_DATE < {% date_end date_filter %} then
        case when DATEDIFF(days, {% date_start date_filter %}, {% date_end date_filter %}) >= 210 then ${calendar_month}
             when DATEDIFF(days, {% date_start date_filter %}, {% date_end date_filter %}) >= 70 then ${calendar_week}
             else ${calendar_date}
        end
      end
    ;;
  }
  }
