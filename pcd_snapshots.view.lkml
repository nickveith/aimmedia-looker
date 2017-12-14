view: pcd_snapshots{
  sql_table_name: PUBLIC.PCD_CONTRACTS ;;

  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${pcd_account_number} || '-' || ${primary_source} || '-' || ${client_code};;
  }

  dimension: contract_indicator {
    type: string
    sql: ${TABLE}.CONTRACT_INDICATOR ;;
  }

  dimension: contract_status {
    type: string
    sql: ${TABLE}.CONTRACT_STATUS ;;
  }

  dimension: copies {
    type: number
    sql: ${TABLE}.COPIES ;;
  }

  dimension: cowles_earnings {
    type: string
    sql: ${TABLE}.COWLES_EARNINGS ;;
  }

  dimension: date_string {
    type: string
    sql: ${TABLE}.DATE_STRING ;;
  }

  dimension: email_transaction_type {
    type: string
    sql: ${TABLE}.EMAIL_TRANSACTION_TYPE ;;
  }

  dimension_group: expiration {
    type: time
    datatype: yyyymmdd
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql:
    CASE
      WHEN TRY_TO_NUMERIC(${expiration_issue}) is null then null
      ELSE
        DATEADD(day,
        substring(${expiration_issue},3,2)::real * (substring(${expiration_issue},1,2)/${frequency}::real) * 30.42,
        TO_DATE('20'||substring(${expiration_issue},1,2)||'0101', 'YYYYMMDD'))
      END;;
  }

  dimension: expiration_issue {
    type: string
    sql: ${TABLE}.EXPIRATION_ISSUE ;;
  }

  dimension: paid_or_charge {
    type: string
    sql: ${TABLE}.PAID_OR_CHARGE ;;
  }

  dimension: pcd_account_number {
    type: string
    sql: ${TABLE}.PCD_ACCOUNT_NUMBER ;;
  }

  dimension: pcd_match_code {
    type: string
    sql: ${TABLE}.PCD_MATCH_CODE ;;
  }

  dimension: pricecopies {
    type: number
    sql: ${TABLE}.PRICECOPIES ;;
  }

  dimension: primary_source {
    type: string
    sql: ${TABLE}.PRIMARY_SOURCE ;;
  }

  dimension_group: process {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.PROCESS_DATE ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  dimension: frequency {
    type: number
    sql: TRY_TO_NUMERIC(${TABLE}.PUB_FREQUENCY) ;;
  }

  dimension: remit_rate {
    type: number
    sql: ${TABLE}.REMIT_RATE ;;
  }

  dimension: source_key_code {
    type: string
    sql: ${TABLE}.SOURCE_KEY_CODE ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: yyyymmdd
    sql:
    CASE
      WHEN TRY_TO_NUMERIC(${start_issue}) is null then null
      ELSE
      DATEADD(day,
        substring(${start_issue},3,2)::real * (substring(${start_issue},1,2)/${frequency}::real) * 30.42,
        TO_DATE('20'||substring(${start_issue},1,2)||'0101', 'YYYYMMDD')
        )
    END;;
  }

  dimension: start_issue {
    type: string
    hidden: yes
    sql: ${TABLE}.START_ISSUE ;;
  }

  dimension: term {
    type: number
    sql: ${TABLE}.TERM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
