-- Gộp dòng đơn của shop + POS thành 1 nguồn duy nhất cho nh_link_order_line
-- (automate_dv.nh_link chỉ nhận 1 source_model).
-- Hai stage đã băm sẵn hash key theo cùng công thức → chỉ cần chọn đúng cột, cùng thứ tự.

{%- set cols = [
    'ORDER_LINE_HK', 'ORDER_HK', 'PRODUCT_HK',
    'line_no', 'quantity', 'unit_price',
    'LOAD_DATETIME', 'RECORD_SOURCE'
] %}

select {{ cols | join(', ') }}
from {{ ref('v_stg_shop__order_lines') }}

union all

select {{ cols | join(', ') }}
from {{ ref('v_stg_pos__sales') }}
