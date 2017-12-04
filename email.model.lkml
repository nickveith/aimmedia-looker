connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: sends {
  from: email_sends
  join:  email_opens {
    type: left_outer
    sql_on: ${sends.client_id} = ${email_opens.client_id}
        and ${sends.send_id} = ${email_opens.send_id}
        and ${sends.subscriber_id} = ${email_opens.subscriber_id} ;;
    relationship: one_to_many
    }
  }
