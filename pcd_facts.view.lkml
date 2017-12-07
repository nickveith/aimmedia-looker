include: "email.model.lkml"

view: pcd_facts {
  derived_table: {
    sql:
      SELECT
        "id"
        , rank() over (partition by "account number", "client-18" order by "week ending" desc) as account_sequence
      FROM pcd_log;;

  }
  dimension: id {hidden:yes sql:${TABLE}."id";;}
  dimension: account_sequence {hidden:yes}
}
