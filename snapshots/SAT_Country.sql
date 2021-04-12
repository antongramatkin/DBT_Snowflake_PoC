{% snapshot SAT_Country %}

{{
    config(
      unique_key='Country_Sk',

      strategy='check',
      check_cols=['Country'],
      tags=['sattelite'],
    )
}}

select
    MD5(Country)    as Country_Sk
    ,Country        as Country
from "STAGING"."users"

{% endsnapshot %}