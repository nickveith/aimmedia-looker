view: ga_profiles {
  sql_table_name: PUBLIC.GA_PROFILES ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."Id" ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}."AccountId" ;;
  }

  dimension: child_link {
    type: string
    sql: ${TABLE}."ChildLink" ;;
  }

  dimension: created {
    type: string
    sql: ${TABLE}."Created" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."Currency" ;;
  }

  dimension: default_page {
    type: string
    sql: ${TABLE}."DefaultPage" ;;
  }

  dimension: e_commerce_tracking {
    type: yesno
    sql: ${TABLE}."eCommerceTracking" ;;
  }

  dimension: exclude_query_parameters {
    type: string
    sql: ${TABLE}."ExcludeQueryParameters" ;;
  }

  dimension: internal_web_property_id {
    type: string
    sql: ${TABLE}."InternalWebPropertyId" ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}."Kind" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: parent_link {
    type: string
    sql: ${TABLE}."ParentLink" ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}."Permissions" ;;
  }

  dimension: self_link {
    type: string
    sql: ${TABLE}."SelfLink" ;;
  }

  dimension: site_search_category_parameters {
    type: string
    sql: ${TABLE}."SiteSearchCategoryParameters" ;;
  }

  dimension: site_search_query_parameters {
    type: string
    sql: ${TABLE}."SiteSearchQueryParameters" ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}."Timezone" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."Type" ;;
  }

  dimension: updated {
    type: string
    sql: ${TABLE}."Updated" ;;
  }

  dimension: web_property_id {
    type: string
    sql: ${TABLE}."WebPropertyId" ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}."WebsiteURL" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
