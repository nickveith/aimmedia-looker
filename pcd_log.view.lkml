view: pcd_log {
  sql_table_name: PUBLIC.PCD_CURRENT ;;

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
  dimension: account_sequence {
    hidden: yes
  }

  dimension: original_start_issue {
    type: string
    sql: ${TABLE}."original start issue" ;;
  }

  dimension: id {
    label: "PCD ID"
    primary_key: yes
#     hidden: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: subscription_status {
    type: string
    sql: CASE WHEN "trailer status low" = '0' THEN 'PENDING'
              WHEN "trailer status low" = '1' THEN 'ACTIVE'
              WHEN "trailer status low" = '2' THEN 'CANCEL-REFUND'
              WHEN "trailer status low" = '3' THEN 'CANCEL-DUPLICATE SALE'
              WHEN "trailer status low" = '4' THEN 'CREDIT SUSPEND'
              WHEN "trailer status low" = '5' THEN 'PO UNDELIVERABLE'
              WHEN "trailer status low" = '6' THEN 'CANCEL-SUBSCRIBER REQUEST'
              WHEN "trailer status low" = '7' THEN 'EXPIRED'
              ELSE NULL
              END;;
        }

  dimension: subcriber_type {
    type: string
    sql: CASE WHEN "subscriber type" = '1' THEN 'REGULAR'
              WHEN "subscriber type" = '2' THEN 'DONOR - SUBSCRIBER'
              WHEN "subscriber type" = '3' THEN 'DONOR ONLY (DOES NOT SUBSCRIBE)'
              WHEN "subscriber type" = '4' THEN 'DONOR & RECIPIENT'
              WHEN "subscriber type" = '5' THEN 'RECIPIENT'
              ELSE NULL
              END;;
    }

  measure: count {
    type: count
#     drill_fields: [id, name, company_name]
  }
}
