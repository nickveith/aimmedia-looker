view: pcd_snapshots {
  derived_table: {
    sql:
      select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 1', 10,1) as contract_number
             , "process date - contract 1" as process_date
             , "contract1 source key code" as source_key_code
             , nullif("contract1 contract indicator", '') as contract_indicator
             , "contract1 primary source" as primary_source
             , nullif("contract1 email transaction type", '') as email_transaction_type
             , nullif("contract1 contract status", '') as contract_status
             , "contract1 paid or charge"::int as paid_or_charge
             , "contract1 renewal start issue" as start_issue
             , "contract1 renewal expire" as expiration_issue
             , ("remit rate - contract 1"::real/100)::real as remit_rate
             , "term - contract 1"::int as term
             , "copies - contract 1"::int as copies
             , ("price - contract 1"::real/100)::real as price
             , null as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where  1=1 AND account_sequence = 1
        UNION
        --- contract 2
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 2', 10,1) as contract_number
             , "process date - contract 2" as process_date
             , "contract2 source key code" as source_key_code
             , null as contract_indicator
             , "contract2 primary source" as primary_source
             , nullif("contract2 email transaction type", '') as email_transaction_type
             , nullif("contract2 contract status", '') as contract_status
             , "contract2 paid or charge"::int as paid_or_charge
             , "contract2 renewal start issue" as start_issue
             , "contract2 renewal expire" as expiration_issue
             , ("remit rate - contract 2"::real/100)::real as remit_rate
             , "term - contract 2"::int as term
             , "copies - contract 2"::int as copies
             , ("price - contract 2"::real/100)::real as price
             , nullif("contract2 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 3
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 3', 10,1) as contract_number
             , "process date - contract 3" as process_date
             , "contract3 source key code" as source_key_code
             , null as contract_indicator
             , "contract3 primary source" as primary_source
             , nullif("contract3 email transaction type", '') as email_transaction_type
             , nullif("contract3 contract status", '') as contract_status
             , "contract3 paid or charge"::int as paid_or_charge
             , "contract3 renewal start issue" as start_issue
             , "contract3 renewal expire" as expiration_issue
             , ("remit rate - contract 3"::real/100)::real as remit_rate
             , "term - contract 3"::int as term
             , "copies - contract 3"::int as copies
             , ("price - contract 3"::real/100)::real as price
             , nullif("contract3 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 4
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 4', 10,1) as contract_number
             , "process date - contract 4" as process_date
             , "contract4 source key code" as source_key_code
             , null as contract_indicator
             , "contract4 primary source" as primary_source
             , nullif("contract4 email transaction type", '') as email_transaction_type
             , nullif("contract4 contract status", '') as contract_status
             , "contract4 paid or charge"::int as paid_or_charge
             , "contract4 renewal start issue" as start_issue
             , "contract4 renewal expire" as expiration_issue
             , ("remit rate - contract 4"::real/100)::real as remit_rate
             , "term - contract 4"::int as term
             , "copies - contract 4"::int as copies
             , ("price - contract 4"::real/100)::real as price
             , nullif("contract4 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 5
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 5', 10,1) as contract_number
             , "process date - contract 5" as process_date
             , "contract5 source key code" as source_key_code
             , null as contract_indicator
             , "contract5 primary source" as primary_source
             , nullif("contract5 email transaction type", '') as email_transaction_type
             , nullif("contract5 contract status", '') as contract_status
             , "contract5 paid or charge"::int as paid_or_charge
             , "contract5 renewal start issue" as start_issue
             , "contract5 renewal expire" as expiration_issue
             , ("remit rate - contract 5"::real/100)::real as remit_rate
             , "term - contract 5"::int as term
             , "copies - contract 5"::int as copies
             , ("price - contract 5"::real/100)::real as price
             , nullif("contract5 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 6
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 6', 10,1) as contract_number
             , "process date - contract 6" as process_date
             , "contract6 source key code" as source_key_code
             , null as contract_indicator
             , "contract6 primary source" as primary_source
             , nullif("contract6 email transaction type", '') as email_transaction_type
             , nullif("contract6 contract status", '') as contract_status
             , "contract6 paid or charge"::int as paid_or_charge
             , "contract6 renewal start issue" as start_issue
             , "contract6 renewal expire" as expiration_issue
             , ("remit rate - contract 6"::real/100)::real as remit_rate
             , "term - contract 6"::int as term
             , "copies - contract 6"::int as copies
             , ("price - contract 6"::real/100)::real as price
             , nullif("contract6 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 7
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 7', 10,1) as contract_number
             , "process date - contract 7" as process_date
             , "contract7 source key code" as source_key_code
             , null as contract_indicator
             , "contract7 primary source" as primary_source
             , nullif("contract7 email transaction type", '') as email_transaction_type
             , nullif("contract7 contract status", '') as contract_status
             , "contract7 paid or charge"::int as paid_or_charge
             , "contract7 renewal start issue" as start_issue
             , "contract7 renewal expire" as expiration_issue
             , ("remit rate - contract 7"::real/100)::real as remit_rate
             , "term - contract 7"::int as term
             , "copies - contract 7"::int as copies
             , ("price - contract 7"::real/100)::real as price
             , nullif("contract7 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 8
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 8', 10,1) as contract_number
             , "process date - contract 8" as process_date
             , "contract8 source key code" as source_key_code
             , null as contract_indicator
             , "contract8 primary source" as primary_source
             , nullif("contract8 email transaction type", '') as email_transaction_type
             , nullif("contract8 contract status", '') as contract_status
             , "contract8 paid or charge"::int as paid_or_charge
             , "contract8 renewal start issue" as start_issue
             , "contract8 renewal expire" as expiration_issue
             , ("remit rate - contract 8"::real/100)::real as remit_rate
             , "term - contract 8"::int as term
             , "copies - contract 8"::int as copies
             , ("price - contract 8"::real/100)::real as price
             , nullif("contract8 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1
        UNION
        --- contract 9
        select "match code"
             , "account number"
             , "client-18" as client_code
             , "pub-18" as pub_code
             --, name
             --, frequency
             , substring('contract 9', 10,1) as contract_number
             , "process date - contract 9" as process_date
             , "contract9 source key code" as source_key_code
             , null as contract_indicator
             , "contract9 primary source" as primary_source
             , nullif("contract9 email transaction type", '') as email_transaction_type
             , nullif("contract9 contract status", '') as contract_status
             , "contract9 paid or charge"::int as paid_or_charge
             , "contract9 renewal start issue" as start_issue
             , "contract9 renewal expire" as expiration_issue
             , ("remit rate - contract 9"::real/100)::real as remit_rate
             , "term - contract 9"::int as term
             , "copies - contract 9"::int as copies
             , ("price - contract 9"::real/100)::real as price
             , nullif("contract9 cowles earnings", '') as cowles_earnings
          from ${pcd_facts.SQL_TABLE_NAME}
         where 1=1 AND account_sequence = 1

 ;;
  }

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
    sql: ${TABLE}.client_code ;;
  }
  dimension: pub_code {
    type: string
    sql: ${TABLE}.pub_code ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: contract_number {
    type: string
    sql: ${TABLE}.CONTRACT_NUMBER ;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: yyyymmdd
    sql:
      DATEADD(day,
            substring(${start_issue},3,2)::real * (substring(${start_issue},1,2)/${pcd_publisher.frequency}::real) * 30.42,
            TO_DATE('20'||substring(${start_issue},1,2)||'0101', 'YYYYMMDD')) ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: yyyymmdd
    sql:
      DATEADD(day,
              substring(${expiration_issue},3,2)::real * (substring(${expiration_issue},1,2)/${pcd_publisher.frequency}::real) * 30.42,
              TO_DATE('20'||substring(${expiration_issue},1,2)||'0101', 'YYYYMMDD')
              );;
  }

  dimension_group: process {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: date
    sql: CASE WHEN ${TABLE}.process_date = '000000' then null
      ELSE TO_DATE(substring(${TABLE}.process_date,2,6), 'YYMMDD') END ;;
  }

  dimension: source_key_code {
    type: string
    sql: ${TABLE}.SOURCE_KEY_CODE ;;
  }

  dimension: contract_indicator {
    type: string
    sql: ${TABLE}.CONTRACT_INDICATOR ;;
  }

  dimension: primary_source {
    type: string
    sql: ${TABLE}.PRIMARY_SOURCE ;;
  }

  dimension: email_transaction_type {
    type: string
    sql: ${TABLE}.EMAIL_TRANSACTION_TYPE ;;
  }

  dimension: contract_status {
    type: string
    sql: ${TABLE}.CONTRACT_STATUS ;;
  }

  dimension: paid_or_charge {
    type: string
    sql: ${TABLE}.PAID_OR_CHARGE::int ;;
  }

  dimension: start_issue {
    type: string
    sql: ${TABLE}.START_ISSUE ;;
  }

  dimension: expiration_issue {
    type: string
    sql: ${TABLE}.EXPIRATION_ISSUE ;;
  }

  dimension: remit_rate {
    type: string
    sql: ${TABLE}.REMIT_RATE ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.TERM::int ;;
  }

  dimension: copies {
    type: string
    sql: ${TABLE}.COPIES::int ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.PRICE ;;
  }

  dimension: cowles_earnings {
    type: string
    sql: ${TABLE}.COWLES_EARNINGS ;;
  }

  set: detail {
    fields: [
#       id,
      contract_number,
      start_date,
      expiration_date,
      process_date,
      source_key_code,
      contract_indicator,
      primary_source,
      email_transaction_type,
      contract_status,
      paid_or_charge,
      start_issue,
      expiration_issue,
      remit_rate,
      term,
      copies,
      price,
      cowles_earnings
    ]
  }
}
