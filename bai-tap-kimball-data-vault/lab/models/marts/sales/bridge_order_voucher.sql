

with fct_order as (
    select *
    from {{ ref('fct_sales') }}
    {# where order_number = 'W0012' #}
), order_voucher as (
    select order_number, voucher_code, sum (discount_amount) as discount
    from {{ ref('stg_shop__order_vouchers') }}
    group by order_number,voucher_code
),
info_discount_per as(
    select *, discount / sum (discount) over(partition by order_number) as weighting_factor
    from order_voucher
)
select distinct  
    fo.order_number, 
    coalesce(v.voucher_key,'-2') as voucher_key, 
    coalesce (discount,0) as voucher_discount_amount, 
    coalesce(weighting_factor,1) weighting_factor
from  fct_order fo
left join info_discount_per ov on fo.order_number = ov.order_number 
left join {{ ref('dim_voucher') }} v on v.voucher_code = ov.voucher_code
{# where fo.order_number = 'W0012' #}










