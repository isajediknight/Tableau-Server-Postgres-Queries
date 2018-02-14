# Reconstructed from a pyc file which I previously lost...
# This code was used to create: Custom_SQL/Tableau_Server_Tables_Fields_Joins.sql
# It needs to be cleaned up so it could be run again - however I wanted to atleast commit
# it because I almost lost this work entirely

def run(parameter_file_1, parameter_file_2):
    """
    """
    import sys
    sys.path.insert(0, '..\\class_files\\')
    import datetime
    from cerner_queries import execute_postgres_query
    from cerner_objects import get_nt_column_names
    from cerner_out_files import write_arr_as_one_line
    from cerner_objects import indices
    from cerner_objects import make_any_object_a_string
    from cerner_objects import convert_nt_to_dict_multi_dim
    from cerner_objects import camel_case_two_params_optional_end_id
    from cerner_objects import find_all
    import cerner_objects
    from collections import namedtuple
    right_now = datetime.datetime.now()
    nt_1 = execute_postgres_query(parameter_file_1)
    column_names = get_nt_column_names(nt_1[0])
    write_arr_as_one_line('Postgres_Tables.csv', nt_1, len(column_names), column_names, ',')
    nt_2 = execute_postgres_query(parameter_file_2)
    column_names = get_nt_column_names(nt_2[0])
    write_arr_as_one_line('Postgres_Tables_Columns.csv', nt_2, len(column_names), column_names, ',')
    end_time = datetime.datetime.now()
    time_diff = end_time - right_now
    print('Done in: ' + str(time_diff.seconds) + ' seconds\n', end = '')
    values = 'table joins_to key_1 key_2 where'
    nt_joins = namedtuple('Postgress_DB_Joins', values)
    alias = { }
    alias['_background_tasks'] = { }
    alias['_comments'] = { }
    alias['_customized_views'] = { }
    alias['_datasources'] = { }
    alias['_datasources_stats'] = { }
    alias['_groups'] = { }
    alias['_http_requests'] = { }
    alias['_projects'] = { }
    alias['_schedules'] = { }
    alias['_sessions'] = { }
    alias['_sites'] = { }
    alias['_subscriptions'] = { }
    alias['_system_users'] = { }
    alias['_tags'] = { }
    alias['_users'] = { }
    alias['_views'] = { }
    alias['_views_stats'] = { }
    alias['_workbooks'] = { }
    alias['administrable_role_authorizations'] = { }
    alias['applicable_roles'] = { }
    alias['asset_key_marker'] = { }
    alias['asset_key_meta_data'] = { }
    alias['asset_list_items'] = { }
    alias['asset_lists'] = { }
    alias['async_jobs'] = { }
    alias['attributes'] = { }
    alias['auto_saves'] = { }
    alias['background_jobs'] = { }
    alias['big_texts'] = { }
    alias['capabilities'] = { }
    alias['capability_roles'] = { }
    alias['character_sets'] = { }
    alias['check_constraint_routine_usage'] = { }
    alias['check_constraints'] = { }
    alias['collation_character_set_applicability'] = { }
    alias['collations'] = { }
    alias['column_domain_usage'] = { }
    alias['column_options'] = { }
    alias['column_privileges'] = { }
    alias['column_udt_usage'] = { }
    alias['columns'] = { }
    alias['comments'] = { }
    alias['constraint_column_usage'] = { }
    alias['constraint_table_usage'] = { }
    alias['core_licenses'] = { }
    alias['customized_views'] = { }
    alias['data_alerts'] = { }
    alias['data_alerts_recipients'] = { }
    alias['data_connections'] = { }
    alias['data_type_privileges'] = { }
    alias['dataengine_configurations'] = { }
    alias['datasource_metrics_aggregations'] = { }
    alias['datasource_refresh_properties'] = { }
    alias['datasource_versions'] = { }
    alias['datasources'] = { }
    alias['deleted_objects'] = { }
    alias['desktop_reporting'] = { }
    alias['domain_constraints'] = { }
    alias['domain_udt_usage'] = { }
    alias['domains'] = { }
    alias['element_types'] = { }
    alias['enabled_roles'] = { }
    alias['exportable_repository_id_columns'] = { }
    alias['exportable_tables'] = { }
    alias['exportable_tables_column_transformations'] = { }
    alias['exportable_types'] = { }
    alias['extract_sessions'] = { }
    alias['extracts'] = { }
    alias['file_uploads'] = { }
    alias['foreign_data_wrapper_options'] = { }
    alias['foreign_data_wrappers'] = { }
    alias['foreign_server_options'] = { }
    alias['foreign_servers'] = { }
    alias['foreign_table_options'] = { }
    alias['foreign_tables'] = { }
    alias['global_settings'] = { }
    alias['group_users'] = { }
    alias['groups'] = { }
    alias['hist_capabilities'] = { }
    alias['hist_comments'] = { }
    alias['hist_configs'] = { }
    alias['hist_data_connections'] = { }
    alias['hist_datasources'] = { }
    alias['hist_groups'] = { }
    alias['hist_licensing_roles'] = { }
    alias['hist_projects'] = { }
    alias['hist_schedules'] = { }
    alias['hist_sites'] = { }
    alias['hist_tags'] = { }
    alias['hist_tasks'] = { }
    alias['hist_users'] = { }
    alias['hist_views'] = { }
    alias['hist_workbooks'] = { }
    alias['historical_disk_usage'] = { }
    alias['historical_event_types'] = { }
    alias['historical_events'] = { }
    alias['http_requests'] = { }
    alias['import_mappable_table_implicit_fks'] = { }
    alias['import_mappable_tables'] = { }
    alias['import_mapping_excluded_schedules'] = { }
    alias['import_mapping_excluded_system_users'] = { }
    alias['importable_table_implicit_fks'] = { }
    alias['importable_tables'] = { }
    alias['information_schema_catalog_name'] = { }
    alias['key_column_usage'] = { }
    alias['keychain_entries'] = { }
    alias['keychain_entry_usage'] = { }
    alias['language_prefs'] = { }
    alias['licensing_roles'] = { }
    alias['local_names'] = { }
    alias['managed_keychains'] = { }
    alias['metrics_data'] = { }
    alias['mobile_enrollments'] = { }
    alias['monitoring_dataengine'] = { }
    alias['monitoring_postgresql'] = { }
    alias['most_recent_refreshes'] = { }
    alias['mru_list_entries'] = { }
    alias['mru_lists'] = { }
    alias['named_resources'] = { }
    alias['next_gen_permissions'] = { }
    alias['oauth_request_tokens'] = { }
    alias['parameters'] = { }
    alias['password_tokens'] = { }
    alias['pending_search_updates'] = { }
    alias['permission_reasons'] = { }
    alias['permissions_templates'] = { }
    alias['pg_aggregate'] = { }
    alias['pg_am'] = { }
    alias['pg_amop'] = { }
    alias['pg_amproc'] = { }
    alias['pg_attrdef'] = { }
    alias['pg_attribute'] = { }
    alias['pg_auth_members'] = { }
    alias['pg_available_extension_versions'] = { }
    alias['pg_available_extensions'] = { }
    alias['pg_cast'] = { }
    alias['pg_class'] = { }
    alias['pg_collation'] = { }
    alias['pg_constraint'] = { }
    alias['pg_conversion'] = { }
    alias['pg_cursors'] = { }
    alias['pg_database'] = { }
    alias['pg_db_role_setting'] = { }
    alias['pg_default_acl'] = { }
    alias['pg_depend'] = { }
    alias['pg_description'] = { }
    alias['pg_enum'] = { }
    alias['pg_event_trigger'] = { }
    alias['pg_extension'] = { }
    alias['pg_foreign_data_wrapper'] = { }
    alias['pg_foreign_server'] = { }
    alias['pg_foreign_table'] = { }
    alias['pg_group'] = { }
    alias['pg_index'] = { }
    alias['pg_indexes'] = { }
    alias['pg_inherits'] = { }
    alias['pg_language'] = { }
    alias['pg_largeobject_metadata'] = { }
    alias['pg_locks'] = { }
    alias['pg_matviews'] = { }
    alias['pg_namespace'] = { }
    alias['pg_opclass'] = { }
    alias['pg_operator'] = { }
    alias['pg_opfamily'] = { }
    alias['pg_pltemplate'] = { }
    alias['pg_policies'] = { }
    alias['pg_policy'] = { }
    alias['pg_prepared_statements'] = { }
    alias['pg_prepared_xacts'] = { }
    alias['pg_proc'] = { }
    alias['pg_range'] = { }
    alias['pg_replication_origin'] = { }
    alias['pg_replication_slots'] = { }
    alias['pg_rewrite'] = { }
    alias['pg_roles'] = { }
    alias['pg_rules'] = { }
    alias['pg_seclabel'] = { }
    alias['pg_seclabels'] = { }
    alias['pg_settings'] = { }
    alias['pg_shdepend'] = { }
    alias['pg_shdescription'] = { }
    alias['pg_shseclabel'] = { }
    alias['pg_stat_activity'] = { }
    alias['pg_stat_all_indexes'] = { }
    alias['pg_stat_all_tables'] = { }
    alias['pg_stat_archiver'] = { }
    alias['pg_stat_bgwriter'] = { }
    alias['pg_stat_database'] = { }
    alias['pg_stat_database_conflicts'] = { }
    alias['pg_stat_replication'] = { }
    alias['pg_stat_ssl'] = { }
    alias['pg_stat_sys_indexes'] = { }
    alias['pg_stat_sys_tables'] = { }
    alias['pg_stat_user_functions'] = { }
    alias['pg_stat_user_indexes'] = { }
    alias['pg_stat_user_tables'] = { }
    alias['pg_stat_xact_all_tables'] = { }
    alias['pg_stat_xact_sys_tables'] = { }
    alias['pg_stat_xact_user_functions'] = { }
    alias['pg_stat_xact_user_tables'] = { }
    alias['pg_statio_all_indexes'] = { }
    alias['pg_statio_all_sequences'] = { }
    alias['pg_statio_all_tables'] = { }
    alias['pg_statio_sys_indexes'] = { }
    alias['pg_statio_sys_sequences'] = { }
    alias['pg_statio_sys_tables'] = { }
    alias['pg_statio_user_indexes'] = { }
    alias['pg_statio_user_sequences'] = { }
    alias['pg_statio_user_tables'] = { }
    alias['pg_stats'] = { }
    alias['pg_tables'] = { }
    alias['pg_tablespace'] = { }
    alias['pg_timezone_abbrevs'] = { }
    alias['pg_timezone_names'] = { }
    alias['pg_transform'] = { }
    alias['pg_trigger'] = { }
    alias['pg_ts_config'] = { }
    alias['pg_ts_config_map'] = { }
    alias['pg_ts_dict'] = { }
    alias['pg_ts_parser'] = { }
    alias['pg_ts_template'] = { }
    alias['pg_type'] = { }
    alias['pg_user'] = { }
    alias['pg_user_mappings'] = { }
    alias['pg_views'] = { }
    alias['postgres_heartbeat'] = { }
    alias['projects'] = { }
    alias['projects_view_option_rights'] = { }
    alias['projects_view_options'] = { }
    alias['referential_constraints'] = { }
    alias['refresh_token_devices'] = { }
    alias['refresh_tokens'] = { }
    alias['remote_agents'] = { }
    alias['repository_data'] = { }
    alias['role_column_grants'] = { }
    alias['role_routine_grants'] = { }
    alias['role_table_grants'] = { }
    alias['role_udt_grants'] = { }
    alias['role_usage_grants'] = { }
    alias['roles'] = { }
    alias['routine_privileges'] = { }
    alias['routines'] = { }
    alias['schedules'] = { }
    alias['schema_migrations'] = { }
    alias['schemata'] = { }
    alias['sequences'] = { }
    alias['serial_collections'] = { }
    alias['sessions'] = { }
    alias['settings'] = { }
    alias['shared_views'] = { }
    alias['sheet_images'] = { }
    alias['site_logos'] = { }
    alias['site_oidc_configurations'] = { }
    alias['site_saml_configurations'] = { }
    alias['site_saml_events'] = { }
    alias['site_saml_sessions'] = { }
    alias['site_saml_users'] = { }
    alias['site_user_prefs'] = { }
    alias['sites'] = { }
    alias['sql_features'] = { }
    alias['sql_implementation_info'] = { }
    alias['sql_languages'] = { }
    alias['sql_packages'] = { }
    alias['sql_sizing'] = { }
    alias['sql_sizing_profiles'] = { }
    alias['startup_infos'] = { }
    alias['subscriptions'] = { }
    alias['subscriptions_customized_views'] = { }
    alias['subscriptions_views'] = { }
    alias['subscriptions_workbooks'] = { }
    alias['system_users'] = { }
    alias['table_constraints'] = { }
    alias['table_privileges'] = { }
    alias['table_revisions'] = { }
    alias['tables'] = { }
    alias['taggings'] = { }
    alias['tags'] = { }
    alias['tasks'] = { }
    alias['triggered_update_columns'] = { }
    alias['triggers'] = { }
    alias['trusted_tickets'] = { }
    alias['udt_privileges'] = { }
    alias['usage_privileges'] = { }
    alias['user_default_customized_views'] = { }
    alias['user_defined_types'] = { }
    alias['user_images'] = { }
    alias['user_mapping_options'] = { }
    alias['user_mappings'] = { }
    alias['user_prefs'] = { }
    alias['users'] = { }
    alias['users_view'] = { }
    alias['view_column_usage'] = { }
    alias['view_metrics_aggregations'] = { }
    alias['view_option_keys'] = { }
    alias['view_routine_usage'] = { }
    alias['view_table_usage'] = { }
    alias['views'] = { }
    alias['views_stats'] = { }
    alias['workbook_checksums'] = { }
    alias['workbook_versions'] = { }
    alias['workbooks'] = { }
    alias['workbooks_view_options'] = { }
    alias['_background_tasks']['SELECT'] = '(_BG Tasks)'
    alias['_comments']['SELECT'] = '(_Comments)'
    alias['_customized_views']['SELECT'] = '(_Cust VW)'
    alias['_datasources']['SELECT'] = '(_DS)'
    alias['_datasources_stats']['SELECT'] = '(_DS Stats)'
    alias['_groups']['SELECT'] = '(_Groups)'
    alias['_http_requests']['SELECT'] = '(_Usage)'
    alias['_projects']['SELECT'] = '(_Projects)'
    alias['_schedules']['SELECT'] = '(_Sched)'
    alias['_sessions']['SELECT'] = '(_Sess)'
    alias['_sites']['SELECT'] = '(_Sites)'
    alias['_subscriptions']['SELECT'] = '(_Subscr)'
    alias['_system_users']['SELECT'] = '(_Sys Users)'
    alias['_tags']['SELECT'] = '(_Tags)'
    alias['_users']['SELECT'] = '(_Users)'
    alias['_views']['SELECT'] = '(_VW)'
    alias['_views_stats']['SELECT'] = '(_VW Stats)'
    alias['_workbooks']['SELECT'] = '(_WB)'
    alias['administrable_role_authorizations']['SELECT'] = '(Admin Role Auth)'
    alias['applicable_roles']['SELECT'] = '(App Roles)'
    alias['asset_key_marker']['SELECT'] = '(Asset Key Marker)'
    alias['asset_key_meta_data']['SELECT'] = '(Asset Key Meta)'
    alias['asset_list_items']['SELECT'] = '(Asset List Items)'
    alias['asset_lists']['SELECT'] = '(Asset Lists)'
    alias['async_jobs']['SELECT'] = '(Async Jobs)'
    alias['attributes']['SELECT'] = '(Attrs)'
    alias['auto_saves']['SELECT'] = '(Auto Save)'
    alias['background_jobs']['SELECT'] = '(BG Jobs)'
    alias['big_texts']['SELECT'] = '(Big Text)'
    alias['capabilities']['SELECT'] = '(Cap)'
    alias['capability_roles']['SELECT'] = '(Cap Roles)'
    alias['character_sets']['SELECT'] = '(Char Sets)'
    alias['check_constraint_routine_usage']['SELECT'] = '(Check Constr Routine Usage)'
    alias['check_constraints']['SELECT'] = '(Check Constr)'
    alias['collation_character_set_applicability']['SELECT'] = '(Coll Char Set App)'
    alias['collations']['SELECT'] = '(Coll)'
    alias['column_domain_usage']['SELECT'] = '(Col Domain Usage)'
    alias['column_options']['SELECT'] = '(Col Options)'
    alias['column_privileges']['SELECT'] = '(Col Privs)'
    alias['column_udt_usage']['SELECT'] = '(Col UDT Usage)'
    alias['columns']['SELECT'] = '(Cols)'
    alias['comments']['SELECT'] = '(Comments)'
    alias['constraint_column_usage']['SELECT'] = '(Constr Col Usage)'
    alias['constraint_table_usage']['SELECT'] = '(Constr TBL Usage)'
    alias['core_licenses']['SELECT'] = '(Core Lic)'
    alias['customized_views']['SELECT'] = '(Cust VW)'
    alias['data_alerts']['SELECT'] = '(Data Alerts)'
    alias['data_alerts_recipients']['SELECT'] = '(Data Alert Recip)'
    alias['data_connections']['SELECT'] = '(Data Conns)'
    alias['data_type_privileges']['SELECT'] = '(DT Privs)'
    alias['dataengine_configurations']['SELECT'] = '(DE Config)'
    alias['datasource_metrics_aggregations']['SELECT'] = '(DS Metric Agg)'
    alias['datasource_refresh_properties']['SELECT'] = '(DS Ref Prop)'
    alias['datasource_versions']['SELECT'] = '(DS Ver)'
    alias['datasources']['SELECT'] = '(DS)'
    alias['deleted_objects']['SELECT'] = '(Del Object)'
    alias['desktop_reporting']['SELECT'] = '(Desktop Rep)'
    alias['domain_constraints']['SELECT'] = '(Domain Constr)'
    alias['domain_udt_usage']['SELECT'] = '(Domain UDT Usage)'
    alias['domains']['SELECT'] = '(Domains)'
    alias['element_types']['SELECT'] = '(Ele Types)'
    alias['enabled_roles']['SELECT'] = '(Enabled Roles)'
    alias['exportable_repository_id_columns']['SELECT'] = '(Exp Rep ID Cols)'
    alias['exportable_tables']['SELECT'] = '(Exp TBL)'
    alias['exportable_tables_column_transformations']['SELECT'] = '(Exp TBL Col trans)'
    alias['exportable_types']['SELECT'] = '(Exp Types)'
    alias['extract_sessions']['SELECT'] = '(Extract Sess)'
    alias['extracts']['SELECT'] = '(Extracts)'
    alias['file_uploads']['SELECT'] = '(File UPL)'
    alias['foreign_data_wrapper_options']['SELECT'] = '(Foreign Data Wrap Opt)'
    alias['foreign_data_wrappers']['SELECT'] = '(Foreign Data Wrap)'
    alias['foreign_server_options']['SELECT'] = '(Foreign Server Opt)'
    alias['foreign_servers']['SELECT'] = '(Foriegn Servers)'
    alias['foreign_table_options']['SELECT'] = '(Foreign TBL Opt)'
    alias['foreign_tables']['SELECT'] = '(Foreign TBL)'
    alias['global_settings']['SELECT'] = '(Global Set)'
    alias['group_users']['SELECT'] = '(Group Users)'
    alias['groups']['SELECT'] = '(Groups)'
    alias['hist_capabilities']['SELECT'] = '(Hist Cap)'
    alias['hist_comments']['SELECT'] = '(Hist Comments)'
    alias['hist_configs']['SELECT'] = '(Hist Configs)'
    alias['hist_data_connections']['SELECT'] = '(Hist Data Conns)'
    alias['hist_datasources']['SELECT'] = '(Hist DS)'
    alias['hist_groups']['SELECT'] = '(Hist Groups)'
    alias['hist_licensing_roles']['SELECT'] = '(Hist Lic Roles)'
    alias['hist_projects']['SELECT'] = '(Hist Projects)'
    alias['hist_schedules']['SELECT'] = '(Hist Sched)'
    alias['hist_sites']['SELECT'] = '(Hist Sites)'
    alias['hist_tags']['SELECT'] = '(Hist Tags)'
    alias['hist_tasks']['SELECT'] = '(Hist Tasks)'
    alias['hist_users']['SELECT'] = '(Hist Users)'
    alias['hist_views']['SELECT'] = '(Hist VW)'
    alias['hist_workbooks']['SELECT'] = '(Hist WB)'
    alias['historical_disk_usage']['SELECT'] = '(Hist Disk Use)'
    alias['historical_event_types']['SELECT'] = '(Hist Event Types)'
    alias['historical_events']['SELECT'] = '(Hist Events)'
    alias['http_requests']['SELECT'] = '(Usage)'
    alias['import_mappable_table_implicit_fks']['SELECT'] = '(Imp Map TBL Imp)'
    alias['import_mappable_tables']['SELECT'] = '(Imp Map TBL)'
    alias['import_mapping_excluded_schedules']['SELECT'] = '(Imp Map Excl Sched)'
    alias['import_mapping_excluded_system_users']['SELECT'] = '(Imp Map Excl Sys Users)'
    alias['importable_table_implicit_fks']['SELECT'] = '(Imp TBL Imp)'
    alias['importable_tables']['SELECT'] = '(Imp TBL)'
    alias['information_schema_catalog_name']['SELECT'] = '(Inform Schema Cat Name)'
    alias['key_column_usage']['SELECT'] = '(Key Col Usage)'
    alias['keychain_entries']['SELECT'] = '(Keychain Entries)'
    alias['keychain_entry_usage']['SELECT'] = '(Keychain Entries Usage)'
    alias['language_prefs']['SELECT'] = '(Lang Prefs)'
    alias['licensing_roles']['SELECT'] = '(Lic Role)'
    alias['local_names']['SELECT'] = '(Local Names)'
    alias['managed_keychains']['SELECT'] = '(Managed Keychains)'
    alias['metrics_data']['SELECT'] = '(Metric Data)'
    alias['mobile_enrollments']['SELECT'] = '(Mobile Enr)'
    alias['monitoring_dataengine']['SELECT'] = '(Mon DE)'
    alias['monitoring_postgresql']['SELECT'] = '(Mon PSQL)'
    alias['most_recent_refreshes']['SELECT'] = '(Most Recent Refr)'
    alias['mru_list_entries']['SELECT'] = '(MRU List Entries)'
    alias['mru_lists']['SELECT'] = '(MRU List)'
    alias['named_resources']['SELECT'] = '(Names Res)'
    alias['next_gen_permissions']['SELECT'] = '(Next Gen Perm)'
    alias['oauth_request_tokens']['SELECT'] = '(OAuth Req Tokens)'
    alias['parameters']['SELECT'] = '(Params)'
    alias['password_tokens']['SELECT'] = '(Pass Tokens)'
    alias['pending_search_updates']['SELECT'] = '(Pend Search UPD)'
    alias['permission_reasons']['SELECT'] = '(Perm Reasons)'
    alias['permissions_templates']['SELECT'] = '(Perm Templ)'
    alias['pg_aggregate']['SELECT'] = '(PG Aggr)'
    alias['pg_am']['SELECT'] = '(PG AM)'
    alias['pg_amop']['SELECT'] = '(PG Amop)'
    alias['pg_amproc']['SELECT'] = '(PG Amproc)'
    alias['pg_attrdef']['SELECT'] = '(PG Attr Def)'
    alias['pg_attribute']['SELECT'] = '(PG Attr)'
    alias['pg_auth_members']['SELECT'] = '(PG Auth Members)'
    alias['pg_available_extension_versions']['SELECT'] = '(PG Avail Ext Ver)'
    alias['pg_available_extensions']['SELECT'] = '(PG Avail Ext)'
    alias['pg_cast']['SELECT'] = '(PG Cast)'
    alias['pg_class']['SELECT'] = '(PG Class)'
    alias['pg_collation']['SELECT'] = '(PG Coll)'
    alias['pg_constraint']['SELECT'] = '(PG Constr)'
    alias['pg_conversion']['SELECT'] = '(PG Conv)'
    alias['pg_cursors']['SELECT'] = '(PG Cursor)'
    alias['pg_database']['SELECT'] = '(PG DB)'
    alias['pg_db_role_setting']['SELECT'] = '(PG DB Role Setting)'
    alias['pg_default_acl']['SELECT'] = '(PG Default ACL)'
    alias['pg_depend']['SELECT'] = '(PG Depend)'
    alias['pg_description']['SELECT'] = '(PG Descr)'
    alias['pg_enum']['SELECT'] = '(PG Enum)'
    alias['pg_event_trigger']['SELECT'] = '(PG Event Trigger)'
    alias['pg_extension']['SELECT'] = '(PG Ext)'
    alias['pg_foreign_data_wrapper']['SELECT'] = '(PG Foreign Data Wrap)'
    alias['pg_foreign_server']['SELECT'] = '(PG Foreign Server)'
    alias['pg_foreign_table']['SELECT'] = '(PG Foreign TBL)'
    alias['pg_group']['SELECT'] = '(PG Group)'
    alias['pg_index']['SELECT'] = '(PG IDX)'
    alias['pg_indexes']['SELECT'] = '(PG IDXs)'
    alias['pg_inherits']['SELECT'] = '(PG)'
    alias['pg_language']['SELECT'] = '(PG Lang)'
    alias['pg_largeobject_metadata']['SELECT'] = '(PG Large Object)'
    alias['pg_locks']['SELECT'] = '(PG Locks)'
    alias['pg_matviews']['SELECT'] = '(PG Mat VW)'
    alias['pg_namespace']['SELECT'] = '(PG Namespace)'
    alias['pg_opclass']['SELECT'] = '(PG OP Class)'
    alias['pg_operator']['SELECT'] = '(PG Opr)'
    alias['pg_opfamily']['SELECT'] = '(PG OP Family)'
    alias['pg_pltemplate']['SELECT'] = '(PG Pl Templ)'
    alias['pg_policies']['SELECT'] = '(PG Policies)'
    alias['pg_policy']['SELECT'] = '(PG Policy)'
    alias['pg_prepared_statements']['SELECT'] = '(PG Prep Statements)'
    alias['pg_prepared_xacts']['SELECT'] = '(PG Prep Xacts)'
    alias['pg_proc']['SELECT'] = '(PG Proc)'
    alias['pg_range']['SELECT'] = '(PG Range)'
    alias['pg_replication_origin']['SELECT'] = '(PG Repl Origin)'
    alias['pg_replication_slots']['SELECT'] = '(PG Repl Slots)'
    alias['pg_rewrite']['SELECT'] = '(PG Rewrite)'
    alias['pg_roles']['SELECT'] = '(PG Roles)'
    alias['pg_rules']['SELECT'] = '(PG Rules)'
    alias['pg_seclabel']['SELECT'] = '(PG Seclabel)'
    alias['pg_seclabels']['SELECT'] = '(PG Seclabels)'
    alias['pg_settings']['SELECT'] = '(PG Settings)'
    alias['pg_shdepend']['SELECT'] = '(PG Shdepend)'
    alias['pg_shdescription']['SELECT'] = '(PG SH Descr)'
    alias['pg_shseclabel']['SELECT'] = '(PG SH SecLabel)'
    alias['pg_stat_activity']['SELECT'] = '(PG Stat Act)'
    alias['pg_stat_all_indexes']['SELECT'] = '(PG Stat All IDX)'
    alias['pg_stat_all_tables']['SELECT'] = '(PG Stat All TBL)'
    alias['pg_stat_archiver']['SELECT'] = '(PG Stat Arch)'
    alias['pg_stat_bgwriter']['SELECT'] = '(PG Stat BG Writer)'
    alias['pg_stat_database']['SELECT'] = '(PG Stat DB)'
    alias['pg_stat_database_conflicts']['SELECT'] = '(PG Stat DB Conflicts)'
    alias['pg_stat_replication']['SELECT'] = '(PG Stat Repl)'
    alias['pg_stat_ssl']['SELECT'] = '(PG Stat SSL)'
    alias['pg_stat_sys_indexes']['SELECT'] = '(PG Stat Sys IDX)'
    alias['pg_stat_sys_tables']['SELECT'] = '(PG Stat Sys TBL)'
    alias['pg_stat_user_functions']['SELECT'] = '(PG Stat User Funct)'
    alias['pg_stat_user_indexes']['SELECT'] = '(PG Stat User IDX)'
    alias['pg_stat_user_tables']['SELECT'] = '(PG Stat User TBL)'
    alias['pg_stat_xact_all_tables']['SELECT'] = '(PG Stat xAct All TBL)'
    alias['pg_stat_xact_sys_tables']['SELECT'] = '(PG Stat xAct User Func)'
    alias['pg_stat_xact_user_functions']['SELECT'] = '(PG Stat xAct User Func)'
    alias['pg_stat_xact_user_tables']['SELECT'] = '(PG Stat xAct User TBL)'
    alias['pg_statio_all_indexes']['SELECT'] = '(PG Statio All IDX)'
    alias['pg_statio_all_sequences']['SELECT'] = '(PG Statio All Seq)'
    alias['pg_statio_all_tables']['SELECT'] = '(PG Statio All TBL)'
    alias['pg_statio_sys_indexes']['SELECT'] = '(PG Statio Sys IDX)'
    alias['pg_statio_sys_sequences']['SELECT'] = '(PG Statio Sys Seq)'
    alias['pg_statio_sys_tables']['SELECT'] = '(PG Statio Sys TBL)'
    alias['pg_statio_user_indexes']['SELECT'] = '(PG Statio User IDX)'
    alias['pg_statio_user_sequences']['SELECT'] = '(PG Statio User Seq)'
    alias['pg_statio_user_tables']['SELECT'] = '(PG Statio User TBL)'
    alias['pg_stats']['SELECT'] = '(PG Stats)'
    alias['pg_tables']['SELECT'] = '(PG TBL)'
    alias['pg_tablespace']['SELECT'] = '(PG TBL Space)'
    alias['pg_timezone_abbrevs']['SELECT'] = '(PG Timezone Abbr)'
    alias['pg_timezone_names']['SELECT'] = '(PG Timezone Names)'
    alias['pg_transform']['SELECT'] = '(PG Transform)'
    alias['pg_trigger']['SELECT'] = '(PG Trigger)'
    alias['pg_ts_config']['SELECT'] = '(PG TS Config)'
    alias['pg_ts_config_map']['SELECT'] = '(PG TS Config Map)'
    alias['pg_ts_dict']['SELECT'] = '(PG TS Dict)'
    alias['pg_ts_parser']['SELECT'] = '(PG TS Parser)'
    alias['pg_ts_template']['SELECT'] = '(PG TS Templ)'
    alias['pg_type']['SELECT'] = '(PG Type)'
    alias['pg_user']['SELECT'] = '(PG User)'
    alias['pg_user_mappings']['SELECT'] = '(PG User Mappings)'
    alias['pg_views']['SELECT'] = '(PG VW)'
    alias['postgres_heartbeat']['SELECT'] = '(PSQL Heartbeat)'
    alias['projects']['SELECT'] = '(Projects)'
    alias['projects_view_option_rights']['SELECT'] = '(Projects VW Opt Rights)'
    alias['projects_view_options']['SELECT'] = '(Projects VW Opt)'
    alias['referential_constraints']['SELECT'] = '(Ref Contsr)'
    alias['refresh_token_devices']['SELECT'] = '(Ref Token Devs)'
    alias['refresh_tokens']['SELECT'] = '(Ref Tokens)'
    alias['remote_agents']['SELECT'] = '(Remote Agents)'
    alias['repository_data']['SELECT'] = '(Repo Data)'
    alias['role_column_grants']['SELECT'] = '(Role Col Grants)'
    alias['role_routine_grants']['SELECT'] = '(Role Routine Grants)'
    alias['role_table_grants']['SELECT'] = '(Role TBL Grants)'
    alias['role_udt_grants']['SELECT'] = '(ROLE UDT Grants)'
    alias['role_usage_grants']['SELECT'] = '(Role Usage Grants)'
    alias['roles']['SELECT'] = '(Roles)'
    alias['routine_privileges']['SELECT'] = '(Routine Privs)'
    alias['routines']['SELECT'] = '(Routines)'
    alias['schedules']['SELECT'] = '(Schedules)'
    alias['schema_migrations']['SELECT'] = '(Schema Migrations)'
    alias['schemata']['SELECT'] = '(Schemata)'
    alias['sequences']['SELECT'] = '(Seq)'
    alias['serial_collections']['SELECT'] = '(Serial Collections)'
    alias['sessions']['SELECT'] = '(Sess)'
    alias['settings']['SELECT'] = '(Settings)'
    alias['shared_views']['SELECT'] = '(Shared VW)'
    alias['sheet_images']['SELECT'] = '(Sheet IMG)'
    alias['site_logos']['SELECT'] = '(Site Logos)'
    alias['site_oidc_configurations']['SELECT'] = '(Site OIDC Config)'
    alias['site_saml_configurations']['SELECT'] = '(Site Saml Config)'
    alias['site_saml_events']['SELECT'] = '(Site Saml Events)'
    alias['site_saml_sessions']['SELECT'] = '(Site Saml Sess)'
    alias['site_saml_users']['SELECT'] = '(Site Saml Users)'
    alias['site_user_prefs']['SELECT'] = '(Site User Prefs)'
    alias['sites']['SELECT'] = '(Sites)'
    alias['sql_features']['SELECT'] = '(SQL Features)'
    alias['sql_implementation_info']['SELECT'] = '(SQL Impl Info)'
    alias['sql_languages']['SELECT'] = '(SQL Lang)'
    alias['sql_packages']['SELECT'] = '(SQL Packages)'
    alias['sql_sizing']['SELECT'] = '(SQL Sizing)'
    alias['sql_sizing_profiles']['SELECT'] = '(SQL Sizing Prof)'
    alias['startup_infos']['SELECT'] = '(Startup Info)'
    alias['subscriptions']['SELECT'] = '(Subscr)'
    alias['subscriptions_customized_views']['SELECT'] = '(Subscr Cust VW)'
    alias['subscriptions_views']['SELECT'] = '(Subscr VW)'
    alias['subscriptions_workbooks']['SELECT'] = '(Subscr WB)'
    alias['system_users']['SELECT'] = '(Sys Users)'
    alias['table_constraints']['SELECT'] = '(TBL Conts)'
    alias['table_privileges']['SELECT'] = '(TBL Privs)'
    alias['table_revisions']['SELECT'] = '(TBL Revs)'
    alias['tables']['SELECT'] = '(Tables)'
    alias['taggings']['SELECT'] = '(Taggings)'
    alias['tags']['SELECT'] = '(Tags)'
    alias['tasks']['SELECT'] = '(Tasks)'
    alias['triggered_update_columns']['SELECT'] = '(Trig UPD Col)'
    alias['triggers']['SELECT'] = '(Triggers)'
    alias['trusted_tickets']['SELECT'] = '(Trusted Tickets)'
    alias['udt_privileges']['SELECT'] = '(UDT Privs)'
    alias['usage_privileges']['SELECT'] = '(Usage Privs)'
    alias['user_default_customized_views']['SELECT'] = '(User Def Cust VW)'
    alias['user_defined_types']['SELECT'] = '(User Def Types)'
    alias['user_images']['SELECT'] = '(User IMG)'
    alias['user_mapping_options']['SELECT'] = '(User Map Opt)'
    alias['user_mappings']['SELECT'] = '(User Mappings)'
    alias['user_prefs']['SELECT'] = '(User Prefs)'
    alias['users']['SELECT'] = '(Users)'
    alias['users_view']['SELECT'] = '(Users VW)'
    alias['view_column_usage']['SELECT'] = '(VW Col Usage)'
    alias['view_metrics_aggregations']['SELECT'] = '(VW MEtric Aggr)'
    alias['view_option_keys']['SELECT'] = '(VW Opt Keys)'
    alias['view_routine_usage']['SELECT'] = '(VW Route Usage)'
    alias['view_table_usage']['SELECT'] = '(VW TBL Usage)'
    alias['views']['SELECT'] = '(Views)'
    alias['views_stats']['SELECT'] = '(VW Stats)'
    alias['workbook_checksums']['SELECT'] = '(WB Checksums)'
    alias['workbook_versions']['SELECT'] = '(WB Versions)'
    alias['workbooks']['SELECT'] = '(WB)'
    alias['workbooks_view_options']['SELECT'] = '(WB View Opt)'
    alias['_background_tasks']['alias'] = 1
    alias['_comments']['alias'] = 2
    alias['_customized_views']['alias'] = 3
    alias['_datasources']['alias'] = 4
    alias['_datasources_stats']['alias'] = 5
    alias['_groups']['alias'] = 6
    alias['_http_requests']['alias'] = 7
    alias['_projects']['alias'] = 8
    alias['_schedules']['alias'] = 9
    alias['_sessions']['alias'] = 10
    alias['_sites']['alias'] = 11
    alias['_subscriptions']['alias'] = 12
    alias['_system_users']['alias'] = 13
    alias['_tags']['alias'] = 14
    alias['_users']['alias'] = 15
    alias['_views']['alias'] = 16
    alias['_views_stats']['alias'] = 17
    alias['_workbooks']['alias'] = 18
    alias['administrable_role_authorizations']['alias'] = 19
    alias['applicable_roles']['alias'] = 20
    alias['asset_key_marker']['alias'] = 21
    alias['asset_key_meta_data']['alias'] = 22
    alias['asset_list_items']['alias'] = 23
    alias['asset_lists']['alias'] = 24
    alias['async_jobs']['alias'] = 25
    alias['attributes']['alias'] = 26
    alias['auto_saves']['alias'] = 27
    alias['background_jobs']['alias'] = 28
    alias['big_texts']['alias'] = 29
    alias['capabilities']['alias'] = 30
    alias['capability_roles']['alias'] = 31
    alias['character_sets']['alias'] = 32
    alias['check_constraint_routine_usage']['alias'] = 33
    alias['check_constraints']['alias'] = 34
    alias['collation_character_set_applicability']['alias'] = 35
    alias['collations']['alias'] = 36
    alias['column_domain_usage']['alias'] = 37
    alias['column_options']['alias'] = 38
    alias['column_privileges']['alias'] = 39
    alias['column_udt_usage']['alias'] = 40
    alias['columns']['alias'] = 41
    alias['comments']['alias'] = 42
    alias['constraint_column_usage']['alias'] = 43
    alias['constraint_table_usage']['alias'] = 44
    alias['core_licenses']['alias'] = 45
    alias['customized_views']['alias'] = 46
    alias['data_alerts']['alias'] = 47
    alias['data_alerts_recipients']['alias'] = 48
    alias['data_connections']['alias'] = 49
    alias['data_type_privileges']['alias'] = 50
    alias['dataengine_configurations']['alias'] = 51
    alias['datasource_metrics_aggregations']['alias'] = 52
    alias['datasource_refresh_properties']['alias'] = 53
    alias['datasource_versions']['alias'] = 54
    alias['datasources']['alias'] = 55
    alias['deleted_objects']['alias'] = 56
    alias['desktop_reporting']['alias'] = 57
    alias['domain_constraints']['alias'] = 58
    alias['domain_udt_usage']['alias'] = 59
    alias['domains']['alias'] = 60
    alias['element_types']['alias'] = 61
    alias['enabled_roles']['alias'] = 62
    alias['exportable_repository_id_columns']['alias'] = 63
    alias['exportable_tables']['alias'] = 64
    alias['exportable_tables_column_transformations']['alias'] = 65
    alias['exportable_types']['alias'] = 66
    alias['extract_sessions']['alias'] = 67
    alias['extracts']['alias'] = 68
    alias['file_uploads']['alias'] = 69
    alias['foreign_data_wrapper_options']['alias'] = 70
    alias['foreign_data_wrappers']['alias'] = 71
    alias['foreign_server_options']['alias'] = 72
    alias['foreign_servers']['alias'] = 73
    alias['foreign_table_options']['alias'] = 74
    alias['foreign_tables']['alias'] = 75
    alias['global_settings']['alias'] = 76
    alias['group_users']['alias'] = 77
    alias['groups']['alias'] = 78
    alias['hist_capabilities']['alias'] = 79
    alias['hist_comments']['alias'] = 80
    alias['hist_configs']['alias'] = 81
    alias['hist_data_connections']['alias'] = 82
    alias['hist_datasources']['alias'] = 83
    alias['hist_groups']['alias'] = 84
    alias['hist_licensing_roles']['alias'] = 85
    alias['hist_projects']['alias'] = 86
    alias['hist_schedules']['alias'] = 87
    alias['hist_sites']['alias'] = 88
    alias['hist_tags']['alias'] = 89
    alias['hist_tasks']['alias'] = 90
    alias['hist_users']['alias'] = 91
    alias['hist_views']['alias'] = 92
    alias['hist_workbooks']['alias'] = 93
    alias['historical_disk_usage']['alias'] = 94
    alias['historical_event_types']['alias'] = 95
    alias['historical_events']['alias'] = 96
    alias['http_requests']['alias'] = 97
    alias['import_mappable_table_implicit_fks']['alias'] = 98
    alias['import_mappable_tables']['alias'] = 99
    alias['import_mapping_excluded_schedules']['alias'] = 100
    alias['import_mapping_excluded_system_users']['alias'] = 101
    alias['importable_table_implicit_fks']['alias'] = 102
    alias['importable_tables']['alias'] = 103
    alias['information_schema_catalog_name']['alias'] = 104
    alias['key_column_usage']['alias'] = 105
    alias['keychain_entries']['alias'] = 106
    alias['keychain_entry_usage']['alias'] = 107
    alias['language_prefs']['alias'] = 108
    alias['licensing_roles']['alias'] = 109
    alias['local_names']['alias'] = 110
    alias['managed_keychains']['alias'] = 111
    alias['metrics_data']['alias'] = 112
    alias['mobile_enrollments']['alias'] = 113
    alias['monitoring_dataengine']['alias'] = 114
    alias['monitoring_postgresql']['alias'] = 115
    alias['most_recent_refreshes']['alias'] = 116
    alias['mru_list_entries']['alias'] = 117
    alias['mru_lists']['alias'] = 118
    alias['named_resources']['alias'] = 119
    alias['next_gen_permissions']['alias'] = 120
    alias['oauth_request_tokens']['alias'] = 121
    alias['parameters']['alias'] = 122
    alias['password_tokens']['alias'] = 123
    alias['pending_search_updates']['alias'] = 124
    alias['permission_reasons']['alias'] = 125
    alias['permissions_templates']['alias'] = 126
    alias['pg_aggregate']['alias'] = 127
    alias['pg_am']['alias'] = 128
    alias['pg_amop']['alias'] = 129
    alias['pg_amproc']['alias'] = 130
    alias['pg_attrdef']['alias'] = 131
    alias['pg_attribute']['alias'] = 132
    alias['pg_auth_members']['alias'] = 133
    alias['pg_available_extension_versions']['alias'] = 134
    alias['pg_available_extensions']['alias'] = 135
    alias['pg_cast']['alias'] = 136
    alias['pg_class']['alias'] = 137
    alias['pg_collation']['alias'] = 138
    alias['pg_constraint']['alias'] = 139
    alias['pg_conversion']['alias'] = 140
    alias['pg_cursors']['alias'] = 141
    alias['pg_database']['alias'] = 142
    alias['pg_db_role_setting']['alias'] = 143
    alias['pg_default_acl']['alias'] = 144
    alias['pg_depend']['alias'] = 145
    alias['pg_description']['alias'] = 146
    alias['pg_enum']['alias'] = 147
    alias['pg_event_trigger']['alias'] = 148
    alias['pg_extension']['alias'] = 149
    alias['pg_foreign_data_wrapper']['alias'] = 150
    alias['pg_foreign_server']['alias'] = 151
    alias['pg_foreign_table']['alias'] = 152
    alias['pg_group']['alias'] = 153
    alias['pg_index']['alias'] = 154
    alias['pg_indexes']['alias'] = 155
    alias['pg_inherits']['alias'] = 156
    alias['pg_language']['alias'] = 157
    alias['pg_largeobject_metadata']['alias'] = 158
    alias['pg_locks']['alias'] = 159
    alias['pg_matviews']['alias'] = 160
    alias['pg_namespace']['alias'] = 161
    alias['pg_opclass']['alias'] = 162
    alias['pg_operator']['alias'] = 163
    alias['pg_opfamily']['alias'] = 164
    alias['pg_pltemplate']['alias'] = 165
    alias['pg_policies']['alias'] = 166
    alias['pg_policy']['alias'] = 167
    alias['pg_prepared_statements']['alias'] = 168
    alias['pg_prepared_xacts']['alias'] = 169
    alias['pg_proc']['alias'] = 170
    alias['pg_range']['alias'] = 171
    alias['pg_replication_origin']['alias'] = 172
    alias['pg_replication_slots']['alias'] = 173
    alias['pg_rewrite']['alias'] = 174
    alias['pg_roles']['alias'] = 175
    alias['pg_rules']['alias'] = 176
    alias['pg_seclabel']['alias'] = 177
    alias['pg_seclabels']['alias'] = 178
    alias['pg_settings']['alias'] = 179
    alias['pg_shdepend']['alias'] = 180
    alias['pg_shdescription']['alias'] = 181
    alias['pg_shseclabel']['alias'] = 182
    alias['pg_stat_activity']['alias'] = 183
    alias['pg_stat_all_indexes']['alias'] = 184
    alias['pg_stat_all_tables']['alias'] = 185
    alias['pg_stat_archiver']['alias'] = 186
    alias['pg_stat_bgwriter']['alias'] = 187
    alias['pg_stat_database']['alias'] = 188
    alias['pg_stat_database_conflicts']['alias'] = 189
    alias['pg_stat_replication']['alias'] = 190
    alias['pg_stat_ssl']['alias'] = 191
    alias['pg_stat_sys_indexes']['alias'] = 192
    alias['pg_stat_sys_tables']['alias'] = 193
    alias['pg_stat_user_functions']['alias'] = 194
    alias['pg_stat_user_indexes']['alias'] = 195
    alias['pg_stat_user_tables']['alias'] = 196
    alias['pg_stat_xact_all_tables']['alias'] = 197
    alias['pg_stat_xact_sys_tables']['alias'] = 198
    alias['pg_stat_xact_user_functions']['alias'] = 199
    alias['pg_stat_xact_user_tables']['alias'] = 200
    alias['pg_statio_all_indexes']['alias'] = 201
    alias['pg_statio_all_sequences']['alias'] = 202
    alias['pg_statio_all_tables']['alias'] = 203
    alias['pg_statio_sys_indexes']['alias'] = 204
    alias['pg_statio_sys_sequences']['alias'] = 205
    alias['pg_statio_sys_tables']['alias'] = 206
    alias['pg_statio_user_indexes']['alias'] = 207
    alias['pg_statio_user_sequences']['alias'] = 208
    alias['pg_statio_user_tables']['alias'] = 209
    alias['pg_stats']['alias'] = 210
    alias['pg_tables']['alias'] = 211
    alias['pg_tablespace']['alias'] = 212
    alias['pg_timezone_abbrevs']['alias'] = 213
    alias['pg_timezone_names']['alias'] = 214
    alias['pg_transform']['alias'] = 215
    alias['pg_trigger']['alias'] = 216
    alias['pg_ts_config']['alias'] = 217
    alias['pg_ts_config_map']['alias'] = 218
    alias['pg_ts_dict']['alias'] = 219
    alias['pg_ts_parser']['alias'] = 220
    alias['pg_ts_template']['alias'] = 221
    alias['pg_type']['alias'] = 222
    alias['pg_user']['alias'] = 223
    alias['pg_user_mappings']['alias'] = 224
    alias['pg_views']['alias'] = 225
    alias['postgres_heartbeat']['alias'] = 226
    alias['projects']['alias'] = 227
    alias['projects_view_option_rights']['alias'] = 228
    alias['projects_view_options']['alias'] = 229
    alias['referential_constraints']['alias'] = 230
    alias['refresh_token_devices']['alias'] = 231
    alias['refresh_tokens']['alias'] = 232
    alias['remote_agents']['alias'] = 233
    alias['repository_data']['alias'] = 234
    alias['role_column_grants']['alias'] = 235
    alias['role_routine_grants']['alias'] = 236
    alias['role_table_grants']['alias'] = 237
    alias['role_udt_grants']['alias'] = 238
    alias['role_usage_grants']['alias'] = 239
    alias['roles']['alias'] = 240
    alias['routine_privileges']['alias'] = 241
    alias['routines']['alias'] = 242
    alias['schedules']['alias'] = 243
    alias['schema_migrations']['alias'] = 244
    alias['schemata']['alias'] = 245
    alias['sequences']['alias'] = 246
    alias['serial_collections']['alias'] = 247
    alias['sessions']['alias'] = 248
    alias['settings']['alias'] = 249
    alias['shared_views']['alias'] = 250
    alias['sheet_images']['alias'] = 251
    alias['site_logos']['alias'] = 252
    alias['site_oidc_configurations']['alias'] = 253
    alias['site_saml_configurations']['alias'] = 254
    alias['site_saml_events']['alias'] = 255
    alias['site_saml_sessions']['alias'] = 256
    alias['site_saml_users']['alias'] = 257
    alias['site_user_prefs']['alias'] = 258
    alias['sites']['alias'] = 259
    alias['sql_features']['alias'] = 260
    alias['sql_implementation_info']['alias'] = 261
    alias['sql_languages']['alias'] = 262
    alias['sql_packages']['alias'] = 263
    alias['sql_sizing']['alias'] = 264
    alias['sql_sizing_profiles']['alias'] = 265
    alias['startup_infos']['alias'] = 266
    alias['subscriptions']['alias'] = 267
    alias['subscriptions_customized_views']['alias'] = 268
    alias['subscriptions_views']['alias'] = 269
    alias['subscriptions_workbooks']['alias'] = 270
    alias['system_users']['alias'] = 271
    alias['table_constraints']['alias'] = 272
    alias['table_privileges']['alias'] = 273
    alias['table_revisions']['alias'] = 274
    alias['tables']['alias'] = 275
    alias['taggings']['alias'] = 276
    alias['tags']['alias'] = 277
    alias['tasks']['alias'] = 278
    alias['triggered_update_columns']['alias'] = 279
    alias['triggers']['alias'] = 280
    alias['trusted_tickets']['alias'] = 281
    alias['udt_privileges']['alias'] = 282
    alias['usage_privileges']['alias'] = 283
    alias['user_default_customized_views']['alias'] = 284
    alias['user_defined_types']['alias'] = 285
    alias['user_images']['alias'] = 286
    alias['user_mapping_options']['alias'] = 287
    alias['user_mappings']['alias'] = 288
    alias['user_prefs']['alias'] = 289
    alias['users']['alias'] = 290
    alias['users_view']['alias'] = 291
    alias['view_column_usage']['alias'] = 292
    alias['view_metrics_aggregations']['alias'] = 293
    alias['view_option_keys']['alias'] = 294
    alias['view_routine_usage']['alias'] = 295
    alias['view_table_usage']['alias'] = 296
    alias['views']['alias'] = 297
    alias['views_stats']['alias'] = 298
    alias['workbook_checksums']['alias'] = 299
    alias['workbook_versions']['alias'] = 300
    alias['workbooks']['alias'] = 301
    alias['workbooks_view_options']['alias'] = 302
    tables_with_zero_rows = []
    tables_with_zero_rows.append('auto_saves')
    tables_with_zero_rows.append('big_texts')
    tables_with_zero_rows.append('data_alerts')
    tables_with_zero_rows.append('data_alerts_recipients')
    tables_with_zero_rows.append('dataengine_configurations')
    tables_with_zero_rows.append('datasource_refresh_properties')
    tables_with_zero_rows.append('deleted_objects')
    tables_with_zero_rows.append('desktop_reporting')
    tables_with_zero_rows.append('file_uploads')
    tables_with_zero_rows.append('hist_capabilities')
    tables_with_zero_rows.append('hist_configs')
    tables_with_zero_rows.append('hist_tags')
    tables_with_zero_rows.append('import_mappable_table_implicit_fks')
    tables_with_zero_rows.append('keychain_entries')
    tables_with_zero_rows.append('keychain_entry_usage')
    tables_with_zero_rows.append('oauth_request_tokens')
    tables_with_zero_rows.append('password_tokens')
    tables_with_zero_rows.append('pending_search_updates')
    tables_with_zero_rows.append('pg_auth_members')
    tables_with_zero_rows.append('pg_db_role_setting')
    tables_with_zero_rows.append('pg_event_trigger')
    tables_with_zero_rows.append('pg_foreign_data_wrapper')
    tables_with_zero_rows.append('pg_foreign_server')
    tables_with_zero_rows.append('pg_foreign_table')
    tables_with_zero_rows.append('pg_group')
    tables_with_zero_rows.append('pg_inherits')
    tables_with_zero_rows.append('pg_matviews')
    tables_with_zero_rows.append('pg_policies')
    tables_with_zero_rows.append('pg_policy')
    tables_with_zero_rows.append('pg_prepared_statements')
    tables_with_zero_rows.append('pg_prepared_xacts')
    tables_with_zero_rows.append('pg_replication_origin')
    tables_with_zero_rows.append('pg_replication_slots')
    tables_with_zero_rows.append('pg_seclabel')
    tables_with_zero_rows.append('pg_seclabels')
    tables_with_zero_rows.append('pg_shseclabel')
    tables_with_zero_rows.append('pg_stat_user_functions')
    tables_with_zero_rows.append('pg_stat_xact_user_functions')
    tables_with_zero_rows.append('pg_statio_sys_sequences')
    tables_with_zero_rows.append('pg_transform')
    tables_with_zero_rows.append('pg_user_mappings')
    tables_with_zero_rows.append('projects_view_options')
    tables_with_zero_rows.append('remote_agents')
    tables_with_zero_rows.append('shared_views')
    tables_with_zero_rows.append('sheet_images')
    tables_with_zero_rows.append('site_logos')
    tables_with_zero_rows.append('site_oidc_configurations')
    tables_with_zero_rows.append('site_saml_configurations')
    tables_with_zero_rows.append('site_saml_events')
    tables_with_zero_rows.append('site_saml_sessions')
    tables_with_zero_rows.append('site_saml_users')
    tables_with_zero_rows.append('site_user_prefs')
    tables_with_zero_rows.append('subscriptions_customized_views')
    tables_with_zero_rows.append('trusted_tickets')
    tables_with_zero_rows.append('workbook_checksums')
    tables_with_zero_rows.append('workbooks_view_options')
    joins = []
    joins.append(nt_joins('asset_key_marker', 'asset_key_meta_data', 'asset_key_id', 'id', ''))
    joins.append(nt_joins('asset_list_items', 'asset_lists', 'asset_list_id', 'id', ''))
    joins.append(nt_joins('asset_lists', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('asset_lists', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('async_jobs', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('async_jobs', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('background_jobs', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('background_jobs', 'serial_collections', 'serial_collection_id', 'id', ''))
    joins.append(nt_joins('background_jobs', '_background_tasks', 'backgrounder_id', 'backgrounder_id', ''))
    joins.append(nt_joins('background_jobs', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('background_jobs', 'subscriptions', 'correlation_id', 'id', ''))
    joins.append(nt_joins('capability_roles', 'capabilities', 'capability_id', 'id', ''))
    joins.append(nt_joins('capability_roles', 'roles', 'role_id', 'id', ''))
    joins.append(nt_joins('comments', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'users', 'creator_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'repository_data', 'repository_data_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'repository_data', 'repository_thumbnail_data_id', 'id', ''))
    joins.append(nt_joins('customized_views', 'views', 'start_view_id', 'id', ''))
    joins.append(nt_joins('data_alerts', 'users', 'creator_id', 'id', ''))
    joins.append(nt_joins('data_alerts', 'schedules', 'schedule_id', 'id', ''))
    joins.append(nt_joins('data_alerts', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('data_alerts', 'workbooks', 'workbook_id', 'id', 'data_alerts.workbook_id could be NULL'))
    joins.append(nt_joins('data_alerts', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('data_alerts', 'users', 'creator_id', 'id', ''))
    joins.append(nt_joins('data_alerts_recipients', 'data_alerts', 'data_alert_id', 'id', ''))
    joins.append(nt_joins('data_connections', 'workbooks', 'owner_id', 'id', "data_connections.OWNER_TYPE = 'Workbook'"))
    joins.append(nt_joins('data_connections', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('data_connections', 'datasources', 'datasource_id', 'id', ''))
    joins.append(nt_joins('data_connections', 'datasources', 'id', 'owner_id', "data_connections.OWNER_TYPE = 'Datasource'"))
    joins.append(nt_joins('datasource_metrics_aggregations', 'datasources', 'datasource_id', 'id', ''))
    joins.append(nt_joins('datasource_refresh_properties', 'remote_agents', 'remote_agent_id', 'id', ''))
    joins.append(nt_joins('datasource_refresh_properties', 'datasources', 'id', 'id', ''))
    joins.append(nt_joins('datasource_versions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('datasource_versions', 'datasources', 'datasource_id', 'id', ''))
    joins.append(nt_joins('datasources', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('datasources', 'projects', 'project_id', 'id', ''))
    joins.append(nt_joins('datasources', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('datasources', 'repository_data', 'repository_data_id', 'id', 'datasources.repository_data_id could be NULL'))
    joins.append(nt_joins('datasources', 'repository_data', 'repository_extract_data_id', 'id', 'datasources.repository_extract_data_id could be NULL'))
    joins.append(nt_joins('datasources', 'workbooks', 'parent_workbook_id', 'id', 'datasources.parent_workbook_id could be NULL'))
    joins.append(nt_joins('datasources', 'remote_agents', 'remote_query_agent_id', 'id', ''))
    joins.append(nt_joins('extracts', 'workbooks', 'workbook_id', 'id', 'extracts.workbook_id could be NULL'))
    joins.append(nt_joins('extracts', 'datasources', 'datasource_id', 'id', 'extracts.datasource_id could be NULL'))
    joins.append(nt_joins('group_users', 'groups', 'group_id', 'id', ''))
    joins.append(nt_joins('group_users', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('groups', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('groups', 'domains', 'domain_id', 'id', ''))
    joins.append(nt_joins('groups', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('hist_capabilities', 'capabilities', 'capability_id', 'id', 'hist_capabilities.capability_id could be NULL'))
    joins.append(nt_joins('hist_comments', 'comments', 'comment_id', 'id', 'hist_comments.comment_id could be NULL'))
    joins.append(nt_joins('hist_data_connections', 'data_connections', 'data_connection_id', 'id', 'hist_data_connections.data_connection_id could be NULL'))
    joins.append(nt_joins('hist_datasources', 'datasources', 'datasource_id', 'id', 'hist_datasources.datasource_id could be NULL'))
    joins.append(nt_joins('hist_groups', 'groups', 'group_id', 'id', 'hist_groups.group_id could be NULL'))
    joins.append(nt_joins('hist_licensing_roles', 'licensing_roles', 'licensing_role_id', 'id', 'hist_licensing_roles.licensing_role_id could be NULL'))
    joins.append(nt_joins('hist_projects', 'projects', 'project_id', 'id', 'hist_projects.project_id could be NULL'))
    joins.append(nt_joins('hist_schedules', 'schedules', 'schedule_id', 'id', 'hist_schedules.schedule_id could be NULL'))
    joins.append(nt_joins('hist_sites', 'sites', 'site_id', 'id', 'hist_sites.site_id could be NULL'))
    joins.append(nt_joins('hist_tags', 'tags', 'tag_id', 'id', 'hist_tags.tag_id could be NULL'))
    joins.append(nt_joins('hist_tasks', 'tasks', 'task_id', 'id', 'hist_tasks.task_id could be NULL'))
    joins.append(nt_joins('hist_users', 'users', 'user_id', 'id', 'hist_users.user_id could be NULL'))
    joins.append(nt_joins('hist_users', 'system_users', 'system_user_id', 'id', ' could be NULL'))
    joins.append(nt_joins('hist_users', 'hist_licensing_roles', 'hist_licensing_role_id', 'licensing_role_id', ''))
    joins.append(nt_joins('hist_views', 'views', 'view_id', 'id', 'hist_views.view_id could be NULL'))
    joins.append(nt_joins('hist_workbooks', 'workbooks', 'workbook_id', 'id', 'hist_workbooks.workbook_id could be NULL'))
    joins.append(nt_joins('historical_events', 'historical_event_types', 'historical_event_type_id', 'type_id', ''))
    joins.append(nt_joins('historical_events', 'hist_users', 'hist_actor_user_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_users', 'hist_target_user_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_sites', 'hist_actor_site_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_sites', 'hist_target_site_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_projects', 'hist_project_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_workbooks', 'hist_workbook_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_views', 'hist_view_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_datasources', 'hist_datasource_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_comments', 'hist_comment_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_tags', 'hist_tag_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_groups', 'hist_group_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_licensing_roles', 'hist_licensing_role_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_schedules', 'hist_schedule_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_tasks', 'hist_task_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_data_connections', 'hist_data_connection_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_configs', 'hist_config_id', 'id', ''))
    joins.append(nt_joins('historical_events', 'hist_capabilities', 'hist_capability_id', 'id', ''))
    joins.append(nt_joins('http_requests', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('http_requests', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('http_requests', 'views', 'currentsheet', 'view_url', ''))
    joins.append(nt_joins('http_requests', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('mobile_enrollments', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('most_recent_refreshes', 'historical_event_types', 'historical_event_type_id', 'id', 'most_recent_refreshes.historical_event_type_id could be NULL'))
    joins.append(nt_joins('most_recent_refreshes', 'data_connections', 'data_connection_id', 'id', 'most_recent_refreshes.data_connection_id could be NULL'))
    joins.append(nt_joins('most_recent_refreshes', 'workbooks', 'workbook_id', 'id', 'most_recent_refreshes.workbook_id could be NULL'))
    joins.append(nt_joins('most_recent_refreshes', 'datasources', 'datasource_id', 'id', 'most_recent_refreshes.datasource_id could be NULL'))
    joins.append(nt_joins('mru_list_entries', 'mru_lists', 'mru_list_id', 'id', ''))
    joins.append(nt_joins('mru_lists', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('next_gen_permissions', 'workbooks', 'authorizable_id', 'id', "next_gen_permissions.authorizable_type = 'Workbook'"))
    joins.append(nt_joins('next_gen_permissions', 'projects', 'authorizable_id', 'id', "next_gen_permissions.authorizable_type = 'Project'"))
    joins.append(nt_joins('next_gen_permissions', 'views', 'authorizable_id', 'id', "next_gen_permissions.authorizable_type = 'View'"))
    joins.append(nt_joins('next_gen_permissions', 'datasources', 'authorizable_id', 'id', "next_gen_permissions.authorizable_type = 'Datasource'"))
    joins.append(nt_joins('next_gen_permissions', 'users', 'grantee_id', 'id', "next_gen_permissions.next_gen_permissions.grantee_type = 'User'"))
    joins.append(nt_joins('next_gen_permissions', 'groups', 'grantee_id', 'id', "next_gen_permissions.next_gen_permissions.grantee_type = 'Group'"))
    joins.append(nt_joins('next_gen_permissions', 'capabilities', 'capability_id', 'id', ''))
    joins.append(nt_joins('password_tokens', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('permissions_templates', 'projects', 'project_id', 'id', ''))
    joins.append(nt_joins('permissions_templates', 'users', 'grantee_id', 'id', "permissions_templates.grantee_type = 'User'"))
    joins.append(nt_joins('permissions_templates', 'groups', 'grantee_id', 'id', "permissions_templates.grantee_type = 'Group'"))
    joins.append(nt_joins('permissions_templates', 'capabilities', 'capability_id', 'id', ''))
    joins.append(nt_joins('projects', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('projects', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('refresh_token_devices', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('refresh_tokens', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('refresh_tokens', 'refresh_token_devices', 'refresh_token_device_id', 'id', ''))
    joins.append(nt_joins('remote_agents', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('remote_agents', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('roles', 'users', 'creator_id', 'id', 'roles.creator_id could be NULL'))
    joins.append(nt_joins('schedules', 'serial_collections', 'serial_collection_id', 'id', ''))
    joins.append(nt_joins('sessions', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('sessions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('sheet_images', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('sheet_images', 'repository_data', 'data_storage_id', 'id', ''))
    joins.append(nt_joins('sheet_images', 'users', 'generated_as_user_id', 'id', ''))
    joins.append(nt_joins('sheet_images', 'customized_views', 'customized_view_id', 'id', ''))
    joins.append(nt_joins('site_logos', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('site_saml_configurations', 'sites', 'site_luid', 'luid', ''))
    joins.append(nt_joins('site_saml_events', 'sites', 'site_luid', 'luid', ''))
    joins.append(nt_joins('site_saml_users', 'sites', 'site_luid', 'luid', ''))
    joins.append(nt_joins('site_saml_users', 'system_users', 'auth_user_id', 'id', ''))
    joins.append(nt_joins('site_user_prefs', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('subscriptions', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('subscriptions', 'schedules', 'schedule_id', 'id', ''))
    joins.append(nt_joins('subscriptions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('subscriptions', 'users', 'creator_id', 'id', ''))
    joins.append(nt_joins('subscriptions_customized_views', 'subscriptions', 'subscription_id', 'id', ''))
    joins.append(nt_joins('subscriptions_customized_views', 'customized_views', 'customized_view_id', 'id', ''))
    joins.append(nt_joins('subscriptions_views', 'subscriptions', 'subscription_id', 'id', ''))
    joins.append(nt_joins('subscriptions_workbooks', 'subscriptions', 'subscription_id', 'id', ''))
    joins.append(nt_joins('subscriptions_workbooks', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('system_users', 'domains', 'domain_id', 'id', ''))
    joins.append(nt_joins('taggings', 'tags', 'tag_id', 'id', ''))
    joins.append(nt_joins('taggings', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('tags', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('tasks', 'schedules', 'schedule_id', 'id', ''))
    joins.append(nt_joins('tasks', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('trusted_tickets', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('trusted_tickets', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('user_default_customized_views', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('user_default_customized_views', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('user_default_customized_views', 'customized_views', 'customized_view_id', 'id', ''))
    joins.append(nt_joins('user_images', 'repository_data', 'repository_data_id', 'id', ''))
    joins.append(nt_joins('user_images', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('user_prefs', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('users', 'licensing_roles', 'licensing_role_id', 'id', 'users.licensing_role_id could be NULL'))
    joins.append(nt_joins('users', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('users', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('view_metrics_aggregations', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('views', 'workbooks', 'workbook_id', 'id', ''))
    joins.append(nt_joins('views', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('views', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('views', 'repository_data', 'repository_data_id', 'id', 'views.repository_data_id could be NULL'))
    joins.append(nt_joins('views_stats', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('views_stats', 'views', 'view_id', 'id', ''))
    joins.append(nt_joins('views_stats', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('workbook_checksums', 'workbooks', 'workbook_id', 'id', ''))
    joins.append(nt_joins('workbook_versions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('workbook_versions', 'workbooks', 'workbook_id', 'id', ''))
    joins.append(nt_joins('workbook_versions', 'users', 'publisher_id', 'id', 'workbook_versions.publisher_id could be NULL'))
    joins.append(nt_joins('workbooks', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('workbooks', 'projects', 'project_id', 'id', ''))
    joins.append(nt_joins('workbooks', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_background_tasks', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_comments', 'views', 'commentable_id', 'id', ''))
    joins.append(nt_joins('_comments', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('_comments', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_customized_views', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_datasources', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('_datasources', 'projects', 'project_id', 'id', ''))
    joins.append(nt_joins('_datasources', 'system_users', 'system_user_id', 'id', '_datasources.system_user_id could be NULL'))
    joins.append(nt_joins('_datasources', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_datasources', 'domains', 'domain_id', 'id', ''))
    joins.append(nt_joins('_datasources_stats', 'datasources', 'datasource_id', 'id', ''))
    joins.append(nt_joins('_datasources_stats', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_http_requests', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('_http_requests', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_projects', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('_projects', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('_projects', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_schedules', 'serial_collections', 'serial_collection_id', 'id', '_schedules.serial_collection_id could be NULL'))
    joins.append(nt_joins('_sessions', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('_sessions', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('_sessions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_subscriptions', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('_subscriptions', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_tags', 'users', 'user_id', 'id', ''))
    joins.append(nt_joins('_tags', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('_tags', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_users', 'licensing_roles', 'licensing_role_id', 'id', ''))
    joins.append(nt_joins('_users', 'domains', 'domain_id', 'id', ''))
    joins.append(nt_joins('_users', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('_users', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_views', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('_views', 'workbooks', 'workbook_id', 'id', '_views.workbook_id could be NULL'))
    joins.append(nt_joins('_views', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_views_stats', 'users', 'users_id', 'id', ''))
    joins.append(nt_joins('_views_stats', 'views', 'views_id', 'id', ''))
    joins.append(nt_joins('_views_stats', 'system_users', 'system_users_id', 'id', ''))
    joins.append(nt_joins('_views_stats', 'workbooks', 'views_workbook_id', 'id', '_views_stats.views_workbook_id could be NULL'))
    joins.append(nt_joins('_views_stats', 'users', 'views_owner_id', 'id', ''))
    joins.append(nt_joins('_views_stats', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_workbooks', 'users', 'owner_id', 'id', ''))
    joins.append(nt_joins('_workbooks', 'projects', 'project_id', 'id', ''))
    joins.append(nt_joins('_workbooks', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('_workbooks', 'sites', 'site_id', 'id', ''))
    joins.append(nt_joins('_workbooks', 'domains', 'domain_id', 'id', ''))
    joins.append(nt_joins('users_view', 'system_users', 'system_user_id', 'id', ''))
    joins.append(nt_joins('subscriptions_workbooks', 'workbooks', 'repository_url', 'repository_url', 'subscriptions_workbooks.repository_url could be NULL'))
    joins.append(nt_joins('subscriptions_views', 'views', 'repository_url', 'repository_url', ''))
    one_join = namedtuple('one_join', 'id_1 joins_to id_2 where')
    joins_dict = { }
    for y in range(len(joins)):
        if joins[y].table == '' and joins[y].joins_to == '' and joins[y].key_1 == '' or joins[y].key_2 == '':
            print(y, joins[y].table)
        my_keys = list(joins_dict.keys())
        
        try:
            idx_found = joins[y].key_1 + joins[y].joins_to + joins[y].key_2 + joins[y].where in joins_dict[joins[y].table]['search']
        except:
            idx_found = False

        if len(indices(my_keys, joins[y].table)) > 0 and idx_found == False:
            joins_dict[joins[y].table]['joins'].append(one_join(joins[y].key_1, joins[y].joins_to, joins[y].key_2, joins[y].where))
            joins_dict[joins[y].table]['search'].append(joins[y].key_1 + joins[y].joins_to + joins[y].key_2 + joins[y].where)
        else:
            joins_dict[joins[y].table] = { }
            joins_dict[joins[y].table]['joins'] = []
            joins_dict[joins[y].table]['joins'].append(one_join(joins[y].key_1, joins[y].joins_to, joins[y].key_2, joins[y].where))
            joins_dict[joins[y].table]['search'] = []
            joins_dict[joins[y].table]['search'].append(joins[y].key_1 + joins[y].joins_to + joins[y].key_2 + joins[y].where)
        
        try:
            idx_found = joins[y].key_2 + joins[y].table + joins[y].key_1 + joins[y].where in joins_dict[joins[y].joins_to]['search']
        except:
            idx_found = False

        if len(indices(my_keys, joins[y].joins_to)) > 0 and idx_found == False:
            joins_dict[joins[y].joins_to]['joins'].append(one_join(joins[y].key_2, joins[y].table, joins[y].key_1, joins[y].where))
            joins_dict[joins[y].joins_to]['search'].append(joins[y].key_2 + joins[y].table + joins[y].key_1 + joins[y].where)
            continue
        joins_dict[joins[y].joins_to] = { }
        joins_dict[joins[y].joins_to]['joins'] = []
        joins_dict[joins[y].joins_to]['joins'].append(one_join(joins[y].key_2, joins[y].table, joins[y].key_1, joins[y].where))
        joins_dict[joins[y].joins_to]['search'] = []
        joins_dict[joins[y].joins_to]['search'].append(joins[y].key_2 + joins[y].table + joins[y].key_1 + joins[y].where)
    
    table_columns = convert_nt_to_dict_multi_dim(nt_2, 'Table_Name')
    table_keys = set(list(table_columns.keys()))
    join_keys = set(list(joins_dict.keys()))
    both_list = list(set(table_keys & join_keys))
    both_set = set(table_keys & join_keys)
    only_table_keys_list = list(table_keys - join_keys)
    only_join_keys_list = list(join_keys - table_keys)
    ans = { }
    for x in range(len(both_list)):
        ans[both_list[x]] = { }
        ans[both_list[x]]['joins'] = joins_dict[both_list[x]]['joins']
        ans[both_list[x]]['columns'] = table_columns[both_list[x]]
        ans[both_list[x]]['alias'] = alias[both_list[x]]
    
    for x in range(len(only_table_keys_list)):
        ans[only_table_keys_list[x]] = { }
        ans[only_table_keys_list[x]]['columns'] = table_columns[only_table_keys_list[x]]
        ans[only_table_keys_list[x]]['joins'] = []
        ans[only_table_keys_list[x]]['alias'] = alias[only_table_keys_list[x]]['alias']
    
    for x in range(len(only_join_keys_list)):
        ans[only_join_keys_list[x]] = { }
        ans[only_join_keys_list[x]]['joins'] = joins_dict[only_join_keys_list[x]]['joins']
        ans[only_join_keys_list[x]]['columns'] = []
        ans[only_join_keys_list[x]]['alias'] = '()'
    
    reorder_output = []
    reorder_output.append('placeholder')
    for x in alias.keys():
        reorder_output.append('placeholder')
    
    for x in ans.keys():
        
        try:
            reorder_output[alias[x]['alias']] = x
        continue
        input(alias[x]['alias'])
        continue

    
    del reorder_output[0]
    reorder_output_2 = []
    for x in range(len(reorder_output)):
        if reorder_output[x] == 'placeholder':
            continue
        reorder_output_2.append(reorder_output[x])
    
    outfile = open('..\\Custom_SQL\\Tableau_Server_Tables_Fields_Joins.sql', 'w')
    outfile.write('/*\n')
    outfile.write('Copyright June 2nd, 2017, Luke Brady, Cerner Corporation\n\n')
    outfile.write('Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated\n')
    outfile.write('documentation files (the "Software"), to deal in the Software without restriction, including without\n')
    outfile.write('limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of\n')
    outfile.write('the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\n')
    outfile.write('The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\n')
    outfile.write('THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE\n')
    outfile.write('WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR\n')
    outfile.write('COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,\n')
    outfile.write('ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\n')
    outfile.write('MIT License: https://opensource.org/licenses/MIT\n\n')
    outfile.write('Pulled Tableau Server 10.1.4\n')
    outfile.write('https://onlinehelp.tableau.com/current/server/en-us/data_dictionary.html\n\n')
    outfile.write('How to use this File:\n')
    outfile.write("1)  Do a search using CTRL-F for the table you are interested in, ie: 'Table workbooks'\n")
    outfile.write('2)  Copy the desired fields from the SELECT and paste into you query tool of choice\n')
    outfile.write('3)  Copy the desired joins from the FROM and paste into you query tool of choice\n')
    outfile.write("4)  Do additional searches using CTRL-F for additional tables ie: 'Table users'\n")
    outfile.write('5)  Add the desired SELECT fields from those tables to your SELECT statement\n')
    outfile.write('6)  Add addtional commas to fields as needed in your SELECT\n')
    outfile.write('7)  Run your query\n\n')
    outfile.write('Known Issues:\n')
    outfile.write("* Some tables join to the same table twice, like '_views_stats' with 'users'\n")
    outfile.write('  **  In these cases you will have to rename the second table alias to a number of your choosing\n\n')
    outfile.write('* It is possible some fields do not exist which are present in the SELECT statements\n')
    outfile.write('  **  If found just remove them from your query\n\n')
    outfile.write('* Be sure to check if an INNER join or LEFT join is correct\n')
    outfile.write("  **  It's possible for rows to drop off where it is wrong\n")
    outfile.write('  **  If one is found please let me know as I will need to update the join list used to print out this file\n')
    outfile.write('\n*/\n\n')
    counter = -1
    for x in reorder_output_2:
        outfile.write('---------------------------------------------------\n')
        outfile.write('-- Table ' + x + '\n')
        counter += 1
        outfile.write('SELECT DISTINCT\n')
        for y in range(len(ans[x]['columns'])):
            outfile.write('T' + str(alias[x]['alias']) + '.' + ans[x]['columns'][y][0] + ' AS "' + camel_case_two_params_optional_end_id(ans[x]['columns'][y][0]) + ' ' + alias[x]['SELECT'] + '"')
            if len(ans[x]['columns']) == y + 1:
                outfile.write('\n')
                continue
            outfile.write(',\n')
        
        outfile.write('FROM\n')
        outfile.write(x + ' T' + str(alias[x]['alias']) + '\n')
        if x in alias.keys():
            for y in range(len(ans[x]['joins'])):
                if ans[x]['joins'][y].where == '' and x not in tables_with_zero_rows:
                    outfile.write('INNER JOIN ' + ans[x]['joins'][y].joins_to + ' T' + str(alias[ans[x]['joins'][y].joins_to]['alias']) + ' ON T' + str(alias[x]['alias']) + '.' + ans[x]['joins'][y].id_1 + ' = T' + str(alias[ans[x]['joins'][y].joins_to]['alias']) + '.' + ans[x]['joins'][y].id_2)
                else:
                    outfile.write('LEFT JOIN ' + ans[x]['joins'][y].joins_to + ' T' + str(alias[ans[x]['joins'][y].joins_to]['alias']) + ' ON T' + str(alias[x]['alias']) + '.' + ans[x]['joins'][y].id_1 + ' = T' + str(alias[ans[x]['joins'][y].joins_to]['alias']) + '.' + ans[x]['joins'][y].id_2)
                if not (ans[x]['joins'][y].where == '') and not (len(list(find_all(ans[x]['joins'][y].where, 'NULL'))) > 0):
                    outfile.write(' AND ' + ans[x]['joins'][y].where)
                outfile.write('\n')
            
    outfile.write('---------------------------------------------------\n')
    outfile.close()
    return ans

