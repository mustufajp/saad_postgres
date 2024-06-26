with 

employee_users as (
    select
        employee_id,
        employee_store_id,
        employee_type,
        employee_status
    from {{ ref('stg_saad_shop__employee_users') }}
),

employee_info as (
    select
        user_id as employee_id,
        user_phone_number as employee_phone_number,
        user_email as employee_email,
        first_name as employee_first_name,
        last_name as employee_last_name,
        gender as employee_gender,
        date_of_birth as employee_date_of_birth,
        user_created_at as employee_created_at,
        user_profile_updated_at as employee_profile_updated_at
    from {{ ref('int_user_profile_joined_to_users') }}
    where user_type !='customer'
),

int_add_info_to_employee as (

    select *
    from employee_users
    left join employee_info using (employee_id)
)

select * from int_add_info_to_employee
