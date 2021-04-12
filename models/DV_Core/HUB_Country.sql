{{ config(materialized='incremental') }}

select
    MD5(u.Country)  as Country_Sk
    ,u.Country      as Country_Bk
    ,'Web'          as Record_Source
    ,u.LoadId       as Load_Id
from "STAGING"."users" u

{% if is_incremental() %}
where
    not exists (select 1 from "DV_Core"."HUB_Country" h where h.Country_Bk = u.Country)
{% endif %}    