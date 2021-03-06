{{ config(materialized='incremental') }}

select distinct
    MD5(u.Username)     as User_Sk
    ,u.Username         as Username_Bk
    ,'Web'              as Record_Source
    ,u.LoadId           as Load_id
from "STAGING"."users" u

{% if is_incremental() %}
where
    not exists (select 1 from "DV_CORE"."HUB_USER" h where h.Username_Bk = u.Username)
{% endif %}    