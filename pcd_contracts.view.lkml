view: pcd_contracts {

  derived_table: {
   sql: select c.*
             , lag(expiration_date) over (partition by account_id order by contract_number asc) as prior_expiration
             , DATEDIFF(days, start_date, lag(expiration_date) over (partition by account_id order by contract_number asc)) as lapsed_days
            , i.frequency
          from PUBLIC.PCD_CONTRACTS c
          left join PUBLIC.PCD_ISSUES i on (c.client_code = i.client_code and c.pub_code = i.pub_code and c.start_issue = i.issue)
            ;;
  }

  dimension: contract_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.account_id||'-'||${TABLE}.contract_number ;;
  }

  dimension: account_id {
    type: string
    sql:  ${TABLE}.account_id ;;
  }

  dimension: contract_number {
    type:  number
    sql: ${TABLE}.contract_number ;;
  }

  dimension: pcd_account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

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
    sql: ${TABLE}.process_date ;;
  }

  dimension: source_key_code {
    type: string
    sql: ${TABLE}.SOURCE_KEY_CODE ;;
  }

  dimension: source_key_year_code {
    type: string
    sql: case when ${primary_source} = 'DTP' then substring(${source_key_code},2,1)
              when ${primary_source} = 'Agency' then substring(${source_key_code},3,1)
          end ;;
  }

  dimension: source_production_year {
    sql: '201' || ${source_key_year_code} ;;
  }

  dimension: source_key_month_code {
    type: string
    sql: case when ${primary_source} = 'DTP' then substring(${source_key_code},3,1)
              when ${primary_source} = 'Agency' then substring(${source_key_code},4,1)
          end ;;
  }

  dimension: source_production_month {
    type: number
    sql: case when ${source_key_month_code} = 'A' then 1
              when ${source_key_month_code} = 'B' then 2
              when ${source_key_month_code} = 'C' then 3
              when ${source_key_month_code} = 'D' then 4
              when ${source_key_month_code} = 'E' then 5
              when ${source_key_month_code} = 'F' then 6
              when ${source_key_month_code} = 'G' then 7
              when ${source_key_month_code} = 'H' then 8
              -- I intentially skipped
              when ${source_key_month_code} = 'J' then 9
              when ${source_key_month_code} = 'K' then 10
              when ${source_key_month_code} = 'L' then 11
              when ${source_key_month_code} = 'M' then 12
        end
              ;;
  }

  dimension_group: source_production_date {
    type: time
    timeframes: [date, week, month, year, month_num, raw]
    datatype: date
    sql: try_to_date(${source_production_year}||'-'|| ${source_production_month} || '-01')  ;;
  }

  dimension: source_key_sub_code {
    type: string
    sql: case when ${primary_source} = 'DTP' then substring(${source_key_code},4,1)
              when ${primary_source} = 'Agency' then substring(${source_key_code},5,1)
          end ;;
  }

  dimension: primary_source {
    type: string
    sql: case when ${TABLE}.PRIMARY_SOURCE = '7' then 'DTP'
              when ${TABLE}.PRIMARY_SOURCE = '8' then 'Agency'
              end ;;
  }

  dimension: source_code {
    type: string
    sql: case when ${primary_source} = 'DTP' then substring(${source_key_code},1,1)
              when ${primary_source} = 'Agency' then substring(${source_key_code},1,2)
          end
    ;;
  }

  dimension: contract_indicator {
    type: string
    sql: ${TABLE}.CONTRACT_INDICATOR ;;
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

  dimension: contract_price {
    type: number
    sql: ${TABLE}.PRICECOPIES ;;
  }

  dimension: cowles_earnings {
    type: string
    sql: ${TABLE}.COWLES_EARNINGS ;;
  }

  dimension: age_in_months {
    type: number
    sql: DATEDIFF(month, ${TABLE}.original_contract_process_date, ${process_date}) ;;
  }

  dimension: previous_expiration {
    type:  date
    sql: ${TABLE}.previous_expiration ;;
  }

  dimension: lapsed_days {
    type:  number
    sql: coalesce(${TABLE}.lapsed_days,0) ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: is_active {
    type: yesno
    sql:  case when ${start_date} >= coalesce(${pcd_current.innactive_date},current_date) then false
               when ${calendar_date.calendar_date} >= coalesce(${pcd_current.innactive_date},current_date) then false
               when ${contract_status} is null then true
               when ${contract_status} not in ('2','3','6') then true
               else false
           end ;;
  }

  measure: contracts {
    type: number
    sql: count(distinct case when ${is_active} then ${contract_id} end) ;;
  }

  measure: unique_contracts {
    type: count_distinct
    sql: ${contract_id} ;;
  }

  measure: price {
    hidden: yes
    type: sum
    value_format_name: usd
    sql: ${contract_price} ;;
  }

  measure: average_order_price {
    type: number
    value_format_name: usd
    sql: case when coalesce(${contracts},0) = 0 then 0
              else sum(${contract_price}/(case when coalesce(${term},0) = 0 then 1 else ${term} end)*${frequency})  / count(1)
          end ;;
  }

}
