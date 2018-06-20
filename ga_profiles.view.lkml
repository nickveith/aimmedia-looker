view: ga_profiles {
  derived_table: {
    sql: select p.*
             , case when b.GA_PROPERTY is not null then True else False end as is_primary
          from PUBLIC.GA_PROFILES p
          left join PUBLIC.AIM_BRAND b on (p."Id" = b.GA_PROPERTY)
            ;;
  }


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."Id" ;;
  }

  dimension: is_primary {
    type: yesno
    sql: ${TABLE}.is_primary ;;
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
