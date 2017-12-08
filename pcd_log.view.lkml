explore: pcd_log {}
view: pcd_log {
  derived_table: {
#     datagroup_trigger: monthly
    sql:
      SELECT
        "id"
        , "match code"
        , "account number"
        , "client-18"
        , "pub-18"
        , rank() over (partition by "account number", "client-18" order by "week ending" desc) as account_sequence
        , "process date - contract 1"
        , "contract1 source key code"
        , "contract1 contract indicator"
        , "contract1 primary source"
        , "contract1 email transaction type"
        , "contract1 contract status"
        , "contract1 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract1 renewal start issue") between 0 and 3 then null else nullif("contract1 renewal start issue",'') end) as "contract1 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract1 renewal expire") between 0 and 3 then null else nullif("contract1 renewal expire",'') end) as "contract1 renewal expire"
        , "remit rate - contract 1"
        , "term - contract 1"
        , "copies - contract 1"
        , "price - contract 1"
        , "process date - contract 2"
        , "contract2 source key code"
        , null as "contract2 contract indicator"
        , "contract2 primary source"
        , "contract2 email transaction type"
        , "contract2 contract status"
        , "contract2 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract2 renewal start issue") between 0 and 3 then null else nullif("contract2 renewal start issue",'') end) as "contract2 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract2 renewal expire") between 0 and 3 then null else nullif("contract2 renewal expire",'') end) as "contract2 renewal expire"
        , "remit rate - contract 2"
        , "term - contract 2"
        , "copies - contract 2"
        , "price - contract 2"
        , "contract2 cowles earnings"
        , "process date - contract 3"
        , "contract3 source key code"
        , null as "contract3 contract indicator"
        , "contract3 primary source"
        , "contract3 email transaction type"
        , "contract3 contract status"
        , "contract3 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract3 renewal start issue") between 0 and 3 then null else nullif("contract3 renewal start issue",'') end) as "contract3 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract3 renewal expire") between 0 and 3 then null else nullif("contract3 renewal expire",'') end) as "contract3 renewal expire"
        , "remit rate - contract 3"
        , "term - contract 3"
        , "copies - contract 3"
        , "price - contract 3"
        , "contract3 cowles earnings"
        , "process date - contract 4"
        , "contract4 source key code"
        , null as "contract4 contract indicator"
        , "contract4 primary source"
        , "contract4 email transaction type"
        , "contract4 contract status"
        , "contract4 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract4 renewal start issue") between 0 and 3 then null else nullif("contract4 renewal start issue",'') end) as "contract4 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract4 renewal expire") between 0 and 3 then null else nullif("contract4 renewal expire",'') end) as "contract4 renewal expire"
        , "remit rate - contract 4"
        , "term - contract 4"
        , "copies - contract 4"
        , "price - contract 4"
        , "contract4 cowles earnings"
        , "process date - contract 5"
        , "contract5 source key code"
        , null as "contract5 contract indicator"
        , "contract5 primary source"
        , "contract5 email transaction type"
        , "contract5 contract status"
        , "contract5 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract5 renewal start issue") between 0 and 3 then null else nullif("contract5 renewal start issue",'') end) as "contract5 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract5 renewal expire") between 0 and 3 then null else nullif("contract5 renewal expire",'') end) as "contract5 renewal expire"
        , "remit rate - contract 5"
        , "term - contract 5"
        , "copies - contract 5"
        , "price - contract 5"
        , "contract5 cowles earnings"
        , "process date - contract 6"
        , "contract6 source key code"
        , null as "contract6 contract indicator"
        , "contract6 primary source"
        , "contract6 email transaction type"
        , "contract6 contract status"
        , "contract6 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract6 renewal start issue") between 0 and 3 then null else nullif("contract6 renewal start issue",'') end) as "contract6 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract6 renewal expire") between 0 and 3 then null else nullif("contract6 renewal expire",'') end) as "contract6 renewal expire"
        , "remit rate - contract 6"
        , "term - contract 6"
        , "copies - contract 6"
        , "price - contract 6"
        , "contract6 cowles earnings"
        , "process date - contract 7"
        , "contract7 source key code"
        , null as "contract7 contract indicator"
        , "contract7 primary source"
        , "contract7 email transaction type"
        , "contract7 contract status"
        , "contract7 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract7 renewal start issue") between 0 and 3 then null else nullif("contract7 renewal start issue",'') end) as "contract7 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract7 renewal expire") between 0 and 3 then null else nullif("contract7 renewal expire",'') end) as "contract7 renewal expire"
        , "remit rate - contract 7"
        , "term - contract 7"
        , "copies - contract 7"
        , "price - contract 7"
        , "contract7 cowles earnings"
        , "process date - contract 8"
        , "contract8 source key code"
        , null as "contract8 contract indicator"
        , "contract8 primary source"
        , "contract8 email transaction type"
        , "contract8 contract status"
        , "contract8 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract8 renewal start issue") between 0 and 3 then null else nullif("contract8 renewal start issue",'') end) as "contract8 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract8 renewal expire") between 0 and 3 then null else nullif("contract8 renewal expire",'') end) as "contract8 renewal expire"
        , "remit rate - contract 8"
        , "term - contract 8"
        , "copies - contract 8"
        , "price - contract 8"
        , "contract8 cowles earnings"
        , "process date - contract 9"
        , "contract9 source key code"
        , null as "contract9 contract indicator"
        , "contract9 primary source"
        , "contract9 email transaction type"
        , "contract9 contract status"
        , "contract9 paid or charge"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract9 renewal start issue") between 0 and 3 then null else nullif("contract9 renewal start issue",'') end) as "contract9 renewal start issue"
        , TRY_TO_NUMERIC(CASE WHEN LENGTH("contract9 renewal expire") between 0 and 3 then null else nullif("contract9 renewal expire",'') end) as "contract9 renewal expire"
        , "remit rate - contract 9"
        , "term - contract 9"
        , "copies - contract 9"
        , "price - contract 9"
        , "contract9 cowles earnings"
        , pub.name
        , TRY_TO_NUMERIC(nullif(pub.frequency,'')) as frequency
    FROM
      MATILLION.PUBLIC.PCD_LOG
    INNER JOIN MATILLION.PUBLIC.PCD_PUBLISHER pub
      on (PCD_LOG."client-18" = pub.CLIENT_CODE and PCD_LOG."pub-18" = pub.PUB_CODE)
    WHERE "week ending" is not null
    AND pub.frequency is not null
    AND PCD_LOG."id" NOT IN
      ('e82bcca09436fb140922594ccfb3cdb1',
      '706461a3dd8e036f074f3854f0a34471',
      'e5ce133d5ab1914132680151592358f1',
      '05b5765f964c6e009281cb6c8a6a0a9a',
      'a64be5dc508ae794793b6e120677f64c',
      '4c1280d6608a1ddec3cb1faccc0ff031',
      '2f71c18f858266a69a6a3a190481edaf',
      'a5315d61836230e03e7b2056f1afd197')
    ORDER BY "id"
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

  dimension: id {
    label: "PCD ID"
    primary_key: yes
#     hidden: yes
    type: string
    sql: ${TABLE}."id" ;;
  }
  measure: count {
    type: count
#     drill_fields: [id, name, company_name]
  }
}
