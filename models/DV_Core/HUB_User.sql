{{ config(materialized='incremental') }}

select
    u.MD5(Username)     as User_Sk
    ,u.Username         as User_Bk
    ,"Web"              as Record_Source
    ,u.Load_Id          as Load_id
from STAGING.Users u
where
    not exists (select 1 from DV_Core.HUB_User h where h.Username_Bk = u.Username)