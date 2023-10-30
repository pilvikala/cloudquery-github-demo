create view typeform_form_cloud_responses_tags as (
select  "_cq_sync_time", submitted_at, response_id, form_id, string_agg(tag,',') as tags from(
	select "_cq_sync_time", submitted_at, response_id, jsonb_array_elements(answers) as value, form_id, jsonb_array_elements_text(tags) as tag from public.typeform_form_responses tfr 
	where form_id = 'MZ0DSN82'
) a group by "_cq_sync_time", submitted_at, response_id, form_id
)