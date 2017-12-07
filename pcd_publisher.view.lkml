view: pcd_publisher {
  sql_table_name: PUBLIC.PCD_PUBLISHER ;;


  dimension: client_code {
    type: string
    sql: ${TABLE}.CLIENT_CODE ;;
  }

  dimension: pub_code {
    type: string
    sql: ${TABLE}.PUB_CODE ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.FREQUENCY ;;
  }

#   dimension: abbr {
#     type: string
#     sql: ${TABLE}.ABBR ;;
#   }
#
#   dimension: acs_member_number {
#     type: string
#     sql: ${TABLE}.ACS_MEMBER_NUMBER ;;
#   }
#
#   dimension: active {
#     type: yesno
#     sql: ${TABLE}.ACTIVE ;;
#   }
#
#   dimension: address_correction_acs_code {
#     type: string
#     sql: ${TABLE}.ADDRESS_CORRECTION_ACS_CODE ;;
#   }
#
#   dimension: audit_info {
#     type: string
#     sql: ${TABLE}.AUDIT_INFO ;;
#   }
#
#   dimension: basic_rate {
#     type: number
#     sql: ${TABLE}.BASIC_RATE ;;
#   }
#
#   dimension: brc_addon_zip {
#     type: string
#     sql: ${TABLE}.BRC_ADDON_ZIP ;;
#   }
#
#   dimension: brm_addon_zip {
#     type: string
#     sql: ${TABLE}.BRM_ADDON_ZIP ;;
#   }
#
#   dimension: business_reply_permit_number {
#     type: string
#     sql: ${TABLE}.BUSINESS_REPLY_PERMIT_NUMBER ;;
#   }
#
#   dimension: canada_rate {
#     type: number
#     sql: ${TABLE}.CANADA_RATE ;;
#   }
#
#   dimension: circ_director {
#     type: string
#     sql: ${TABLE}.CIRC_DIRECTOR ;;
#   }
#
#
#
#   dimension: courtesy_reply_addon_zip {
#     type: string
#     sql: ${TABLE}.COURTESY_REPLY_ADDON_ZIP ;;
#   }
#
#   dimension: customer_service_domestic {
#     type: string
#     sql: ${TABLE}.CUSTOMER_SERVICE_DOMESTIC ;;
#   }
#
#   dimension: customer_service_international {
#     type: string
#     sql: ${TABLE}.CUSTOMER_SERVICE_INTERNATIONAL ;;
#   }
#
#   dimension: edit_day {
#     type: string
#     sql: ${TABLE}.EDIT_DAY ;;
#   }
#
#
#
#   dimension: fulfillment_manager {
#     type: string
#     sql: ${TABLE}.FULFILLMENT_MANAGER ;;
#   }
#
#   dimension: gl_code {
#     type: string
#     sql: ${TABLE}.GL_CODE ;;
#   }
#
#   dimension: group {
#     type: string
#     sql: ${TABLE}."GROUP" ;;
#   }
#
#   dimension: international_rate {
#     type: number
#     sql: ${TABLE}.INTERNATIONAL_RATE ;;
#   }
#
#   dimension: ip_id {
#     type: string
#     sql: ${TABLE}.IP_ID ;;
#   }
#
#   dimension: issn {
#     type: string
#     sql: ${TABLE}.ISSN ;;
#   }
#
#   dimension: mid_member_number {
#     type: string
#     sql: ${TABLE}.MID_MEMBER_NUMBER ;;
#   }
#
#
#
#   dimension: newstand_rate {
#     type: number
#     sql: ${TABLE}.NEWSTAND_RATE ;;
#   }
#
#   dimension: nl_id {
#     type: string
#     sql: ${TABLE}.NL_ID ;;
#   }
#
#   dimension: outgoing_permit_number {
#     type: string
#     sql: ${TABLE}.OUTGOING_PERMIT_NUMBER ;;
#   }
#
#   dimension: pcd_account_manager {
#     type: string
#     sql: ${TABLE}.PCD_ACCOUNT_MANAGER ;;
#   }
#
#   dimension: pcd_backup {
#     type: string
#     sql: ${TABLE}.PCD_BACKUP ;;
#   }
#
#   dimension: po_box {
#     type: string
#     sql: ${TABLE}.PO_BOX ;;
#   }
#
#   dimension: pref_center_code {
#     type: string
#     sql: ${TABLE}.PREF_CENTER_CODE ;;
#   }
#
#
#
#   dimension: publication_mailer_id {
#     type: string
#     sql: ${TABLE}.PUBLICATION_MAILER_ID ;;
#   }
#
#   dimension: tp_id {
#     type: string
#     sql: ${TABLE}.TP_ID ;;
#   }
#
#   dimension: umc {
#     type: string
#     sql: ${TABLE}.UMC ;;
#   }
#
#   dimension: umc_digital {
#     type: string
#     sql: ${TABLE}.UMC_DIGITAL ;;
#   }
#
#   dimension: update_day {
#     type: string
#     sql: ${TABLE}.UPDATE_DAY ;;
#   }
#
#   dimension: zip_code {
#     type: zipcode
#     sql: ${TABLE}.ZIP_CODE ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [name]
#   }
}
