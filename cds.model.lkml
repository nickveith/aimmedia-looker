connection: "snowflake"

# include all views in this project
include: "*.view.lkml"

datagroup: daily {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "30 hours"
}

explore: subscriptions {
  from: cds_subscription_issues
  label: "Subscriptions (Over Time)"
  view_label: "Subscriptions"
  description: "Active subscriptions by date"
  join: cds_issues {
    from:  cds_issues
    type:  inner
    sql_on: ${subscriptions.magazine_abbreviation} = ${cds_issues.magazine_abbreviation}
        and ${subscriptions.issue_number} = ${cds_issues.issue_number};;
    relationship: many_to_one
  }

  join: calendar_date {
    from: calendar_date
    type: inner
    sql_on: ${cds_issues.from_date} <= ${calendar_date.calendar_date}
        and ${cds_issues.until_date} > ${calendar_date.calendar_date}
        and ${calendar_date.is_last_day_of_month} = True;;
    relationship: many_to_many
  }
  join: cds_orders {
    from: cds_orders
    type: left_outer
    sql_on: ${subscriptions.account_number} = ${cds_orders.account_number}
        and ${subscriptions.magazine_abbreviation} = ${cds_orders.magazine_abbreviation}
        and ${subscriptions.order_number} = ${cds_orders.order_number};;
    relationship: one_to_many
  }

  join: cds_subscriptions {
    from: cds_subscriptions
    type: left_outer
    sql_on: ${subscriptions.account_number} = ${cds_subscriptions.account_number}
        and ${subscriptions.magazine_abbreviation} = ${cds_subscriptions.magazine_abbreviation}
        and ${subscriptions.issue_number} = ${cds_subscriptions.start_issue};;
        relationship: many_to_one
  }

  join: cds_pub  {
    from:  cds_pub
    type: left_outer
    sql_on: ${subscriptions.magazine_abbreviation} = ${cds_pub.magazine_abbreviation} ;;
    relationship: one_to_many
  }
  join: cds_customers {
    from: cds_customers
    type: left_outer
    sql_on: ${subscriptions.account_number} = ${cds_customers.account_number};;
    relationship: one_to_one
  }
  join: aim_brand {
    from: aim_brand
    type: left_outer
    sql_on:  ${subscriptions.magazine_abbreviation} = ${aim_brand.cds_magazine_abbreviation};;
    relationship: one_to_one
  }

}
