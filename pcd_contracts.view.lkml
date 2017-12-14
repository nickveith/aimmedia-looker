view: pcd_contracts {
  sql_table_name: PUBLIC.PCD_CONTRACTS;;

  measure: contracts {
    type: count
    drill_fields: [detail*]
  }

  dimension: contract {
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.pcd_account_number ||'-'|| ${TABLE}.process_date;;
  }

  dimension_group: start {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: yyyymmdd
    sql: ${TABLE}.start_date ;;
  }

  # dimension_group: expiration {
  #   type: time
  #   timeframes: [date, week, month, year, month_num, raw]
  #   datatype: yyyymmdd
  #   sql: ${TABLE}.expiration_date;;
  # }
  dimension: expiration_date {}

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
    type: string
    sql: (${TABLE}.PRICE::real/100)::real ;;
  }

  dimension: cowles_earnings {
    type: string
    sql: ${TABLE}.COWLES_EARNINGS ;;
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
