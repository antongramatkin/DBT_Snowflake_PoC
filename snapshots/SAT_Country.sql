{% snapshot SAT_Country %}

{{
    config(
      target_database='Airflow-Snowflake-PoC',
      target_schema='DV_Core',
      unique_key='Country_Sk',

      strategy='check',
      check_cols=['Country']
    )
}}

select
    MD5(Country)    as Country_Sk
    ,Country        as Country
    ,Load_Id        as Load_Id
from STAGING.Users

{% endsnapshot %}