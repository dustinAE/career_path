{{
    automate_dv.link(
        src_pk='LINK_PRODUCT_CATEGORY_HK',
        src_fk=['PRODUCT_HK', 'CATEGORY_HK'],
        src_ldts='LOAD_DATETIME', src_source='RECORD_SOURCE',
        source_model=['v_stg_erp__products']
    )
}}
