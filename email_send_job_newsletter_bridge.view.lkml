view: email_send_job_newsletter_bridge {

  derived_table:  {
    sql:  SELECT j.send_id,
                 lkp.newsletter_id
          FROM PUBLIC.EMAIL_SEND_JOBS j,
               LATERAL flatten (split (replace (trim (regexp_substr (email_name,'\\[[A-Za-z0-9_ ]+\\]'),'[] '),' ',','),',')) f
            JOIN newsletter_lookup lkp ON (lkp.newsletter_id = trim (f.value,'"'));;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}.newsletter_id ;;
  }

}
