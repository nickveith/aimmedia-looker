view: ga_accounts {
  sql_table_name: PUBLIC.GA_ACCOUNTS ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }

  dimension: child_link {
    type: string
    sql: ${TABLE}.ChildLink ;;
  }

  dimension: created {
    type: string
    sql: ${TABLE}.Created ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.Kind ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}.Permissions ;;
  }

  dimension: self_link {
    type: string
    sql: ${TABLE}.SelfLink ;;
  }

  dimension: updated {
    type: string
    sql: ${TABLE}.Updated ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
