
-- ma_sat so CẢ TẬP số của lần nạp mới với tập gần nhất → stage chỉ được có ĐÚNG 1 lần nạp
select *
from {{ ref('stg_crm__customer_phones') }}
where extract_date = (select max(extract_date) from {{ ref('stg_crm__customer_phones') }})