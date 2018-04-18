include: "aim_brand.view"

view: aim_navigation {

  derived_table: {
    sql: select b."BRAND_ID" as brand_id
              , b."NAME" as brand_name
              , g."NAME" as group_name
              , '<a href="'||'/dashboards/15'||'">'||b."NAME"||'</a>' as brand_link
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

  measure: brand_dashboard_link {
    type: string
    sql: '/dashboards/15';;
  }

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id;;
  }

  measure: brand_name {
    type: string
    sql: ${TABLE}.brand_name;;
  }

  measure: link_html {
    sql: LISTAGG('<a href="'||${brand_dashboard_link}||'">'||${brand_name}||'</a>', '');;
  }

  measure: group_links {
    view_label: "Group"
    type: string
    sql:'AIM' ;;
    html: <div class="navLinks">
  <div class="linkButton" style="display: inline-block; border: 1px solid black; padding: 5px 10px 5px 10px; border-radius: 5px;">
    <a class="navLink" style="color: black; text-decoration: none;" href='/dashboards/15?Group=Equine'>Equine</a>
  </div>
  <div class="linkButton" style="display: inline-block; border: 1px solid black; padding: 5px 10px 5px 10px; border-radius: 5px;">
  <a class="navLink" style="color: black; text-decoration: none;" href='/dashboards/15?Group=Healthy+Living'>Healthy Living</a>
  </div>
  <div class="linkButton" style="display: inline-block; border: 1px solid black; padding: 5px 10px 5px 10px; border-radius: 5px;">
  <a class="navLink" style="color: black; text-decoration: none;" href='/dashboards/15?Group=Equine'>Home</a>
  </div>
  <div class="linkButton" style="display: inline-block; border: 1px solid black; padding: 5px 10px 5px 10px; border-radius: 5px;">
  <a class="navLink" style="color: black; text-decoration: none;" href='/dashboards/15?Group=Equine'>Marine</a>
  </div>
  <div class="linkButton" style="display: inline-block; border: 1px solid black; padding: 5px 10px 5px 10px; border-radius: 5px;">
  <a class="navLink" style="color: black; text-decoration: none;" href='/dashboards/15?Group=Equine'>Outdoor</a>
  </div>
</div>;;
  }

}
