include: "aim_brand.view"

view: aim_navigation {

  extends: [aim_brand]

  dimension: brand_links {
    sql: ${brand_name} ;;
    html: <p>{{value}}</p> ;;
  }

  }
