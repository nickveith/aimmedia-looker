view: ga_reporting {
  sql_table_name: PUBLIC.GA_TRAFFIC ;;

  dimension: property_id {
    type: number
    sql: ${TABLE}."PROPERTY_ID" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."Browser" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."ChannelGrouping" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}."Campaign" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."Source" ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}."Medium" ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}."DeviceCategory" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."Date"::date ;;
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
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${date} >=  {% date_start previous_period_filter %}
                AND ${date} < {% date_end previous_period_filter %}
                THEN '1 - This Period'
              WHEN ${date} >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ), {% date_start previous_period_filter %} )
                AND ${date} < {% date_start previous_period_filter %}
                THEN '2 - Previous Period'
              WHEN ${date} >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ) -365, {% date_start previous_period_filter %} )
                AND ${date} < DATEADD(day, -365, {% date_start previous_period_filter %} )
                THEN '3 - Prior Year'
            END
          END ;;
  }

  ####################################

  measure: new_users {
    type: number
    sql: SUM(${TABLE}."NewUsers") ;;
  }

  measure: percent_new_users {
    type: number
    sql: CASE WHEN SUM(${TABLE}."Users") = 0 THEN 0
              ELSE SUM(${TABLE}."NewUsers") / SUM(${TABLE}."Users")
              END;;
  }

  measure: pageviews_per_session {
    type: number
    sql: CASE WHEN SUM(${TABLE}."Sessions") = 0 THEN 0
              ELSE (SUM(${TABLE}."PageviewsPerSession" * ${TABLE}."Sessions") / SUM(${TABLE}."Sessions"))::real
              END;;
  }

  measure: avg_session_duration {
    type: number
    sql: CASE WHEN SUM(${TABLE}."Sessions") = 0 THEN 0
              ELSE SUM(${TABLE}."AvgSessionDuration" * ${TABLE}."Sessions") / SUM(${TABLE}."Sessions")
              END;;
  }

  measure: bounces {
    type: number
    sql: (SUM(${TABLE}."BounceRate" / 100 * ${TABLE}."Sessions"))::int ;;
  }

  measure: bounce_rate {
    type: number
    sql: CASE WHEN SUM(${TABLE}."Sessions") = 0 THEN 0
              ELSE (SUM(${TABLE}."BounceRate" / 100 * ${TABLE}."Sessions") / SUM(${TABLE}."Sessions"))::real
              END;;
  }

  measure: transaction_revenue {
    type: number
    sql: SUM(${TABLE}."TransactionRevenue") ;;
  }

  measure: transactions {
    type: number
    sql: SUM(${TABLE}."Transactions") ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}."Sessions";;
    drill_fields: [channel, campaign, source, medium]
  }

  measure: users {
    type: number
    sql: SUM(${TABLE}."Users") ;;
  }

  measure: pageviews {
    type: sum
    sql: ${TABLE}."PageviewsPerSession" * ${TABLE}."Sessions" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  ## Dynamic Measure Select

  parameter: primary_metric_name {
    type: string
    default_value: "pageviews"
    allowed_value: {
      value: "pageviews"
      label: "Pageviews"
    }
    allowed_value: {
      value: "users"
      label: "Users"
    }
    allowed_value: {
      value: "sessions"
      label: "Sessions"
    }
    allowed_value: {
      value: "pageviews_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "percent_new_users"
      label: "% New Users"
    }
  }

  parameter: second_metric_name {
    type: string
    allowed_value: {
      value: "pageviews"
      label: "Pageviews"
    }
    allowed_value: {
      value: "users"
      label: "Users"
    }
    allowed_value: {
      value: "sessions"
      label: "Sessions"
    }
    allowed_value: {
      value: "pageviews_per_session"
      label: "Pages/Session"
    }
    allowed_value: {
      value: "percent_new_users"
      label: "% New Users"
    }
  }

  measure: primary_metric {
    sql: case when {% parameter primary_metric_name %} = 'pageviews' then ${pageviews}
              when {% parameter primary_metric_name %} = 'users' then ${users}
              when {% parameter primary_metric_name %} = 'sessions' then ${sessions}
              when {% parameter primary_metric_name %} = 'pageviews_per_session' then ${pageviews_per_session}
              when {% parameter primary_metric_name %} = 'percent_new_users' then ${percent_new_users}
          end ;;
    type: number
    label_from_parameter: primary_metric_name
  }
  measure: second_metric {
    sql: case when {% parameter second_metric_name %} = 'pageviews' then ${pageviews}
              when {% parameter second_metric_name %} = 'users' then ${users}
              when {% parameter second_metric_name %} = 'sessions' then ${sessions}
              when {% parameter second_metric_name %} = 'pageviews_per_session' then ${pageviews_per_session}
              when {% parameter second_metric_name %} = 'percent_new_users' then ${percent_new_users}
          end;;
    type: number
    label_from_parameter: second_metric_name
  }

}
