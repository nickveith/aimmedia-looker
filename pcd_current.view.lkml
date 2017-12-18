view: pcd_current {
  sql_table_name: PUBLIC.PCD_CURRENT;;

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
    hidden: yes
    sql: ${TABLE}."client-18" ;;
  }

  dimension: pub_code {
    type: string
    hidden:  yes
    sql: ${TABLE}."pub-18" ;;
  }

  dimension_group: original_start_date {
    type: time
    datatype: date
    sql: DATEADD( day
               , (substring("original start issue",3,2)::real - 1) * (365/ coalesce(${pcd_publisher.frequency},12))
               , TRY_TO_DATE('01-JAN-'||case when substring("original start issue",1,1) in ('0', '1', '2') then '20' else '19' end||substring("original start issue",1,2))
             );; }

  dimension: age_in_months {
    type: number
    sql: DATEDIFF(month, ${original_start_date_date},${calendar_date.calendar_date}) ;;
  }

  dimension: week_ending {
    type: string
    sql: ${TABLE}."week ending" ;;
  }

  dimension: account_sequence {
    hidden: yes
  }

  dimension: record_id {
    label: "PCD ID"
    primary_key: yes
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
  }

}
