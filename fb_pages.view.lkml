view: fb_pages {
  sql_table_name: PUBLIC.FB_PAGES ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: about {
    type: string
    sql: ${TABLE}.About ;;
  }

  dimension: accepts_american_express {
    type: yesno
    sql: ${TABLE}.AcceptsAmericanExpress ;;
  }

  dimension: accepts_cash_only {
    type: yesno
    sql: ${TABLE}.AcceptsCashOnly ;;
  }

  dimension: accepts_discover {
    type: yesno
    sql: ${TABLE}.AcceptsDiscover ;;
  }

  dimension: accepts_master_card {
    type: yesno
    sql: ${TABLE}.AcceptsMasterCard ;;
  }

  dimension: accepts_visa {
    type: yesno
    sql: ${TABLE}.AcceptsVisa ;;
  }

  dimension: affiliation {
    type: string
    sql: ${TABLE}.Affiliation ;;
  }

  dimension: allows_groups {
    type: yesno
    sql: ${TABLE}.AllowsGroups ;;
  }

  dimension: allows_kids {
    type: yesno
    sql: ${TABLE}.AllowsKids ;;
  }

  dimension: allows_walkins {
    type: yesno
    sql: ${TABLE}.AllowsWalkins ;;
  }

  dimension: artists_we_like {
    type: string
    sql: ${TABLE}.ArtistsWeLike ;;
  }

  dimension: attire {
    type: string
    sql: ${TABLE}.Attire ;;
  }

  dimension: awards {
    type: string
    sql: ${TABLE}.Awards ;;
  }

  dimension: band_interests {
    type: string
    sql: ${TABLE}.BandInterests ;;
  }

  dimension: band_members {
    type: string
    sql: ${TABLE}.BandMembers ;;
  }

  dimension: bio {
    type: string
    sql: ${TABLE}.Bio ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}.Birthday ;;
  }

  dimension: booking_agent {
    type: string
    sql: ${TABLE}.BookingAgent ;;
  }

  dimension: built {
    type: string
    sql: ${TABLE}.Built ;;
  }

  dimension: can_post {
    type: yesno
    sql: ${TABLE}.CanPost ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.Categories ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: checkins {
    type: number
    sql: ${TABLE}.Checkins ;;
  }

  dimension: company_overview {
    type: string
    sql: ${TABLE}.CompanyOverview ;;
  }

  dimension: cover_id {
    type: string
    sql: ${TABLE}.CoverId ;;
  }

  dimension: cover_offset_x {
    type: string
    sql: ${TABLE}.CoverOffsetX ;;
  }

  dimension: cover_offset_y {
    type: string
    sql: ${TABLE}.CoverOffsetY ;;
  }

  dimension: cover_source {
    type: string
    sql: ${TABLE}.CoverSource ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_DATE ;;
  }

  dimension: culinary_team {
    type: string
    sql: ${TABLE}.CulinaryTeam ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: directed_by {
    type: string
    sql: ${TABLE}.DirectedBy ;;
  }

  dimension: features {
    type: string
    sql: ${TABLE}.Features ;;
  }

  dimension: founded {
    type: string
    sql: ${TABLE}.Founded ;;
  }

  dimension: general_info {
    type: string
    sql: ${TABLE}.GeneralInfo ;;
  }

  dimension: general_manager {
    type: string
    sql: ${TABLE}.GeneralManager ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.Genre ;;
  }

  dimension: has_outdoor_seating {
    type: yesno
    sql: ${TABLE}.HasOutdoorSeating ;;
  }

  dimension: has_waiters {
    type: yesno
    sql: ${TABLE}.HasWaiters ;;
  }

  dimension: hometown {
    type: string
    sql: ${TABLE}.Hometown ;;
  }

  dimension: hours {
    type: string
    sql: ${TABLE}.Hours ;;
  }

  dimension: influences {
    type: string
    sql: ${TABLE}.Influences ;;
  }

  dimension: is_community_page {
    type: yesno
    sql: ${TABLE}.IsCommunityPage ;;
  }

  dimension: is_published {
    type: yesno
    sql: ${TABLE}.IsPublished ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.Likes ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.Link ;;
  }

  dimension: location_city {
    type: string
    sql: ${TABLE}.LocationCity ;;
  }

  dimension: location_country {
    type: string
    sql: ${TABLE}.LocationCountry ;;
  }

  dimension: location_latitude {
    type: string
    sql: ${TABLE}.LocationLatitude ;;
  }

  dimension: location_longitude {
    type: string
    sql: ${TABLE}.LocationLongitude ;;
  }

  dimension: location_state {
    type: string
    sql: ${TABLE}.LocationState ;;
  }

  dimension: location_street {
    type: string
    sql: ${TABLE}.LocationStreet ;;
  }

  dimension: location_zip {
    type: string
    sql: ${TABLE}.LocationZip ;;
  }

  dimension: members {
    type: string
    sql: ${TABLE}.Members ;;
  }

  dimension: mission {
    type: string
    sql: ${TABLE}.Mission ;;
  }

  dimension: mpg {
    type: string
    sql: ${TABLE}.MPG ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.Network ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.ParentID ;;
  }

  dimension: parking_lot {
    type: yesno
    sql: ${TABLE}.ParkingLot ;;
  }

  dimension: parking_street {
    type: yesno
    sql: ${TABLE}.ParkingStreet ;;
  }

  dimension: parking_valet {
    type: yesno
    sql: ${TABLE}.ParkingValet ;;
  }

  dimension: personal_info {
    type: string
    sql: ${TABLE}.PersonalInfo ;;
  }

  dimension: personal_interests {
    type: string
    sql: ${TABLE}.PersonalInterests ;;
  }

  dimension: pharma_safety_info {
    type: string
    sql: ${TABLE}.PharmaSafetyInfo ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.Picture ;;
  }

  dimension: plot_outline {
    type: string
    sql: ${TABLE}.PlotOutline ;;
  }

  dimension: press_contact {
    type: string
    sql: ${TABLE}.PressContact ;;
  }

  dimension: price_range {
    type: string
    sql: ${TABLE}.PriceRange ;;
  }

  dimension: produced_by {
    type: string
    sql: ${TABLE}.ProducedBy ;;
  }

  dimension: products {
    type: string
    sql: ${TABLE}.Products ;;
  }

  dimension: promotion_eligible {
    type: yesno
    sql: ${TABLE}.PromotionEligible ;;
  }

  dimension: promotion_ineligible_reason {
    type: string
    sql: ${TABLE}.PromotionIneligibleReason ;;
  }

  dimension: provides_catering {
    type: yesno
    sql: ${TABLE}.ProvidesCatering ;;
  }

  dimension: provides_delivery {
    type: yesno
    sql: ${TABLE}.ProvidesDelivery ;;
  }

  dimension: provides_takeout {
    type: yesno
    sql: ${TABLE}.ProvidesTakeout ;;
  }

  dimension: public_transit {
    type: string
    sql: ${TABLE}.PublicTransit ;;
  }

  dimension: record_label {
    type: string
    sql: ${TABLE}.RecordLabel ;;
  }

  dimension: release_data {
    type: string
    sql: ${TABLE}.ReleaseData ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}.Schedule ;;
  }

  dimension: screenplay_by {
    type: string
    sql: ${TABLE}.ScreenplayBy ;;
  }

  dimension: search_terms {
    type: string
    sql: ${TABLE}.SearchTerms ;;
  }

  dimension: season {
    type: string
    sql: ${TABLE}.Season ;;
  }

  dimension: serves_breakfast {
    type: yesno
    sql: ${TABLE}.ServesBreakfast ;;
  }

  dimension: serves_coffee {
    type: yesno
    sql: ${TABLE}.ServesCoffee ;;
  }

  dimension: serves_dinner {
    type: yesno
    sql: ${TABLE}.ServesDinner ;;
  }

  dimension: serves_drinks {
    type: yesno
    sql: ${TABLE}.ServesDrinks ;;
  }

  dimension: serves_lunch {
    type: yesno
    sql: ${TABLE}.ServesLunch ;;
  }

  dimension: starring {
    type: string
    sql: ${TABLE}.Starring ;;
  }

  dimension: store_number {
    type: number
    sql: ${TABLE}.StoreNumber ;;
  }

  dimension: studio {
    type: string
    sql: ${TABLE}.Studio ;;
  }

  dimension: takes_reservations {
    type: yesno
    sql: ${TABLE}.TakesReservations ;;
  }

  dimension: talking_about_count {
    type: number
    sql: ${TABLE}.TalkingAboutCount ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.UPDATED_DATE ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.Username ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.Website ;;
  }

  dimension: were_here_count {
    type: number
    sql: ${TABLE}.WereHereCount ;;
  }

  dimension: written_by {
    type: string
    sql: ${TABLE}.WrittenBy ;;
  }

  measure: count {
    type: count
    drill_fields: [id, username, name]
  }
}
