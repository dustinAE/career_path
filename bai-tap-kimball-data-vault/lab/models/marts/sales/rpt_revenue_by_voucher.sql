

with bridge_order_voucher as (
    select *
    from {{ ref('bridge_order_voucher') }}
), dim_voucher as (
    select *
    from {{ ref('dim_voucher') }}
), net_amount_info  as (
    select order_number, net_amount
    from {{ ref('fct_sales') }}
)
select  
    dv.voucher_code, dv.voucher_name, 
    count (distinct bv.order_number) as order_count
    ,  sum(net_amount * weighting_factor) weighted_net_amount,
    sum (net_amount) as  impact_net_amount
from bridge_order_voucher bv 
left join dim_voucher dv on bv.voucher_key = dv.voucher_key
left join net_amount_info ni
    on ni.order_number = bv.order_number
group by dv.voucher_code, dv.voucher_name