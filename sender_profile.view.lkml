view: sender_profile {

  sql_table_name: PUBLIC.SENDER_PROFILE ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: brand_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BRAND_ID ;;
  }

  dimension: from_email {
    hidden: yes
    type: string
    sql: ${TABLE}.FROM_EMAIL ;;
  }

  dimension: from_name {
    hidden: yes
    type: string
    sql: ${TABLE}.FROM_NAME ;;
  }

  dimension: group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.GROUP_ID ;;
  }

  dimension: test {
    hidden: yes
    type: yesno
    sql: ${TABLE}.TEST ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, from_name]
  }

}
