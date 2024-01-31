with 

product as (
    select 
    *
    from {{ ref('int_sales_aggregated_to_product') }}
),
sales as (
    select 
    sales_date,
    transaction_id,
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_category,
    customer_payment_method,
    is_customer_email_verified,
    is_magazine_subscribed,
    is_agree_to_term_of_service,
    customer_gender,
    customer_date_of_birth,
    customer_prefecture,
    customer_combined_address,
    employee_type,
    employee_status,
    employee_first_name,
    employee_last_name,
    store_short_name,
    store_prefecture,
    store_combined_address
    from {{ ref('int_joined_sales_emolyee_customer_store_info') }}
),

customer_analysis_dashboard_aggregated_to_products as (
    select *
    from product
    left join sales 
    using (transaction_id)

)

select *
from customer_analysis_dashboard_aggregated_to_products
