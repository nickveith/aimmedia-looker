view: aim_group {
  sql_table_name: PUBLIC.AIM_GROUP ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: group_abbreviation {
    type: string
    sql: ${TABLE}."GROUP_ABBREVIATION" ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: sfmc_client_id {
    type: string
    sql: ${TABLE}."SFMC_CLIENT_ID" ;;
  }

  measure: brand_links  {
    sql: ${TABLE}."NAME"  ;;
    html: <p>{{value}}</p> ;;
  }

}
