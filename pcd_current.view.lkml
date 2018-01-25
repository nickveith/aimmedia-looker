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
    sql: CASE WHEN "original start issue" = '0000' then null
              ELSE DATEADD( day
                         , (TRY_TO_NUMBER(substring( ${TABLE}."original start issue",3,2)) - 1) * (365/ coalesce(${pcd_publisher.frequency},12))
                         , TRY_TO_DATE('01-JAN-'||case when substring(${TABLE}."original start issue",1,1) in ('0', '1', '2') then '20' else '19' end||substring(${TABLE}."original start issue",1,2))
                       )
            END ;; }

  dimension: original_start_issue {
    type: string
    sql: ${TABLE}."original start issue" ;;
  }

  dimension: overall_expire {
    type: string
    sql: ${TABLE}."overall expire" ;;
  }

  dimension: week_ending {
    type: date
    sql: TO_DATE(substring("week ending",2,6), 'YYMMDD');;
  }

  dimension: account_sequence {
    hidden: yes
  }

  dimension: record_id {
    label: "PCD ID"
    type: string
    sql: ${TABLE}."id";;
  }

  dimension: account_id {
    label: "PCD ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."client-18" || ${TABLE}."pub-18" || ${TABLE}."type-18" || ${TABLE}."traf-18" || ${TABLE}."acct-18" || ${TABLE}."ck-digit-18" ;;
  }

  dimension: subscription_status {
    type: string
    sql: CASE WHEN  ${TABLE}."trailer status low" = '0' THEN 'PENDING'
              WHEN  ${TABLE}."trailer status low" = '1' THEN 'ACTIVE'
              WHEN  ${TABLE}."trailer status low" = '2' THEN 'CANCEL-REFUND'
              WHEN  ${TABLE}."trailer status low" = '3' THEN 'CANCEL-DUPLICATE SALE'
              WHEN  ${TABLE}."trailer status low" = '4' THEN 'CREDIT SUSPEND'
              WHEN  ${TABLE}."trailer status low" = '5' THEN 'PO UNDELIVERABLE'
              WHEN  ${TABLE}."trailer status low" = '6' THEN 'CANCEL-SUBSCRIBER REQUEST'
              WHEN  ${TABLE}."trailer status low" = '7' THEN 'EXPIRED'
              ELSE NULL
              END;;
  }

  dimension: subcriber_type {
    type: string
    sql: CASE WHEN  ${TABLE}."subscriber type" = '1' THEN 'REGULAR'
              WHEN  ${TABLE}."subscriber type" = '2' THEN 'DONOR - SUBSCRIBER'
              WHEN  ${TABLE}."subscriber type" = '3' THEN 'DONOR ONLY (DOES NOT SUBSCRIBE)'
              WHEN  ${TABLE}."subscriber type" = '4' THEN 'DONOR & RECIPIENT'
              WHEN  ${TABLE}."subscriber type" = '5' THEN 'RECIPIENT'
              ELSE NULL
              END;;
  }

  dimension: promote_status {
    type: string
    sql: CASE WHEN  ${TABLE}."promote flag" = 'N' THEN 'Do Not Promote Name'
              WHEN  ${TABLE}."promote flag" = '1' THEN 'Do Not Rent'
              WHEN  ${TABLE}."promote flag" = '2' THEN 'Do Not Call'
              WHEN  ${TABLE}."promote flag" = '3' THEN 'Do Not Rent or Call'
              WHEN  ${TABLE}."promote flag" = '4' THEN 'NA'
              WHEN  ${TABLE}."promote flag" = '5' THEN 'Do Not Rent'
              WHEN  ${TABLE}."promote flag" = '6' THEN 'Do Not Call'
              WHEN  ${TABLE}."promote flag" = '7' THEN 'Do Not Rent or Call'
              ELSE NULL
              END;;
  }

  dimension: is_subscriber {
    type: yesno
    sql: CASE WHEN  ${TABLE}."subscriber type" = '3' THEN False
              ELSE True
              END;;
  }

  dimension: source_code {
    type: string
    sql: CASE WHEN  ${TABLE}."subscriber type" = '3' THEN 'ZZZ - Non Sub Donor'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'Z' THEN substring("current source key code",1,2)
              ELSE substring( ${TABLE}."current source key code",1,1)
              END;;
  }

  dimension: source_type {
    type: string
    sql: CASE WHEN ${TABLE}."subscriber type" = '3' THEN 'OTHER'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'Z' THEN 'AGENCIES'
              ELSE 'DIR. TO PUB.'
              END;;
  }

  dimension: source_of_business {
    type: string
    sql: CASE
              WHEN  ${TABLE}."subscriber type" = '3' THEN 'NO SUB DONOR'
              ----
              WHEN substring( ${TABLE}."current source key code",1,2) = 'Z1' THEN 'DIGITAL ORDERS'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'Z3' THEN 'ASSOC NON DEDUCT'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'Z4' THEN 'RESERVE AMER CLUB'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'Z6' THEN 'RESERVE AMERICA'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZD' THEN 'NAT PUB EXC'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZG' THEN 'NSS ONLINE AGENTS'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZH' THEN 'ONLINE-CONT'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZJ' THEN 'NSS REWARDS CS'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZL' THEN 'NSS OTHER'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZM' THEN 'PCH'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZO' THEN 'DMA OFFERS'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZP' THEN 'CASH FIELD'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZR' THEN 'SCHOOL PLAN'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZS' THEN 'CATALOG'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZT' THEN 'TELEMARKETING'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZV' THEN 'RECEPTION ROOM'
              WHEN substring( ${TABLE}."current source key code",1,2) = 'ZY' THEN 'OLD RESERVE AMER'
              ----
              WHEN substring( ${TABLE}."current source key code",1,1) = '0' THEN 'DTP PKG INSERT'
              WHEN substring( ${TABLE}."current source key code",1,1) = '1' THEN 'DTP CONVERSION'
              WHEN substring( ${TABLE}."current source key code",1,1) = '2' THEN 'DIRECT MAIL'
              WHEN substring( ${TABLE}."current source key code",1,1) = '3' THEN '2X Renewal'
              WHEN substring( ${TABLE}."current source key code",1,1) = '4' THEN 'DM-NON AUTO REN'
              WHEN substring( ${TABLE}."current source key code",1,1) = '5' THEN 'AFFILIATES'
              WHEN substring( ${TABLE}."current source key code",1,1) = '6' THEN 'INSERT CARDS'
              WHEN substring( ${TABLE}."current source key code",1,1) = '7' THEN 'XMAS GIFT'
              WHEN substring( ${TABLE}."current source key code",1,1) = '8' THEN 'WHITE MAIL'
              WHEN substring( ${TABLE}."current source key code",1,1) = '9' THEN 'UNKNOWN -Source Code 9'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'A' THEN 'INSERT NEWSSTAND'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'B' THEN 'MAGAZINE TRANSFER'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'C' THEN 'COMP'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'D' THEN '3X RENEWALS'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'E' THEN 'AGENCY CONVERSION'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'F' THEN 'NON XMAS GIFT'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'G' THEN '4X RENEWALS'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'H' THEN 'CROSS PROMOTION'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'I' THEN 'INTERNET'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'J' THEN 'AUTOMATIC RENEWALS'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'K' THEN 'UNRENEWED RECIPIENT'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'L' THEN 'REN OF AUTO REN'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'M' THEN 'USA CLIMBING'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'N' THEN 'EMAIL COMBO'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'O' THEN 'OUTSIDE INTERNET'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'P' THEN 'UNKNOWN -Source Code P'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'Q' THEN 'UNKNOWN -Source Code Q'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'R' THEN 'UNKNOWN -Source Code R'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'S' THEN 'Email Promotion'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'T' THEN 'UNKNOWN -Source Code T'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'U' THEN 'COA'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'V' THEN 'UNKNOWN -Source Code V'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'W' THEN 'UNKNOWN -Source Code W'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'X' THEN 'UNKNOWN -Source Code X'
              WHEN substring( ${TABLE}."current source key code",1,1) = 'Y' THEN 'PUBLIC - SPONSORED'
              ----
              ELSE NULL
              END;;
  }

  measure: count {
    type: count
  }

  measure: actives {
    type: count
    filters: {
      field: subscription_status
      value: "ACTIVE"
      }
    filters: {
      field: is_subscriber
      value: "yes"
    }
  }

  measure: expired {
    type: count
    filters: {
      field: subscription_status
      value:  "EXPIRED"
    }
    filters: {
      field: is_subscriber
      value: "yes"
    }
  }

  measure: subscribers {
    type: count
    filters: {
      field: is_subscriber
      value: "yes"
    }
  }

}
