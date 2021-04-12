{% snapshot SAT_User %}

{{
    config(
      target_database='Airflow-Snowflake-PoC',
      target_schema='DV_Core',
      unique_key='User_Sk',

      strategy='check',
      check_cols=['Firstname', 'Lastname', 'Password', 'Email']
    )
}}

select
    MD5(Username)   as User_Sk
    ,Firstname      as First_Name
    ,Lastname       as Last_Name
    ,Email          as Email
    ,"Password"     as "Password"
from STAGING.Users

{% endsnapshot %}