{% snapshot SAT_COUNTRY %}

{{
    config(
      unique_key='Country_Sk',

      strategy='check',
      check_cols=['Country'],
      tags=['sattelite'],
    )
}}

select distinct
    MD5(Country)    as Country_Sk
    ,Country        as Country
from "STAGING"."users"

{% endsnapshot %}