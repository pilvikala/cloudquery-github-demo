create view hubspot_crm_companies_props as (
with companies_with_revenue as (
	select
		id,
		properties->>'domain' as domain,
		properties->>'country' as country,
		properties->>'industry' as industry,
		properties->>'description' as description,
		properties->>'annualrevenue' as annualRevenue,
		properties->>'numberofemployees' as numberOfEmployees
	from 
		hubspot_crm_companies hcc
	where properties->>'annualrevenue' <> '' and properties->>'annualrevenue' is not null
)
select id,
domain as domain,
country as country,
industry as industry,
description as description, 
CASE when annualrevenue = ''
     then null::bigint
	 WHEN annualrevenue !~ '^(\+|-)?[[:digit:]]+$'
     THEN NULL::bigint
     WHEN annualrevenue::numeric NOT BETWEEN -9223372036854775808 AND 9223372036854775807
     THEN NULL::bigint
     ELSE annualrevenue::bigint
end,
CASE when numberOfEmployees = ''
     then null::bigint
	 WHEN numberOfEmployees !~ '^(\+|-)?[[:digit:]]+$'
     THEN NULL::bigint
     WHEN numberOfEmployees::numeric NOT BETWEEN -9223372036854775808 AND 9223372036854775807
     THEN NULL::bigint
     ELSE numberOfEmployees::bigint
end as numberOfEmployees 
from companies_with_revenue
)
