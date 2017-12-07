include: "email.model.lkml"

view: pcd_facts {
  derived_table: {
    sql:
      SELECT
        *
        , rank() over (partition by "account number", "client-18" order by "week ending" desc) as account_sequence
      FROM pcd_log
      WHERE "week ending" is not null;;

  }
  dimension: id {hidden:yes sql:${TABLE}."id";;}
  dimension: account_sequence {hidden:yes}
}
