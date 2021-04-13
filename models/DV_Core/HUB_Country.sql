{{ config(materialized='incremental') }}

select distinct
    MD5(u.Country)  as Country_Sk
    ,u.Country      as Country_Bk
    ,'Web'          as Record_Source
    ,u.LoadId       as Load_Id
from "STAGING"."users" u

{% if is_incremental() %}
where
    not exists (select 1 from "DV_CORE"."HUB_COUNTRY" h where h.Country_Bk = u.Country)
{% endif %}    