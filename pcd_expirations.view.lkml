include: "pcd_contracts.view.lkml"
include: "pcd_pub_source.view.lkml"

view: pcd_expirations {

  extends: [pcd_contracts]

  measure: unique_expirations {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
  }

  measure: dtp_unique_expirations {
    type: count_distinct
    sql: case when ${expirations.primary_source} = 'DTP' then ${expirations.account_id} end ;;
  }

  measure: agency_unique_expirations {
    type: count_distinct
    sql: case when ${expirations.primary_source} = 'Agency' then ${expirations.account_id} end ;;
  }

}

view: pcd_renewals {

  extends: [pcd_contracts]

  measure: renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct ${TABLE}.account_id)
                   / ${expirations.unique_expirations}
              end ;;
    value_format: "##.#%"
  }

  measure: dtp_renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct case when ${expirations.primary_source} = 'DTP' and ${lapsed_days} <= 90 then ${TABLE}.account_id end)
                / ${expirations.dtp_unique_expirations}
              end ;;
    value_format: "##.#%"
  }

  measure: agency_renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct case when ${expirations.primary_source} = 'Agency' and ${lapsed_days} <= 90 then ${TABLE}.account_id end)
                / ${expirations.agency_unique_expirations}
              end ;;
    value_format: "##.#%"
  }

  measure: direct_renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct case when ${renewal_source.source_type} = 'Renewals' and ${lapsed_days} <= 90 then ${TABLE}.account_id end)
                   / ${expirations.unique_expirations}
              end ;;
    value_format: "##.#%"
    }

  measure: indirect_renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct case when ${renewal_source.source_type} != 'Renewals' and ${lapsed_days} <= 90 then ${TABLE}.account_id end)
                   / ${expirations.unique_expirations}
              end ;;
    value_format: "##.#%"
  }

  measure: under_promotion_renewal_rate {
    type: number
    sql: case when count(distinct ${TABLE}.account_id) = 0 then 0
              else count(distinct case when ${lapsed_days} > 90 then ${TABLE}.account_id end)
                   / ${expirations.unique_expirations}
              end ;;
    value_format: "##.#%"
  }

}
