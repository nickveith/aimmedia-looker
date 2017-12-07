view: pcd_log {
  sql_table_name: PUBLIC.PCD_LOG ;;

  dimension: pcd_account_number {
    label: "PCD Account Number"
    type: string
    sql: ${TABLE}."account number" ;;
  }
  dimension: pcd_match_code {
    label: "PCD Match Code"
    type: string
    sql: ${TABLE}."match code" ;;
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}."client-18" ;;
  }
  dimension: pub_code {
    type: string
    sql: ${TABLE}."pub-18" ;;
  }

  dimension: week_ending {
    type: string
    sql: ${TABLE}."week ending" ;;
  }

  dimension: id {
    label: "PCD ID"
    primary_key: yes
#     hidden: yes
    type: string
    sql: ${TABLE}."id" ;;
  }
  measure: count {
    type: count
#     drill_fields: [id, name, company_name]
  }
}
