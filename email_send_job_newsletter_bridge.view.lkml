view: email_send_job_newsletter_bridge {

  derived_table:  {
    sql:  SELECT j.send_id,
                 UPPER(lkp.newsletter_id) as newsletter_id
          FROM PUBLIC.EMAIL_SEND_JOBS j,
               LATERAL flatten (split (replace (trim (regexp_substr (email_name,'\\[[A-Za-z0-9_ ]+\\]'),'[] '),' ',','),',')) f
            JOIN newsletter_lookup lkp ON (UPPER(lkp.newsletter_id) = UPPER(trim (f.value,'"')));;
  }

  dimension: send_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.send_id ;;
  }

  dimension: newsletter_id {
    type: string
    hidden:  yes
    sql: UPPER(${TABLE}.newsletter_id) ;;
  }

}
