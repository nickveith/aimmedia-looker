include: "aim_brand.view"

view: aim_navigation {

  derived_table: {
    sql: select b."BRAND_ID" as brand_id
              , b."NAME" as brand_name
              , g."NAME" as group_name
           from aim_brand b
                left join aim_group g on (b.group_id = g.id)
                ;;
  }

  dimension: aim_dashboard_link {
    type: string
    sql: '/dashboards/15' ;;
  }

  dimension: group_dashboard_link {
    type: string
    sql: '/dashboards/15' ;;
  }

  dimension: brand_dashboard_link {
    type: string
    sql: '/dashboards/15' ;;
  }

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name;;
  }

  measure: link_html {
    sql: LISTAGG('<a href="'||${brand_dashboard_link}||'">'||${brand_name}||'</a>', '');;
  }

  measure: brand_links {
    sql: 1 ;;
    html: <div>{{ _view.link_html }}</div>;;
  }

}
