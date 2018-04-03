connection: "snowflake"

# include all the views
include: "*.view"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: aim_heirarchy {
  from: "aim_group"
  join: aim_brand {
    relationship: one_to_many
    sql_on: ${aim_heirarchy.id} = ${aim_brand.group_id} ;;
  }
}
