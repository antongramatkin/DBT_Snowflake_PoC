{{ config(materialized='incremental') }}

select
    u.MD5(Country) as Country_Sk
    ,u.Country as Country_Bk
    ,"Web" as  Record_Source
    ,u.Load_Id
from STAGING.Users u
where
    not exists (select 1 from DV_Core.HUB_Country h where h.Country_Bk = u.Country)