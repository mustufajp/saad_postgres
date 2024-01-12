with
    customer_list as (
        select  
         customer_email as email,
        concat('81', substring(cast(customer_phone_number as varchar), 2)) as phone_number,
        customer_first_name as fn,
        customer_last_name as ln,
        'jp' as country,
        customer_post_code as zip
        from {{ ref('int_add_addresses_to_user_info') }}
    )



select
   *
from customer_list