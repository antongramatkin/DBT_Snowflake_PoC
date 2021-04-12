{{ config(materialized='incremental') }}

select
    u.MD5(Username + Country)   as User_Country_Sk
    ,u.MD5(Username)            as User_Sk
    ,u.MD5(Country)             as Country_Sk
    ,u.Username                 as Username_Bk
    ,u.Country                  as Country_Bk
    ,"Web"              as Record_Source
    ,u.Load_Id          as Load_id
from STAGING.Users u
where
    not exists (select 1 from DV_Core.LNK_User_Country l where l.Username_Bk = u.Username and l.Country_Bk = u.Country)