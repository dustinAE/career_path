

with erp_promotions_info as (
    select *
    from {{ ref('stg_erp__promotions') }} 
), date_info as (
    select *
    from {{ ref('dim_date') }} 
),
product_info as (
    select *
    from {{ ref('dim_product') }}
), promotion_info as (
    select *
    from {{ ref('dim_promotion') }} 
)
select distinct
    d.date_key, dp.product_key , pro.promotion_key 
from erp_promotions_info p
join date_info d 
    on d.full_date between p.start_date and p.end_date
join product_info dp 
    on dp.sku = p.sku 
join promotion_info pro
    on pro.promo_code = p.promo_code

{# select  distinct
    d.date_key, dp.product_key , pro.promotion_key 
from {{ ref('stg_erp__promotions') }} p
join {{ ref('dim_date') }} d 
    on d.full_date between p.start_date and p.end_date
join {{ ref('dim_product') }} dp 
    on p.sku = dp.sku
join {{ ref('dim_promotion') }} pro 
    on pro.promo_code = p.promo_code #}





























































