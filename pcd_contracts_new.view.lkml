include: "pcd_contracts.view.lkml"
include: "pcd_pub_source.view.lkml"

view: pcd_contracts_new {

  extends: [pcd_contracts]

  measure: new_contracts {
    type: count_distinct
    sql: case when ${contracts.calendar_date} = ${process_date}::date then ${contract_id} end  ;;
  }

}
