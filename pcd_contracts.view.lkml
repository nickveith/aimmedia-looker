view: pcd_contracts {

  sql_table_name: PUBLIC.PCD_CONTRACTS;;

  dimension: contract_id {
    type: string
    hidden: yes
    sql: ${TABLE}.contract_id ;;
  }

  dimension: account_id {
    type: string
    sql:  ${TABLE}.account_id ;;
  }

  dimension: contract_number {
    type:  number
    sql: ${TABLE}.contract_number ;;
  }

  dimension: pcd_account_number {}

  dimension_group: start {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: date
    sql: ${TABLE}.expiration_date ;;
  }

  dimension_group: process {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: date
    sql: TRY_TO_DATE(CASE WHEN substring(${TABLE}.process_date,2,2) in ('0','1','2','3','4','5') then '20' else '19' end ||
                     substring(${TABLE}.process_date,2,2)||'-'||
                     substring(${TABLE}.process_date,4,2)||'-'||
                     substring(${TABLE}.process_date,6,2)
                    ) ;;
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
    sql: case when ${TABLE}.PRIMARY_SOURCE = '7' then 'DTP'
              when ${TABLE}.PRIMARY_SOURCE = '8' then 'Agency'
              end ;;
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
    sql: nullif(${TABLE}.EXPIRATION_ISSUE,'') ;;
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

  dimension: client_code {
    type: string
    ####removed ::int because of non-int values
    sql: ${TABLE}.client_code ;;

  }

  dimension: pub_code {
    type: string
    ####removed ::int because of non-int values
    sql: ${TABLE}.pub_code ;;

  }

  dimension: price {
    type: number
    sql: PRICECOPIES ;;
  }

  dimension: cowles_earnings {
    type: string
    sql: ${TABLE}.COWLES_EARNINGS ;;
  }

  dimension: age_in_months {
    type: number
    sql: DATEDIFF(month, ${TABLE}.original_contract_process_date, ${process_date}) ;;
  }

  measure: contracts {
    type: count
    drill_fields: [detail*]
  }

  measure: unique_contracts {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    drill_fields: [detail*]
  }

  measure: unique_contracts_direct {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    drill_fields: [detail*]
  }

  measure: unique_contracts_indirect {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    drill_fields: [detail*]
  }


  measure: revenue {
    type: sum
    sql: ${price} ;;
  }

  set: measures {
    fields: [
      revenue,
      contracts
    ]
  }

  set: detail {
    fields: [
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
