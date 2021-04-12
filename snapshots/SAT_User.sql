{% snapshot SAT_USER %}

{{
    config(
      unique_key='User_Sk',
      strategy='check',
      check_cols=['First_Name', 'Last_Name', 'Password', 'Email'],
      tags=['sattelite'],
    )
}}

select
    MD5(Username)   as User_Sk
    ,Firstname      as First_Name
    ,Lastname       as Last_Name
    ,Email          as Email
    ,Password       as Password
from "STAGING"."users"

{% endsnapshot %}