CREATE OR REPLACE VIEW public.typeform_form_office_hours_responses
AS WITH names AS (
         SELECT t1._cq_sync_time,
            t1.submitted_at,
            t1.response_id,
            regexp_replace((t1.value -> 'text'::text)::text, '\"'::text, ''::text, 'g'::text) AS name
           FROM ( SELECT tfr._cq_sync_time,
                    tfr.submitted_at,
                    tfr.response_id,
                    jsonb_array_elements(tfr.answers) AS value
                   FROM typeform_form_responses tfr
                  WHERE tfr.form_id = 'K7lGrRtz'::text) t1
          WHERE ((((t1.value -> 'field'::text) -> 'id'::text)::json)::text) = '"EmStStrY2U5h"'::text
        ), emails AS (
         SELECT t1.response_id,
            regexp_replace((t1.email -> 'email'::text)::text, '\"'::text, ''::text, 'g'::text) AS email
           FROM ( SELECT tfr.response_id,
                    jsonb_array_elements(tfr.answers) AS email
                   FROM typeform_form_responses tfr
                  WHERE tfr.form_id = 'K7lGrRtz'::text) t1
          WHERE ((((t1.email -> 'field'::text) -> 'id'::text)::json)::text) = '"JQG9UW205rbz"'::text
        ), answers AS (
         SELECT t1.response_id,
            regexp_replace((t1.answer -> 'text'::text)::text, '\"'::text, ''::text, 'g'::text) AS answer
           FROM ( SELECT tfr.response_id,
                    jsonb_array_elements(tfr.answers) AS answer
                   FROM typeform_form_responses tfr
                  WHERE tfr.form_id = 'K7lGrRtz'::text) t1
          WHERE ((((t1.answer -> 'field'::text) -> 'id'::text)::json)::text) = '"irINcDeI6u9m"'::text
        )
 SELECT names._cq_sync_time,
    names.submitted_at,
    names.response_id,
    names.name,
    emails.email,
    answers.answer,
    regexp_replace(emails.email, '.*\@'::text, ''::text) AS domain_name
   FROM names
     JOIN emails ON emails.response_id = names.response_id
     JOIN answers ON answers.response_id = names.response_id;