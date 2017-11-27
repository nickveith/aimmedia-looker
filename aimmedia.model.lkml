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
  sql_table_name: MATILLION.PUBLIC.EMAIL_SENDS;;
}
