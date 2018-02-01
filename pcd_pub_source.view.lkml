view: pcd_pub_source {
  sql_table_name: PUBLIC.PCD_PUB_SOURCE ;;

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension: description {
    type: string
    sql:  case when ${TABLE}.DESCRIPTION is not null then ${TABLE}.DESCRIPTION
              when length(${source_code}) = 2 then 'UNKNOWN AGENCY SOURCE'
              when length(${source_code}) = 1 then 'UNKNOWN DTP SOURCE'
              else 'Other'
              end ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  dimension: publication {
    type: string
    sql: ${TABLE}.PUBLICATION ;;
  }

  dimension: source_type {
    type: string
    sql: case when ${TABLE}.SOURCE_TYPE is not null then ${TABLE}.SOURCE_TYPE
              when length(${source_code}) = 2 then 'Agency'
              when length(${source_code}) = 1 then 'Direct'
              else 'Other'
              end ;;
  }

  dimension: source_code {
    type: string
    sql: ${TABLE}.SOURCE_CODE ;;
  }

  dimension: renewal_source_type {
    type: string
    sql:  case when ${TABLE}.source_type = 'Renewals' then 'Direct' else 'Indirect' end ;;
  }

}
