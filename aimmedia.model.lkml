connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

######################################
# FILE: ecommercestore.model.lkml    #
# Define the explores and join logic #
######################################
connection: "snowflake"
include: "*.view.lkml"
explore: sends {
#   join: customers {
#     sql_on: ${orders.customer_id} = ${customers.id} ;;
#   }
}

#############################################################
# FILE: customers.view.lkml                                 #
# Define the dimensions and measures for the CUSTOMERS view #
#############################################################
view: sends {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
#   dimension: city {                    # field: customers.city
#     sql: ${TABLE}.city ;;
#   }
#   dimension: state {                   # field: customers.state
#     sql: ${TABLE}.state ;;
#   }
#   dimension: name {
#     sql: CONCAT(${TABLE}.firstname, " ", ${TABLE}.lastname) ;;
#   }
#   measure: count {            # field: customers.count
#     type: count               # creates a sql COUNT(*)
#     drill_fields: [drill_set] # fields to show when someone clicks 'CUSTOMERS Count'
#   }
#   set: drill_set {                     # set: customers.drill_set
#     fields: [id, state, orders.count]  # list of fields to show when someone clicks 'CUSTOMERS Count'
#   }
}
