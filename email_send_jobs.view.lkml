view: send_jobs {
  derived_table: {
    sql:  select j.*
               , m.newsletter_id
             from PUBLIC.EMAIL_SEND_JOBS j
             left join email_send_nls_map m on (j.send_id = m .send_id);;
  }

  dimension: additional {
    type: string
    hidden: yes
    sql: ${TABLE}.ADDITIONAL ;;
  }

  dimension: client_id {
    type: number
    hidden: yes
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: email_name {
    type: string
    sql: ${TABLE}.EMAIL_NAME ;;
  }

  dimension: newsletter_id {
    type: string
    sql: ${TABLE}.newsletter_id;;
  }

  dimension: from_email {
    type: string
    sql: ${TABLE}.FROM_EMAIL ;;
  }

  dimension: from_name {
    type: string
    sql: ${TABLE}.FROM_NAME ;;
  }

  dimension: is_multipart {
    type: yesno
    hidden: yes
    sql: ${TABLE}.IS_MULTIPART ;;
  }

  dimension: job_status {
    type: string
    hidden: yes
    sql: ${TABLE}.JOB_STATUS ;;
  }

  dimension: preview_url {
    type: string
    sql: ${TABLE}.PREVIEW_URL ;;
  }

  dimension: scheduled_time {
    type: date_time
    hidden: yes
    sql: ${TABLE}.SCHEDULED_TIME ;;
  }

  dimension: send_definition_external_key {
    type: string
    hidden: yes
    sql: ${TABLE}.SEND_DEFINITION_EXTERNAL_KEY ;;
  }

  dimension: send_id {
    type: number
    hidden: yes
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: sent_time {
    type: date_time
    hidden: yes
    sql: ${TABLE}.SENT_TIME ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.SUBJECT ;;
  }

  dimension: triggered_send_external_key {
    type: string
    hidden: yes
    sql: nullif(${TABLE}.TRIGGERED_SEND_EXTERNAL_KEY,'') ;;
  }

  dimension: is_triggered_send {
    type: yesno
    sql: ${triggered_send_external_key} is not null;;
  }

  dimension: email_thumbnail {
    type: string
    sql: ${TABLE}.SEND_ID;;
    html: <img src="https://members.s7.exacttarget.com/Content/Email/EmailThumbnail.aspx?jid={{value}}&w=300&h=500" /> ;;
  }

  measure: email_sends {
    type: count_distinct
    sql: ${TABLE}.SEND_ID ;;
  }

  dimension: parent_allsub_list {
    type: string
    sql: '173' ;;
  }

  dimension: bu_allsub_list {
    type: string
    sql: case when ${client_id} = '7237799' then '4467' -- MG
              when ${client_id} = '7233488' then '4505' -- EQ
              when ${client_id} = '7233491' then '4506' --HL
              when ${client_id} = '7233492' then '4508' -- HG
              when ${client_id} = '7233494' then '4509' -- MG
          end ;;
  }

}
