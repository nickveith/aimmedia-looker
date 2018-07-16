include: "pcd_current.view.lkml"
view: pcd_current_extended {
  extends: [pcd_current]


  dimension: fourteen {
    label: "1-4"
    type: string
    sql: ${TABLE}."1-4" ;;
  }

  dimension: sixteen {
    label: "1-6"
    type: string
    sql: ${TABLE}."1-6" ;;
  }

  dimension: eighteen19 {
    label: "1819"
    type: string
    sql: ${TABLE}."18-19" ;;
  }

  dimension: eighteen20 {
    label: "1820"
    type: string
    sql: ${TABLE}."18-20" ;;
  }

  dimension: nineteen {
    label: "1-9"
    type: string
    sql: ${TABLE}."1-9" ;;
  }

  dimension: twenty {
    label: "20"
    type: string
    sql: ${TABLE}.20 ;;
  }

  dimension: fiftyeight {
    label: "58"
    type: string
    sql: ${TABLE}."5-8" ;;
  }

  dimension: nine {
    label: "9"
    type: string
    sql: ${TABLE}.9 ;;
  }

  dimension: nine15 {
    label: "915"
    type: string
    sql: ${TABLE}."9-15" ;;
  }


  dimension: acct18 {
    type: string
    sql: ${TABLE}."acct-18" ;;
  }

  dimension: additional_address {
    type: string
    sql: ${TABLE}."additional address" ;;
  }

  dimension: alpha_line_of_travel {
    type: string
    sql: ${TABLE}."alpha line of travel" ;;
  }

  dimension: alternate_seq__code__a {
    type: string
    sql: ${TABLE}."alternate seq. code - a" ;;
  }

  dimension: alternate_sequencehex {
    type: string
    sql: ${TABLE}."alternate sequence-hex" ;;
  }

  dimension: ar_ {
    type: string
    sql: ${TABLE}."a/r $" ;;
  }

  dimension: batch_date {
    type: string
    sql: ${TABLE}."batch date" ;;
  }

  dimension: batch_date__trans_1 {
    type: string
    sql: ${TABLE}."batch date - trans 1" ;;
  }

  dimension: batch_date__trans_2 {
    type: string
    sql: ${TABLE}."batch date - trans 2" ;;
  }

  dimension: batch_date__trans_3 {
    type: string
    sql: ${TABLE}."batch date - trans 3" ;;
  }

  dimension: batch_date__trans_4 {
    type: string
    sql: ${TABLE}."batch date - trans 4" ;;
  }

  dimension: batch_date__trans_5 {
    type: string
    sql: ${TABLE}."batch date - trans 5" ;;
  }

  dimension: batch_date__trans_6 {
    type: string
    sql: ${TABLE}."batch date - trans 6" ;;
  }

  dimension: batch_date__trans_7 {
    type: string
    sql: ${TABLE}."batch date - trans 7" ;;
  }

  dimension: batch_date__trans_8 {
    type: string
    sql: ${TABLE}."batch date - trans 8" ;;
  }

  dimension: batch_date__trans_9 {
    type: string
    sql: ${TABLE}."batch date - trans 9" ;;
  }

  dimension: bill_group {
    type: string
    sql: ${TABLE}."bill group" ;;
  }

  dimension: billing_effort {
    type: string
    sql: ${TABLE}."billing effort" ;;
  }

  dimension: billing_effort_paid_on {
    type: string
    sql: ${TABLE}."billing effort paid on" ;;
  }

  dimension: billing_source_key_code {
    type: string
    sql: ${TABLE}."billing source key code" ;;
  }

  dimension: birthdate {
    type: string
    sql: ${TABLE}.birthdate ;;
  }

  dimension: canada_postal_code {
    type: string
    sql: ${TABLE}."canada postal code" ;;
  }

  dimension: cash_ {
    type: string
    sql: ${TABLE}."cash $" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: ckdigit18 {
    type: string
    sql: ${TABLE}."ck-digit-18" ;;
  }

  dimension: class_of_sub {
    type: string
    sql: ${TABLE}."class of sub" ;;
  }


  dimension: client_number {
    type: string
    sql: ${TABLE}."client number" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."company name" ;;
  }

  dimension: contract1_contract_indicator {
    type: string
    sql: ${TABLE}."contract1 contract indicator" ;;
  }

  dimension: contract1_contract_status {
    type: string
    sql: ${TABLE}."contract1 contract status" ;;
  }

  dimension: contract1_email_transaction_type {
    type: string
    sql: ${TABLE}."contract1 email transaction type" ;;
  }

  dimension: contract1_paid_or_charge {
    type: string
    sql: ${TABLE}."contract1 paid or charge" ;;
  }

  dimension: contract1_primary_source {
    type: string
    sql: ${TABLE}."contract1 primary source" ;;
  }

  dimension: contract1_renewal_expire {
    type: string
    sql: ${TABLE}."contract1 renewal expire" ;;
  }

  dimension: contract1_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract1 renewal start issue" ;;
  }

  dimension: contract1_source_key_code {
    type: string
    sql: ${TABLE}."contract1 source key code" ;;
  }

  dimension: contract2_contract_status {
    type: string
    sql: ${TABLE}."contract2 contract status" ;;
  }

  dimension: contract2_cowles_earnings {
    type: string
    sql: ${TABLE}."contract2 cowles earnings" ;;
  }

  dimension: contract2_email_transaction_type {
    type: string
    sql: ${TABLE}."contract2 email transaction type" ;;
  }

  dimension: contract2_paid_or_charge {
    type: string
    sql: ${TABLE}."contract2 paid or charge" ;;
  }

  dimension: contract2_primary_source {
    type: string
    sql: ${TABLE}."contract2 primary source" ;;
  }

  dimension: contract2_renewal_expire {
    type: string
    sql: ${TABLE}."contract2 renewal expire" ;;
  }

  dimension: contract2_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract2 renewal start issue" ;;
  }

  dimension: contract2_source_key_code {
    type: string
    sql: ${TABLE}."contract2 source key code" ;;
  }

  dimension: contract3_contract_status {
    type: string
    sql: ${TABLE}."contract3 contract status" ;;
  }

  dimension: contract3_cowles_earnings {
    type: string
    sql: ${TABLE}."contract3 cowles earnings" ;;
  }

  dimension: contract3_email_transaction_type {
    type: string
    sql: ${TABLE}."contract3 email transaction type" ;;
  }

  dimension: contract3_paid_or_charge {
    type: string
    sql: ${TABLE}."contract3 paid or charge" ;;
  }

  dimension: contract3_primary_source {
    type: string
    sql: ${TABLE}."contract3 primary source" ;;
  }

  dimension: contract3_renewal_expire {
    type: string
    sql: ${TABLE}."contract3 renewal expire" ;;
  }

  dimension: contract3_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract3 renewal start issue" ;;
  }

  dimension: contract3_source_key_code {
    type: string
    sql: ${TABLE}."contract3 source key code" ;;
  }

  dimension: contract4_contract_status {
    type: string
    sql: ${TABLE}."contract4 contract status" ;;
  }

  dimension: contract4_cowles_earnings {
    type: string
    sql: ${TABLE}."contract4 cowles earnings" ;;
  }

  dimension: contract4_email_transaction_type {
    type: string
    sql: ${TABLE}."contract4 email transaction type" ;;
  }

  dimension: contract4_paid_or_charge {
    type: string
    sql: ${TABLE}."contract4 paid or charge" ;;
  }

  dimension: contract4_primary_source {
    type: string
    sql: ${TABLE}."contract4 primary source" ;;
  }

  dimension: contract4_renewal_expire {
    type: string
    sql: ${TABLE}."contract4 renewal expire" ;;
  }

  dimension: contract4_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract4 renewal start issue" ;;
  }

  dimension: contract4_source_key_code {
    type: string
    sql: ${TABLE}."contract4 source key code" ;;
  }

  dimension: contract5_contract_status {
    type: string
    sql: ${TABLE}."contract5 contract status" ;;
  }

  dimension: contract5_cowles_earnings {
    type: string
    sql: ${TABLE}."contract5 cowles earnings" ;;
  }

  dimension: contract5_email_transaction_type {
    type: string
    sql: ${TABLE}."contract5 email transaction type" ;;
  }

  dimension: contract5_paid_or_charge {
    type: string
    sql: ${TABLE}."contract5 paid or charge" ;;
  }

  dimension: contract5_primary_source {
    type: string
    sql: ${TABLE}."contract5 primary source" ;;
  }

  dimension: contract5_renewal_expire {
    type: string
    sql: ${TABLE}."contract5 renewal expire" ;;
  }

  dimension: contract5_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract5 renewal start issue" ;;
  }

  dimension: contract5_source_key_code {
    type: string
    sql: ${TABLE}."contract5 source key code" ;;
  }

  dimension: contract6_contract_status {
    type: string
    sql: ${TABLE}."contract6 contract status" ;;
  }

  dimension: contract6_cowles_earnings {
    type: string
    sql: ${TABLE}."contract6 cowles earnings" ;;
  }

  dimension: contract6_email_transaction_type {
    type: string
    sql: ${TABLE}."contract6 email transaction type" ;;
  }

  dimension: contract6_paid_or_charge {
    type: string
    sql: ${TABLE}."contract6 paid or charge" ;;
  }

  dimension: contract6_primary_source {
    type: string
    sql: ${TABLE}."contract6 primary source" ;;
  }

  dimension: contract6_renewal_expire {
    type: string
    sql: ${TABLE}."contract6 renewal expire" ;;
  }

  dimension: contract6_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract6 renewal start issue" ;;
  }

  dimension: contract6_source_key_code {
    type: string
    sql: ${TABLE}."contract6 source key code" ;;
  }

  dimension: contract7_contract_status {
    type: string
    sql: ${TABLE}."contract7 contract status" ;;
  }

  dimension: contract7_cowles_earnings {
    type: string
    sql: ${TABLE}."contract7 cowles earnings" ;;
  }

  dimension: contract7_email_transaction_type {
    type: string
    sql: ${TABLE}."contract7 email transaction type" ;;
  }

  dimension: contract7_paid_or_charge {
    type: string
    sql: ${TABLE}."contract7 paid or charge" ;;
  }

  dimension: contract7_primary_source {
    type: string
    sql: ${TABLE}."contract7 primary source" ;;
  }

  dimension: contract7_renewal_expire {
    type: string
    sql: ${TABLE}."contract7 renewal expire" ;;
  }

  dimension: contract7_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract7 renewal start issue" ;;
  }

  dimension: contract7_source_key_code {
    type: string
    sql: ${TABLE}."contract7 source key code" ;;
  }

  dimension: contract8_contract_status {
    type: string
    sql: ${TABLE}."contract8 contract status" ;;
  }

  dimension: contract8_cowles_earnings {
    type: string
    sql: ${TABLE}."contract8 cowles earnings" ;;
  }

  dimension: contract8_email_transaction_type {
    type: string
    sql: ${TABLE}."contract8 email transaction type" ;;
  }

  dimension: contract8_paid_or_charge {
    type: string
    sql: ${TABLE}."contract8 paid or charge" ;;
  }

  dimension: contract8_primary_source {
    type: string
    sql: ${TABLE}."contract8 primary source" ;;
  }

  dimension: contract8_renewal_expire {
    type: string
    sql: ${TABLE}."contract8 renewal expire" ;;
  }

  dimension: contract8_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract8 renewal start issue" ;;
  }

  dimension: contract8_source_key_code {
    type: string
    sql: ${TABLE}."contract8 source key code" ;;
  }

  dimension: contract9_contract_status {
    type: string
    sql: ${TABLE}."contract9 contract status" ;;
  }

  dimension: contract9_cowles_earnings {
    type: string
    sql: ${TABLE}."contract9 cowles earnings" ;;
  }

  dimension: contract9_email_transaction_type {
    type: string
    sql: ${TABLE}."contract9 email transaction type" ;;
  }

  dimension: contract9_paid_or_charge {
    type: string
    sql: ${TABLE}."contract9 paid or charge" ;;
  }

  dimension: contract9_primary_source {
    type: string
    sql: ${TABLE}."contract9 primary source" ;;
  }

  dimension: contract9_renewal_expire {
    type: string
    sql: ${TABLE}."contract9 renewal expire" ;;
  }

  dimension: contract9_renewal_start_issue {
    type: string
    sql: ${TABLE}."contract9 renewal start issue" ;;
  }

  dimension: contract9_source_key_code {
    type: string
    sql: ${TABLE}."contract9 source key code" ;;
  }

  dimension: copies__contract_1 {
    type: string
    sql: ${TABLE}."copies - contract 1" ;;
  }

  dimension: copies__contract_2 {
    type: string
    sql: ${TABLE}."copies - contract 2" ;;
  }

  dimension: copies__contract_3 {
    type: string
    sql: ${TABLE}."copies - contract 3" ;;
  }

  dimension: copies__contract_4 {
    type: string
    sql: ${TABLE}."copies - contract 4" ;;
  }

  dimension: copies__contract_5 {
    type: string
    sql: ${TABLE}."copies - contract 5" ;;
  }

  dimension: copies__contract_6 {
    type: string
    sql: ${TABLE}."copies - contract 6" ;;
  }

  dimension: copies__contract_7 {
    type: string
    sql: ${TABLE}."copies - contract 7" ;;
  }

  dimension: copies__contract_8 {
    type: string
    sql: ${TABLE}."copies - contract 8" ;;
  }

  dimension: copies__contract_9 {
    type: string
    sql: ${TABLE}."copies - contract 9" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
  }

  dimension: credit_card_data {
    type: string
    sql: ${TABLE}."credit card data" ;;
  }

  dimension: current_copies {
    type: string
    sql: ${TABLE}."current copies" ;;
  }

  dimension: current_issue {
    type: string
    sql: ${TABLE}."current issue" ;;
  }

  dimension: current_price {
    type: string
    sql: ${TABLE}."current price" ;;
  }

  dimension: current_remit_rate {
    type: string
    sql: ${TABLE}."current remit rate" ;;
  }

  dimension: current_source_key_code {
    type: string
    sql: ${TABLE}."current source key code" ;;
  }

  dimension: current_src__prim__src {
    type: string
    sql: ${TABLE}."current src - prim. src" ;;
  }

  dimension: current_term {
    type: string
    sql: ${TABLE}."current term" ;;
  }

  dimension: decile_score {
    type: string
    sql: ${TABLE}."decile score" ;;
  }

  dimension: delivery_indicator {
    type: string
    sql: ${TABLE}."delivery indicator" ;;
  }

  dimension: demo_date {
    type: string
    sql: ${TABLE}."demo date" ;;
  }

  dimension: donor_match_code {
    type: string
    sql: ${TABLE}."donor match code" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: email_addr_1 {
    type: string
    sql: ${TABLE}."email addr 1" ;;
  }

  dimension: email_batch_date {
    type: string
    sql: ${TABLE}."email batch date" ;;
  }

  dimension: email_deliver_code {
    type: string
    sql: ${TABLE}."email deliver code" ;;
  }

  dimension: email_origin_code__curr {
    type: string
    sql: ${TABLE}."email origin code - curr" ;;
  }

  dimension: email_origin_code__orig {
    type: string
    sql: ${TABLE}."email origin code - orig" ;;
  }

  dimension: file_batch_date {
    type: string
    sql: ${TABLE}."file batch date" ;;
  }

  dimension: file_batch_number {
    type: string
    sql: ${TABLE}."file batch number" ;;
  }

  dimension: file_id_number {
    type: string
    sql: ${TABLE}."file id number" ;;
  }

  dimension: file_process_cycle {
    type: string
    sql: ${TABLE}."file process cycle" ;;
  }

  dimension: file_source_key {
    type: string
    sql: ${TABLE}."file source key" ;;
  }

  dimension: file_trans_id_indicator {
    type: string
    sql: ${TABLE}."file trans id indicator" ;;
  }

  dimension: file_trans_id_occr_1_ {
    type: string
    sql: ${TABLE}."file trans id occr 1 " ;;
  }

  dimension: fips_code {
    type: string
    sql: ${TABLE}."fips code" ;;
  }

  dimension: foreign_currency_amount {
    type: string
    sql: ${TABLE}."foreign currency amount" ;;
  }

  dimension: future_demos {
    type: string
    sql: ${TABLE}."future demos" ;;
  }

  dimension: geographic_indicator {
    type: string
    sql: ${TABLE}."geographic indicator" ;;
  }

  dimension: header_status {
    type: string
    sql: ${TABLE}."header status" ;;
  }

  dimension: issues_rcvd_in_billing {
    type: string
    sql: ${TABLE}."issues rcvd in billing" ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}."job title" ;;
  }

  dimension: last_batch__of_trans_ {
    type: string
    sql: ${TABLE}."last batch # of trans."
      ;;
  }


  dimension: merchandise_amount {
    type: string
    sql: ${TABLE}."merchandise amount" ;;
  }

  dimension: mkt_12 {
    type: string
    sql: ${TABLE}."mkt 12" ;;
  }

  dimension: mkt_13 {
    type: string
    sql: ${TABLE}."mkt 13" ;;
  }

  dimension: mkt_14 {
    type: string
    sql: ${TABLE}."mkt 14" ;;
  }

  dimension: mkt_1_5 {
    type: string
    sql: ${TABLE}."mkt 1-5" ;;
  }

  dimension: mkt_15 {
    type: string
    sql: ${TABLE}."mkt 15" ;;
  }

  dimension: mkt_1617 {
    type: string
    sql: ${TABLE}."mkt 16-17" ;;
  }

  dimension: mkt_1819 {
    type: string
    sql: ${TABLE}."mkt 18-19" ;;
  }

  dimension: mkt_20 {
    type: string
    sql: ${TABLE}."mkt 20" ;;
  }

  dimension: mkt_6 {
    type: string
    sql: ${TABLE}."mkt 6" ;;
  }

  dimension: mkt_7 {
    type: string
    sql: ${TABLE}."mkt 7" ;;
  }

  dimension: mkt_811 {
    type: string
    sql: ${TABLE}."mkt 8-11" ;;
  }



  dimension: number_of_trailers {
    type: string
    sql: ${TABLE}."number of trailers" ;;
  }

  dimension: numeric_line_of_travel {
    type: string
    sql: ${TABLE}."numeric line of travel" ;;
  }

  dimension: opt_code_fields__email_opt_out {
    type: string
    sql: ${TABLE}."opt code fields - email opt out" ;;
  }

  dimension: original_remit_rate {
    type: string
    sql: ${TABLE}."original remit rate" ;;
  }

  dimension: original_source_key_code {
    type: string
    sql: ${TABLE}."original source key code" ;;
  }

  dimension: original_src__prim__src {
    type: string
    sql: ${TABLE}."original src - prim. src" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone number" ;;
  }

  dimension: prev_decile_score {
    type: string
    sql: ${TABLE}."prev decile score" ;;
  }

  dimension: price__contract_1 {
    type: string
    sql: ${TABLE}."price - contract 1" ;;
  }

  dimension: price__contract_2 {
    type: string
    sql: ${TABLE}."price - contract 2" ;;
  }

  dimension: price__contract_3 {
    type: string
    sql: ${TABLE}."price - contract 3" ;;
  }

  dimension: price__contract_4 {
    type: string
    sql: ${TABLE}."price - contract 4" ;;
  }

  dimension: price__contract_5 {
    type: string
    sql: ${TABLE}."price - contract 5" ;;
  }

  dimension: price__contract_6 {
    type: string
    sql: ${TABLE}."price - contract 6" ;;
  }

  dimension: price__contract_7 {
    type: string
    sql: ${TABLE}."price - contract 7" ;;
  }

  dimension: price__contract_8 {
    type: string
    sql: ${TABLE}."price - contract 8" ;;
  }

  dimension: price__contract_9 {
    type: string
    sql: ${TABLE}."price - contract 9" ;;
  }

  dimension: process_cycle {
    type: string
    sql: ${TABLE}."process cycle" ;;
  }

  dimension: process_date__contract_1 {
    type: string
    sql: ${TABLE}."process date - contract 1" ;;
  }

  dimension: process_date__contract_2 {
    type: string
    sql: ${TABLE}."process date - contract 2" ;;
  }

  dimension: process_date__contract_3 {
    type: string
    sql: ${TABLE}."process date - contract 3" ;;
  }

  dimension: process_date__contract_4 {
    type: string
    sql: ${TABLE}."process date - contract 4" ;;
  }

  dimension: process_date__contract_5 {
    type: string
    sql: ${TABLE}."process date - contract 5" ;;
  }

  dimension: process_date__contract_6 {
    type: string
    sql: ${TABLE}."process date - contract 6" ;;
  }

  dimension: process_date__contract_7 {
    type: string
    sql: ${TABLE}."process date - contract 7" ;;
  }

  dimension: process_date__contract_8 {
    type: string
    sql: ${TABLE}."process date - contract 8" ;;
  }

  dimension: process_date__contract_9 {
    type: string
    sql: ${TABLE}."process date - contract 9" ;;
  }

  dimension: promote_flag {
    type: string
    sql: ${TABLE}."promote flag" ;;
  }



  dimension: record_status_high {
    type: string
    sql: ${TABLE}."record status high" ;;
  }

  dimension: remit_rate__contract_1 {
    type: string
    sql: ${TABLE}."remit rate - contract 1" ;;
  }

  dimension: remit_rate__contract_2 {
    type: string
    sql: ${TABLE}."remit rate - contract 2" ;;
  }

  dimension: remit_rate__contract_3 {
    type: string
    sql: ${TABLE}."remit rate - contract 3" ;;
  }

  dimension: remit_rate__contract_4 {
    type: string
    sql: ${TABLE}."remit rate - contract 4" ;;
  }

  dimension: remit_rate__contract_5 {
    type: string
    sql: ${TABLE}."remit rate - contract 5" ;;
  }

  dimension: remit_rate__contract_6 {
    type: string
    sql: ${TABLE}."remit rate - contract 6" ;;
  }

  dimension: remit_rate__contract_7 {
    type: string
    sql: ${TABLE}."remit rate - contract 7" ;;
  }

  dimension: remit_rate__contract_8 {
    type: string
    sql: ${TABLE}."remit rate - contract 8" ;;
  }

  dimension: remit_rate__contract_9 {
    type: string
    sql: ${TABLE}."remit rate - contract 9" ;;
  }

  dimension: renewal_test_code {
    type: string
    sql: ${TABLE}."renewal test code" ;;
  }

  dimension: reserved {
    type: string
    sql: ${TABLE}.reserved ;;
  }

  dimension: stateprovince {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}."state/province" ;;
  }

  dimension: street_address {
    type: string
    sql: ${TABLE}."street address" ;;
  }

  dimension: strt_issue_of_last_renewal {
    type: string
    sql: ${TABLE}."strt issue of last renewal" ;;
  }

  dimension: subscriber_type {
    type: string
    sql: ${TABLE}."subscriber type" ;;
  }

  dimension: term__contract_1 {
    type: string
    sql: ${TABLE}."term - contract 1" ;;
  }

  dimension: term__contract_2 {
    type: string
    sql: ${TABLE}."term - contract 2" ;;
  }

  dimension: term__contract_3 {
    type: string
    sql: ${TABLE}."term - contract 3" ;;
  }

  dimension: term__contract_4 {
    type: string
    sql: ${TABLE}."term - contract 4" ;;
  }

  dimension: term__contract_5 {
    type: string
    sql: ${TABLE}."term - contract 5" ;;
  }

  dimension: term__contract_6 {
    type: string
    sql: ${TABLE}."term - contract 6" ;;
  }

  dimension: term__contract_7 {
    type: string
    sql: ${TABLE}."term - contract 7" ;;
  }

  dimension: term__contract_8 {
    type: string
    sql: ${TABLE}."term - contract 8" ;;
  }

  dimension: term__contract_9 {
    type: string
    sql: ${TABLE}."term - contract 9" ;;
  }

  dimension: title_code {
    type: string
    sql: ${TABLE}."title code" ;;
  }

  dimension: total_issues_received {
    type: string
    sql: ${TABLE}."total issues received" ;;
  }

  dimension: total_number_of_contracts {
    type: string
    sql: ${TABLE}."total number of contracts" ;;
  }

  dimension: traf18 {
    type: string
    sql: ${TABLE}."traf-18" ;;
  }

  dimension: trailer_data_follows_delivery_indicator {
    type: string
    sql: ${TABLE}."trailer data follows delivery indicator" ;;
  }

  dimension: trailer_data_follows_geographic_indicator {
    type: string
    sql: ${TABLE}."trailer data follows geographic indicator" ;;
  }

  dimension: trailer_data_follows_trailer_record_id {
    type: string
    sql: ${TABLE}."trailer data follows trailer record id" ;;
  }

  dimension: trailer_status_high {
    type: string
    sql: ${TABLE}."trailer status high" ;;
  }

  dimension: trans__dollars__trans_1 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 1" ;;
  }

  dimension: trans__dollars__trans_2 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 2" ;;
  }

  dimension: trans__dollars__trans_3 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 3" ;;
  }

  dimension: trans__dollars__trans_4 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 4" ;;
  }

  dimension: trans__dollars__trans_5 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 5" ;;
  }

  dimension: trans__dollars__trans_6 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 6" ;;
  }

  dimension: trans__dollars__trans_7 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 7" ;;
  }

  dimension: trans__dollars__trans_8 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 8" ;;
  }

  dimension: trans__dollars__trans_9 {
    type: string
    sql: ${TABLE}."trans. dollars - trans 9" ;;
  }

  dimension: trans_id_occr_2 {
    type: string
    sql: ${TABLE}."trans id occr 2" ;;
  }

  dimension: trans_id_occr_3 {
    type: string
    sql: ${TABLE}."trans id occr 3" ;;
  }

  dimension: transaction1_batch_number {
    type: string
    sql: ${TABLE}."transaction1 batch number" ;;
  }

  dimension: transaction1_transaction_code {
    type: string
    sql: ${TABLE}."transaction1 transaction code" ;;
  }

  dimension: transaction2_batch_number {
    type: string
    sql: ${TABLE}."transaction2 batch number" ;;
  }

  dimension: transaction2_transaction_code {
    type: string
    sql: ${TABLE}."transaction2 transaction code" ;;
  }

  dimension: transaction3_batch_number {
    type: string
    sql: ${TABLE}."transaction3 batch number" ;;
  }

  dimension: transaction3_transaction_code {
    type: string
    sql: ${TABLE}."transaction3 transaction code" ;;
  }

  dimension: transaction4_batch_number {
    type: string
    sql: ${TABLE}."transaction4 batch number" ;;
  }

  dimension: transaction4_transaction_code {
    type: string
    sql: ${TABLE}."transaction4 transaction code" ;;
  }

  dimension: transaction5_batch_number {
    type: string
    sql: ${TABLE}."transaction5 batch number" ;;
  }

  dimension: transaction5_transaction_code {
    type: string
    sql: ${TABLE}."transaction5 transaction code" ;;
  }

  dimension: transaction6_batch_number {
    type: string
    sql: ${TABLE}."transaction6 batch number" ;;
  }

  dimension: transaction6_transaction_code {
    type: string
    sql: ${TABLE}."transaction6 transaction code" ;;
  }

  dimension: transaction7_batch_number {
    type: string
    sql: ${TABLE}."transaction7 batch number" ;;
  }

  dimension: transaction7_transaction_code {
    type: string
    sql: ${TABLE}."transaction7 transaction code" ;;
  }

  dimension: transaction8_batch_number {
    type: string
    sql: ${TABLE}."transaction8 batch number" ;;
  }

  dimension: transaction8_transaction_code {
    type: string
    sql: ${TABLE}."transaction8 transaction code" ;;
  }

  dimension: transaction9_batch_number {
    type: string
    sql: ${TABLE}."transaction9 batch number" ;;
  }

  dimension: transaction9_transaction_code {
    type: string
    sql: ${TABLE}."transaction9 transaction code" ;;
  }

  dimension: type18 {
    type: string
    sql: ${TABLE}."type-18" ;;
  }

  dimension: v_datelast_sale {
    type: string
    sql: ${TABLE}."v date/last sale" ;;
  }

  dimension: verified_location_cd {
    type: string
    sql: ${TABLE}."verified location cd" ;;
  }


  dimension: x_label_is_passing_master {
    type: string
    sql: ${TABLE}."x label is passing master" ;;
  }

  dimension: zip {
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}."zip" ;;
  }

  dimension: zip_raw {
    type: string
    sql: ${TABLE}."zip" ;;
  }

  dimension: zip4 {
    type: string
    sql: ${TABLE}."zip+4" ;;
  }




   }
