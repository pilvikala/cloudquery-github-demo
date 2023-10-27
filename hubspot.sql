create view hubspot_crm_companies_props as (
select id,
regexp_replace(cast (properties->'domain' as text), '\"', '', 'g') as "domain",
regexp_replace(cast (properties->'country' as text), '\"', '', 'g') as country,
regexp_replace(cast (properties->'industry' as text), '\"', '', 'g') as industry,
regexp_replace(cast (properties->'description' as text), '\"', '', 'g') as description, 
cast(regexp_replace(cast (properties->'annualrevenue' as text), '\"', '', 'g') as int) as annualRevenue, 
cast(regexp_replace(cast (properties->'numberofemployees' as text), '\"', '', 'g') as int) as numberOfEmployees 
from hubspot_crm_companies
)