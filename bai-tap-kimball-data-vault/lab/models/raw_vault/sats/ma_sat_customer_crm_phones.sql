

{{ automate_dv.ma_sat(src_pk='CUSTOMER_HK', src_cdk=['phone_type'], src_hashdiff='PHONE_HASHDIFF',
                      src_payload=['phone_number'], src_eff='EFFECTIVE_FROM', src_ldts='LOAD_DATETIME',
                      src_source='RECORD_SOURCE', source_model='v_stg_crm__customer_phones') }}
