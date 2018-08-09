connection: "snowflake"

# include all the views
include: "*.view"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: aim_hierarchy {
  from: "aim_group"
  join: aim_brand {
    relationship: one_to_many
    sql_on: ${aim_hierarchy.id} = ${aim_brand.group_id} ;;
  }
  join: aim_navigation {
    relationship: one_to_many
    sql_on: ${aim_brand.brand_id} = ${aim_navigation.brand_id} ;;
  }
}
