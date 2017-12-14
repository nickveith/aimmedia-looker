view: pcd_snapshots_deprecated{
  derived_table: {
    datagroup_trigger: monthly
  sql:
      SELECT * FROM
      (
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 1' as contract_number
          , CASE WHEN "contract1 renewal start issue" is null then null ELSE
              DATEADD(day,
                        substring("contract1 renewal start issue",3,2)::real * (substring("contract1 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract1 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract1 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract1 renewal expire",3,2)::real * (substring("contract1 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract1 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 1" as process_date
          , "contract1 source key code" as source_key_code
          , nullif("contract1 contract indicator", '') as contract_indicator
          , "contract1 primary source" as primary_source
          , "contract1 email transaction type" as email_transaction_type
          , "contract1 contract status" as contract_status
          , "contract1 paid or charge" as paid_or_charge
          , "contract1 renewal start issue" as start_issue
          , "contract1 renewal expire" as expiration_issue
          , "remit rate - contract 1" as remit_rate
          , "term - contract 1" as term
          , "copies - contract 1" as copies
          , "price - contract 1" as price
          , null as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
        WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 2' as contract_number
          , CASE WHEN "contract2 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract2 renewal start issue",3,2)::real * (substring("contract2 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract2 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract2 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract2 renewal expire",3,2)::real * (substring("contract2 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract2 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 2" as process_date
          , "contract2 source key code" as source_key_code
          , null as contract_indicator
          , "contract2 primary source" as primary_source
          , "contract2 email transaction type" as email_transaction_type
          , "contract2 contract status" as contract_status
          , "contract2 paid or charge" as paid_or_charge
          , "contract2 renewal start issue" as start_issue
          , "contract2 renewal expire" as expiration_issue
          , "remit rate - contract 2" as remit_rate
          , "term - contract 2" as term
          , "copies - contract 2" as copies
          , "price - contract 2" as price
          , nullif("contract2 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 3' as contract_number
          , CASE WHEN "contract3 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract3 renewal start issue",3,2)::real * (substring("contract3 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract3 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract3 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract3 renewal expire",3,2)::real * (substring("contract3 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract3 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 3" as process_date
          , "contract3 source key code" as source_key_code
          , null as contract_indicator
          , "contract3 primary source" as primary_source
          , "contract3 email transaction type" as email_transaction_type
          , "contract3 contract status" as contract_status
          , "contract3 paid or charge" as paid_or_charge
          , "contract3 renewal start issue" as start_issue
          , "contract3 renewal expire" as expiration_issue
          , "remit rate - contract 3" as remit_rate
          , "term - contract 3" as term
          , "copies - contract 3" as copies
          , "price - contract 3" as price
          , nullif("contract3 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 4' as contract_number
          , CASE WHEN "contract4 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract4 renewal start issue",3,2)::real * (substring("contract4 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract4 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract4 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract4 renewal expire",3,2)::real * (substring("contract4 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract4 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 4" as process_date
          , "contract4 source key code" as source_key_code
          , null as contract_indicator
          , "contract4 primary source" as primary_source
          , "contract4 email transaction type" as email_transaction_type
          , "contract4 contract status" as contract_status
          , "contract4 paid or charge" as paid_or_charge
          , "contract4 renewal start issue" as start_issue
          , "contract4 renewal expire" as expiration_issue
          , "remit rate - contract 4" as remit_rate
          , "term - contract 4" as term
          , "copies - contract 4" as copies
          , "price - contract 4" as price
          , nullif("contract4 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 5' as contract_number
          , CASE WHEN "contract5 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract5 renewal start issue",3,2)::real * (substring("contract5 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract5 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract5 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract5 renewal expire",3,2)::real * (substring("contract5 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract5 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 5" as process_date
          , "contract5 source key code" as source_key_code
          , null as contract_indicator
          , "contract5 primary source" as primary_source
          , "contract5 email transaction type" as email_transaction_type
          , "contract5 contract status" as contract_status
          , "contract5 paid or charge" as paid_or_charge
          , "contract5 renewal start issue" as start_issue
          , "contract5 renewal expire" as expiration_issue
          , "remit rate - contract 5" as remit_rate
          , "term - contract 5" as term
          , "copies - contract 5" as copies
          , "price - contract 5" as price
          , nullif("contract5 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 6' as contract_number
          , CASE WHEN "contract6 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract6 renewal start issue",3,2)::real * (substring("contract6 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract6 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract6 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract6 renewal expire",3,2)::real * (substring("contract6 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract6 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 6" as process_date
          , "contract6 source key code" as source_key_code
          , null as contract_indicator
          , "contract6 primary source" as primary_source
          , "contract6 email transaction type" as email_transaction_type
          , "contract6 contract status" as contract_status
          , "contract6 paid or charge" as paid_or_charge
          , "contract6 renewal start issue" as start_issue
          , "contract6 renewal expire" as expiration_issue
          , "remit rate - contract 6" as remit_rate
          , "term - contract 6" as term
          , "copies - contract 6" as copies
          , "price - contract 6" as price
          , nullif("contract6 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 7' as contract_number
          , CASE WHEN "contract7 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract7 renewal start issue",3,2)::real * (substring("contract7 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract7 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract7 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract7 renewal expire",3,2)::real * (substring("contract7 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract7 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 7" as process_date
          , "contract7 source key code" as source_key_code
          , null as contract_indicator
          , "contract7 primary source" as primary_source
          , "contract7 email transaction type" as email_transaction_type
          , "contract7 contract status" as contract_status
          , "contract7 paid or charge" as paid_or_charge
          , "contract7 renewal start issue" as start_issue
          , "contract7 renewal expire" as expiration_issue
          , "remit rate - contract 7" as remit_rate
          , "term - contract 7" as term
          , "copies - contract 7" as copies
          , "price - contract 7" as price
          , nullif("contract7 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 8' as contract_number
          , CASE WHEN "contract8 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract8 renewal start issue",3,2)::real * (substring("contract8 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract8 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract8 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract8 renewal expire",3,2)::real * (substring("contract8 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract8 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 8" as process_date
          , "contract8 source key code" as source_key_code
          , null as contract_indicator
          , "contract8 primary source" as primary_source
          , "contract8 email transaction type" as email_transaction_type
          , "contract8 contract status" as contract_status
          , "contract8 paid or charge" as paid_or_charge
          , "contract8 renewal start issue" as start_issue
          , "contract8 renewal expire" as expiration_issue
          , "remit rate - contract 8" as remit_rate
          , "term - contract 8" as term
          , "copies - contract 8" as copies
          , "price - contract 8" as price
          , nullif("contract8 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
      UNION
      select
          "id", "match code" as pcd_match_code, "account number" as pcd_account_number, "client-18" as client_code, "pub-18" as pub_code
          , 'contract 9' as contract_number
          , CASE WHEN "contract9 renewal start issue" is null then null ELSE
            DATEADD(day,
                        substring("contract9 renewal start issue",3,2)::real * (substring("contract9 renewal start issue",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract9 renewal start issue",1,2)||'0101', 'YYYYMMDD')
                        ) END as start_date
          , CASE WHEN "contract9 renewal expire" is null then null ELSE
            DATEADD(day,
                        substring("contract9 renewal expire",3,2)::real * (substring("contract9 renewal expire",1,2)/frequency::real) * 30.42,
                        TO_DATE('20'||substring("contract9 renewal expire",1,2)||'0101', 'YYYYMMDD')
                        ) END as expiration_date
          , "process date - contract 9" as process_date
          , "contract9 source key code" as source_key_code
          , null as contract_indicator
          , "contract9 primary source" as primary_source
          , "contract9 email transaction type" as email_transaction_type
          , "contract9 contract status" as contract_status
          , "contract9 paid or charge" as paid_or_charge
          , "contract9 renewal start issue" as start_issue
          , "contract9 renewal expire" as expiration_issue
          , "remit rate - contract 9" as remit_rate
          , "term - contract 9" as term
          , "copies - contract 9" as copies
          , "price - contract 9" as price
          , nullif("contract9 cowles earnings", '') as cowles_earnings
         from ${pcd_log.SQL_TABLE_NAME}
          WHERE account_sequence = 1
          )
          order by "id"
 ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}
dimension: pk {
  primary_key: yes
  hidden: yes
  sql: ${id}||'-'||${contract_number} ;;
}

dimension: id {
  type: string
  sql: ${TABLE}."id";;
}

dimension: contract_number {
  type: string
  sql: substring(${TABLE}.CONTRACT_NUMBER, 10,1) ;;
}

dimension_group: start {
  type: time
  timeframes: [date, week, month, year, month_num, raw]
  datatype: yyyymmdd
  sql: ${TABLE}.start_date ;;
}

dimension_group: expiration {
  type: time
  timeframes: [date, week, month, year, month_num, raw]
  datatype: yyyymmdd
  sql: ${TABLE}.expiration_date;;
}
# dimension: expiration_date {}

dimension_group: process {
  type: time
  timeframes: [date, week, month, year, month_num, raw]
  datatype: date
  sql: TO_DATE(substring(${TABLE}.process_date,2,6), 'YYMMDD') ;;
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
  sql: nullif(${TABLE}.EMAIL_TRANSACTION_TYPE,'') ;;
}

dimension: contract_status {
  type: string
  sql: nullif(${TABLE}.CONTRACT_STATUS,'') ;;
}

dimension: paid_or_charge {
  type: string
  sql: ${TABLE}.PAID_OR_CHARGE::int ;;
}

dimension: start_issue {
  type: string
  sql: nullif(${TABLE}.START_ISSUE,'') ;;
}

dimension: expiration_issue {
  type: string
  sql: COALESCE(nullif(${TABLE}.EXPIRATION_ISSUE,''),'9999-12-31 23:59:59') ;;
}

dimension: remit_rate {
  type: string
  sql: (${TABLE}.REMIT_RATE::real/100)::real ;;
}

dimension: term {
  type: string
  sql: ${TABLE}.TERM::int ;;
}

dimension: copies {
  type: string
  ####removed ::int because of non-int values
  sql: ${TABLE}.COPIES ;;

}

dimension: price {
  type: string
  sql: (${TABLE}.PRICE::real/100)::real ;;
}

dimension: cowles_earnings {
  type: string
  sql: ${TABLE}.COWLES_EARNINGS ;;
}

set: detail {
  fields: [
    id,
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
