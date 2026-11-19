{{
    automate_dv.hub(src_pk='CUSTOMER_HK', src_nk='customer_code',
                    src_ldts='LOAD_DATETIME', src_source='RECORD_SOURCE',
                    source_model=['v_stg_crm__customers', 'v_stg_shop__orders', 'v_stg_pos__sales']

                    )
}}
