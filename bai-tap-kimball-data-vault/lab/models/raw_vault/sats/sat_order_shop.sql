{{ automate_dv.sat(src_pk='ORDER_HK', src_hashdiff='ORDER_SHOP_HASHDIFF',
                   src_payload=['order_status', 'paid_at', 'cancelled_at'], src_eff='EFFECTIVE_FROM',
                   src_ldts='LOAD_DATETIME', src_source='RECORD_SOURCE',
                   source_model='v_stg_shop__orders') }}
