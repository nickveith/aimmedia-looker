view: fb_pages {
  sql_table_name: PUBLIC.FB_PAGES ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: about {
    type: string
    hidden: yes
    sql: ${TABLE}."About" ;;
  }

  dimension: accepts_american_express {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AcceptsAmericanExpress" ;;
  }

  dimension: accepts_cash_only {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AcceptsCashOnly" ;;
  }

  dimension: accepts_discover {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AcceptsDiscover" ;;
  }

  dimension: accepts_master_card {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AcceptsMasterCard" ;;
  }

  dimension: accepts_visa {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AcceptsVisa" ;;
  }

  dimension: affiliation {
    type: string
    hidden: yes
    sql: ${TABLE}."Affiliation" ;;
  }

  dimension: allows_groups {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AllowsGroups" ;;
  }

  dimension: allows_kids {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AllowsKids" ;;
  }

  dimension: allows_walkins {
    type: yesno
    hidden: yes
    sql: ${TABLE}."AllowsWalkins" ;;
  }

  dimension: artists_we_like {
    type: string
    hidden: yes
    sql: ${TABLE}."ArtistsWeLike" ;;
  }

  dimension: attire {
    type: string
    hidden: yes
    sql: ${TABLE}."Attire" ;;
  }

  dimension: awards {
    type: string
    hidden: yes
    sql: ${TABLE}."Awards" ;;
  }

  dimension: band_interests {
    type: string
    hidden: yes
    sql: ${TABLE}."BandInterests" ;;
  }

  dimension: band_members {
    type: string
    hidden: yes
    sql: ${TABLE}."BandMembers" ;;
  }

  dimension: bio {
    type: string
    hidden: yes
    sql: ${TABLE}."Bio" ;;
  }

  dimension: birthday {
    type: string
    hidden: yes
    sql: ${TABLE}."Birthday" ;;
  }

  dimension: booking_agent {
    type: string
    hidden: yes
    sql: ${TABLE}."BookingAgent" ;;
  }

  dimension: built {
    type: string
    hidden: yes
    sql: ${TABLE}."Built" ;;
  }

  dimension: can_post {
    type: yesno
    hidden: yes
    sql: ${TABLE}."CanPost" ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}."Categories" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."Category" ;;
  }

  measure: checkins {
    type: sum
    sql: ${TABLE}."Checkins" ;;
  }

  dimension: company_overview {
    type: string
    sql: ${TABLE}."CompanyOverview" ;;
  }

  dimension: cover_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CoverId" ;;
  }

  dimension: cover_offset_x {
    type: string
    hidden: yes
    sql: ${TABLE}."CoverOffsetX" ;;
  }

  dimension: cover_offset_y {
    type: string
    hidden: yes
    sql: ${TABLE}."CoverOffsetY" ;;
  }

  dimension: cover_source {
    type: string
    hidden: yes
    sql: ${TABLE}."CoverSource" ;;
  }

  dimension_group: created {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension: culinary_team {
    type: string
    hidden: yes
    sql: ${TABLE}."CulinaryTeam" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."Description" ;;
  }

  dimension: directed_by {
    type: string
    hidden: yes
    sql: ${TABLE}."DirectedBy" ;;
  }

  dimension: features {
    type: string
    hidden: yes
    sql: ${TABLE}."Features" ;;
  }

  dimension: founded {
    type: string
    hidden: yes
    sql: ${TABLE}."Founded" ;;
  }

  dimension: general_info {
    type: string
    hidden: yes
    sql: ${TABLE}."GeneralInfo" ;;
  }

  dimension: general_manager {
    type: string
    hidden: yes
    sql: ${TABLE}."GeneralManager" ;;
  }

  dimension: genre {
    type: string
    hidden: yes
    sql: ${TABLE}."Genre" ;;
  }

  dimension: has_outdoor_seating {
    type: yesno
    hidden: yes
    sql: ${TABLE}."HasOutdoorSeating" ;;
  }

  dimension: has_waiters {
    type: yesno
    hidden: yes
    sql: ${TABLE}."HasWaiters" ;;
  }

  dimension: hometown {
    type: string
    hidden: yes
    sql: ${TABLE}."Hometown" ;;
  }

  dimension: hours {
    type: string
    hidden: yes
    sql: ${TABLE}."Hours" ;;
  }

  dimension: influences {
    type: string
    hidden: yes
    sql: ${TABLE}."Influences" ;;
  }

  dimension: is_community_page {
    type: yesno
    hidden: yes
    sql: ${TABLE}."IsCommunityPage" ;;
  }

  dimension: is_published {
    type: yesno
    hidden: yes
    sql: ${TABLE}."IsPublished" ;;
  }

  measure: likes {
    type: sum
    sql: ${TABLE}."Likes" ;;
  }

  dimension: link {
    type: string
    hidden: yes
    sql: ${TABLE}."Link" ;;
  }

  dimension: location_city {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationCity" ;;
  }

  dimension: location_country {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationCountry" ;;
  }

  dimension: location_latitude {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationLatitude" ;;
  }

  dimension: location_longitude {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationLongitude" ;;
  }

  dimension: location_state {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationState" ;;
  }

  dimension: location_street {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationStreet" ;;
  }

  dimension: location_zip {
    type: string
    hidden: yes
    sql: ${TABLE}."LocationZip" ;;
  }

  dimension: members {
    type: string
    hidden: yes
    sql: ${TABLE}."Members" ;;
  }

  dimension: mission {
    type: string
    sql: ${TABLE}."Mission" ;;
  }

  dimension: mpg {
    type: string
    hidden: yes
    sql: ${TABLE}."MPG" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."Name" ;;
  }

  dimension: network {
    type: string
    hidden: yes
    sql: ${TABLE}."Network" ;;
  }

  dimension: parent_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ParentID" ;;
  }

  dimension: parking_lot {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ParkingLot" ;;
  }

  dimension: parking_street {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ParkingStreet" ;;
  }

  dimension: parking_valet {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ParkingValet" ;;
  }

  dimension: personal_info {
    type: string
    hidden: yes
    sql: ${TABLE}."PersonalInfo" ;;
  }

  dimension: personal_interests {
    type: string
    hidden: yes
    sql: ${TABLE}."PersonalInterests" ;;
  }

  dimension: pharma_safety_info {
    type: string
    hidden: yes
    sql: ${TABLE}."PharmaSafetyInfo" ;;
  }

  dimension: phone {
    type: string
    hidden: yes
    sql: ${TABLE}."Phone" ;;
  }

  dimension: picture {
    type: string
    hidden: yes
    sql: ${TABLE}."Picture" ;;
  }

  dimension: plot_outline {
    type: string
    hidden: yes
    sql: ${TABLE}."PlotOutline" ;;
  }

  dimension: press_contact {
    type: string
    hidden: yes
    sql: ${TABLE}."PressContact" ;;
  }

  dimension: price_range {
    type: string
    hidden: yes
    sql: ${TABLE}."PriceRange" ;;
  }

  dimension: produced_by {
    type: string
    hidden: yes
    sql: ${TABLE}."ProducedBy" ;;
  }

  dimension: products {
    type: string
    hidden: yes
    sql: ${TABLE}."Products" ;;
  }

  dimension: promotion_eligible {
    type: yesno
    hidden: yes
    sql: ${TABLE}."PromotionEligible" ;;
  }

  dimension: promotion_ineligible_reason {
    type: string
    hidden: yes
    sql: ${TABLE}."PromotionIneligibleReason" ;;
  }

  dimension: provides_catering {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ProvidesCatering" ;;
  }

  dimension: provides_delivery {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ProvidesDelivery" ;;
  }

  dimension: provides_takeout {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ProvidesTakeout" ;;
  }

  dimension: public_transit {
    type: string
    hidden: yes
    sql: ${TABLE}."PublicTransit" ;;
  }

  dimension: record_label {
    type: string
    hidden: yes
    sql: ${TABLE}."RecordLabel" ;;
  }

  dimension: release_data {
    type: string
    hidden: yes
    sql: ${TABLE}."ReleaseData" ;;
  }

  dimension: schedule {
    type: string
    hidden: yes
    sql: ${TABLE}."Schedule" ;;
  }

  dimension: screenplay_by {
    type: string
    hidden: yes
    sql: ${TABLE}."ScreenplayBy" ;;
  }

  dimension: search_terms {
    type: string
    hidden: yes
    sql: ${TABLE}."SearchTerms" ;;
  }

  dimension: season {
    type: string
    hidden: yes
    sql: ${TABLE}."Season" ;;
  }

  dimension: serves_breakfast {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ServesBreakfast" ;;
  }

  dimension: serves_coffee {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ServesCoffee" ;;
  }

  dimension: serves_dinner {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ServesDinner" ;;
  }

  dimension: serves_drinks {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ServesDrinks" ;;
  }

  dimension: serves_lunch {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ServesLunch" ;;
  }

  dimension: starring {
    type: string
    hidden: yes
    sql: ${TABLE}."Starring" ;;
  }

  dimension: store_number {
    type: number
    hidden: yes
    sql: ${TABLE}."StoreNumber" ;;
  }

  dimension: studio {
    type: string
    hidden: yes
    sql: ${TABLE}."Studio" ;;
  }

  dimension: takes_reservations {
    type: yesno
    hidden: yes
    sql: ${TABLE}."TakesReservations" ;;
  }

  measure: talking_about_count {
    type: sum
    sql: ${TABLE}."TalkingAboutCount" ;;
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
    sql: ${TABLE}."UPDATED_DATE" ;;
  }

  dimension: username {
    type: string
    hidden: yes
    sql: ${TABLE}."Username" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."Website" ;;
  }

  measure: were_here_count {
    type: sum
    sql: ${TABLE}."WereHereCount" ;;
  }

  dimension: written_by {
    type: string
    hidden: yes
    sql: ${TABLE}."WrittenBy" ;;
  }

}
