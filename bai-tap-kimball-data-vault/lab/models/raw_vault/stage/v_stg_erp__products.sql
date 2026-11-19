{%- set yaml_metadata -%}
source_model: stg_erp__products
derived_columns:
  RECORD_SOURCE: "!ERP.PRODUCTS"
  LOAD_DATETIME: _loaded_at
  EFFECTIVE_FROM: _loaded_at                                     # quy ước ERP
  START_DATE: _loaded_at                                         # cho eff_sat (V5)
  END_DATE: "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)"   # cho eff_sat (V5)
hashed_columns:
  PRODUCT_HK: sku
  CATEGORY_HK: category_code
  LINK_PRODUCT_CATEGORY_HK: [sku, category_code]
  PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns: [product_name, brand, list_price]
{%- endset -%}

{%- set metadata = fromyaml(yaml_metadata) -%}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata['source_model'],
                     derived_columns=metadata['derived_columns'],
                     hashed_columns=metadata['hashed_columns'],
                     ranked_columns=none) }}
