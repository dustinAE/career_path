
{{ automate_dv.sat(src_pk='CUSTOMER_HK', src_hashdiff='CUSTOMER_PROFILE_HASHDIFF',
                   src_payload=['full_name', 'email'], src_eff='EFFECTIVE_FROM',
                   src_ldts='LOAD_DATETIME', src_source='RECORD_SOURCE',
                   source_model='v_stg_crm__customers') }}
