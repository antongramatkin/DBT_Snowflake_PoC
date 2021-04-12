{{ config(materialized='incremental') }}

select
    MD5(u.Username || u.Country)    as User_Country_Sk
    ,MD5(u.Username)                as User_Sk
    ,MD5(u.Country)                 as Country_Sk
    ,u.Username                     as Username_Bk
    ,u.Country                      as Country_Bk
    ,'Web'                          as Record_Source
    ,u.LoadId                       as Load_Id
from "STAGING"."users" u

{% if is_incremental() %}
where
    not exists (select 1 from "DV_Core"."LNK_User_Country" l where l.Username_Bk = u.Username and l.Country_Bk = u.Country)
{% endif %}    