with names as (
select "_cq_sync_time", submitted_at, response_id, regexp_replace(cast(value->'text' as text), '\"', '', 'g') as name from (
select "_cq_sync_time", submitted_at, response_id, jsonb_array_elements(answers) as value from public.typeform_form_responses tfr 
where form_id = 'MZ0DSN82'
) t1
where (value->'field'->'id')::json::text = '"RJDdgkvvWaie"'
),
emails as (
select response_id, regexp_replace(cast(email->'email' as text), '\"', '', 'g') as email from (
select response_id, jsonb_array_elements(answers) as email from public.typeform_form_responses tfr 
where form_id = 'MZ0DSN82'
) t1
where (email->'field'->'id')::json::text = '"yX1K7oplSHVX"'
),
answers as (
select response_id, regexp_replace(cast(answer->'text' as text), '\"', '', 'g') as answer from (
select response_id, jsonb_array_elements(answers) as answer from public.typeform_form_responses tfr 
where form_id = 'MZ0DSN82'
) t1
where (answer->'field'->'id')::json::text = '"HUnsZKqVPDBH"'
)
select "_cq_sync_time", submitted_at, names.response_id, names.name, emails.email, answers.answer, regexp_replace(emails.email, '.*\@', '') as domain_name  from names
join emails on emails.response_id = names.response_id
join answers on answers.response_id = names.response_id
