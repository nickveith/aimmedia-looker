connection: "snowflake"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: calendar_date {
  from: "calendar_date"
}
