{%- set yaml_metadata -%}

source_model: stg_pos__sales

derived_columns:
  RECORD_SOURCE: "!POS.SALES"              # dấu ! = hằng số chuỗi
  LOAD_DATETIME: _loaded_at
  EFFECTIVE_FROM: "CAST(sale_ts AS TIMESTAMP)"
  order_number: receipt_no
  
hashed_columns:
  ORDER_HK: order_number
  CUSTOMER_HK: customer_code
  PRODUCT_HK: sku
  LINK_ORDER_CUSTOMER_HK: [order_number, customer_code]
  

null_columns:
  optional:          # optional → '-2', required → '-1'; giá trị gốc giữ ở customer_code_ORIGINAL
    - customer_code

{%- endset -%}

{%- set metadata = fromyaml(yaml_metadata) -%}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata['source_model'],
                     derived_columns=metadata['derived_columns'],
                     hashed_columns=metadata['hashed_columns'],
                     null_columns=metadata['null_columns'],
                     ranked_columns=none) }}


                     