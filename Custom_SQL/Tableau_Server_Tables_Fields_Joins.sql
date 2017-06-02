/*
Copyright June 2nd, 2017, Luke Brady, Cerner Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

MIT License: https://opensource.org/licenses/MIT

Pulled Tableau Server 10.1.4
https://onlinehelp.tableau.com/current/server/en-us/data_dictionary.html

How to use this File:
1)  Do a search using CTRL-F for the table you are interested in, ie: 'Table workbooks'
2)  Copy the desired fields from the SELECT and paste into you query tool of choice
3)  Copy the desired joins from the FROM and paste into you query tool of choice
4)  Do additional searches using CTRL-F for additional tables ie: 'Table users'
5)  Add the desired SELECT fields from those tables to your SELECT statement
6)  Add addtional commas to fields as needed in your SELECT
7)  Run your query

Known Issues:
* Some tables join to the same table twice, like '_views_stats' with 'users'
  **  In these cases you will have to rename the second table alias to a number of your choosing

* It is possible some fields do not exist which are present in the SELECT statements
  **  If found just remove them from your query

* Be sure to check if an INNER join or LEFT join is correct
  **  It's possible for rows to drop off where it is wrong
  **  If one is found please let me know as I will need to update the join list used to print out this file

*/

---------------------------------------------------
-- Table keychain_entries
SELECT DISTINCT
T106.asset_key_id AS "Asset_Key_ID (Keychain Entries)",
T106.created_at AS "Created_At (Keychain Entries)",
T106.entry_attributes AS "Entry_Attributes (Keychain Entries)",
T106.entry_db_class AS "Entry_Db_Class (Keychain Entries)",
T106.entry_db_subclass AS "Entry_Db_Subclass (Keychain Entries)",
T106.entry_username AS "Entry_Username (Keychain Entries)",
T106.entry_xml AS "Entry_Xml (Keychain Entries)",
T106.id AS "Id (Keychain Entries)",
T106.updated_at AS "Updated_At (Keychain Entries)",
T106.user_id AS "User_ID (Keychain Entries)"
FROM
keychain_entries T106
---------------------------------------------------
-- Table language_prefs
SELECT DISTINCT
T108.display_name AS "Display_Name (Lang Prefs)",
T108.display_order AS "Display_Order (Lang Prefs)",
T108.help_link AS "Help_Link (Lang Prefs)",
T108.language_id AS "Language_ID (Lang Prefs)",
T108.locale_id AS "Locale_ID (Lang Prefs)"
FROM
language_prefs T108
---------------------------------------------------
-- Table oauth_request_tokens
SELECT DISTINCT
T121.asset_key_id AS "Asset_Key_ID (OAuth Req Tokens)",
T121.created_at AS "Created_At (OAuth Req Tokens)",
T121.entry_db_class AS "Entry_Db_Class (OAuth Req Tokens)",
T121.entry_db_subclass AS "Entry_Db_Subclass (OAuth Req Tokens)",
T121.id AS "Id (OAuth Req Tokens)",
T121.is_used AS "Is_Used (OAuth Req Tokens)",
T121.request_token AS "Request_Token (OAuth Req Tokens)",
T121.request_token_secret_encrypted AS "Request_Token_Secret_Encrypted (OAuth Req Tokens)",
T121.updated_at AS "Updated_At (OAuth Req Tokens)"
FROM
oauth_request_tokens T121
---------------------------------------------------
-- Table data_connections
SELECT DISTINCT
T49.caption AS "Caption (Data Conns)",
T49.created_at AS "Created_At (Data Conns)",
T49.datasource_id AS "Datasource_ID (Data Conns)",
T49.db_subclass AS "Db_Subclass (Data Conns)",
T49.dbclass AS "Dbclass (Data Conns)",
T49.dbname AS "Dbname (Data Conns)",
T49.has_extract AS "Has_Extract (Data Conns)",
T49.id AS "Id (Data Conns)",
T49.keychain AS "Keychain (Data Conns)",
T49.luid AS "Luid (Data Conns)",
T49.name AS "Name (Data Conns)",
T49.owner_id AS "Owner_ID (Data Conns)",
T49.owner_type AS "Owner_Type (Data Conns)",
T49.password AS "Password (Data Conns)",
T49.port AS "Port (Data Conns)",
T49.server AS "Server (Data Conns)",
T49.site_id AS "Site_ID (Data Conns)",
T49.tablename AS "Tablename (Data Conns)",
T49.updated_at AS "Updated_At (Data Conns)",
T49.username AS "Username (Data Conns)"
FROM
data_connections T49
LEFT JOIN workbooks T301 ON T49.owner_id = T301.id AND data_connections.OWNER_TYPE = 'Workbook'
INNER JOIN sites T259 ON T49.site_id = T259.id
INNER JOIN datasources T55 ON T49.datasource_id = T55.id
LEFT JOIN datasources T55 ON T49.id = T55.owner_id AND data_connections.OWNER_TYPE = 'Datasource'
LEFT JOIN hist_data_connections T82 ON T49.id = T82.data_connection_id
LEFT JOIN most_recent_refreshes T116 ON T49.id = T116.data_connection_id
---------------------------------------------------
-- Table constraint_table_usage
SELECT DISTINCT
T44.constraint_catalog AS "Constraint_Catalog (Constr TBL Usage)",
T44.constraint_name AS "Constraint_Name (Constr TBL Usage)",
T44.constraint_schema AS "Constraint_Schema (Constr TBL Usage)",
T44.table_catalog AS "Table_Catalog (Constr TBL Usage)",
T44.table_name AS "Table_Name (Constr TBL Usage)",
T44.table_schema AS "Table_Schema (Constr TBL Usage)"
FROM
constraint_table_usage T44
---------------------------------------------------
-- Table tasks
SELECT DISTINCT
T278.active AS "Active (Tasks)",
T278.consecutive_failure_count AS "Consecutive_Failure_Count (Tasks)",
T278.created_at AS "Created_At (Tasks)",
T278.id AS "Id (Tasks)",
T278.luid AS "Luid (Tasks)",
T278.obj_id AS "Obj_ID (Tasks)",
T278.obj_type AS "Obj_Type (Tasks)",
T278.priority AS "Priority (Tasks)",
T278.schedule_id AS "Schedule_ID (Tasks)",
T278.site_id AS "Site_ID (Tasks)",
T278.type AS "Type (Tasks)",
T278.updated_at AS "Updated_At (Tasks)"
FROM
tasks T278
LEFT JOIN hist_tasks T90 ON T278.id = T90.task_id
INNER JOIN schedules T243 ON T278.schedule_id = T243.id
INNER JOIN sites T259 ON T278.site_id = T259.id
---------------------------------------------------
-- Table _sites
SELECT DISTINCT
T11.id AS "Id (_Sites)",
T11.name AS "Name (_Sites)",
T11.status AS "Status (_Sites)",
T11.url_namespace AS "Url_Namespace (_Sites)"
FROM
_sites T11
---------------------------------------------------
-- Table user_images
SELECT DISTINCT
T286.id AS "Id (User IMG)",
T286.image_id AS "Image_ID (User IMG)",
T286.image_type AS "Image_Type (User IMG)",
T286.repository_data_id AS "Repository_Data_ID (User IMG)",
T286.system_user_id AS "System_User_ID (User IMG)"
FROM
user_images T286
INNER JOIN repository_data T234 ON T286.repository_data_id = T234.id
INNER JOIN system_users T271 ON T286.system_user_id = T271.id
---------------------------------------------------
-- Table foreign_tables
SELECT DISTINCT
T75.foreign_server_catalog AS "Foreign_Server_Catalog (Foreign TBL)",
T75.foreign_server_name AS "Foreign_Server_Name (Foreign TBL)",
T75.foreign_table_catalog AS "Foreign_Table_Catalog (Foreign TBL)",
T75.foreign_table_name AS "Foreign_Table_Name (Foreign TBL)",
T75.foreign_table_schema AS "Foreign_Table_Schema (Foreign TBL)"
FROM
foreign_tables T75
---------------------------------------------------
-- Table projects_view_options
SELECT DISTINCT
T229.project_id AS "Project_ID (Projects VW Opt)",
T229.value AS "Value (Projects VW Opt)",
T229.view_option_id AS "View_Option_ID (Projects VW Opt)",
T229.view_option_key_id AS "View_Option_Key_ID (Projects VW Opt)"
FROM
projects_view_options T229
---------------------------------------------------
-- Table pg_statio_sys_sequences
SELECT DISTINCT
T205.blks_hit AS "Blks_Hit (PG Statio Sys Seq)",
T205.blks_read AS "Blks_Read (PG Statio Sys Seq)",
T205.relid AS "Relid (PG Statio Sys Seq)",
T205.relname AS "Relname (PG Statio Sys Seq)",
T205.schemaname AS "Schemaname (PG Statio Sys Seq)"
FROM
pg_statio_sys_sequences T205
---------------------------------------------------
-- Table site_saml_users
SELECT DISTINCT
T257.auth_user_id AS "Auth_User_ID (Site Saml Users)",
T257.authentication_type AS "Authentication_Type (Site Saml Users)",
T257.id AS "Id (Site Saml Users)",
T257.site_luid AS "Site_Luid (Site Saml Users)",
T257.user_name AS "User_Name (Site Saml Users)"
FROM
site_saml_users T257
LEFT JOIN sites T259 ON T257.site_luid = T259.luid
LEFT JOIN system_users T271 ON T257.auth_user_id = T271.id
---------------------------------------------------
-- Table refresh_tokens
SELECT DISTINCT
T232.client_id AS "Client_ID (Ref Tokens)",
T232.client_name AS "Client_Name (Ref Tokens)",
T232.expires_at AS "Expires_At (Ref Tokens)",
T232.guid AS "Guid (Ref Tokens)",
T232.hashed_secret AS "Hashed_Secret (Ref Tokens)",
T232.id AS "Id (Ref Tokens)",
T232.issued_at AS "Issued_At (Ref Tokens)",
T232.last_used_at AS "Last_Used_At (Ref Tokens)",
T232.next_hashed_secret AS "Next_Hashed_Secret (Ref Tokens)",
T232.next_salt AS "Next_Salt (Ref Tokens)",
T232.refresh_token_device_id AS "Refresh_Token_Device_ID (Ref Tokens)",
T232.salt AS "Salt (Ref Tokens)",
T232.session_id AS "Session_ID (Ref Tokens)",
T232.system_user_id AS "System_User_ID (Ref Tokens)"
FROM
refresh_tokens T232
INNER JOIN system_users T271 ON T232.system_user_id = T271.id
INNER JOIN refresh_token_devices T231 ON T232.refresh_token_device_id = T231.id
---------------------------------------------------
-- Table mobile_enrollments
SELECT DISTINCT
T113.height AS "Height (Mobile Enr)",
T113.id AS "Id (Mobile Enr)",
T113.last_enrolled_at AS "Last_Enrolled_At (Mobile Enr)",
T113.pixel_ratio AS "Pixel_Ratio (Mobile Enr)",
T113.user_id AS "User_ID (Mobile Enr)",
T113.width AS "Width (Mobile Enr)"
FROM
mobile_enrollments T113
INNER JOIN users T290 ON T113.user_id = T290.id
---------------------------------------------------
-- Table pg_aggregate
SELECT DISTINCT
T127.aggfinalextra AS "Aggfinalextra (PG Aggr)",
T127.aggfinalfn AS "Aggfinalfn (PG Aggr)",
T127.aggfnoid AS "Aggfnoid (PG Aggr)",
T127.agginitval AS "Agginitval (PG Aggr)",
T127.aggkind AS "Aggkind (PG Aggr)",
T127.aggmfinalextra AS "Aggmfinalextra (PG Aggr)",
T127.aggmfinalfn AS "Aggmfinalfn (PG Aggr)",
T127.aggminitval AS "Aggminitval (PG Aggr)",
T127.aggminvtransfn AS "Aggminvtransfn (PG Aggr)",
T127.aggmtransfn AS "Aggmtransfn (PG Aggr)",
T127.aggmtransspace AS "Aggmtransspace (PG Aggr)",
T127.aggmtranstype AS "Aggmtranstype (PG Aggr)",
T127.aggnumdirectargs AS "Aggnumdirectargs (PG Aggr)",
T127.aggsortop AS "Aggsortop (PG Aggr)",
T127.aggtransfn AS "Aggtransfn (PG Aggr)",
T127.aggtransspace AS "Aggtransspace (PG Aggr)",
T127.aggtranstype AS "Aggtranstype (PG Aggr)"
FROM
pg_aggregate T127
---------------------------------------------------
-- Table exportable_repository_id_columns
SELECT DISTINCT
T63.exportable_table_id AS "Exportable_Table_ID (Exp Rep ID Cols)",
T63.id AS "Id (Exp Rep ID Cols)",
T63.name AS "Name (Exp Rep ID Cols)",
T63.type AS "Type (Exp Rep ID Cols)"
FROM
exportable_repository_id_columns T63
---------------------------------------------------
-- Table _views
SELECT DISTINCT
T16.caption AS "Caption (_VW)",
T16.created_at AS "Created_At (_VW)",
T16.id AS "Id (_VW)",
T16.index AS "Index (_VW)",
T16.name AS "Name (_VW)",
T16.owner_id AS "Owner_ID (_VW)",
T16.owner_name AS "Owner_Name (_VW)",
T16.site_id AS "Site_ID (_VW)",
T16.title AS "Title (_VW)",
T16.view_url AS "View_Url (_VW)",
T16.workbook_id AS "Workbook_ID (_VW)"
FROM
_views T16
INNER JOIN users T290 ON T16.owner_id = T290.id
LEFT JOIN workbooks T301 ON T16.workbook_id = T301.id
INNER JOIN sites T259 ON T16.site_id = T259.id
---------------------------------------------------
-- Table global_settings
SELECT DISTINCT
T76.created_at AS "Created_At (Global Set)",
T76.default_value AS "Default_Value (Global Set)",
T76.description AS "Description (Global Set)",
T76.friendly_name AS "Friendly_Name (Global Set)",
T76.hidden AS "Hidden (Global Set)",
T76.id AS "Id (Global Set)",
T76.name AS "Name (Global Set)",
T76.setting_type AS "Setting_Type (Global Set)",
T76.sort_num AS "Sort_Num (Global Set)",
T76.updated_at AS "Updated_At (Global Set)",
T76.value AS "Value (Global Set)"
FROM
global_settings T76
---------------------------------------------------
-- Table pg_statio_user_tables
SELECT DISTINCT
T209.heap_blks_hit AS "Heap_Blks_Hit (PG Statio User TBL)",
T209.heap_blks_read AS "Heap_Blks_Read (PG Statio User TBL)",
T209.idx_blks_hit AS "Idx_Blks_Hit (PG Statio User TBL)",
T209.idx_blks_read AS "Idx_Blks_Read (PG Statio User TBL)",
T209.relid AS "Relid (PG Statio User TBL)",
T209.relname AS "Relname (PG Statio User TBL)",
T209.schemaname AS "Schemaname (PG Statio User TBL)",
T209.tidx_blks_hit AS "Tidx_Blks_Hit (PG Statio User TBL)",
T209.tidx_blks_read AS "Tidx_Blks_Read (PG Statio User TBL)",
T209.toast_blks_hit AS "Toast_Blks_Hit (PG Statio User TBL)",
T209.toast_blks_read AS "Toast_Blks_Read (PG Statio User TBL)"
FROM
pg_statio_user_tables T209
---------------------------------------------------
-- Table historical_events
SELECT DISTINCT
T96.created_at AS "Created_At (Hist Events)",
T96.details AS "Details (Hist Events)",
T96.duration_in_ms AS "Duration_In_Ms (Hist Events)",
T96.hist_actor_site_id AS "Hist_Actor_Site_ID (Hist Events)",
T96.hist_actor_user_id AS "Hist_Actor_User_ID (Hist Events)",
T96.hist_capability_id AS "Hist_Capability_ID (Hist Events)",
T96.hist_comment_id AS "Hist_Comment_ID (Hist Events)",
T96.hist_config_id AS "Hist_Config_ID (Hist Events)",
T96.hist_data_connection_id AS "Hist_Data_Connection_ID (Hist Events)",
T96.hist_datasource_id AS "Hist_Datasource_ID (Hist Events)",
T96.hist_group_id AS "Hist_Group_ID (Hist Events)",
T96.hist_licensing_role_id AS "Hist_Licensing_Role_ID (Hist Events)",
T96.hist_project_id AS "Hist_Project_ID (Hist Events)",
T96.hist_schedule_id AS "Hist_Schedule_ID (Hist Events)",
T96.hist_tag_id AS "Hist_Tag_ID (Hist Events)",
T96.hist_target_site_id AS "Hist_Target_Site_ID (Hist Events)",
T96.hist_target_user_id AS "Hist_Target_User_ID (Hist Events)",
T96.hist_task_id AS "Hist_Task_ID (Hist Events)",
T96.hist_view_id AS "Hist_View_ID (Hist Events)",
T96.hist_workbook_id AS "Hist_Workbook_ID (Hist Events)",
T96.historical_event_type_id AS "Historical_Event_Type_ID (Hist Events)",
T96.id AS "Id (Hist Events)",
T96.is_failure AS "Is_Failure (Hist Events)",
T96.worker AS "Worker (Hist Events)"
FROM
historical_events T96
INNER JOIN historical_event_types T95 ON T96.historical_event_type_id = T95.type_id
INNER JOIN hist_users T91 ON T96.hist_actor_user_id = T91.id
INNER JOIN hist_users T91 ON T96.hist_target_user_id = T91.id
INNER JOIN hist_sites T88 ON T96.hist_actor_site_id = T88.id
INNER JOIN hist_sites T88 ON T96.hist_target_site_id = T88.id
INNER JOIN hist_projects T86 ON T96.hist_project_id = T86.id
INNER JOIN hist_workbooks T93 ON T96.hist_workbook_id = T93.id
INNER JOIN hist_views T92 ON T96.hist_view_id = T92.id
INNER JOIN hist_datasources T83 ON T96.hist_datasource_id = T83.id
INNER JOIN hist_comments T80 ON T96.hist_comment_id = T80.id
INNER JOIN hist_tags T89 ON T96.hist_tag_id = T89.id
INNER JOIN hist_groups T84 ON T96.hist_group_id = T84.id
INNER JOIN hist_licensing_roles T85 ON T96.hist_licensing_role_id = T85.id
INNER JOIN hist_schedules T87 ON T96.hist_schedule_id = T87.id
INNER JOIN hist_tasks T90 ON T96.hist_task_id = T90.id
INNER JOIN hist_data_connections T82 ON T96.hist_data_connection_id = T82.id
INNER JOIN hist_configs T81 ON T96.hist_config_id = T81.id
INNER JOIN hist_capabilities T79 ON T96.hist_capability_id = T79.id
---------------------------------------------------
-- Table capability_roles
SELECT DISTINCT
T31.capability_id AS "Capability_ID (Cap Roles)",
T31.id AS "Id (Cap Roles)",
T31.role_id AS "Role_ID (Cap Roles)"
FROM
capability_roles T31
INNER JOIN capabilities T30 ON T31.capability_id = T30.id
INNER JOIN roles T240 ON T31.role_id = T240.id
---------------------------------------------------
-- Table sites
SELECT DISTINCT
T259.authoring_disabled AS "Authoring_Disabled (Sites)",
T259.content_admin_mode AS "Content_Admin_Mode (Sites)",
T259.content_version_limit AS "Content_Version_Limit (Sites)",
T259.created_at AS "Created_At (Sites)",
T259.custom_subscription_email AS "Custom_Subscription_Email (Sites)",
T259.custom_subscription_footer AS "Custom_Subscription_Footer (Sites)",
T259.guest_access_enabled AS "Guest_Access_Enabled (Sites)",
T259.id AS "Id (Sites)",
T259.livedb_connections_whitelist_enabled AS "Livedb_Connections_Whitelist_Enabled (Sites)",
T259.lock_version AS "Lock_Version (Sites)",
T259.luid AS "Luid (Sites)",
T259.metrics_level AS "Metrics_Level (Sites)",
T259.name AS "Name (Sites)",
T259.notification_enabled AS "Notification_Enabled (Sites)",
T259.query_limit AS "Query_Limit (Sites)",
T259.refresh_token_setting AS "Refresh_Token_Setting (Sites)",
T259.sheet_image_enabled AS "Sheet_Image_Enabled (Sites)",
T259.status AS "Status (Sites)",
T259.status_reason AS "Status_Reason (Sites)",
T259.storage_quota AS "Storage_Quota (Sites)",
T259.subscribe_others_enabled AS "Subscribe_Others_Enabled (Sites)",
T259.subscriptions_enabled AS "Subscriptions_Enabled (Sites)",
T259.support_access_enabled AS "Support_Access_Enabled (Sites)",
T259.updated_at AS "Updated_At (Sites)",
T259.url_namespace AS "Url_Namespace (Sites)",
T259.user_quota AS "User_Quota (Sites)",
T259.version_history_enabled AS "Version_History_Enabled (Sites)"
FROM
sites T259
INNER JOIN background_jobs T28 ON T259.id = T28.site_id
INNER JOIN customized_views T46 ON T259.id = T46.site_id
INNER JOIN data_alerts T47 ON T259.id = T47.site_id
INNER JOIN data_connections T49 ON T259.id = T49.site_id
INNER JOIN datasource_versions T54 ON T259.id = T54.site_id
INNER JOIN datasources T55 ON T259.id = T55.site_id
INNER JOIN groups T78 ON T259.id = T78.site_id
LEFT JOIN hist_sites T88 ON T259.id = T88.site_id
INNER JOIN http_requests T97 ON T259.id = T97.site_id
INNER JOIN projects T227 ON T259.id = T227.site_id
INNER JOIN remote_agents T233 ON T259.id = T233.site_id
INNER JOIN sessions T248 ON T259.id = T248.site_id
INNER JOIN site_logos T252 ON T259.id = T252.site_id
INNER JOIN site_saml_configurations T254 ON T259.luid = T254.site_luid
INNER JOIN site_saml_events T255 ON T259.luid = T255.site_luid
INNER JOIN site_saml_users T257 ON T259.luid = T257.site_luid
INNER JOIN subscriptions T267 ON T259.id = T267.site_id
INNER JOIN subscriptions_workbooks T270 ON T259.id = T270.site_id
INNER JOIN tags T277 ON T259.id = T277.site_id
INNER JOIN tasks T278 ON T259.id = T278.site_id
INNER JOIN trusted_tickets T281 ON T259.id = T281.site_id
INNER JOIN users T290 ON T259.id = T290.site_id
INNER JOIN views T297 ON T259.id = T297.site_id
INNER JOIN views_stats T298 ON T259.id = T298.site_id
INNER JOIN workbook_versions T300 ON T259.id = T300.site_id
INNER JOIN workbooks T301 ON T259.id = T301.site_id
INNER JOIN _background_tasks T1 ON T259.id = T1.site_id
INNER JOIN _comments T2 ON T259.id = T2.site_id
INNER JOIN _customized_views T3 ON T259.id = T3.site_id
INNER JOIN _datasources T4 ON T259.id = T4.site_id
INNER JOIN _datasources_stats T5 ON T259.id = T5.site_id
INNER JOIN _http_requests T7 ON T259.id = T7.site_id
INNER JOIN _projects T8 ON T259.id = T8.site_id
INNER JOIN _sessions T10 ON T259.id = T10.site_id
INNER JOIN _subscriptions T12 ON T259.id = T12.site_id
INNER JOIN _tags T14 ON T259.id = T14.site_id
INNER JOIN _users T15 ON T259.id = T15.site_id
INNER JOIN _views T16 ON T259.id = T16.site_id
INNER JOIN _views_stats T17 ON T259.id = T17.site_id
INNER JOIN _workbooks T18 ON T259.id = T18.site_id
---------------------------------------------------
-- Table managed_keychains
SELECT DISTINCT
T111.asset_key_id AS "Asset_Key_ID (Managed Keychains)",
T111.created_at AS "Created_At (Managed Keychains)",
T111.id AS "Id (Managed Keychains)",
T111.keychain AS "Keychain (Managed Keychains)",
T111.site_id AS "Site_ID (Managed Keychains)",
T111.updated_at AS "Updated_At (Managed Keychains)"
FROM
managed_keychains T111
---------------------------------------------------
-- Table view_metrics_aggregations
SELECT DISTINCT
T293.day_index AS "Day_Index (VW MEtric Aggr)",
T293.device_type AS "Device_Type (VW MEtric Aggr)",
T293.id AS "Id (VW MEtric Aggr)",
T293.month_index AS "Month_Index (VW MEtric Aggr)",
T293.view_count AS "View_Count (VW MEtric Aggr)",
T293.view_id AS "View_ID (VW MEtric Aggr)",
T293.year_index AS "Year_Index (VW MEtric Aggr)"
FROM
view_metrics_aggregations T293
INNER JOIN views T297 ON T293.view_id = T297.id
---------------------------------------------------
-- Table postgres_heartbeat
SELECT DISTINCT
T226.id AS "Id (PSQL Heartbeat)",
T226.last_update AS "Last_Update (PSQL Heartbeat)"
FROM
postgres_heartbeat T226
---------------------------------------------------
-- Table pg_event_trigger
SELECT DISTINCT
T148.evtenabled AS "Evtenabled (PG Event Trigger)",
T148.evtevent AS "Evtevent (PG Event Trigger)",
T148.evtfoid AS "Evtfoid (PG Event Trigger)",
T148.evtname AS "Evtname (PG Event Trigger)",
T148.evtowner AS "Evtowner (PG Event Trigger)",
T148.evttags AS "Evttags (PG Event Trigger)"
FROM
pg_event_trigger T148
---------------------------------------------------
-- Table mru_list_entries
SELECT DISTINCT
T117.id AS "Id (MRU List Entries)",
T117.mru_list_id AS "Mru_List_ID (MRU List Entries)",
T117.position AS "Position (MRU List Entries)",
T117.useable_id AS "Useable_ID (MRU List Entries)",
T117.useable_type AS "Useable_Type (MRU List Entries)",
T117.used_at AS "Used_At (MRU List Entries)",
T117.usedobj_name AS "Usedobj_Name (MRU List Entries)",
T117.usedobj_url AS "Usedobj_Url (MRU List Entries)"
FROM
mru_list_entries T117
INNER JOIN mru_lists T118 ON T117.mru_list_id = T118.id
---------------------------------------------------
-- Table pg_indexes
SELECT DISTINCT
T155.indexdef AS "Indexdef (PG IDXs)",
T155.indexname AS "Indexname (PG IDXs)",
T155.schemaname AS "Schemaname (PG IDXs)",
T155.tablename AS "Tablename (PG IDXs)",
T155.tablespace AS "Tablespace (PG IDXs)"
FROM
pg_indexes T155
---------------------------------------------------
-- Table pg_ts_config
SELECT DISTINCT
T217.cfgname AS "Cfgname (PG TS Config)",
T217.cfgnamespace AS "Cfgnamespace (PG TS Config)",
T217.cfgowner AS "Cfgowner (PG TS Config)",
T217.cfgparser AS "Cfgparser (PG TS Config)"
FROM
pg_ts_config T217
---------------------------------------------------
-- Table referential_constraints
SELECT DISTINCT
T230.constraint_catalog AS "Constraint_Catalog (Ref Contsr)",
T230.constraint_name AS "Constraint_Name (Ref Contsr)",
T230.constraint_schema AS "Constraint_Schema (Ref Contsr)",
T230.delete_rule AS "Delete_Rule (Ref Contsr)",
T230.match_option AS "Match_Option (Ref Contsr)",
T230.unique_constraint_catalog AS "Unique_Constraint_Catalog (Ref Contsr)",
T230.unique_constraint_name AS "Unique_Constraint_Name (Ref Contsr)",
T230.unique_constraint_schema AS "Unique_Constraint_Schema (Ref Contsr)",
T230.update_rule AS "Update_Rule (Ref Contsr)"
FROM
referential_constraints T230
---------------------------------------------------
-- Table sequences
SELECT DISTINCT
T246.cycle_option AS "Cycle_Option (Seq)",
T246.data_type AS "Data_Type (Seq)",
T246.increment AS "Increment (Seq)",
T246.maximum_value AS "Maximum_Value (Seq)",
T246.minimum_value AS "Minimum_Value (Seq)",
T246.numeric_precision AS "Numeric_Precision (Seq)",
T246.numeric_precision_radix AS "Numeric_Precision_Radix (Seq)",
T246.numeric_scale AS "Numeric_Scale (Seq)",
T246.sequence_catalog AS "Sequence_Catalog (Seq)",
T246.sequence_name AS "Sequence_Name (Seq)",
T246.sequence_schema AS "Sequence_Schema (Seq)",
T246.start_value AS "Start_Value (Seq)"
FROM
sequences T246
---------------------------------------------------
-- Table triggers
SELECT DISTINCT
T280.action_condition AS "Action_Condition (Triggers)",
T280.action_order AS "Action_Order (Triggers)",
T280.action_orientation AS "Action_Orientation (Triggers)",
T280.action_reference_new_row AS "Action_Reference_New_Row (Triggers)",
T280.action_reference_new_table AS "Action_Reference_New_Table (Triggers)",
T280.action_reference_old_row AS "Action_Reference_Old_Row (Triggers)",
T280.action_reference_old_table AS "Action_Reference_Old_Table (Triggers)",
T280.action_statement AS "Action_Statement (Triggers)",
T280.action_timing AS "Action_Timing (Triggers)",
T280.created AS "Created (Triggers)",
T280.event_manipulation AS "Event_Manipulation (Triggers)",
T280.event_object_catalog AS "Event_Object_Catalog (Triggers)",
T280.event_object_schema AS "Event_Object_Schema (Triggers)",
T280.event_object_table AS "Event_Object_Table (Triggers)",
T280.trigger_catalog AS "Trigger_Catalog (Triggers)",
T280.trigger_name AS "Trigger_Name (Triggers)",
T280.trigger_schema AS "Trigger_Schema (Triggers)"
FROM
triggers T280
---------------------------------------------------
-- Table enabled_roles
SELECT DISTINCT
T62.role_name AS "Role_Name (Enabled Roles)"
FROM
enabled_roles T62
---------------------------------------------------
-- Table pg_statio_all_sequences
SELECT DISTINCT
T202.blks_hit AS "Blks_Hit (PG Statio All Seq)",
T202.blks_read AS "Blks_Read (PG Statio All Seq)",
T202.relid AS "Relid (PG Statio All Seq)",
T202.relname AS "Relname (PG Statio All Seq)",
T202.schemaname AS "Schemaname (PG Statio All Seq)"
FROM
pg_statio_all_sequences T202
---------------------------------------------------
-- Table table_privileges
SELECT DISTINCT
T273.grantee AS "Grantee (TBL Privs)",
T273.grantor AS "Grantor (TBL Privs)",
T273.is_grantable AS "Is_Grantable (TBL Privs)",
T273.privilege_type AS "Privilege_Type (TBL Privs)",
T273.table_catalog AS "Table_Catalog (TBL Privs)",
T273.table_name AS "Table_Name (TBL Privs)",
T273.table_schema AS "Table_Schema (TBL Privs)",
T273.with_hierarchy AS "With_Hierarchy (TBL Privs)"
FROM
table_privileges T273
---------------------------------------------------
-- Table role_column_grants
SELECT DISTINCT
T235.column_name AS "Column_Name (Role Col Grants)",
T235.grantee AS "Grantee (Role Col Grants)",
T235.grantor AS "Grantor (Role Col Grants)",
T235.is_grantable AS "Is_Grantable (Role Col Grants)",
T235.privilege_type AS "Privilege_Type (Role Col Grants)",
T235.table_catalog AS "Table_Catalog (Role Col Grants)",
T235.table_name AS "Table_Name (Role Col Grants)",
T235.table_schema AS "Table_Schema (Role Col Grants)"
FROM
role_column_grants T235
---------------------------------------------------
-- Table column_privileges
SELECT DISTINCT
T39.column_name AS "Column_Name (Col Privs)",
T39.grantee AS "Grantee (Col Privs)",
T39.grantor AS "Grantor (Col Privs)",
T39.is_grantable AS "Is_Grantable (Col Privs)",
T39.privilege_type AS "Privilege_Type (Col Privs)",
T39.table_catalog AS "Table_Catalog (Col Privs)",
T39.table_name AS "Table_Name (Col Privs)",
T39.table_schema AS "Table_Schema (Col Privs)"
FROM
column_privileges T39
---------------------------------------------------
-- Table pg_largeobject_metadata
SELECT DISTINCT
T158.lomacl AS "Lomacl (PG Large Object)",
T158.lomowner AS "Lomowner (PG Large Object)"
FROM
pg_largeobject_metadata T158
---------------------------------------------------
-- Table pg_stat_xact_user_tables
SELECT DISTINCT
T200.idx_scan AS "Idx_Scan (PG Stat xAct User TBL)",
T200.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat xAct User TBL)",
T200.n_tup_del AS "N_Tup_Del (PG Stat xAct User TBL)",
T200.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat xAct User TBL)",
T200.n_tup_ins AS "N_Tup_Ins (PG Stat xAct User TBL)",
T200.n_tup_upd AS "N_Tup_Upd (PG Stat xAct User TBL)",
T200.relid AS "Relid (PG Stat xAct User TBL)",
T200.relname AS "Relname (PG Stat xAct User TBL)",
T200.schemaname AS "Schemaname (PG Stat xAct User TBL)",
T200.seq_scan AS "Seq_Scan (PG Stat xAct User TBL)",
T200.seq_tup_read AS "Seq_Tup_Read (PG Stat xAct User TBL)"
FROM
pg_stat_xact_user_tables T200
---------------------------------------------------
-- Table import_mappable_table_implicit_fks
SELECT DISTINCT
T98.column_name AS "Column_Name (Imp Map TBL Imp)",
T98.discriminator_column_name AS "Discriminator_Column_Name (Imp Map TBL Imp)",
T98.discriminator_column_value AS "Discriminator_Column_Value (Imp Map TBL Imp)",
T98.id AS "Id (Imp Map TBL Imp)",
T98.import_mappable_table_id AS "Import_Mappable_Table_ID (Imp Map TBL Imp)",
T98.table_name AS "Table_Name (Imp Map TBL Imp)"
FROM
import_mappable_table_implicit_fks T98
---------------------------------------------------
-- Table _datasources_stats
SELECT DISTINCT
T5.datasource_id AS "Datasource_ID (_DS Stats)",
T5.last_access_time AS "Last_Access_Time (_DS Stats)",
T5.nviews AS "Nviews (_DS Stats)",
T5.site_id AS "Site_ID (_DS Stats)"
FROM
_datasources_stats T5
INNER JOIN datasources T55 ON T5.datasource_id = T55.id
INNER JOIN sites T259 ON T5.site_id = T259.id
---------------------------------------------------
-- Table pg_statio_all_indexes
SELECT DISTINCT
T201.idx_blks_hit AS "Idx_Blks_Hit (PG Statio All IDX)",
T201.idx_blks_read AS "Idx_Blks_Read (PG Statio All IDX)",
T201.indexrelid AS "Indexrelid (PG Statio All IDX)",
T201.indexrelname AS "Indexrelname (PG Statio All IDX)",
T201.relid AS "Relid (PG Statio All IDX)",
T201.relname AS "Relname (PG Statio All IDX)",
T201.schemaname AS "Schemaname (PG Statio All IDX)"
FROM
pg_statio_all_indexes T201
---------------------------------------------------
-- Table capabilities
SELECT DISTINCT
T30.display_name AS "Display_Name (Cap)",
T30.display_order AS "Display_Order (Cap)",
T30.id AS "Id (Cap)",
T30.name AS "Name (Cap)"
FROM
capabilities T30
INNER JOIN capability_roles T31 ON T30.id = T31.capability_id
LEFT JOIN hist_capabilities T79 ON T30.id = T79.capability_id
INNER JOIN next_gen_permissions T120 ON T30.id = T120.capability_id
INNER JOIN permissions_templates T126 ON T30.id = T126.capability_id
---------------------------------------------------
-- Table pg_ts_template
SELECT DISTINCT
T221.tmplinit AS "Tmplinit (PG TS Templ)",
T221.tmpllexize AS "Tmpllexize (PG TS Templ)",
T221.tmplname AS "Tmplname (PG TS Templ)",
T221.tmplnamespace AS "Tmplnamespace (PG TS Templ)"
FROM
pg_ts_template T221
---------------------------------------------------
-- Table site_logos
SELECT DISTINCT
T252.created_at AS "Created_At (Site Logos)",
T252.height AS "Height (Site Logos)",
T252.id AS "Id (Site Logos)",
T252.mime_type AS "Mime_Type (Site Logos)",
T252.site_id AS "Site_ID (Site Logos)",
T252.storage_id AS "Storage_ID (Site Logos)",
T252.updated_at AS "Updated_At (Site Logos)",
T252.url AS "Url (Site Logos)",
T252.width AS "Width (Site Logos)"
FROM
site_logos T252
LEFT JOIN sites T259 ON T252.site_id = T259.id
---------------------------------------------------
-- Table _workbooks
SELECT DISTINCT
T18.created_at AS "Created_At (_WB)",
T18.domain_id AS "Domain_ID (_WB)",
T18.domain_name AS "Domain_Name (_WB)",
T18.id AS "Id (_WB)",
T18.name AS "Name (_WB)",
T18.owner_id AS "Owner_ID (_WB)",
T18.owner_name AS "Owner_Name (_WB)",
T18.project_id AS "Project_ID (_WB)",
T18.project_name AS "Project_Name (_WB)",
T18.site_id AS "Site_ID (_WB)",
T18.size AS "Size (_WB)",
T18.system_user_id AS "System_User_ID (_WB)",
T18.updated_at AS "Updated_At (_WB)",
T18.view_count AS "View_Count (_WB)",
T18.workbook_url AS "Workbook_Url (_WB)"
FROM
_workbooks T18
INNER JOIN users T290 ON T18.owner_id = T290.id
INNER JOIN projects T227 ON T18.project_id = T227.id
INNER JOIN system_users T271 ON T18.system_user_id = T271.id
INNER JOIN sites T259 ON T18.site_id = T259.id
INNER JOIN domains T60 ON T18.domain_id = T60.id
---------------------------------------------------
-- Table domain_constraints
SELECT DISTINCT
T58.constraint_catalog AS "Constraint_Catalog (Domain Constr)",
T58.constraint_name AS "Constraint_Name (Domain Constr)",
T58.constraint_schema AS "Constraint_Schema (Domain Constr)",
T58.domain_catalog AS "Domain_Catalog (Domain Constr)",
T58.domain_name AS "Domain_Name (Domain Constr)",
T58.domain_schema AS "Domain_Schema (Domain Constr)",
T58.initially_deferred AS "Initially_Deferred (Domain Constr)",
T58.is_deferrable AS "Is_Deferrable (Domain Constr)"
FROM
domain_constraints T58
---------------------------------------------------
-- Table dataengine_configurations
SELECT DISTINCT
T51.machine_ip AS "Machine_Ip (DE Config)",
T51.pipe_name AS "Pipe_Name (DE Config)",
T51.port AS "Port (DE Config)",
T51.state AS "State (DE Config)",
T51.updated_at AS "Updated_At (DE Config)"
FROM
dataengine_configurations T51
---------------------------------------------------
-- Table mru_lists
SELECT DISTINCT
T118.id AS "Id (MRU List)",
T118.list_type AS "List_Type (MRU List)",
T118.user_id AS "User_ID (MRU List)"
FROM
mru_lists T118
INNER JOIN mru_list_entries T117 ON T118.id = T117.mru_list_id
INNER JOIN users T290 ON T118.user_id = T290.id
---------------------------------------------------
-- Table data_alerts_recipients
SELECT DISTINCT
T48.data_alert_id AS "Data_Alert_ID (Data Alert Recip)",
T48.id AS "Id (Data Alert Recip)",
T48.recipient_id AS "Recipient_ID (Data Alert Recip)",
T48.recipient_type AS "Recipient_Type (Data Alert Recip)"
FROM
data_alerts_recipients T48
LEFT JOIN data_alerts T47 ON T48.data_alert_id = T47.id
---------------------------------------------------
-- Table pg_replication_origin
SELECT DISTINCT
T172.roident AS "Roident (PG Repl Origin)",
T172.roname AS "Roname (PG Repl Origin)"
FROM
pg_replication_origin T172
---------------------------------------------------
-- Table pg_policy
SELECT DISTINCT
T167.polcmd AS "Polcmd (PG Policy)",
T167.polname AS "Polname (PG Policy)",
T167.polqual AS "Polqual (PG Policy)",
T167.polrelid AS "Polrelid (PG Policy)",
T167.polroles AS "Polroles (PG Policy)",
T167.polwithcheck AS "Polwithcheck (PG Policy)"
FROM
pg_policy T167
---------------------------------------------------
-- Table local_names
SELECT DISTINCT
T110.id AS "Id (Local Names)",
T110.language_id AS "Language_ID (Local Names)",
T110.name AS "Name (Local Names)",
T110.obj_name AS "Obj_Name (Local Names)",
T110.obj_type AS "Obj_Type (Local Names)"
FROM
local_names T110
---------------------------------------------------
-- Table hist_licensing_roles
SELECT DISTINCT
T85.id AS "Id (Hist Lic Roles)",
T85.licensing_role_id AS "Licensing_Role_ID (Hist Lic Roles)",
T85.name AS "Name (Hist Lic Roles)"
FROM
hist_licensing_roles T85
LEFT JOIN licensing_roles T109 ON T85.licensing_role_id = T109.id
INNER JOIN hist_users T91 ON T85.licensing_role_id = T91.hist_licensing_role_id
INNER JOIN historical_events T96 ON T85.id = T96.hist_licensing_role_id
---------------------------------------------------
-- Table permissions_templates
SELECT DISTINCT
T126.capability_id AS "Capability_ID (Perm Templ)",
T126.grantee_id AS "Grantee_ID (Perm Templ)",
T126.grantee_type AS "Grantee_Type (Perm Templ)",
T126.id AS "Id (Perm Templ)",
T126.permission AS "Permission (Perm Templ)",
T126.project_id AS "Project_ID (Perm Templ)",
T126.template_type AS "Template_Type (Perm Templ)"
FROM
permissions_templates T126
INNER JOIN projects T227 ON T126.project_id = T227.id
LEFT JOIN users T290 ON T126.grantee_id = T290.id AND permissions_templates.grantee_type = 'User'
LEFT JOIN groups T78 ON T126.grantee_id = T78.id AND permissions_templates.grantee_type = 'Group'
INNER JOIN capabilities T30 ON T126.capability_id = T30.id
---------------------------------------------------
-- Table pg_inherits
SELECT DISTINCT
T156.inhparent AS "Inhparent (PG)",
T156.inhrelid AS "Inhrelid (PG)",
T156.inhseqno AS "Inhseqno (PG)"
FROM
pg_inherits T156
---------------------------------------------------
-- Table pg_stats
SELECT DISTINCT
T210.attname AS "Attname (PG Stats)",
T210.avg_width AS "Avg_Width (PG Stats)",
T210.correlation AS "Correlation (PG Stats)",
T210.elem_count_histogram AS "Elem_Count_Histogram (PG Stats)",
T210.histogram_bounds AS "Histogram_Bounds (PG Stats)",
T210.inherited AS "Inherited (PG Stats)",
T210.most_common_elem_freqs AS "Most_Common_Elem_Freqs (PG Stats)",
T210.most_common_elems AS "Most_Common_Elems (PG Stats)",
T210.most_common_freqs AS "Most_Common_Freqs (PG Stats)",
T210.most_common_vals AS "Most_Common_Vals (PG Stats)",
T210.n_distinct AS "N_Distinct (PG Stats)",
T210.null_frac AS "Null_Frac (PG Stats)",
T210.schemaname AS "Schemaname (PG Stats)",
T210.tablename AS "Tablename (PG Stats)"
FROM
pg_stats T210
---------------------------------------------------
-- Table schema_migrations
SELECT DISTINCT
T244.version AS "Version (Schema Migrations)"
FROM
schema_migrations T244
---------------------------------------------------
-- Table pg_stat_sys_tables
SELECT DISTINCT
T193.analyze_count AS "Analyze_Count (PG Stat Sys TBL)",
T193.autoanalyze_count AS "Autoanalyze_Count (PG Stat Sys TBL)",
T193.autovacuum_count AS "Autovacuum_Count (PG Stat Sys TBL)",
T193.idx_scan AS "Idx_Scan (PG Stat Sys TBL)",
T193.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat Sys TBL)",
T193.last_analyze AS "Last_Analyze (PG Stat Sys TBL)",
T193.last_autoanalyze AS "Last_Autoanalyze (PG Stat Sys TBL)",
T193.last_autovacuum AS "Last_Autovacuum (PG Stat Sys TBL)",
T193.last_vacuum AS "Last_Vacuum (PG Stat Sys TBL)",
T193.n_dead_tup AS "N_Dead_Tup (PG Stat Sys TBL)",
T193.n_live_tup AS "N_Live_Tup (PG Stat Sys TBL)",
T193.n_mod_since_analyze AS "N_Mod_Since_Analyze (PG Stat Sys TBL)",
T193.n_tup_del AS "N_Tup_Del (PG Stat Sys TBL)",
T193.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat Sys TBL)",
T193.n_tup_ins AS "N_Tup_Ins (PG Stat Sys TBL)",
T193.n_tup_upd AS "N_Tup_Upd (PG Stat Sys TBL)",
T193.relid AS "Relid (PG Stat Sys TBL)",
T193.relname AS "Relname (PG Stat Sys TBL)",
T193.schemaname AS "Schemaname (PG Stat Sys TBL)",
T193.seq_scan AS "Seq_Scan (PG Stat Sys TBL)",
T193.seq_tup_read AS "Seq_Tup_Read (PG Stat Sys TBL)",
T193.vacuum_count AS "Vacuum_Count (PG Stat Sys TBL)"
FROM
pg_stat_sys_tables T193
---------------------------------------------------
-- Table pg_statio_user_indexes
SELECT DISTINCT
T207.idx_blks_hit AS "Idx_Blks_Hit (PG Statio User IDX)",
T207.idx_blks_read AS "Idx_Blks_Read (PG Statio User IDX)",
T207.indexrelid AS "Indexrelid (PG Statio User IDX)",
T207.indexrelname AS "Indexrelname (PG Statio User IDX)",
T207.relid AS "Relid (PG Statio User IDX)",
T207.relname AS "Relname (PG Statio User IDX)",
T207.schemaname AS "Schemaname (PG Statio User IDX)"
FROM
pg_statio_user_indexes T207
---------------------------------------------------
-- Table hist_tasks
SELECT DISTINCT
T90.id AS "Id (Hist Tasks)",
T90.priority AS "Priority (Hist Tasks)",
T90.task_id AS "Task_ID (Hist Tasks)",
T90.type AS "Type (Hist Tasks)"
FROM
hist_tasks T90
LEFT JOIN tasks T278 ON T90.task_id = T278.id
INNER JOIN historical_events T96 ON T90.id = T96.hist_task_id
---------------------------------------------------
-- Table pg_settings
SELECT DISTINCT
T179.boot_val AS "Boot_Val (PG Settings)",
T179.category AS "Category (PG Settings)",
T179.context AS "Context (PG Settings)",
T179.enumvals AS "Enumvals (PG Settings)",
T179.extra_desc AS "Extra_Desc (PG Settings)",
T179.max_val AS "Max_Val (PG Settings)",
T179.min_val AS "Min_Val (PG Settings)",
T179.name AS "Name (PG Settings)",
T179.pending_restart AS "Pending_Restart (PG Settings)",
T179.reset_val AS "Reset_Val (PG Settings)",
T179.setting AS "Setting (PG Settings)",
T179.short_desc AS "Short_Desc (PG Settings)",
T179.source AS "Source (PG Settings)",
T179.sourcefile AS "Sourcefile (PG Settings)",
T179.sourceline AS "Sourceline (PG Settings)",
T179.unit AS "Unit (PG Settings)",
T179.vartype AS "Vartype (PG Settings)"
FROM
pg_settings T179
---------------------------------------------------
-- Table domain_udt_usage
SELECT DISTINCT
T59.domain_catalog AS "Domain_Catalog (Domain UDT Usage)",
T59.domain_name AS "Domain_Name (Domain UDT Usage)",
T59.domain_schema AS "Domain_Schema (Domain UDT Usage)",
T59.udt_catalog AS "Udt_Catalog (Domain UDT Usage)",
T59.udt_name AS "Udt_Name (Domain UDT Usage)",
T59.udt_schema AS "Udt_Schema (Domain UDT Usage)"
FROM
domain_udt_usage T59
---------------------------------------------------
-- Table pg_stat_replication
SELECT DISTINCT
T190.application_name AS "Application_Name (PG Stat Repl)",
T190.backend_start AS "Backend_Start (PG Stat Repl)",
T190.backend_xmin AS "Backend_Xmin (PG Stat Repl)",
T190.client_addr AS "Client_Addr (PG Stat Repl)",
T190.client_hostname AS "Client_Hostname (PG Stat Repl)",
T190.client_port AS "Client_Port (PG Stat Repl)",
T190.flush_location AS "Flush_Location (PG Stat Repl)",
T190.pid AS "Pid (PG Stat Repl)",
T190.replay_location AS "Replay_Location (PG Stat Repl)",
T190.sent_location AS "Sent_Location (PG Stat Repl)",
T190.state AS "State (PG Stat Repl)",
T190.sync_priority AS "Sync_Priority (PG Stat Repl)",
T190.sync_state AS "Sync_State (PG Stat Repl)",
T190.usename AS "Usename (PG Stat Repl)",
T190.usesysid AS "Usesysid (PG Stat Repl)",
T190.write_location AS "Write_Location (PG Stat Repl)"
FROM
pg_stat_replication T190
---------------------------------------------------
-- Table view_column_usage
SELECT DISTINCT
T292.column_name AS "Column_Name (VW Col Usage)",
T292.table_catalog AS "Table_Catalog (VW Col Usage)",
T292.table_name AS "Table_Name (VW Col Usage)",
T292.table_schema AS "Table_Schema (VW Col Usage)",
T292.view_catalog AS "View_Catalog (VW Col Usage)",
T292.view_name AS "View_Name (VW Col Usage)",
T292.view_schema AS "View_Schema (VW Col Usage)"
FROM
view_column_usage T292
---------------------------------------------------
-- Table pg_views
SELECT DISTINCT
T225.definition AS "Definition (PG VW)",
T225.schemaname AS "Schemaname (PG VW)",
T225.viewname AS "Viewname (PG VW)",
T225.viewowner AS "Viewowner (PG VW)"
FROM
pg_views T225
---------------------------------------------------
-- Table pg_description
SELECT DISTINCT
T146.classoid AS "Classoid (PG Descr)",
T146.description AS "Description (PG Descr)",
T146.objoid AS "Objoid (PG Descr)",
T146.objsubid AS "Objsubid (PG Descr)"
FROM
pg_description T146
---------------------------------------------------
-- Table pg_available_extension_versions
SELECT DISTINCT
T134.comment AS "Comment (PG Avail Ext Ver)",
T134.installed AS "Installed (PG Avail Ext Ver)",
T134.name AS "Name (PG Avail Ext Ver)",
T134.relocatable AS "Relocatable (PG Avail Ext Ver)",
T134.requires AS "Requires (PG Avail Ext Ver)",
T134.schema AS "Schema (PG Avail Ext Ver)",
T134.superuser AS "Superuser (PG Avail Ext Ver)",
T134.version AS "Version (PG Avail Ext Ver)"
FROM
pg_available_extension_versions T134
---------------------------------------------------
-- Table pg_ts_config_map
SELECT DISTINCT
T218.mapcfg AS "Mapcfg (PG TS Config Map)",
T218.mapdict AS "Mapdict (PG TS Config Map)",
T218.mapseqno AS "Mapseqno (PG TS Config Map)",
T218.maptokentype AS "Maptokentype (PG TS Config Map)"
FROM
pg_ts_config_map T218
---------------------------------------------------
-- Table constraint_column_usage
SELECT DISTINCT
T43.column_name AS "Column_Name (Constr Col Usage)",
T43.constraint_catalog AS "Constraint_Catalog (Constr Col Usage)",
T43.constraint_name AS "Constraint_Name (Constr Col Usage)",
T43.constraint_schema AS "Constraint_Schema (Constr Col Usage)",
T43.table_catalog AS "Table_Catalog (Constr Col Usage)",
T43.table_name AS "Table_Name (Constr Col Usage)",
T43.table_schema AS "Table_Schema (Constr Col Usage)"
FROM
constraint_column_usage T43
---------------------------------------------------
-- Table projects_view_option_rights
SELECT DISTINCT
T228.project_id AS "Project_ID (Projects VW Opt Rights)",
T228.view_option_key_id AS "View_Option_Key_ID (Projects VW Opt Rights)",
T228.view_option_right_id AS "View_Option_Right_ID (Projects VW Opt Rights)"
FROM
projects_view_option_rights T228
---------------------------------------------------
-- Table pg_stat_all_indexes
SELECT DISTINCT
T184.idx_scan AS "Idx_Scan (PG Stat All IDX)",
T184.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat All IDX)",
T184.idx_tup_read AS "Idx_Tup_Read (PG Stat All IDX)",
T184.indexrelid AS "Indexrelid (PG Stat All IDX)",
T184.indexrelname AS "Indexrelname (PG Stat All IDX)",
T184.relid AS "Relid (PG Stat All IDX)",
T184.relname AS "Relname (PG Stat All IDX)",
T184.schemaname AS "Schemaname (PG Stat All IDX)"
FROM
pg_stat_all_indexes T184
---------------------------------------------------
-- Table pg_roles
SELECT DISTINCT
T175.oid AS "Oid (PG Roles)",
T175.rolbypassrls AS "Rolbypassrls (PG Roles)",
T175.rolcanlogin AS "Rolcanlogin (PG Roles)",
T175.rolconfig AS "Rolconfig (PG Roles)",
T175.rolconnlimit AS "Rolconnlimit (PG Roles)",
T175.rolcreatedb AS "Rolcreatedb (PG Roles)",
T175.rolcreaterole AS "Rolcreaterole (PG Roles)",
T175.rolinherit AS "Rolinherit (PG Roles)",
T175.rolname AS "Rolname (PG Roles)",
T175.rolpassword AS "Rolpassword (PG Roles)",
T175.rolreplication AS "Rolreplication (PG Roles)",
T175.rolsuper AS "Rolsuper (PG Roles)",
T175.rolvaliduntil AS "Rolvaliduntil (PG Roles)"
FROM
pg_roles T175
---------------------------------------------------
-- Table pg_amop
SELECT DISTINCT
T129.amopfamily AS "Amopfamily (PG Amop)",
T129.amoplefttype AS "Amoplefttype (PG Amop)",
T129.amopmethod AS "Amopmethod (PG Amop)",
T129.amopopr AS "Amopopr (PG Amop)",
T129.amoppurpose AS "Amoppurpose (PG Amop)",
T129.amoprighttype AS "Amoprighttype (PG Amop)",
T129.amopsortfamily AS "Amopsortfamily (PG Amop)",
T129.amopstrategy AS "Amopstrategy (PG Amop)"
FROM
pg_amop T129
---------------------------------------------------
-- Table data_alerts
SELECT DISTINCT
T47.creator_id AS "Creator_ID (Data Alerts)",
T47.customized_view_id AS "Customized_View_ID (Data Alerts)",
T47.data_condition AS "Data_Condition (Data Alerts)",
T47.data_specification AS "Data_Specification (Data Alerts)",
T47.id AS "Id (Data Alerts)",
T47.last_triggered AS "Last_Triggered (Data Alerts)",
T47.luid AS "Luid (Data Alerts)",
T47.schedule_id AS "Schedule_ID (Data Alerts)",
T47.site_id AS "Site_ID (Data Alerts)",
T47.title AS "Title (Data Alerts)",
T47.view_id AS "View_ID (Data Alerts)",
T47.workbook_id AS "Workbook_ID (Data Alerts)"
FROM
data_alerts T47
LEFT JOIN users T290 ON T47.creator_id = T290.id
LEFT JOIN data_alerts_recipients T48 ON T47.id = T48.data_alert_id
---------------------------------------------------
-- Table pg_statio_sys_tables
SELECT DISTINCT
T206.heap_blks_hit AS "Heap_Blks_Hit (PG Statio Sys TBL)",
T206.heap_blks_read AS "Heap_Blks_Read (PG Statio Sys TBL)",
T206.idx_blks_hit AS "Idx_Blks_Hit (PG Statio Sys TBL)",
T206.idx_blks_read AS "Idx_Blks_Read (PG Statio Sys TBL)",
T206.relid AS "Relid (PG Statio Sys TBL)",
T206.relname AS "Relname (PG Statio Sys TBL)",
T206.schemaname AS "Schemaname (PG Statio Sys TBL)",
T206.tidx_blks_hit AS "Tidx_Blks_Hit (PG Statio Sys TBL)",
T206.tidx_blks_read AS "Tidx_Blks_Read (PG Statio Sys TBL)",
T206.toast_blks_hit AS "Toast_Blks_Hit (PG Statio Sys TBL)",
T206.toast_blks_read AS "Toast_Blks_Read (PG Statio Sys TBL)"
FROM
pg_statio_sys_tables T206
---------------------------------------------------
-- Table historical_event_types
SELECT DISTINCT
T95.action_type AS "Action_Type (Hist Event Types)",
T95.name AS "Name (Hist Event Types)",
T95.type_id AS "Type_ID (Hist Event Types)"
FROM
historical_event_types T95
INNER JOIN historical_events T96 ON T95.type_id = T96.historical_event_type_id
LEFT JOIN most_recent_refreshes T116 ON T95.id = T116.historical_event_type_id
---------------------------------------------------
-- Table permission_reasons
SELECT DISTINCT
T125.precedence AS "Precedence (Perm Reasons)",
T125.reason AS "Reason (Perm Reasons)"
FROM
permission_reasons T125
---------------------------------------------------
-- Table pg_am
SELECT DISTINCT
T128.ambeginscan AS "Ambeginscan (PG AM)",
T128.ambuild AS "Ambuild (PG AM)",
T128.ambuildempty AS "Ambuildempty (PG AM)",
T128.ambulkdelete AS "Ambulkdelete (PG AM)",
T128.amcanbackward AS "Amcanbackward (PG AM)",
T128.amcanmulticol AS "Amcanmulticol (PG AM)",
T128.amcanorder AS "Amcanorder (PG AM)",
T128.amcanorderbyop AS "Amcanorderbyop (PG AM)",
T128.amcanreturn AS "Amcanreturn (PG AM)",
T128.amcanunique AS "Amcanunique (PG AM)",
T128.amclusterable AS "Amclusterable (PG AM)",
T128.amcostestimate AS "Amcostestimate (PG AM)",
T128.amendscan AS "Amendscan (PG AM)",
T128.amgetbitmap AS "Amgetbitmap (PG AM)",
T128.amgettuple AS "Amgettuple (PG AM)",
T128.aminsert AS "Aminsert (PG AM)",
T128.amkeytype AS "Amkeytype (PG AM)",
T128.ammarkpos AS "Ammarkpos (PG AM)",
T128.amname AS "Amname (PG AM)",
T128.amoptionalkey AS "Amoptionalkey (PG AM)",
T128.amoptions AS "Amoptions (PG AM)",
T128.ampredlocks AS "Ampredlocks (PG AM)",
T128.amrescan AS "Amrescan (PG AM)",
T128.amrestrpos AS "Amrestrpos (PG AM)",
T128.amsearcharray AS "Amsearcharray (PG AM)",
T128.amsearchnulls AS "Amsearchnulls (PG AM)",
T128.amstorage AS "Amstorage (PG AM)",
T128.amstrategies AS "Amstrategies (PG AM)",
T128.amsupport AS "Amsupport (PG AM)",
T128.amvacuumcleanup AS "Amvacuumcleanup (PG AM)"
FROM
pg_am T128
---------------------------------------------------
-- Table pg_stat_ssl
SELECT DISTINCT
T191.bits AS "Bits (PG Stat SSL)",
T191.cipher AS "Cipher (PG Stat SSL)",
T191.clientdn AS "Clientdn (PG Stat SSL)",
T191.compression AS "Compression (PG Stat SSL)",
T191.pid AS "Pid (PG Stat SSL)",
T191.ssl AS "Ssl (PG Stat SSL)",
T191.version AS "Version (PG Stat SSL)"
FROM
pg_stat_ssl T191
---------------------------------------------------
-- Table pg_group
SELECT DISTINCT
T153.grolist AS "Grolist (PG Group)",
T153.groname AS "Groname (PG Group)",
T153.grosysid AS "Grosysid (PG Group)"
FROM
pg_group T153
---------------------------------------------------
-- Table column_udt_usage
SELECT DISTINCT
T40.column_name AS "Column_Name (Col UDT Usage)",
T40.table_catalog AS "Table_Catalog (Col UDT Usage)",
T40.table_name AS "Table_Name (Col UDT Usage)",
T40.table_schema AS "Table_Schema (Col UDT Usage)",
T40.udt_catalog AS "Udt_Catalog (Col UDT Usage)",
T40.udt_name AS "Udt_Name (Col UDT Usage)",
T40.udt_schema AS "Udt_Schema (Col UDT Usage)"
FROM
column_udt_usage T40
---------------------------------------------------
-- Table pg_timezone_names
SELECT DISTINCT
T214.abbrev AS "Abbrev (PG Timezone Names)",
T214.is_dst AS "Is_Dst (PG Timezone Names)",
T214.name AS "Name (PG Timezone Names)",
T214.utc_offset AS "Utc_Offset (PG Timezone Names)"
FROM
pg_timezone_names T214
---------------------------------------------------
-- Table hist_schedules
SELECT DISTINCT
T87.day_of_month_mask AS "Day_Of_Month_Mask (Hist Sched)",
T87.day_of_week_mask AS "Day_Of_Week_Mask (Hist Sched)",
T87.end_at_minute AS "End_At_Minute (Hist Sched)",
T87.end_schedule_at AS "End_Schedule_At (Hist Sched)",
T87.id AS "Id (Hist Sched)",
T87.is_serial AS "Is_Serial (Hist Sched)",
T87.minute_interval AS "Minute_Interval (Hist Sched)",
T87.name AS "Name (Hist Sched)",
T87.priority AS "Priority (Hist Sched)",
T87.schedule_id AS "Schedule_ID (Hist Sched)",
T87.schedule_type AS "Schedule_Type (Hist Sched)",
T87.scheduled_action AS "Scheduled_Action (Hist Sched)",
T87.start_at_minute AS "Start_At_Minute (Hist Sched)"
FROM
hist_schedules T87
LEFT JOIN schedules T243 ON T87.schedule_id = T243.id
INNER JOIN historical_events T96 ON T87.id = T96.hist_schedule_id
---------------------------------------------------
-- Table hist_workbooks
SELECT DISTINCT
T93.id AS "Id (Hist WB)",
T93.name AS "Name (Hist WB)",
T93.repository_url AS "Repository_Url (Hist WB)",
T93.revision AS "Revision (Hist WB)",
T93.size AS "Size (Hist WB)",
T93.workbook_id AS "Workbook_ID (Hist WB)"
FROM
hist_workbooks T93
LEFT JOIN workbooks T301 ON T93.workbook_id = T301.id
INNER JOIN historical_events T96 ON T93.id = T96.hist_workbook_id
---------------------------------------------------
-- Table pg_foreign_table
SELECT DISTINCT
T152.ftoptions AS "Ftoptions (PG Foreign TBL)",
T152.ftrelid AS "Ftrelid (PG Foreign TBL)",
T152.ftserver AS "Ftserver (PG Foreign TBL)"
FROM
pg_foreign_table T152
---------------------------------------------------
-- Table next_gen_permissions
SELECT DISTINCT
T120.authorizable_id AS "Authorizable_ID (Next Gen Perm)",
T120.authorizable_type AS "Authorizable_Type (Next Gen Perm)",
T120.capability_id AS "Capability_ID (Next Gen Perm)",
T120.grantee_id AS "Grantee_ID (Next Gen Perm)",
T120.grantee_type AS "Grantee_Type (Next Gen Perm)",
T120.id AS "Id (Next Gen Perm)",
T120.permission AS "Permission (Next Gen Perm)"
FROM
next_gen_permissions T120
LEFT JOIN workbooks T301 ON T120.authorizable_id = T301.id AND next_gen_permissions.authorizable_type = 'Workbook'
LEFT JOIN projects T227 ON T120.authorizable_id = T227.id AND next_gen_permissions.authorizable_type = 'Project'
LEFT JOIN views T297 ON T120.authorizable_id = T297.id AND next_gen_permissions.authorizable_type = 'View'
LEFT JOIN datasources T55 ON T120.authorizable_id = T55.id AND next_gen_permissions.authorizable_type = 'Datasource'
LEFT JOIN users T290 ON T120.grantee_id = T290.id AND next_gen_permissions.next_gen_permissions.grantee_type = 'User'
LEFT JOIN groups T78 ON T120.grantee_id = T78.id AND next_gen_permissions.next_gen_permissions.grantee_type = 'Group'
INNER JOIN capabilities T30 ON T120.capability_id = T30.id
---------------------------------------------------
-- Table remote_agents
SELECT DISTINCT
T233.device_id AS "Device_ID (Remote Agents)",
T233.id AS "Id (Remote Agents)",
T233.name AS "Name (Remote Agents)",
T233.owner_id AS "Owner_ID (Remote Agents)",
T233.schedules_synced_at AS "Schedules_Synced_At (Remote Agents)",
T233.site_id AS "Site_ID (Remote Agents)",
T233.time_zone_id AS "Time_Zone_ID (Remote Agents)"
FROM
remote_agents T233
LEFT JOIN datasource_refresh_properties T53 ON T233.id = T53.remote_agent_id
LEFT JOIN datasources T55 ON T233.id = T55.remote_query_agent_id
LEFT JOIN users T290 ON T233.owner_id = T290.id
LEFT JOIN sites T259 ON T233.site_id = T259.id
---------------------------------------------------
-- Table import_mapping_excluded_system_users
SELECT DISTINCT
T101.domain_name AS "Domain_Name (Imp Map Excl Sys Users)",
T101.id AS "Id (Imp Map Excl Sys Users)",
T101.user_name AS "User_Name (Imp Map Excl Sys Users)"
FROM
import_mapping_excluded_system_users T101
---------------------------------------------------
-- Table customized_views
SELECT DISTINCT
T46.created_at AS "Created_At (Cust VW)",
T46.creator_id AS "Creator_ID (Cust VW)",
T46.data_id AS "Data_ID (Cust VW)",
T46.description AS "Description (Cust VW)",
T46.id AS "Id (Cust VW)",
T46.luid AS "Luid (Cust VW)",
T46.name AS "Name (Cust VW)",
T46.public AS "Public (Cust VW)",
T46.repository_data_id AS "Repository_Data_ID (Cust VW)",
T46.repository_thumbnail_data_id AS "Repository_Thumbnail_Data_ID (Cust VW)",
T46.repository_url AS "Repository_Url (Cust VW)",
T46.site_id AS "Site_ID (Cust VW)",
T46.size AS "Size (Cust VW)",
T46.start_view_id AS "Start_View_ID (Cust VW)",
T46.thumbnail_id AS "Thumbnail_ID (Cust VW)",
T46.updated_at AS "Updated_At (Cust VW)",
T46.url_id AS "Url_ID (Cust VW)",
T46.view_id AS "View_ID (Cust VW)"
FROM
customized_views T46
INNER JOIN views T297 ON T46.view_id = T297.id
INNER JOIN users T290 ON T46.creator_id = T290.id
INNER JOIN sites T259 ON T46.site_id = T259.id
INNER JOIN repository_data T234 ON T46.repository_data_id = T234.id
INNER JOIN repository_data T234 ON T46.repository_thumbnail_data_id = T234.id
INNER JOIN views T297 ON T46.start_view_id = T297.id
INNER JOIN sheet_images T251 ON T46.id = T251.customized_view_id
INNER JOIN subscriptions_customized_views T268 ON T46.id = T268.customized_view_id
INNER JOIN user_default_customized_views T284 ON T46.id = T284.customized_view_id
---------------------------------------------------
-- Table pg_attribute
SELECT DISTINCT
T132.attacl AS "Attacl (PG Attr)",
T132.attalign AS "Attalign (PG Attr)",
T132.attbyval AS "Attbyval (PG Attr)",
T132.attcacheoff AS "Attcacheoff (PG Attr)",
T132.attcollation AS "Attcollation (PG Attr)",
T132.attfdwoptions AS "Attfdwoptions (PG Attr)",
T132.atthasdef AS "Atthasdef (PG Attr)",
T132.attinhcount AS "Attinhcount (PG Attr)",
T132.attisdropped AS "Attisdropped (PG Attr)",
T132.attislocal AS "Attislocal (PG Attr)",
T132.attlen AS "Attlen (PG Attr)",
T132.attname AS "Attname (PG Attr)",
T132.attndims AS "Attndims (PG Attr)",
T132.attnotnull AS "Attnotnull (PG Attr)",
T132.attnum AS "Attnum (PG Attr)",
T132.attoptions AS "Attoptions (PG Attr)",
T132.attrelid AS "Attrelid (PG Attr)",
T132.attstattarget AS "Attstattarget (PG Attr)",
T132.attstorage AS "Attstorage (PG Attr)",
T132.atttypid AS "Atttypid (PG Attr)",
T132.atttypmod AS "Atttypmod (PG Attr)"
FROM
pg_attribute T132
---------------------------------------------------
-- Table pg_range
SELECT DISTINCT
T171.rngcanonical AS "Rngcanonical (PG Range)",
T171.rngcollation AS "Rngcollation (PG Range)",
T171.rngsubdiff AS "Rngsubdiff (PG Range)",
T171.rngsubopc AS "Rngsubopc (PG Range)",
T171.rngsubtype AS "Rngsubtype (PG Range)",
T171.rngtypid AS "Rngtypid (PG Range)"
FROM
pg_range T171
---------------------------------------------------
-- Table pg_stat_user_functions
SELECT DISTINCT
T194.calls AS "Calls (PG Stat User Funct)",
T194.funcid AS "Funcid (PG Stat User Funct)",
T194.funcname AS "Funcname (PG Stat User Funct)",
T194.schemaname AS "Schemaname (PG Stat User Funct)",
T194.self_time AS "Self_Time (PG Stat User Funct)",
T194.total_time AS "Total_Time (PG Stat User Funct)"
FROM
pg_stat_user_functions T194
---------------------------------------------------
-- Table schedules
SELECT DISTINCT
T243.active AS "Active (Schedules)",
T243.created_at AS "Created_At (Schedules)",
T243.day_of_month_mask AS "Day_Of_Month_Mask (Schedules)",
T243.day_of_week_mask AS "Day_Of_Week_Mask (Schedules)",
T243.defined_by AS "Defined_By (Schedules)",
T243.end_at_minute AS "End_At_Minute (Schedules)",
T243.end_schedule_at AS "End_Schedule_At (Schedules)",
T243.hidden AS "Hidden (Schedules)",
T243.id AS "Id (Schedules)",
T243.lock_version AS "Lock_Version (Schedules)",
T243.luid AS "Luid (Schedules)",
T243.minute_interval AS "Minute_Interval (Schedules)",
T243.name AS "Name (Schedules)",
T243.priority AS "Priority (Schedules)",
T243.run_next_at AS "Run_Next_At (Schedules)",
T243.schedule_type AS "Schedule_Type (Schedules)",
T243.scheduled_action AS "Scheduled_Action (Schedules)",
T243.serial_collection_id AS "Serial_Collection_ID (Schedules)",
T243.start_at_minute AS "Start_At_Minute (Schedules)",
T243.updated_at AS "Updated_At (Schedules)"
FROM
schedules T243
INNER JOIN data_alerts T47 ON T243.id = T47.schedule_id
LEFT JOIN hist_schedules T87 ON T243.id = T87.schedule_id
INNER JOIN serial_collections T247 ON T243.serial_collection_id = T247.id
INNER JOIN subscriptions T267 ON T243.id = T267.schedule_id
INNER JOIN tasks T278 ON T243.id = T278.schedule_id
---------------------------------------------------
-- Table pg_trigger
SELECT DISTINCT
T216.tgargs AS "Tgargs (PG Trigger)",
T216.tgattr AS "Tgattr (PG Trigger)",
T216.tgconstraint AS "Tgconstraint (PG Trigger)",
T216.tgconstrindid AS "Tgconstrindid (PG Trigger)",
T216.tgconstrrelid AS "Tgconstrrelid (PG Trigger)",
T216.tgdeferrable AS "Tgdeferrable (PG Trigger)",
T216.tgenabled AS "Tgenabled (PG Trigger)",
T216.tgfoid AS "Tgfoid (PG Trigger)",
T216.tginitdeferred AS "Tginitdeferred (PG Trigger)",
T216.tgisinternal AS "Tgisinternal (PG Trigger)",
T216.tgname AS "Tgname (PG Trigger)",
T216.tgnargs AS "Tgnargs (PG Trigger)",
T216.tgqual AS "Tgqual (PG Trigger)",
T216.tgrelid AS "Tgrelid (PG Trigger)",
T216.tgtype AS "Tgtype (PG Trigger)"
FROM
pg_trigger T216
---------------------------------------------------
-- Table users
SELECT DISTINCT
T290.admin_level AS "Admin_Level (Users)",
T290.created_at AS "Created_At (Users)",
T290.extracts_required AS "Extracts_Required (Users)",
T290.id AS "Id (Users)",
T290.licensing_role_id AS "Licensing_Role_ID (Users)",
T290.lock_version AS "Lock_Version (Users)",
T290.login_at AS "Login_At (Users)",
T290.luid AS "Luid (Users)",
T290.nonce AS "Nonce (Users)",
T290.publisher_tristate AS "Publisher_Tristate (Users)",
T290.raw_data_suppressor_tristate AS "Raw_Data_Suppressor_Tristate (Users)",
T290.row_limit AS "Row_Limit (Users)",
T290.site_id AS "Site_ID (Users)",
T290.storage_limit AS "Storage_Limit (Users)",
T290.system_admin_auto AS "System_Admin_Auto (Users)",
T290.system_user_id AS "System_User_ID (Users)",
T290.updated_at AS "Updated_At (Users)"
FROM
users T290
INNER JOIN data_alerts T47 ON T290.id = T47.creator_id
INNER JOIN datasources T55 ON T290.id = T55.owner_id
INNER JOIN group_users T77 ON T290.id = T77.user_id
INNER JOIN groups T78 ON T290.id = T78.owner_id
LEFT JOIN hist_users T91 ON T290.id = T91.user_id
INNER JOIN http_requests T97 ON T290.id = T97.user_id
INNER JOIN http_requests T97 ON T290.id = T97.owner_id
INNER JOIN mobile_enrollments T113 ON T290.id = T113.user_id
INNER JOIN mru_lists T118 ON T290.id = T118.user_id
LEFT JOIN next_gen_permissions T120 ON T290.id = T120.grantee_id AND next_gen_permissions.next_gen_permissions.grantee_type = 'User'
LEFT JOIN permissions_templates T126 ON T290.id = T126.grantee_id AND permissions_templates.grantee_type = 'User'
INNER JOIN projects T227 ON T290.id = T227.owner_id
INNER JOIN remote_agents T233 ON T290.id = T233.owner_id
LEFT JOIN roles T240 ON T290.id = T240.creator_id
INNER JOIN sessions T248 ON T290.id = T248.user_id
INNER JOIN sheet_images T251 ON T290.id = T251.generated_as_user_id
INNER JOIN site_user_prefs T258 ON T290.id = T258.user_id
INNER JOIN subscriptions T267 ON T290.id = T267.user_id
INNER JOIN subscriptions T267 ON T290.id = T267.creator_id
INNER JOIN taggings T276 ON T290.id = T276.user_id
INNER JOIN trusted_tickets T281 ON T290.id = T281.user_id
INNER JOIN user_default_customized_views T284 ON T290.id = T284.user_id
LEFT JOIN licensing_roles T109 ON T290.licensing_role_id = T109.id
INNER JOIN sites T259 ON T290.site_id = T259.id
INNER JOIN system_users T271 ON T290.system_user_id = T271.id
INNER JOIN views T297 ON T290.id = T297.owner_id
INNER JOIN views_stats T298 ON T290.id = T298.user_id
LEFT JOIN workbook_versions T300 ON T290.id = T300.publisher_id
INNER JOIN workbooks T301 ON T290.id = T301.owner_id
INNER JOIN _comments T2 ON T290.id = T2.user_id
INNER JOIN _datasources T4 ON T290.id = T4.owner_id
INNER JOIN _http_requests T7 ON T290.id = T7.user_id
INNER JOIN _projects T8 ON T290.id = T8.owner_id
INNER JOIN _sessions T10 ON T290.id = T10.user_id
INNER JOIN _subscriptions T12 ON T290.id = T12.user_id
INNER JOIN _tags T14 ON T290.id = T14.user_id
INNER JOIN _views T16 ON T290.id = T16.owner_id
INNER JOIN _views_stats T17 ON T290.id = T17.users_id
INNER JOIN _views_stats T17 ON T290.id = T17.views_owner_id
INNER JOIN _workbooks T18 ON T290.id = T18.owner_id
---------------------------------------------------
-- Table deleted_objects
SELECT DISTINCT
T56.base_id AS "Base_ID (Del Object)",
T56.base_type AS "Base_Type (Del Object)",
T56.id AS "Id (Del Object)",
T56.updated_at AS "Updated_At (Del Object)",
T56.uuid AS "Uuid (Del Object)"
FROM
deleted_objects T56
---------------------------------------------------
-- Table role_routine_grants
SELECT DISTINCT
T236.grantee AS "Grantee (Role Routine Grants)",
T236.grantor AS "Grantor (Role Routine Grants)",
T236.is_grantable AS "Is_Grantable (Role Routine Grants)",
T236.privilege_type AS "Privilege_Type (Role Routine Grants)",
T236.routine_catalog AS "Routine_Catalog (Role Routine Grants)",
T236.routine_name AS "Routine_Name (Role Routine Grants)",
T236.routine_schema AS "Routine_Schema (Role Routine Grants)",
T236.specific_catalog AS "Specific_Catalog (Role Routine Grants)",
T236.specific_name AS "Specific_Name (Role Routine Grants)",
T236.specific_schema AS "Specific_Schema (Role Routine Grants)"
FROM
role_routine_grants T236
---------------------------------------------------
-- Table triggered_update_columns
SELECT DISTINCT
T279.event_object_catalog AS "Event_Object_Catalog (Trig UPD Col)",
T279.event_object_column AS "Event_Object_Column (Trig UPD Col)",
T279.event_object_schema AS "Event_Object_Schema (Trig UPD Col)",
T279.event_object_table AS "Event_Object_Table (Trig UPD Col)",
T279.trigger_catalog AS "Trigger_Catalog (Trig UPD Col)",
T279.trigger_name AS "Trigger_Name (Trig UPD Col)",
T279.trigger_schema AS "Trigger_Schema (Trig UPD Col)"
FROM
triggered_update_columns T279
---------------------------------------------------
-- Table parameters
SELECT DISTINCT
T122.as_locator AS "As_Locator (Params)",
T122.character_maximum_length AS "Character_Maximum_Length (Params)",
T122.character_octet_length AS "Character_Octet_Length (Params)",
T122.character_set_catalog AS "Character_Set_Catalog (Params)",
T122.character_set_name AS "Character_Set_Name (Params)",
T122.character_set_schema AS "Character_Set_Schema (Params)",
T122.collation_catalog AS "Collation_Catalog (Params)",
T122.collation_name AS "Collation_Name (Params)",
T122.collation_schema AS "Collation_Schema (Params)",
T122.data_type AS "Data_Type (Params)",
T122.datetime_precision AS "Datetime_Precision (Params)",
T122.dtd_identifier AS "Dtd_Identifier (Params)",
T122.interval_precision AS "Interval_Precision (Params)",
T122.interval_type AS "Interval_Type (Params)",
T122.is_result AS "Is_Result (Params)",
T122.maximum_cardinality AS "Maximum_Cardinality (Params)",
T122.numeric_precision AS "Numeric_Precision (Params)",
T122.numeric_precision_radix AS "Numeric_Precision_Radix (Params)",
T122.numeric_scale AS "Numeric_Scale (Params)",
T122.ordinal_position AS "Ordinal_Position (Params)",
T122.parameter_default AS "Parameter_Default (Params)",
T122.parameter_mode AS "Parameter_Mode (Params)",
T122.parameter_name AS "Parameter_Name (Params)",
T122.scope_catalog AS "Scope_Catalog (Params)",
T122.scope_name AS "Scope_Name (Params)",
T122.scope_schema AS "Scope_Schema (Params)",
T122.specific_catalog AS "Specific_Catalog (Params)",
T122.specific_name AS "Specific_Name (Params)",
T122.specific_schema AS "Specific_Schema (Params)",
T122.udt_catalog AS "Udt_Catalog (Params)",
T122.udt_name AS "Udt_Name (Params)",
T122.udt_schema AS "Udt_Schema (Params)"
FROM
parameters T122
---------------------------------------------------
-- Table check_constraint_routine_usage
SELECT DISTINCT
T33.constraint_catalog AS "Constraint_Catalog (Check Constr Routine Usage)",
T33.constraint_name AS "Constraint_Name (Check Constr Routine Usage)",
T33.constraint_schema AS "Constraint_Schema (Check Constr Routine Usage)",
T33.specific_catalog AS "Specific_Catalog (Check Constr Routine Usage)",
T33.specific_name AS "Specific_Name (Check Constr Routine Usage)",
T33.specific_schema AS "Specific_Schema (Check Constr Routine Usage)"
FROM
check_constraint_routine_usage T33
---------------------------------------------------
-- Table key_column_usage
SELECT DISTINCT
T105.column_name AS "Column_Name (Key Col Usage)",
T105.constraint_catalog AS "Constraint_Catalog (Key Col Usage)",
T105.constraint_name AS "Constraint_Name (Key Col Usage)",
T105.constraint_schema AS "Constraint_Schema (Key Col Usage)",
T105.ordinal_position AS "Ordinal_Position (Key Col Usage)",
T105.position_in_unique_constraint AS "Position_In_Unique_Constraint (Key Col Usage)",
T105.table_catalog AS "Table_Catalog (Key Col Usage)",
T105.table_name AS "Table_Name (Key Col Usage)",
T105.table_schema AS "Table_Schema (Key Col Usage)"
FROM
key_column_usage T105
---------------------------------------------------
-- Table pg_database
SELECT DISTINCT
T142.datacl AS "Datacl (PG DB)",
T142.datallowconn AS "Datallowconn (PG DB)",
T142.datcollate AS "Datcollate (PG DB)",
T142.datconnlimit AS "Datconnlimit (PG DB)",
T142.datctype AS "Datctype (PG DB)",
T142.datdba AS "Datdba (PG DB)",
T142.datfrozenxid AS "Datfrozenxid (PG DB)",
T142.datistemplate AS "Datistemplate (PG DB)",
T142.datlastsysoid AS "Datlastsysoid (PG DB)",
T142.datminmxid AS "Datminmxid (PG DB)",
T142.datname AS "Datname (PG DB)",
T142.dattablespace AS "Dattablespace (PG DB)",
T142.encoding AS "Encoding (PG DB)"
FROM
pg_database T142
---------------------------------------------------
-- Table core_licenses
SELECT DISTINCT
T45.allocated_cores AS "Allocated_Cores (Core Lic)",
T45.machine_cores AS "Machine_Cores (Core Lic)",
T45.machine_ip AS "Machine_Ip (Core Lic)",
T45.update_ts AS "Update_Ts (Core Lic)"
FROM
core_licenses T45
---------------------------------------------------
-- Table _groups
SELECT DISTINCT
T6.domain_family AS "Domain_Family (_Groups)",
T6.domain_name AS "Domain_Name (_Groups)",
T6.domain_short_name AS "Domain_Short_Name (_Groups)",
T6.id AS "Id (_Groups)",
T6.name AS "Name (_Groups)",
T6.site_name AS "Site_Name (_Groups)"
FROM
_groups T6
---------------------------------------------------
-- Table column_domain_usage
SELECT DISTINCT
T37.column_name AS "Column_Name (Col Domain Usage)",
T37.domain_catalog AS "Domain_Catalog (Col Domain Usage)",
T37.domain_name AS "Domain_Name (Col Domain Usage)",
T37.domain_schema AS "Domain_Schema (Col Domain Usage)",
T37.table_catalog AS "Table_Catalog (Col Domain Usage)",
T37.table_name AS "Table_Name (Col Domain Usage)",
T37.table_schema AS "Table_Schema (Col Domain Usage)"
FROM
column_domain_usage T37
---------------------------------------------------
-- Table big_texts
SELECT DISTINCT
T29.id AS "Id (Big Text)",
T29.txt AS "Txt (Big Text)",
T29.updated_at AS "Updated_At (Big Text)"
FROM
big_texts T29
---------------------------------------------------
-- Table pg_statio_all_tables
SELECT DISTINCT
T203.heap_blks_hit AS "Heap_Blks_Hit (PG Statio All TBL)",
T203.heap_blks_read AS "Heap_Blks_Read (PG Statio All TBL)",
T203.idx_blks_hit AS "Idx_Blks_Hit (PG Statio All TBL)",
T203.idx_blks_read AS "Idx_Blks_Read (PG Statio All TBL)",
T203.relid AS "Relid (PG Statio All TBL)",
T203.relname AS "Relname (PG Statio All TBL)",
T203.schemaname AS "Schemaname (PG Statio All TBL)",
T203.tidx_blks_hit AS "Tidx_Blks_Hit (PG Statio All TBL)",
T203.tidx_blks_read AS "Tidx_Blks_Read (PG Statio All TBL)",
T203.toast_blks_hit AS "Toast_Blks_Hit (PG Statio All TBL)",
T203.toast_blks_read AS "Toast_Blks_Read (PG Statio All TBL)"
FROM
pg_statio_all_tables T203
---------------------------------------------------
-- Table keychain_entry_usage
SELECT DISTINCT
T107.datasource_id AS "Datasource_ID (Keychain Entries Usage)",
T107.id AS "Id (Keychain Entries Usage)",
T107.keychain_entry_id AS "Keychain_Entry_ID (Keychain Entries Usage)",
T107.workbook_id AS "Workbook_ID (Keychain Entries Usage)"
FROM
keychain_entry_usage T107
---------------------------------------------------
-- Table view_routine_usage
SELECT DISTINCT
T295.specific_catalog AS "Specific_Catalog (VW Route Usage)",
T295.specific_name AS "Specific_Name (VW Route Usage)",
T295.specific_schema AS "Specific_Schema (VW Route Usage)",
T295.table_catalog AS "Table_Catalog (VW Route Usage)",
T295.table_name AS "Table_Name (VW Route Usage)",
T295.table_schema AS "Table_Schema (VW Route Usage)"
FROM
view_routine_usage T295
---------------------------------------------------
-- Table pg_foreign_server
SELECT DISTINCT
T151.srvacl AS "Srvacl (PG Foreign Server)",
T151.srvfdw AS "Srvfdw (PG Foreign Server)",
T151.srvname AS "Srvname (PG Foreign Server)",
T151.srvoptions AS "Srvoptions (PG Foreign Server)",
T151.srvowner AS "Srvowner (PG Foreign Server)",
T151.srvtype AS "Srvtype (PG Foreign Server)",
T151.srvversion AS "Srvversion (PG Foreign Server)"
FROM
pg_foreign_server T151
---------------------------------------------------
-- Table character_sets
SELECT DISTINCT
T32.character_repertoire AS "Character_Repertoire (Char Sets)",
T32.character_set_catalog AS "Character_Set_Catalog (Char Sets)",
T32.character_set_name AS "Character_Set_Name (Char Sets)",
T32.character_set_schema AS "Character_Set_Schema (Char Sets)",
T32.default_collate_catalog AS "Default_Collate_Catalog (Char Sets)",
T32.default_collate_name AS "Default_Collate_Name (Char Sets)",
T32.default_collate_schema AS "Default_Collate_Schema (Char Sets)",
T32.form_of_use AS "Form_Of_Use (Char Sets)"
FROM
character_sets T32
---------------------------------------------------
-- Table role_table_grants
SELECT DISTINCT
T237.grantee AS "Grantee (Role TBL Grants)",
T237.grantor AS "Grantor (Role TBL Grants)",
T237.is_grantable AS "Is_Grantable (Role TBL Grants)",
T237.privilege_type AS "Privilege_Type (Role TBL Grants)",
T237.table_catalog AS "Table_Catalog (Role TBL Grants)",
T237.table_name AS "Table_Name (Role TBL Grants)",
T237.table_schema AS "Table_Schema (Role TBL Grants)",
T237.with_hierarchy AS "With_Hierarchy (Role TBL Grants)"
FROM
role_table_grants T237
---------------------------------------------------
-- Table datasource_metrics_aggregations
SELECT DISTINCT
T52.datasource_id AS "Datasource_ID (DS Metric Agg)",
T52.day_index AS "Day_Index (DS Metric Agg)",
T52.id AS "Id (DS Metric Agg)",
T52.month_index AS "Month_Index (DS Metric Agg)",
T52.view_count AS "View_Count (DS Metric Agg)",
T52.year_index AS "Year_Index (DS Metric Agg)"
FROM
datasource_metrics_aggregations T52
INNER JOIN datasources T55 ON T52.datasource_id = T55.id
---------------------------------------------------
-- Table comments
SELECT DISTINCT
T42.comment AS "Comment (Comments)",
T42.commentable_id AS "Commentable_ID (Comments)",
T42.commentable_type AS "Commentable_Type (Comments)",
T42.created_at AS "Created_At (Comments)",
T42.drawing AS "Drawing (Comments)",
T42.id AS "Id (Comments)",
T42.title AS "Title (Comments)",
T42.updated_at AS "Updated_At (Comments)",
T42.user_id AS "User_ID (Comments)"
FROM
comments T42
INNER JOIN users T290 ON T42.user_id = T290.id
LEFT JOIN hist_comments T80 ON T42.id = T80.comment_id
---------------------------------------------------
-- Table sessions
SELECT DISTINCT
T248.created_at AS "Created_At (Sess)",
T248.data AS "Data (Sess)",
T248.hashed_secret AS "Hashed_Secret (Sess)",
T248.id AS "Id (Sess)",
T248.lock_version AS "Lock_Version (Sess)",
T248.salt AS "Salt (Sess)",
T248.session_id AS "Session_ID (Sess)",
T248.shared_vizql_write AS "Shared_Vizql_Write (Sess)",
T248.shared_wg_write AS "Shared_Wg_Write (Sess)",
T248.site_id AS "Site_ID (Sess)",
T248.updated_at AS "Updated_At (Sess)",
T248.user_id AS "User_ID (Sess)"
FROM
sessions T248
INNER JOIN users T290 ON T248.user_id = T290.id
INNER JOIN sites T259 ON T248.site_id = T259.id
---------------------------------------------------
-- Table pg_stat_activity
SELECT DISTINCT
T183.application_name AS "Application_Name (PG Stat Act)",
T183.backend_start AS "Backend_Start (PG Stat Act)",
T183.backend_xid AS "Backend_Xid (PG Stat Act)",
T183.backend_xmin AS "Backend_Xmin (PG Stat Act)",
T183.client_addr AS "Client_Addr (PG Stat Act)",
T183.client_hostname AS "Client_Hostname (PG Stat Act)",
T183.client_port AS "Client_Port (PG Stat Act)",
T183.datid AS "Datid (PG Stat Act)",
T183.datname AS "Datname (PG Stat Act)",
T183.pid AS "Pid (PG Stat Act)",
T183.query AS "Query (PG Stat Act)",
T183.query_start AS "Query_Start (PG Stat Act)",
T183.state AS "State (PG Stat Act)",
T183.state_change AS "State_Change (PG Stat Act)",
T183.usename AS "Usename (PG Stat Act)",
T183.usesysid AS "Usesysid (PG Stat Act)",
T183.waiting AS "Waiting (PG Stat Act)",
T183.xact_start AS "Xact_Start (PG Stat Act)"
FROM
pg_stat_activity T183
---------------------------------------------------
-- Table site_saml_sessions
SELECT DISTINCT
T256.http_session AS "Http_Session (Site Saml Sess)",
T256.id AS "Id (Site Saml Sess)",
T256.last_accessed_at AS "Last_Accessed_At (Site Saml Sess)",
T256.site_luid AS "Site_Luid (Site Saml Sess)",
T256.version AS "Version (Site Saml Sess)"
FROM
site_saml_sessions T256
---------------------------------------------------
-- Table hist_configs
SELECT DISTINCT
T81.id AS "Id (Hist Configs)",
T81.key AS "Key (Hist Configs)",
T81.value AS "Value (Hist Configs)"
FROM
hist_configs T81
LEFT JOIN historical_events T96 ON T81.id = T96.hist_config_id
---------------------------------------------------
-- Table table_revisions
SELECT DISTINCT
T274.id AS "Id (TBL Revs)",
T274.name AS "Name (TBL Revs)",
T274.nonce AS "Nonce (TBL Revs)",
T274.revision AS "Revision (TBL Revs)"
FROM
table_revisions T274
---------------------------------------------------
-- Table udt_privileges
SELECT DISTINCT
T282.grantee AS "Grantee (UDT Privs)",
T282.grantor AS "Grantor (UDT Privs)",
T282.is_grantable AS "Is_Grantable (UDT Privs)",
T282.privilege_type AS "Privilege_Type (UDT Privs)",
T282.udt_catalog AS "Udt_Catalog (UDT Privs)",
T282.udt_name AS "Udt_Name (UDT Privs)",
T282.udt_schema AS "Udt_Schema (UDT Privs)"
FROM
udt_privileges T282
---------------------------------------------------
-- Table user_defined_types
SELECT DISTINCT
T285.character_maximum_length AS "Character_Maximum_Length (User Def Types)",
T285.character_octet_length AS "Character_Octet_Length (User Def Types)",
T285.character_set_catalog AS "Character_Set_Catalog (User Def Types)",
T285.character_set_name AS "Character_Set_Name (User Def Types)",
T285.character_set_schema AS "Character_Set_Schema (User Def Types)",
T285.collation_catalog AS "Collation_Catalog (User Def Types)",
T285.collation_name AS "Collation_Name (User Def Types)",
T285.collation_schema AS "Collation_Schema (User Def Types)",
T285.data_type AS "Data_Type (User Def Types)",
T285.datetime_precision AS "Datetime_Precision (User Def Types)",
T285.interval_precision AS "Interval_Precision (User Def Types)",
T285.interval_type AS "Interval_Type (User Def Types)",
T285.is_final AS "Is_Final (User Def Types)",
T285.is_instantiable AS "Is_Instantiable (User Def Types)",
T285.numeric_precision AS "Numeric_Precision (User Def Types)",
T285.numeric_precision_radix AS "Numeric_Precision_Radix (User Def Types)",
T285.numeric_scale AS "Numeric_Scale (User Def Types)",
T285.ordering_category AS "Ordering_Category (User Def Types)",
T285.ordering_form AS "Ordering_Form (User Def Types)",
T285.ordering_routine_catalog AS "Ordering_Routine_Catalog (User Def Types)",
T285.ordering_routine_name AS "Ordering_Routine_Name (User Def Types)",
T285.ordering_routine_schema AS "Ordering_Routine_Schema (User Def Types)",
T285.ref_dtd_identifier AS "Ref_Dtd_Identifier (User Def Types)",
T285.reference_type AS "Reference_Type (User Def Types)",
T285.source_dtd_identifier AS "Source_Dtd_Identifier (User Def Types)",
T285.user_defined_type_catalog AS "User_Defined_Type_Catalog (User Def Types)",
T285.user_defined_type_category AS "User_Defined_Type_Category (User Def Types)",
T285.user_defined_type_name AS "User_Defined_Type_Name (User Def Types)",
T285.user_defined_type_schema AS "User_Defined_Type_Schema (User Def Types)"
FROM
user_defined_types T285
---------------------------------------------------
-- Table sql_sizing_profiles
SELECT DISTINCT
T265.comments AS "Comments (SQL Sizing Prof)",
T265.profile_id AS "Profile_ID (SQL Sizing Prof)",
T265.required_value AS "Required_Value (SQL Sizing Prof)",
T265.sizing_id AS "Sizing_ID (SQL Sizing Prof)",
T265.sizing_name AS "Sizing_Name (SQL Sizing Prof)"
FROM
sql_sizing_profiles T265
---------------------------------------------------
-- Table _projects
SELECT DISTINCT
T8.created_at AS "Created_At (_Projects)",
T8.id AS "Id (_Projects)",
T8.name AS "Name (_Projects)",
T8.owner_id AS "Owner_ID (_Projects)",
T8.owner_name AS "Owner_Name (_Projects)",
T8.site_id AS "Site_ID (_Projects)",
T8.system_user_id AS "System_User_ID (_Projects)"
FROM
_projects T8
INNER JOIN users T290 ON T8.owner_id = T290.id
INNER JOIN system_users T271 ON T8.system_user_id = T271.id
INNER JOIN sites T259 ON T8.site_id = T259.id
---------------------------------------------------
-- Table site_saml_events
SELECT DISTINCT
T255.id AS "Id (Site Saml Events)",
T255.log_level AS "Log_Level (Site Saml Events)",
T255.message AS "Message (Site Saml Events)",
T255.site_luid AS "Site_Luid (Site Saml Events)",
T255.timestamp AS "Timestamp (Site Saml Events)"
FROM
site_saml_events T255
LEFT JOIN sites T259 ON T255.site_luid = T259.luid
---------------------------------------------------
-- Table asset_lists
SELECT DISTINCT
T24.id AS "Id (Asset Lists)",
T24.name AS "Name (Asset Lists)",
T24.owner_id AS "Owner_ID (Asset Lists)",
T24.site_id AS "Site_ID (Asset Lists)"
FROM
asset_lists T24
INNER JOIN asset_list_items T23 ON T24.id = T23.asset_list_id
INNER JOIN users T290 ON T24.owner_id = T290.id
INNER JOIN sites T259 ON T24.site_id = T259.id
---------------------------------------------------
-- Table workbook_checksums
SELECT DISTINCT
T299.checksum AS "Checksum (WB Checksums)",
T299.created_at AS "Created_At (WB Checksums)",
T299.expires_at AS "Expires_At (WB Checksums)",
T299.id AS "Id (WB Checksums)",
T299.workbook_id AS "Workbook_ID (WB Checksums)"
FROM
workbook_checksums T299
LEFT JOIN workbooks T301 ON T299.workbook_id = T301.id
---------------------------------------------------
-- Table user_prefs
SELECT DISTINCT
T289.display_mode AS "Display_Mode (User Prefs)",
T289.id AS "Id (User Prefs)",
T289.language_id AS "Language_ID (User Prefs)",
T289.local_timezone_name AS "Local_Timezone_Name (User Prefs)",
T289.local_timezone_offset AS "Local_Timezone_Offset (User Prefs)",
T289.locale_id AS "Locale_ID (User Prefs)",
T289.lock_version AS "Lock_Version (User Prefs)",
T289.prefs AS "Prefs (User Prefs)",
T289.start_page AS "Start_Page (User Prefs)",
T289.suppress_getting_started_notifications AS "Suppress_Getting_Started_Notifications (User Prefs)",
T289.system_user_id AS "System_User_ID (User Prefs)",
T289.version AS "Version (User Prefs)"
FROM
user_prefs T289
INNER JOIN system_users T271 ON T289.system_user_id = T271.id
---------------------------------------------------
-- Table pg_tablespace
SELECT DISTINCT
T212.spcacl AS "Spcacl (PG TBL Space)",
T212.spcname AS "Spcname (PG TBL Space)",
T212.spcoptions AS "Spcoptions (PG TBL Space)",
T212.spcowner AS "Spcowner (PG TBL Space)"
FROM
pg_tablespace T212
---------------------------------------------------
-- Table user_mappings
SELECT DISTINCT
T288.authorization_identifier AS "Authorization_Identifier (User Mappings)",
T288.foreign_server_catalog AS "Foreign_Server_Catalog (User Mappings)",
T288.foreign_server_name AS "Foreign_Server_Name (User Mappings)"
FROM
user_mappings T288
---------------------------------------------------
-- Table hist_capabilities
SELECT DISTINCT
T79.allow AS "Allow (Hist Cap)",
T79.capability_id AS "Capability_ID (Hist Cap)",
T79.id AS "Id (Hist Cap)",
T79.name AS "Name (Hist Cap)"
FROM
hist_capabilities T79
LEFT JOIN capabilities T30 ON T79.capability_id = T30.id
LEFT JOIN historical_events T96 ON T79.id = T96.hist_capability_id
---------------------------------------------------
-- Table column_options
SELECT DISTINCT
T38.column_name AS "Column_Name (Col Options)",
T38.option_name AS "Option_Name (Col Options)",
T38.option_value AS "Option_Value (Col Options)",
T38.table_catalog AS "Table_Catalog (Col Options)",
T38.table_name AS "Table_Name (Col Options)",
T38.table_schema AS "Table_Schema (Col Options)"
FROM
column_options T38
---------------------------------------------------
-- Table group_users
SELECT DISTINCT
T77.group_id AS "Group_ID (Group Users)",
T77.id AS "Id (Group Users)",
T77.user_id AS "User_ID (Group Users)"
FROM
group_users T77
INNER JOIN groups T78 ON T77.group_id = T78.id
INNER JOIN users T290 ON T77.user_id = T290.id
---------------------------------------------------
-- Table sql_features
SELECT DISTINCT
T260.comments AS "Comments (SQL Features)",
T260.feature_id AS "Feature_ID (SQL Features)",
T260.feature_name AS "Feature_Name (SQL Features)",
T260.is_supported AS "Is_Supported (SQL Features)",
T260.is_verified_by AS "Is_Verified_By (SQL Features)",
T260.sub_feature_id AS "Sub_Feature_ID (SQL Features)",
T260.sub_feature_name AS "Sub_Feature_Name (SQL Features)"
FROM
sql_features T260
---------------------------------------------------
-- Table workbooks_view_options
SELECT DISTINCT
T302.value AS "Value (WB View Opt)",
T302.view_option_id AS "View_Option_ID (WB View Opt)",
T302.view_option_key_id AS "View_Option_Key_ID (WB View Opt)",
T302.workbook_id AS "Workbook_ID (WB View Opt)"
FROM
workbooks_view_options T302
---------------------------------------------------
-- Table pg_stat_xact_all_tables
SELECT DISTINCT
T197.idx_scan AS "Idx_Scan (PG Stat xAct All TBL)",
T197.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat xAct All TBL)",
T197.n_tup_del AS "N_Tup_Del (PG Stat xAct All TBL)",
T197.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat xAct All TBL)",
T197.n_tup_ins AS "N_Tup_Ins (PG Stat xAct All TBL)",
T197.n_tup_upd AS "N_Tup_Upd (PG Stat xAct All TBL)",
T197.relid AS "Relid (PG Stat xAct All TBL)",
T197.relname AS "Relname (PG Stat xAct All TBL)",
T197.schemaname AS "Schemaname (PG Stat xAct All TBL)",
T197.seq_scan AS "Seq_Scan (PG Stat xAct All TBL)",
T197.seq_tup_read AS "Seq_Tup_Read (PG Stat xAct All TBL)"
FROM
pg_stat_xact_all_tables T197
---------------------------------------------------
-- Table data_type_privileges
SELECT DISTINCT
T50.dtd_identifier AS "Dtd_Identifier (DT Privs)",
T50.object_catalog AS "Object_Catalog (DT Privs)",
T50.object_name AS "Object_Name (DT Privs)",
T50.object_schema AS "Object_Schema (DT Privs)",
T50.object_type AS "Object_Type (DT Privs)"
FROM
data_type_privileges T50
---------------------------------------------------
-- Table importable_table_implicit_fks
SELECT DISTINCT
T102.column_name AS "Column_Name (Imp TBL Imp)",
T102.discriminator_column_name AS "Discriminator_Column_Name (Imp TBL Imp)",
T102.discriminator_column_value AS "Discriminator_Column_Value (Imp TBL Imp)",
T102.id AS "Id (Imp TBL Imp)",
T102.importable_table_id AS "Importable_Table_ID (Imp TBL Imp)",
T102.table_name AS "Table_Name (Imp TBL Imp)"
FROM
importable_table_implicit_fks T102
---------------------------------------------------
-- Table password_tokens
SELECT DISTINCT
T123.expires_at AS "Expires_At (Pass Tokens)",
T123.guid AS "Guid (Pass Tokens)",
T123.hashed_secret AS "Hashed_Secret (Pass Tokens)",
T123.id AS "Id (Pass Tokens)",
T123.salt AS "Salt (Pass Tokens)",
T123.system_user_id AS "System_User_ID (Pass Tokens)"
FROM
password_tokens T123
LEFT JOIN system_users T271 ON T123.system_user_id = T271.id
---------------------------------------------------
-- Table monitoring_dataengine
SELECT DISTINCT
T114.pk AS "Pk (Mon DE)",
T114.primary_ip AS "Primary_Ip (Mon DE)",
T114.primary_port AS "Primary_Port (Mon DE)",
T114.secondary_ip AS "Secondary_Ip (Mon DE)",
T114.secondary_port AS "Secondary_Port (Mon DE)",
T114.updated_at AS "Updated_At (Mon DE)",
T114.updated_by AS "Updated_By (Mon DE)"
FROM
monitoring_dataengine T114
---------------------------------------------------
-- Table pg_stat_bgwriter
SELECT DISTINCT
T187.buffers_alloc AS "Buffers_Alloc (PG Stat BG Writer)",
T187.buffers_backend AS "Buffers_Backend (PG Stat BG Writer)",
T187.buffers_backend_fsync AS "Buffers_Backend_Fsync (PG Stat BG Writer)",
T187.buffers_checkpoint AS "Buffers_Checkpoint (PG Stat BG Writer)",
T187.buffers_clean AS "Buffers_Clean (PG Stat BG Writer)",
T187.checkpoint_sync_time AS "Checkpoint_Sync_Time (PG Stat BG Writer)",
T187.checkpoint_write_time AS "Checkpoint_Write_Time (PG Stat BG Writer)",
T187.checkpoints_req AS "Checkpoints_Req (PG Stat BG Writer)",
T187.checkpoints_timed AS "Checkpoints_Timed (PG Stat BG Writer)",
T187.maxwritten_clean AS "Maxwritten_Clean (PG Stat BG Writer)",
T187.stats_reset AS "Stats_Reset (PG Stat BG Writer)"
FROM
pg_stat_bgwriter T187
---------------------------------------------------
-- Table pg_amproc
SELECT DISTINCT
T130.amproc AS "Amproc (PG Amproc)",
T130.amprocfamily AS "Amprocfamily (PG Amproc)",
T130.amproclefttype AS "Amproclefttype (PG Amproc)",
T130.amprocnum AS "Amprocnum (PG Amproc)",
T130.amprocrighttype AS "Amprocrighttype (PG Amproc)"
FROM
pg_amproc T130
---------------------------------------------------
-- Table element_types
SELECT DISTINCT
T61.character_maximum_length AS "Character_Maximum_Length (Ele Types)",
T61.character_octet_length AS "Character_Octet_Length (Ele Types)",
T61.character_set_catalog AS "Character_Set_Catalog (Ele Types)",
T61.character_set_name AS "Character_Set_Name (Ele Types)",
T61.character_set_schema AS "Character_Set_Schema (Ele Types)",
T61.collation_catalog AS "Collation_Catalog (Ele Types)",
T61.collation_name AS "Collation_Name (Ele Types)",
T61.collation_schema AS "Collation_Schema (Ele Types)",
T61.collection_type_identifier AS "Collection_Type_Identifier (Ele Types)",
T61.data_type AS "Data_Type (Ele Types)",
T61.datetime_precision AS "Datetime_Precision (Ele Types)",
T61.domain_default AS "Domain_Default (Ele Types)",
T61.dtd_identifier AS "Dtd_Identifier (Ele Types)",
T61.interval_precision AS "Interval_Precision (Ele Types)",
T61.interval_type AS "Interval_Type (Ele Types)",
T61.maximum_cardinality AS "Maximum_Cardinality (Ele Types)",
T61.numeric_precision AS "Numeric_Precision (Ele Types)",
T61.numeric_precision_radix AS "Numeric_Precision_Radix (Ele Types)",
T61.numeric_scale AS "Numeric_Scale (Ele Types)",
T61.object_catalog AS "Object_Catalog (Ele Types)",
T61.object_name AS "Object_Name (Ele Types)",
T61.object_schema AS "Object_Schema (Ele Types)",
T61.object_type AS "Object_Type (Ele Types)",
T61.scope_catalog AS "Scope_Catalog (Ele Types)",
T61.scope_name AS "Scope_Name (Ele Types)",
T61.scope_schema AS "Scope_Schema (Ele Types)",
T61.udt_catalog AS "Udt_Catalog (Ele Types)",
T61.udt_name AS "Udt_Name (Ele Types)",
T61.udt_schema AS "Udt_Schema (Ele Types)"
FROM
element_types T61
---------------------------------------------------
-- Table site_user_prefs
SELECT DISTINCT
T258.id AS "Id (Site User Prefs)",
T258.refresh_failure_notification_enabled AS "Refresh_Failure_Notification_Enabled (Site User Prefs)",
T258.user_id AS "User_ID (Site User Prefs)"
FROM
site_user_prefs T258
LEFT JOIN users T290 ON T258.user_id = T290.id
---------------------------------------------------
-- Table pg_collation
SELECT DISTINCT
T138.collcollate AS "Collcollate (PG Coll)",
T138.collctype AS "Collctype (PG Coll)",
T138.collencoding AS "Collencoding (PG Coll)",
T138.collname AS "Collname (PG Coll)",
T138.collnamespace AS "Collnamespace (PG Coll)",
T138.collowner AS "Collowner (PG Coll)"
FROM
pg_collation T138
---------------------------------------------------
-- Table check_constraints
SELECT DISTINCT
T34.check_clause AS "Check_Clause (Check Constr)",
T34.constraint_catalog AS "Constraint_Catalog (Check Constr)",
T34.constraint_name AS "Constraint_Name (Check Constr)",
T34.constraint_schema AS "Constraint_Schema (Check Constr)"
FROM
check_constraints T34
---------------------------------------------------
-- Table pg_stat_database
SELECT DISTINCT
T188.blk_read_time AS "Blk_Read_Time (PG Stat DB)",
T188.blk_write_time AS "Blk_Write_Time (PG Stat DB)",
T188.blks_hit AS "Blks_Hit (PG Stat DB)",
T188.blks_read AS "Blks_Read (PG Stat DB)",
T188.conflicts AS "Conflicts (PG Stat DB)",
T188.datid AS "Datid (PG Stat DB)",
T188.datname AS "Datname (PG Stat DB)",
T188.deadlocks AS "Deadlocks (PG Stat DB)",
T188.numbackends AS "Numbackends (PG Stat DB)",
T188.stats_reset AS "Stats_Reset (PG Stat DB)",
T188.temp_bytes AS "Temp_Bytes (PG Stat DB)",
T188.temp_files AS "Temp_Files (PG Stat DB)",
T188.tup_deleted AS "Tup_Deleted (PG Stat DB)",
T188.tup_fetched AS "Tup_Fetched (PG Stat DB)",
T188.tup_inserted AS "Tup_Inserted (PG Stat DB)",
T188.tup_returned AS "Tup_Returned (PG Stat DB)",
T188.tup_updated AS "Tup_Updated (PG Stat DB)",
T188.xact_commit AS "Xact_Commit (PG Stat DB)",
T188.xact_rollback AS "Xact_Rollback (PG Stat DB)"
FROM
pg_stat_database T188
---------------------------------------------------
-- Table sql_implementation_info
SELECT DISTINCT
T261.character_value AS "Character_Value (SQL Impl Info)",
T261.comments AS "Comments (SQL Impl Info)",
T261.implementation_info_id AS "Implementation_Info_ID (SQL Impl Info)",
T261.implementation_info_name AS "Implementation_Info_Name (SQL Impl Info)",
T261.integer_value AS "Integer_Value (SQL Impl Info)"
FROM
sql_implementation_info T261
---------------------------------------------------
-- Table pg_language
SELECT DISTINCT
T157.lanacl AS "Lanacl (PG Lang)",
T157.laninline AS "Laninline (PG Lang)",
T157.lanispl AS "Lanispl (PG Lang)",
T157.lanname AS "Lanname (PG Lang)",
T157.lanowner AS "Lanowner (PG Lang)",
T157.lanplcallfoid AS "Lanplcallfoid (PG Lang)",
T157.lanpltrusted AS "Lanpltrusted (PG Lang)",
T157.lanvalidator AS "Lanvalidator (PG Lang)"
FROM
pg_language T157
---------------------------------------------------
-- Table _background_tasks
SELECT DISTINCT
T1.args AS "Args (_BG Tasks)",
T1.backgrounder_id AS "Backgrounder_ID (_BG Tasks)",
T1.completed_at AS "Completed_At (_BG Tasks)",
T1.created_at AS "Created_At (_BG Tasks)",
T1.finish_code AS "Finish_Code (_BG Tasks)",
T1.id AS "Id (_BG Tasks)",
T1.job_name AS "Job_Name (_BG Tasks)",
T1.job_type AS "Job_Type (_BG Tasks)",
T1.language AS "Language (_BG Tasks)",
T1.locale AS "Locale (_BG Tasks)",
T1.notes AS "Notes (_BG Tasks)",
T1.priority AS "Priority (_BG Tasks)",
T1.processed_on_worker AS "Processed_On_Worker (_BG Tasks)",
T1.progress AS "Progress (_BG Tasks)",
T1.site_id AS "Site_ID (_BG Tasks)",
T1.started_at AS "Started_At (_BG Tasks)",
T1.subtitle AS "Subtitle (_BG Tasks)",
T1.title AS "Title (_BG Tasks)"
FROM
_background_tasks T1
INNER JOIN background_jobs T28 ON T1.backgrounder_id = T28.backgrounder_id
INNER JOIN sites T259 ON T1.site_id = T259.id
---------------------------------------------------
-- Table subscriptions_workbooks
SELECT DISTINCT
T270.id AS "Id (Subscr WB)",
T270.repository_url AS "Repository_Url (Subscr WB)",
T270.site_id AS "Site_ID (Subscr WB)",
T270.subscription_id AS "Subscription_ID (Subscr WB)"
FROM
subscriptions_workbooks T270
INNER JOIN subscriptions T267 ON T270.subscription_id = T267.id
INNER JOIN sites T259 ON T270.site_id = T259.id
LEFT JOIN workbooks T301 ON T270.repository_url = T301.repository_url
---------------------------------------------------
-- Table pg_conversion
SELECT DISTINCT
T140.condefault AS "Condefault (PG Conv)",
T140.conforencoding AS "Conforencoding (PG Conv)",
T140.conname AS "Conname (PG Conv)",
T140.connamespace AS "Connamespace (PG Conv)",
T140.conowner AS "Conowner (PG Conv)",
T140.conproc AS "Conproc (PG Conv)",
T140.contoencoding AS "Contoencoding (PG Conv)"
FROM
pg_conversion T140
---------------------------------------------------
-- Table subscriptions_views
SELECT DISTINCT
T269.id AS "Id (Subscr VW)",
T269.repository_url AS "Repository_Url (Subscr VW)",
T269.subscription_id AS "Subscription_ID (Subscr VW)"
FROM
subscriptions_views T269
INNER JOIN subscriptions T267 ON T269.subscription_id = T267.id
INNER JOIN views T297 ON T269.repository_url = T297.repository_url
---------------------------------------------------
-- Table table_constraints
SELECT DISTINCT
T272.constraint_catalog AS "Constraint_Catalog (TBL Conts)",
T272.constraint_name AS "Constraint_Name (TBL Conts)",
T272.constraint_schema AS "Constraint_Schema (TBL Conts)",
T272.constraint_type AS "Constraint_Type (TBL Conts)",
T272.initially_deferred AS "Initially_Deferred (TBL Conts)",
T272.is_deferrable AS "Is_Deferrable (TBL Conts)",
T272.table_catalog AS "Table_Catalog (TBL Conts)",
T272.table_name AS "Table_Name (TBL Conts)",
T272.table_schema AS "Table_Schema (TBL Conts)"
FROM
table_constraints T272
---------------------------------------------------
-- Table hist_groups
SELECT DISTINCT
T84.domain_name AS "Domain_Name (Hist Groups)",
T84.group_id AS "Group_ID (Hist Groups)",
T84.id AS "Id (Hist Groups)",
T84.name AS "Name (Hist Groups)"
FROM
hist_groups T84
LEFT JOIN groups T78 ON T84.group_id = T78.id
INNER JOIN historical_events T96 ON T84.id = T96.hist_group_id
---------------------------------------------------
-- Table foreign_data_wrapper_options
SELECT DISTINCT
T70.foreign_data_wrapper_catalog AS "Foreign_Data_Wrapper_Catalog (Foreign Data Wrap Opt)",
T70.foreign_data_wrapper_name AS "Foreign_Data_Wrapper_Name (Foreign Data Wrap Opt)",
T70.option_name AS "Option_Name (Foreign Data Wrap Opt)",
T70.option_value AS "Option_Value (Foreign Data Wrap Opt)"
FROM
foreign_data_wrapper_options T70
---------------------------------------------------
-- Table view_table_usage
SELECT DISTINCT
T296.table_catalog AS "Table_Catalog (VW TBL Usage)",
T296.table_name AS "Table_Name (VW TBL Usage)",
T296.table_schema AS "Table_Schema (VW TBL Usage)",
T296.view_catalog AS "View_Catalog (VW TBL Usage)",
T296.view_name AS "View_Name (VW TBL Usage)",
T296.view_schema AS "View_Schema (VW TBL Usage)"
FROM
view_table_usage T296
---------------------------------------------------
-- Table _views_stats
SELECT DISTINCT
T17.device_type AS "Device_Type (_VW Stats)",
T17.last_view_time AS "Last_View_Time (_VW Stats)",
T17.nviews AS "Nviews (_VW Stats)",
T17.site_id AS "Site_ID (_VW Stats)",
T17.system_users_friendly_name AS "System_Users_Friendly_Name (_VW Stats)",
T17.system_users_id AS "System_Users_ID (_VW Stats)",
T17.system_users_name AS "System_Users_Name (_VW Stats)",
T17.users_id AS "Users_ID (_VW Stats)",
T17.users_login_at AS "Users_Login_At (_VW Stats)",
T17.views_caption AS "Views_Caption (_VW Stats)",
T17.views_created_at AS "Views_Created_At (_VW Stats)",
T17.views_id AS "Views_ID (_VW Stats)",
T17.views_index AS "Views_Index (_VW Stats)",
T17.views_name AS "Views_Name (_VW Stats)",
T17.views_owner_id AS "Views_Owner_ID (_VW Stats)",
T17.views_title AS "Views_Title (_VW Stats)",
T17.views_url AS "Views_Url (_VW Stats)",
T17.views_workbook_id AS "Views_Workbook_ID (_VW Stats)"
FROM
_views_stats T17
INNER JOIN users T290 ON T17.users_id = T290.id
INNER JOIN views T297 ON T17.views_id = T297.id
INNER JOIN system_users T271 ON T17.system_users_id = T271.id
LEFT JOIN workbooks T301 ON T17.views_workbook_id = T301.id
INNER JOIN users T290 ON T17.views_owner_id = T290.id
INNER JOIN sites T259 ON T17.site_id = T259.id
---------------------------------------------------
-- Table collations
SELECT DISTINCT
T36.collation_catalog AS "Collation_Catalog (Coll)",
T36.collation_name AS "Collation_Name (Coll)",
T36.collation_schema AS "Collation_Schema (Coll)",
T36.pad_attribute AS "Pad_Attribute (Coll)"
FROM
collations T36
---------------------------------------------------
-- Table background_jobs
SELECT DISTINCT
T28.args AS "Args (BG Jobs)",
T28.attempts_remaining AS "Attempts_Remaining (BG Jobs)",
T28.backgrounder_id AS "Backgrounder_ID (BG Jobs)",
T28.completed_at AS "Completed_At (BG Jobs)",
T28.correlation_id AS "Correlation_ID (BG Jobs)",
T28.created_at AS "Created_At (BG Jobs)",
T28.created_on_worker AS "Created_On_Worker (BG Jobs)",
T28.finish_code AS "Finish_Code (BG Jobs)",
T28.id AS "Id (BG Jobs)",
T28.job_name AS "Job_Name (BG Jobs)",
T28.job_type AS "Job_Type (BG Jobs)",
T28.language AS "Language (BG Jobs)",
T28.link AS "Link (BG Jobs)",
T28.locale AS "Locale (BG Jobs)",
T28.lock_version AS "Lock_Version (BG Jobs)",
T28.notes AS "Notes (BG Jobs)",
T28.priority AS "Priority (BG Jobs)",
T28.processed_on_worker AS "Processed_On_Worker (BG Jobs)",
T28.progress AS "Progress (BG Jobs)",
T28.serial_collection_id AS "Serial_Collection_ID (BG Jobs)",
T28.site_id AS "Site_ID (BG Jobs)",
T28.started_at AS "Started_At (BG Jobs)",
T28.subtitle AS "Subtitle (BG Jobs)",
T28.title AS "Title (BG Jobs)",
T28.updated_at AS "Updated_At (BG Jobs)"
FROM
background_jobs T28
INNER JOIN sites T259 ON T28.site_id = T259.id
INNER JOIN subscriptions T267 ON T28.correlation_id = T267.id
---------------------------------------------------
-- Table pg_available_extensions
SELECT DISTINCT
T135.comment AS "Comment (PG Avail Ext)",
T135.default_version AS "Default_Version (PG Avail Ext)",
T135.installed_version AS "Installed_Version (PG Avail Ext)",
T135.name AS "Name (PG Avail Ext)"
FROM
pg_available_extensions T135
---------------------------------------------------
-- Table historical_disk_usage
SELECT DISTINCT
T94.id AS "Id (Hist Disk Use)",
T94.path AS "Path (Hist Disk Use)",
T94.record_timestamp AS "Record_Timestamp (Hist Disk Use)",
T94.resource_type AS "Resource_Type (Hist Disk Use)",
T94.state AS "State (Hist Disk Use)",
T94.total_space_bytes AS "Total_Space_Bytes (Hist Disk Use)",
T94.used_space_bytes AS "Used_Space_Bytes (Hist Disk Use)",
T94.worker_id AS "Worker_ID (Hist Disk Use)"
FROM
historical_disk_usage T94
---------------------------------------------------
-- Table pg_prepared_statements
SELECT DISTINCT
T168.from_sql AS "From_Sql (PG Prep Statements)",
T168.name AS "Name (PG Prep Statements)",
T168.parameter_types AS "Parameter_Types (PG Prep Statements)",
T168.prepare_time AS "Prepare_Time (PG Prep Statements)",
T168.statement AS "Statement (PG Prep Statements)"
FROM
pg_prepared_statements T168
---------------------------------------------------
-- Table serial_collections
SELECT DISTINCT
T247.created_at AS "Created_At (Serial Collections)",
T247.description AS "Description (Serial Collections)",
T247.id AS "Id (Serial Collections)",
T247.updated_at AS "Updated_At (Serial Collections)"
FROM
serial_collections T247
INNER JOIN background_jobs T28 ON T247.id = T28.serial_collection_id
INNER JOIN schedules T243 ON T247.id = T243.serial_collection_id
LEFT JOIN _schedules T9 ON T247.id = T9.serial_collection_id
---------------------------------------------------
-- Table pg_transform
SELECT DISTINCT
T215.trffromsql AS "Trffromsql (PG Transform)",
T215.trflang AS "Trflang (PG Transform)",
T215.trftosql AS "Trftosql (PG Transform)",
T215.trftype AS "Trftype (PG Transform)"
FROM
pg_transform T215
---------------------------------------------------
-- Table site_saml_configurations
SELECT DISTINCT
T254.allow_embedded_authentication AS "Allow_Embedded_Authentication (Site Saml Config)",
T254.attribute_mapping AS "Attribute_Mapping (Site Saml Config)",
T254.authentication_domain_id AS "Authentication_Domain_ID (Site Saml Config)",
T254.authentication_type_for_embedded AS "Authentication_Type_For_Embedded (Site Saml Config)",
T254.entity_descriptor_validation_result AS "Entity_Descriptor_Validation_Result (Site Saml Config)",
T254.idp_entity_descriptor AS "Idp_Entity_Descriptor (Site Saml Config)",
T254.is_enabled AS "Is_Enabled (Site Saml Config)",
T254.site_luid AS "Site_Luid (Site Saml Config)",
T254.sp_certificate AS "Sp_Certificate (Site Saml Config)",
T254.sp_private_key AS "Sp_Private_Key (Site Saml Config)"
FROM
site_saml_configurations T254
LEFT JOIN sites T259 ON T254.site_luid = T259.luid
---------------------------------------------------
-- Table pg_rules
SELECT DISTINCT
T176.definition AS "Definition (PG Rules)",
T176.rulename AS "Rulename (PG Rules)",
T176.schemaname AS "Schemaname (PG Rules)",
T176.tablename AS "Tablename (PG Rules)"
FROM
pg_rules T176
---------------------------------------------------
-- Table pg_stat_user_tables
SELECT DISTINCT
T196.analyze_count AS "Analyze_Count (PG Stat User TBL)",
T196.autoanalyze_count AS "Autoanalyze_Count (PG Stat User TBL)",
T196.autovacuum_count AS "Autovacuum_Count (PG Stat User TBL)",
T196.idx_scan AS "Idx_Scan (PG Stat User TBL)",
T196.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat User TBL)",
T196.last_analyze AS "Last_Analyze (PG Stat User TBL)",
T196.last_autoanalyze AS "Last_Autoanalyze (PG Stat User TBL)",
T196.last_autovacuum AS "Last_Autovacuum (PG Stat User TBL)",
T196.last_vacuum AS "Last_Vacuum (PG Stat User TBL)",
T196.n_dead_tup AS "N_Dead_Tup (PG Stat User TBL)",
T196.n_live_tup AS "N_Live_Tup (PG Stat User TBL)",
T196.n_mod_since_analyze AS "N_Mod_Since_Analyze (PG Stat User TBL)",
T196.n_tup_del AS "N_Tup_Del (PG Stat User TBL)",
T196.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat User TBL)",
T196.n_tup_ins AS "N_Tup_Ins (PG Stat User TBL)",
T196.n_tup_upd AS "N_Tup_Upd (PG Stat User TBL)",
T196.relid AS "Relid (PG Stat User TBL)",
T196.relname AS "Relname (PG Stat User TBL)",
T196.schemaname AS "Schemaname (PG Stat User TBL)",
T196.seq_scan AS "Seq_Scan (PG Stat User TBL)",
T196.seq_tup_read AS "Seq_Tup_Read (PG Stat User TBL)",
T196.vacuum_count AS "Vacuum_Count (PG Stat User TBL)"
FROM
pg_stat_user_tables T196
---------------------------------------------------
-- Table asset_list_items
SELECT DISTINCT
T23.asset_list_id AS "Asset_List_ID (Asset List Items)",
T23.id AS "Id (Asset List Items)",
T23.position AS "Position (Asset List Items)",
T23.useable_id AS "Useable_ID (Asset List Items)",
T23.useable_type AS "Useable_Type (Asset List Items)",
T23.usedobj_name AS "Usedobj_Name (Asset List Items)",
T23.usedobj_url AS "Usedobj_Url (Asset List Items)"
FROM
asset_list_items T23
INNER JOIN asset_lists T24 ON T23.asset_list_id = T24.id
---------------------------------------------------
-- Table pg_stat_xact_sys_tables
SELECT DISTINCT
T198.idx_scan AS "Idx_Scan (PG Stat xAct User Func)",
T198.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat xAct User Func)",
T198.n_tup_del AS "N_Tup_Del (PG Stat xAct User Func)",
T198.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat xAct User Func)",
T198.n_tup_ins AS "N_Tup_Ins (PG Stat xAct User Func)",
T198.n_tup_upd AS "N_Tup_Upd (PG Stat xAct User Func)",
T198.relid AS "Relid (PG Stat xAct User Func)",
T198.relname AS "Relname (PG Stat xAct User Func)",
T198.schemaname AS "Schemaname (PG Stat xAct User Func)",
T198.seq_scan AS "Seq_Scan (PG Stat xAct User Func)",
T198.seq_tup_read AS "Seq_Tup_Read (PG Stat xAct User Func)"
FROM
pg_stat_xact_sys_tables T198
---------------------------------------------------
-- Table taggings
SELECT DISTINCT
T276.id AS "Id (Taggings)",
T276.tag_id AS "Tag_ID (Taggings)",
T276.taggable_id AS "Taggable_ID (Taggings)",
T276.taggable_type AS "Taggable_Type (Taggings)",
T276.user_id AS "User_ID (Taggings)"
FROM
taggings T276
INNER JOIN tags T277 ON T276.tag_id = T277.id
INNER JOIN users T290 ON T276.user_id = T290.id
---------------------------------------------------
-- Table pending_search_updates
SELECT DISTINCT
T124.attempts AS "Attempts (Pend Search UPD)",
T124.created_at AS "Created_At (Pend Search UPD)",
T124.entity_type AS "Entity_Type (Pend Search UPD)",
T124.id AS "Id (Pend Search UPD)",
T124.lock_version AS "Lock_Version (Pend Search UPD)",
T124.object_id AS "Object_ID (Pend Search UPD)",
T124.operation AS "Operation (Pend Search UPD)",
T124.updated_at AS "Updated_At (Pend Search UPD)"
FROM
pending_search_updates T124
---------------------------------------------------
-- Table pg_stat_sys_indexes
SELECT DISTINCT
T192.idx_scan AS "Idx_Scan (PG Stat Sys IDX)",
T192.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat Sys IDX)",
T192.idx_tup_read AS "Idx_Tup_Read (PG Stat Sys IDX)",
T192.indexrelid AS "Indexrelid (PG Stat Sys IDX)",
T192.indexrelname AS "Indexrelname (PG Stat Sys IDX)",
T192.relid AS "Relid (PG Stat Sys IDX)",
T192.relname AS "Relname (PG Stat Sys IDX)",
T192.schemaname AS "Schemaname (PG Stat Sys IDX)"
FROM
pg_stat_sys_indexes T192
---------------------------------------------------
-- Table exportable_types
SELECT DISTINCT
T66.id AS "Id (Exp Types)",
T66.name AS "Name (Exp Types)"
FROM
exportable_types T66
---------------------------------------------------
-- Table asset_key_meta_data
SELECT DISTINCT
T22.algorithm_name AS "Algorithm_Name (Asset Key Meta)",
T22.created_at AS "Created_At (Asset Key Meta)",
T22.id AS "Id (Asset Key Meta)",
T22.salt AS "Salt (Asset Key Meta)",
T22.test_string AS "Test_String (Asset Key Meta)",
T22.updated_at AS "Updated_At (Asset Key Meta)"
FROM
asset_key_meta_data T22
INNER JOIN asset_key_marker T21 ON T22.id = T21.asset_key_id
---------------------------------------------------
-- Table columns
SELECT DISTINCT
T41.character_maximum_length AS "Character_Maximum_Length (Cols)",
T41.character_octet_length AS "Character_Octet_Length (Cols)",
T41.character_set_catalog AS "Character_Set_Catalog (Cols)",
T41.character_set_name AS "Character_Set_Name (Cols)",
T41.character_set_schema AS "Character_Set_Schema (Cols)",
T41.collation_catalog AS "Collation_Catalog (Cols)",
T41.collation_name AS "Collation_Name (Cols)",
T41.collation_schema AS "Collation_Schema (Cols)",
T41.column_default AS "Column_Default (Cols)",
T41.column_name AS "Column_Name (Cols)",
T41.data_type AS "Data_Type (Cols)",
T41.datetime_precision AS "Datetime_Precision (Cols)",
T41.domain_catalog AS "Domain_Catalog (Cols)",
T41.domain_name AS "Domain_Name (Cols)",
T41.domain_schema AS "Domain_Schema (Cols)",
T41.dtd_identifier AS "Dtd_Identifier (Cols)",
T41.generation_expression AS "Generation_Expression (Cols)",
T41.identity_cycle AS "Identity_Cycle (Cols)",
T41.identity_generation AS "Identity_Generation (Cols)",
T41.identity_increment AS "Identity_Increment (Cols)",
T41.identity_maximum AS "Identity_Maximum (Cols)",
T41.identity_minimum AS "Identity_Minimum (Cols)",
T41.identity_start AS "Identity_Start (Cols)",
T41.interval_precision AS "Interval_Precision (Cols)",
T41.interval_type AS "Interval_Type (Cols)",
T41.is_generated AS "Is_Generated (Cols)",
T41.is_identity AS "Is_Identity (Cols)",
T41.is_nullable AS "Is_Nullable (Cols)",
T41.is_self_referencing AS "Is_Self_Referencing (Cols)",
T41.is_updatable AS "Is_Updatable (Cols)",
T41.maximum_cardinality AS "Maximum_Cardinality (Cols)",
T41.numeric_precision AS "Numeric_Precision (Cols)",
T41.numeric_precision_radix AS "Numeric_Precision_Radix (Cols)",
T41.numeric_scale AS "Numeric_Scale (Cols)",
T41.ordinal_position AS "Ordinal_Position (Cols)",
T41.scope_catalog AS "Scope_Catalog (Cols)",
T41.scope_name AS "Scope_Name (Cols)",
T41.scope_schema AS "Scope_Schema (Cols)",
T41.table_catalog AS "Table_Catalog (Cols)",
T41.table_name AS "Table_Name (Cols)",
T41.table_schema AS "Table_Schema (Cols)",
T41.udt_catalog AS "Udt_Catalog (Cols)",
T41.udt_name AS "Udt_Name (Cols)",
T41.udt_schema AS "Udt_Schema (Cols)"
FROM
columns T41
---------------------------------------------------
-- Table shared_views
SELECT DISTINCT
T250.accessed_at AS "Accessed_At (Shared VW)",
T250.base_view_id AS "Base_View_ID (Shared VW)",
T250.big_text_id AS "Big_Text_ID (Shared VW)",
T250.created_at AS "Created_At (Shared VW)",
T250.creator_id AS "Creator_ID (Shared VW)",
T250.disabled AS "Disabled (Shared VW)",
T250.guid AS "Guid (Shared VW)",
T250.id AS "Id (Shared VW)",
T250.image_generated AS "Image_Generated (Shared VW)",
T250.other_creator AS "Other_Creator (Shared VW)",
T250.parent_id AS "Parent_ID (Shared VW)",
T250.primary_content_url AS "Primary_Content_Url (Shared VW)",
T250.share_method AS "Share_Method (Shared VW)",
T250.site_id AS "Site_ID (Shared VW)",
T250.static_image_updated_at AS "Static_Image_Updated_At (Shared VW)",
T250.updated_at AS "Updated_At (Shared VW)"
FROM
shared_views T250
---------------------------------------------------
-- Table roles
SELECT DISTINCT
T240.administrative AS "Administrative (Roles)",
T240.created_at AS "Created_At (Roles)",
T240.creator_id AS "Creator_ID (Roles)",
T240.display_name AS "Display_Name (Roles)",
T240.display_order AS "Display_Order (Roles)",
T240.displayable AS "Displayable (Roles)",
T240.id AS "Id (Roles)",
T240.name AS "Name (Roles)",
T240.updated_at AS "Updated_At (Roles)"
FROM
roles T240
INNER JOIN capability_roles T31 ON T240.id = T31.role_id
LEFT JOIN users T290 ON T240.creator_id = T290.id
---------------------------------------------------
-- Table pg_db_role_setting
SELECT DISTINCT
T143.setconfig AS "Setconfig (PG DB Role Setting)",
T143.setdatabase AS "Setdatabase (PG DB Role Setting)",
T143.setrole AS "Setrole (PG DB Role Setting)"
FROM
pg_db_role_setting T143
---------------------------------------------------
-- Table named_resources
SELECT DISTINCT
T119.id AS "Id (Names Res)",
T119.name AS "Name (Names Res)",
T119.owner_id AS "Owner_ID (Names Res)",
T119.state AS "State (Names Res)",
T119.value AS "Value (Names Res)"
FROM
named_resources T119
---------------------------------------------------
-- Table _http_requests
SELECT DISTINCT
T7.action AS "Action (_Usage)",
T7.completed_at AS "Completed_At (_Usage)",
T7.controller AS "Controller (_Usage)",
T7.created_at AS "Created_At (_Usage)",
T7.currentsheet AS "Currentsheet (_Usage)",
T7.http_referer AS "Http_Referer (_Usage)",
T7.http_request_uri AS "Http_Request_Uri (_Usage)",
T7.http_user_agent AS "Http_User_Agent (_Usage)",
T7.port AS "Port (_Usage)",
T7.remote_ip AS "Remote_Ip (_Usage)",
T7.session_id AS "Session_ID (_Usage)",
T7.site_id AS "Site_ID (_Usage)",
T7.user_id AS "User_ID (_Usage)",
T7.user_ip AS "User_Ip (_Usage)",
T7.vizql_session AS "Vizql_Session (_Usage)",
T7.worker AS "Worker (_Usage)"
FROM
_http_requests T7
INNER JOIN users T290 ON T7.user_id = T290.id
INNER JOIN sites T259 ON T7.site_id = T259.id
---------------------------------------------------
-- Table _system_users
SELECT DISTINCT
T13.admin_level AS "Admin_Level (_Sys Users)",
T13.custom_display_name AS "Custom_Display_Name (_Sys Users)",
T13.domain_family AS "Domain_Family (_Sys Users)",
T13.domain_name AS "Domain_Name (_Sys Users)",
T13.domain_short_name AS "Domain_Short_Name (_Sys Users)",
T13.email AS "Email (_Sys Users)",
T13.friendly_name AS "Friendly_Name (_Sys Users)",
T13.id AS "Id (_Sys Users)",
T13.name AS "Name (_Sys Users)",
T13.state AS "State (_Sys Users)"
FROM
_system_users T13
---------------------------------------------------
-- Table role_udt_grants
SELECT DISTINCT
T238.grantee AS "Grantee (ROLE UDT Grants)",
T238.grantor AS "Grantor (ROLE UDT Grants)",
T238.is_grantable AS "Is_Grantable (ROLE UDT Grants)",
T238.privilege_type AS "Privilege_Type (ROLE UDT Grants)",
T238.udt_catalog AS "Udt_Catalog (ROLE UDT Grants)",
T238.udt_name AS "Udt_Name (ROLE UDT Grants)",
T238.udt_schema AS "Udt_Schema (ROLE UDT Grants)"
FROM
role_udt_grants T238
---------------------------------------------------
-- Table pg_shdescription
SELECT DISTINCT
T181.classoid AS "Classoid (PG SH Descr)",
T181.description AS "Description (PG SH Descr)",
T181.objoid AS "Objoid (PG SH Descr)"
FROM
pg_shdescription T181
---------------------------------------------------
-- Table asset_key_marker
SELECT DISTINCT
T21.asset_key_id AS "Asset_Key_ID (Asset Key Marker)",
T21.created_at AS "Created_At (Asset Key Marker)",
T21.id AS "Id (Asset Key Marker)",
T21.marker_name AS "Marker_Name (Asset Key Marker)",
T21.updated_at AS "Updated_At (Asset Key Marker)"
FROM
asset_key_marker T21
INNER JOIN asset_key_meta_data T22 ON T21.asset_key_id = T22.id
---------------------------------------------------
-- Table import_mapping_excluded_schedules
SELECT DISTINCT
T100.id AS "Id (Imp Map Excl Sched)",
T100.name AS "Name (Imp Map Excl Sched)",
T100.schedule_type AS "Schedule_Type (Imp Map Excl Sched)",
T100.scheduled_action AS "Scheduled_Action (Imp Map Excl Sched)",
T100.scheduled_action_type AS "Scheduled_Action_Type (Imp Map Excl Sched)"
FROM
import_mapping_excluded_schedules T100
---------------------------------------------------
-- Table subscriptions
SELECT DISTINCT
T267.creator_id AS "Creator_ID (Subscr)",
T267.data_condition AS "Data_Condition (Subscr)",
T267.data_condition_type AS "Data_Condition_Type (Subscr)",
T267.data_specification AS "Data_Specification (Subscr)",
T267.id AS "Id (Subscr)",
T267.is_refresh_extract_triggered AS "Is_Refresh_Extract_Triggered (Subscr)",
T267.last_sent AS "Last_Sent (Subscr)",
T267.luid AS "Luid (Subscr)",
T267.schedule_id AS "Schedule_ID (Subscr)",
T267.site_id AS "Site_ID (Subscr)",
T267.subject AS "Subject (Subscr)",
T267.user_id AS "User_ID (Subscr)"
FROM
subscriptions T267
INNER JOIN background_jobs T28 ON T267.id = T28.correlation_id
INNER JOIN users T290 ON T267.user_id = T290.id
INNER JOIN schedules T243 ON T267.schedule_id = T243.id
INNER JOIN sites T259 ON T267.site_id = T259.id
INNER JOIN users T290 ON T267.creator_id = T290.id
INNER JOIN subscriptions_customized_views T268 ON T267.id = T268.subscription_id
INNER JOIN subscriptions_views T269 ON T267.id = T269.subscription_id
INNER JOIN subscriptions_workbooks T270 ON T267.id = T270.subscription_id
---------------------------------------------------
-- Table views_stats
SELECT DISTINCT
T298.device_type AS "Device_Type (VW Stats)",
T298.id AS "Id (VW Stats)",
T298.nviews AS "Nviews (VW Stats)",
T298.site_id AS "Site_ID (VW Stats)",
T298.time AS "Time (VW Stats)",
T298.user_id AS "User_ID (VW Stats)",
T298.view_id AS "View_ID (VW Stats)"
FROM
views_stats T298
INNER JOIN users T290 ON T298.user_id = T290.id
INNER JOIN views T297 ON T298.view_id = T297.id
INNER JOIN sites T259 ON T298.site_id = T259.id
---------------------------------------------------
-- Table tags
SELECT DISTINCT
T277.created_at AS "Created_At (Tags)",
T277.id AS "Id (Tags)",
T277.name AS "Name (Tags)",
T277.site_id AS "Site_ID (Tags)",
T277.updated_at AS "Updated_At (Tags)"
FROM
tags T277
LEFT JOIN hist_tags T89 ON T277.id = T89.tag_id
INNER JOIN taggings T276 ON T277.id = T276.tag_id
INNER JOIN sites T259 ON T277.site_id = T259.id
---------------------------------------------------
-- Table role_usage_grants
SELECT DISTINCT
T239.grantee AS "Grantee (Role Usage Grants)",
T239.grantor AS "Grantor (Role Usage Grants)",
T239.is_grantable AS "Is_Grantable (Role Usage Grants)",
T239.object_catalog AS "Object_Catalog (Role Usage Grants)",
T239.object_name AS "Object_Name (Role Usage Grants)",
T239.object_schema AS "Object_Schema (Role Usage Grants)",
T239.object_type AS "Object_Type (Role Usage Grants)",
T239.privilege_type AS "Privilege_Type (Role Usage Grants)"
FROM
role_usage_grants T239
---------------------------------------------------
-- Table hist_sites
SELECT DISTINCT
T88.id AS "Id (Hist Sites)",
T88.name AS "Name (Hist Sites)",
T88.site_id AS "Site_ID (Hist Sites)",
T88.url_namespace AS "Url_Namespace (Hist Sites)"
FROM
hist_sites T88
LEFT JOIN sites T259 ON T88.site_id = T259.id
INNER JOIN historical_events T96 ON T88.id = T96.hist_actor_site_id
INNER JOIN historical_events T96 ON T88.id = T96.hist_target_site_id
---------------------------------------------------
-- Table datasources
SELECT DISTINCT
T55.asset_key_id AS "Asset_Key_ID (DS)",
T55.connectable AS "Connectable (DS)",
T55.content_version AS "Content_Version (DS)",
T55.created_at AS "Created_At (DS)",
T55.data_engine_extracts AS "Data_Engine_Extracts (DS)",
T55.data_id AS "Data_ID (DS)",
T55.db_class AS "Db_Class (DS)",
T55.db_name AS "Db_Name (DS)",
T55.description AS "Description (DS)",
T55.document_version AS "Document_Version (DS)",
T55.embedded AS "Embedded (DS)",
T55.extracts_incremented_at AS "Extracts_Incremented_At (DS)",
T55.extracts_refreshed_at AS "Extracts_Refreshed_At (DS)",
T55.first_published_at AS "First_Published_At (DS)",
T55.hidden_name AS "Hidden_Name (DS)",
T55.id AS "Id (DS)",
T55.incrementable_extracts AS "Incrementable_Extracts (DS)",
T55.is_hierarchical AS "Is_Hierarchical (DS)",
T55.last_published_at AS "Last_Published_At (DS)",
T55.lock_version AS "Lock_Version (DS)",
T55.luid AS "Luid (DS)",
T55.name AS "Name (DS)",
T55.owner_id AS "Owner_ID (DS)",
T55.parent_workbook_id AS "Parent_Workbook_ID (DS)",
T55.project_id AS "Project_ID (DS)",
T55.reduced_data_id AS "Reduced_Data_ID (DS)",
T55.refreshable_extracts AS "Refreshable_Extracts (DS)",
T55.remote_query_agent_id AS "Remote_Query_Agent_ID (DS)",
T55.repository_data_id AS "Repository_Data_ID (DS)",
T55.repository_extract_data_id AS "Repository_Extract_Data_ID (DS)",
T55.repository_url AS "Repository_Url (DS)",
T55.revision AS "Revision (DS)",
T55.site_id AS "Site_ID (DS)",
T55.size AS "Size (DS)",
T55.state AS "State (DS)",
T55.table_name AS "Table_Name (DS)",
T55.updated_at AS "Updated_At (DS)"
FROM
datasources T55
INNER JOIN data_connections T49 ON T55.id = T49.datasource_id
LEFT JOIN data_connections T49 ON T55.owner_id = T49.id AND data_connections.OWNER_TYPE = 'Datasource'
INNER JOIN datasource_metrics_aggregations T52 ON T55.id = T52.datasource_id
INNER JOIN datasource_refresh_properties T53 ON T55.id = T53.id
INNER JOIN datasource_versions T54 ON T55.id = T54.datasource_id
INNER JOIN users T290 ON T55.owner_id = T290.id
INNER JOIN projects T227 ON T55.project_id = T227.id
INNER JOIN sites T259 ON T55.site_id = T259.id
LEFT JOIN repository_data T234 ON T55.repository_data_id = T234.id
LEFT JOIN repository_data T234 ON T55.repository_extract_data_id = T234.id
LEFT JOIN workbooks T301 ON T55.parent_workbook_id = T301.id
INNER JOIN remote_agents T233 ON T55.remote_query_agent_id = T233.id
LEFT JOIN extracts T68 ON T55.id = T68.datasource_id
LEFT JOIN hist_datasources T83 ON T55.id = T83.datasource_id
LEFT JOIN most_recent_refreshes T116 ON T55.id = T116.datasource_id
LEFT JOIN next_gen_permissions T120 ON T55.id = T120.authorizable_id AND next_gen_permissions.authorizable_type = 'Datasource'
INNER JOIN _datasources_stats T5 ON T55.id = T5.datasource_id
---------------------------------------------------
-- Table views
SELECT DISTINCT
T297.caption AS "Caption (Views)",
T297.check_option AS "Check_Option (Views)",
T297.created_at AS "Created_At (Views)",
T297.datasource_id AS "Datasource_ID (Views)",
T297.description AS "Description (Views)",
T297.edit_count AS "Edit_Count (Views)",
T297.fields AS "Fields (Views)",
T297.first_published_at AS "First_Published_At (Views)",
T297.for_cache_updated_at AS "For_Cache_Updated_At (Views)",
T297.id AS "Id (Views)",
T297.index AS "Index (Views)",
T297.is_insertable_into AS "Is_Insertable_Into (Views)",
T297.is_trigger_deletable AS "Is_Trigger_Deletable (Views)",
T297.is_trigger_insertable_into AS "Is_Trigger_Insertable_Into (Views)",
T297.is_trigger_updatable AS "Is_Trigger_Updatable (Views)",
T297.is_updatable AS "Is_Updatable (Views)",
T297.locked AS "Locked (Views)",
T297.luid AS "Luid (Views)",
T297.name AS "Name (Views)",
T297.owner_id AS "Owner_ID (Views)",
T297.published AS "Published (Views)",
T297.read_count AS "Read_Count (Views)",
T297.repository_data_id AS "Repository_Data_ID (Views)",
T297.repository_url AS "Repository_Url (Views)",
T297.revision AS "Revision (Views)",
T297.sheet_id AS "Sheet_ID (Views)",
T297.sheettype AS "Sheettype (Views)",
T297.site_id AS "Site_ID (Views)",
T297.state AS "State (Views)",
T297.table_catalog AS "Table_Catalog (Views)",
T297.table_name AS "Table_Name (Views)",
T297.table_schema AS "Table_Schema (Views)",
T297.thumbnail_id AS "Thumbnail_ID (Views)",
T297.title AS "Title (Views)",
T297.updated_at AS "Updated_At (Views)",
T297.view_definition AS "View_Definition (Views)",
T297.workbook_id AS "Workbook_ID (Views)"
FROM
views T297
INNER JOIN customized_views T46 ON T297.id = T46.view_id
INNER JOIN customized_views T46 ON T297.id = T46.start_view_id
INNER JOIN data_alerts T47 ON T297.id = T47.view_id
LEFT JOIN hist_views T92 ON T297.id = T92.view_id
INNER JOIN http_requests T97 ON T297.view_url = T97.currentsheet
LEFT JOIN next_gen_permissions T120 ON T297.id = T120.authorizable_id AND next_gen_permissions.authorizable_type = 'View'
INNER JOIN sheet_images T251 ON T297.id = T251.view_id
INNER JOIN user_default_customized_views T284 ON T297.id = T284.view_id
INNER JOIN view_metrics_aggregations T293 ON T297.id = T293.view_id
INNER JOIN workbooks T301 ON T297.workbook_id = T301.id
INNER JOIN users T290 ON T297.owner_id = T290.id
INNER JOIN sites T259 ON T297.site_id = T259.id
LEFT JOIN repository_data T234 ON T297.repository_data_id = T234.id
INNER JOIN views_stats T298 ON T297.id = T298.view_id
INNER JOIN _comments T2 ON T297.id = T2.commentable_id
INNER JOIN _views_stats T17 ON T297.id = T17.views_id
INNER JOIN subscriptions_views T269 ON T297.repository_url = T269.repository_url
---------------------------------------------------
-- Table settings
SELECT DISTINCT
T249.created_at AS "Created_At (Settings)",
T249.description AS "Description (Settings)",
T249.friendly_name AS "Friendly_Name (Settings)",
T249.id AS "Id (Settings)",
T249.name AS "Name (Settings)",
T249.type AS "Type (Settings)",
T249.updated_at AS "Updated_At (Settings)",
T249.value AS "Value (Settings)"
FROM
settings T249
---------------------------------------------------
-- Table hist_datasources
SELECT DISTINCT
T83.datasource_id AS "Datasource_ID (Hist DS)",
T83.id AS "Id (Hist DS)",
T83.name AS "Name (Hist DS)",
T83.repository_url AS "Repository_Url (Hist DS)",
T83.revision AS "Revision (Hist DS)",
T83.size AS "Size (Hist DS)"
FROM
hist_datasources T83
LEFT JOIN datasources T55 ON T83.datasource_id = T55.id
INNER JOIN historical_events T96 ON T83.id = T96.hist_datasource_id
---------------------------------------------------
-- Table pg_user
SELECT DISTINCT
T223.passwd AS "Passwd (PG User)",
T223.usebypassrls AS "Usebypassrls (PG User)",
T223.useconfig AS "Useconfig (PG User)",
T223.usecreatedb AS "Usecreatedb (PG User)",
T223.usename AS "Usename (PG User)",
T223.userepl AS "Userepl (PG User)",
T223.usesuper AS "Usesuper (PG User)",
T223.usesysid AS "Usesysid (PG User)",
T223.valuntil AS "Valuntil (PG User)"
FROM
pg_user T223
---------------------------------------------------
-- Table pg_tables
SELECT DISTINCT
T211.hasindexes AS "Hasindexes (PG TBL)",
T211.hasrules AS "Hasrules (PG TBL)",
T211.hastriggers AS "Hastriggers (PG TBL)",
T211.rowsecurity AS "Rowsecurity (PG TBL)",
T211.schemaname AS "Schemaname (PG TBL)",
T211.tablename AS "Tablename (PG TBL)",
T211.tableowner AS "Tableowner (PG TBL)",
T211.tablespace AS "Tablespace (PG TBL)"
FROM
pg_tables T211
---------------------------------------------------
-- Table pg_statio_sys_indexes
SELECT DISTINCT
T204.idx_blks_hit AS "Idx_Blks_Hit (PG Statio Sys IDX)",
T204.idx_blks_read AS "Idx_Blks_Read (PG Statio Sys IDX)",
T204.indexrelid AS "Indexrelid (PG Statio Sys IDX)",
T204.indexrelname AS "Indexrelname (PG Statio Sys IDX)",
T204.relid AS "Relid (PG Statio Sys IDX)",
T204.relname AS "Relname (PG Statio Sys IDX)",
T204.schemaname AS "Schemaname (PG Statio Sys IDX)"
FROM
pg_statio_sys_indexes T204
---------------------------------------------------
-- Table file_uploads
SELECT DISTINCT
T69.created_at AS "Created_At (File UPL)",
T69.file_size AS "File_Size (File UPL)",
T69.id AS "Id (File UPL)",
T69.ip_address AS "Ip_Address (File UPL)",
T69.owner_id AS "Owner_ID (File UPL)",
T69.site_id AS "Site_ID (File UPL)",
T69.updated_at AS "Updated_At (File UPL)",
T69.upload_id AS "Upload_ID (File UPL)"
FROM
file_uploads T69
---------------------------------------------------
-- Table most_recent_refreshes
SELECT DISTINCT
T116.created_at AS "Created_At (Most Recent Refr)",
T116.data_connection_id AS "Data_Connection_ID (Most Recent Refr)",
T116.datasource_id AS "Datasource_ID (Most Recent Refr)",
T116.details AS "Details (Most Recent Refr)",
T116.duration_in_ms AS "Duration_In_Ms (Most Recent Refr)",
T116.historical_event_type_id AS "Historical_Event_Type_ID (Most Recent Refr)",
T116.id AS "Id (Most Recent Refr)",
T116.is_failure AS "Is_Failure (Most Recent Refr)",
T116.site_id AS "Site_ID (Most Recent Refr)",
T116.task_id AS "Task_ID (Most Recent Refr)",
T116.workbook_id AS "Workbook_ID (Most Recent Refr)",
T116.worker AS "Worker (Most Recent Refr)"
FROM
most_recent_refreshes T116
LEFT JOIN historical_event_types T95 ON T116.historical_event_type_id = T95.id
LEFT JOIN data_connections T49 ON T116.data_connection_id = T49.id
LEFT JOIN workbooks T301 ON T116.workbook_id = T301.id
LEFT JOIN datasources T55 ON T116.datasource_id = T55.id
---------------------------------------------------
-- Table pg_opfamily
SELECT DISTINCT
T164.opfmethod AS "Opfmethod (PG OP Family)",
T164.opfname AS "Opfname (PG OP Family)",
T164.opfnamespace AS "Opfnamespace (PG OP Family)",
T164.opfowner AS "Opfowner (PG OP Family)"
FROM
pg_opfamily T164
---------------------------------------------------
-- Table domains
SELECT DISTINCT
T60.active AS "Active (Domains)",
T60.character_maximum_length AS "Character_Maximum_Length (Domains)",
T60.character_octet_length AS "Character_Octet_Length (Domains)",
T60.character_set_catalog AS "Character_Set_Catalog (Domains)",
T60.character_set_name AS "Character_Set_Name (Domains)",
T60.character_set_schema AS "Character_Set_Schema (Domains)",
T60.collation_catalog AS "Collation_Catalog (Domains)",
T60.collation_name AS "Collation_Name (Domains)",
T60.collation_schema AS "Collation_Schema (Domains)",
T60.data_type AS "Data_Type (Domains)",
T60.datetime_precision AS "Datetime_Precision (Domains)",
T60.domain_catalog AS "Domain_Catalog (Domains)",
T60.domain_default AS "Domain_Default (Domains)",
T60.domain_name AS "Domain_Name (Domains)",
T60.domain_schema AS "Domain_Schema (Domains)",
T60.dtd_identifier AS "Dtd_Identifier (Domains)",
T60.family AS "Family (Domains)",
T60.id AS "Id (Domains)",
T60.interval_precision AS "Interval_Precision (Domains)",
T60.interval_type AS "Interval_Type (Domains)",
T60.maximum_cardinality AS "Maximum_Cardinality (Domains)",
T60.name AS "Name (Domains)",
T60.numeric_precision AS "Numeric_Precision (Domains)",
T60.numeric_precision_radix AS "Numeric_Precision_Radix (Domains)",
T60.numeric_scale AS "Numeric_Scale (Domains)",
T60.scope_catalog AS "Scope_Catalog (Domains)",
T60.scope_name AS "Scope_Name (Domains)",
T60.scope_schema AS "Scope_Schema (Domains)",
T60.short_name AS "Short_Name (Domains)",
T60.udt_catalog AS "Udt_Catalog (Domains)",
T60.udt_name AS "Udt_Name (Domains)",
T60.udt_schema AS "Udt_Schema (Domains)"
FROM
domains T60
INNER JOIN groups T78 ON T60.id = T78.domain_id
INNER JOIN system_users T271 ON T60.id = T271.domain_id
INNER JOIN _datasources T4 ON T60.id = T4.domain_id
INNER JOIN _users T15 ON T60.id = T15.domain_id
INNER JOIN _workbooks T18 ON T60.id = T18.domain_id
---------------------------------------------------
-- Table pg_extension
SELECT DISTINCT
T149.extcondition AS "Extcondition (PG Ext)",
T149.extconfig AS "Extconfig (PG Ext)",
T149.extname AS "Extname (PG Ext)",
T149.extnamespace AS "Extnamespace (PG Ext)",
T149.extowner AS "Extowner (PG Ext)",
T149.extrelocatable AS "Extrelocatable (PG Ext)",
T149.extversion AS "Extversion (PG Ext)"
FROM
pg_extension T149
---------------------------------------------------
-- Table foreign_servers
SELECT DISTINCT
T73.authorization_identifier AS "Authorization_Identifier (Foriegn Servers)",
T73.foreign_data_wrapper_catalog AS "Foreign_Data_Wrapper_Catalog (Foriegn Servers)",
T73.foreign_data_wrapper_name AS "Foreign_Data_Wrapper_Name (Foriegn Servers)",
T73.foreign_server_catalog AS "Foreign_Server_Catalog (Foriegn Servers)",
T73.foreign_server_name AS "Foreign_Server_Name (Foriegn Servers)",
T73.foreign_server_type AS "Foreign_Server_Type (Foriegn Servers)",
T73.foreign_server_version AS "Foreign_Server_Version (Foriegn Servers)"
FROM
foreign_servers T73
---------------------------------------------------
-- Table workbook_versions
SELECT DISTINCT
T300.content_key AS "Content_Key (WB Versions)",
T300.id AS "Id (WB Versions)",
T300.publish_metadata AS "Publish_Metadata (WB Versions)",
T300.published_at AS "Published_At (WB Versions)",
T300.publisher_id AS "Publisher_ID (WB Versions)",
T300.site_id AS "Site_ID (WB Versions)",
T300.size AS "Size (WB Versions)",
T300.sos_type AS "Sos_Type (WB Versions)",
T300.version_number AS "Version_Number (WB Versions)",
T300.workbook_id AS "Workbook_ID (WB Versions)"
FROM
workbook_versions T300
INNER JOIN sites T259 ON T300.site_id = T259.id
INNER JOIN workbooks T301 ON T300.workbook_id = T301.id
LEFT JOIN users T290 ON T300.publisher_id = T290.id
---------------------------------------------------
-- Table metrics_data
SELECT DISTINCT
T112.created_at AS "Created_At (Metric Data)",
T112.data_id AS "Data_ID (Metric Data)",
T112.id AS "Id (Metric Data)",
T112.repository_data_id AS "Repository_Data_ID (Metric Data)",
T112.session_id AS "Session_ID (Metric Data)"
FROM
metrics_data T112
---------------------------------------------------
-- Table pg_timezone_abbrevs
SELECT DISTINCT
T213.abbrev AS "Abbrev (PG Timezone Abbr)",
T213.is_dst AS "Is_Dst (PG Timezone Abbr)",
T213.utc_offset AS "Utc_Offset (PG Timezone Abbr)"
FROM
pg_timezone_abbrevs T213
---------------------------------------------------
-- Table async_jobs
SELECT DISTINCT
T25.completed_at AS "Completed_At (Async Jobs)",
T25.created_at AS "Created_At (Async Jobs)",
T25.detailed_status AS "Detailed_Status (Async Jobs)",
T25.id AS "Id (Async Jobs)",
T25.job_type AS "Job_Type (Async Jobs)",
T25.luid AS "Luid (Async Jobs)",
T25.notes AS "Notes (Async Jobs)",
T25.progress AS "Progress (Async Jobs)",
T25.site_id AS "Site_ID (Async Jobs)",
T25.success AS "Success (Async Jobs)",
T25.updated_at AS "Updated_At (Async Jobs)",
T25.user_id AS "User_ID (Async Jobs)",
T25.worker AS "Worker (Async Jobs)"
FROM
async_jobs T25
INNER JOIN users T290 ON T25.user_id = T290.id
INNER JOIN sites T259 ON T25.site_id = T259.id
---------------------------------------------------
-- Table _sessions
SELECT DISTINCT
T10.session_id AS "Session_ID (_Sess)",
T10.site_id AS "Site_ID (_Sess)",
T10.system_user_id AS "System_User_ID (_Sess)",
T10.updated_at AS "Updated_At (_Sess)",
T10.user_id AS "User_ID (_Sess)",
T10.user_name AS "User_Name (_Sess)"
FROM
_sessions T10
INNER JOIN users T290 ON T10.user_id = T290.id
INNER JOIN system_users T271 ON T10.system_user_id = T271.id
INNER JOIN sites T259 ON T10.site_id = T259.id
---------------------------------------------------
-- Table pg_stat_xact_user_functions
SELECT DISTINCT
T199.calls AS "Calls (PG Stat xAct User Func)",
T199.funcid AS "Funcid (PG Stat xAct User Func)",
T199.funcname AS "Funcname (PG Stat xAct User Func)",
T199.schemaname AS "Schemaname (PG Stat xAct User Func)",
T199.self_time AS "Self_Time (PG Stat xAct User Func)",
T199.total_time AS "Total_Time (PG Stat xAct User Func)"
FROM
pg_stat_xact_user_functions T199
---------------------------------------------------
-- Table trusted_tickets
SELECT DISTINCT
T281.client_ip AS "Client_Ip (Trusted Tickets)",
T281.created_at AS "Created_At (Trusted Tickets)",
T281.expires_at AS "Expires_At (Trusted Tickets)",
T281.guid AS "Guid (Trusted Tickets)",
T281.hashed_ticket AS "Hashed_Ticket (Trusted Tickets)",
T281.id AS "Id (Trusted Tickets)",
T281.originating_session_id AS "Originating_Session_ID (Trusted Tickets)",
T281.salt AS "Salt (Trusted Tickets)",
T281.site_id AS "Site_ID (Trusted Tickets)",
T281.ticket AS "Ticket (Trusted Tickets)",
T281.user_id AS "User_ID (Trusted Tickets)",
T281.username AS "Username (Trusted Tickets)"
FROM
trusted_tickets T281
LEFT JOIN users T290 ON T281.user_id = T290.id
LEFT JOIN sites T259 ON T281.site_id = T259.id
---------------------------------------------------
-- Table groups
SELECT DISTINCT
T78.created_at AS "Created_At (Groups)",
T78.domain_id AS "Domain_ID (Groups)",
T78.id AS "Id (Groups)",
T78.last_synchronized AS "Last_Synchronized (Groups)",
T78.luid AS "Luid (Groups)",
T78.minimum_site_role AS "Minimum_Site_Role (Groups)",
T78.name AS "Name (Groups)",
T78.owner_id AS "Owner_ID (Groups)",
T78.site_id AS "Site_ID (Groups)",
T78.system AS "System (Groups)",
T78.updated_at AS "Updated_At (Groups)"
FROM
groups T78
INNER JOIN group_users T77 ON T78.id = T77.group_id
INNER JOIN users T290 ON T78.owner_id = T290.id
INNER JOIN domains T60 ON T78.domain_id = T60.id
INNER JOIN sites T259 ON T78.site_id = T259.id
LEFT JOIN hist_groups T84 ON T78.id = T84.group_id
LEFT JOIN next_gen_permissions T120 ON T78.id = T120.grantee_id AND next_gen_permissions.next_gen_permissions.grantee_type = 'Group'
LEFT JOIN permissions_templates T126 ON T78.id = T126.grantee_id AND permissions_templates.grantee_type = 'Group'
---------------------------------------------------
-- Table pg_stat_archiver
SELECT DISTINCT
T186.archived_count AS "Archived_Count (PG Stat Arch)",
T186.failed_count AS "Failed_Count (PG Stat Arch)",
T186.last_archived_time AS "Last_Archived_Time (PG Stat Arch)",
T186.last_archived_wal AS "Last_Archived_Wal (PG Stat Arch)",
T186.last_failed_time AS "Last_Failed_Time (PG Stat Arch)",
T186.last_failed_wal AS "Last_Failed_Wal (PG Stat Arch)",
T186.stats_reset AS "Stats_Reset (PG Stat Arch)"
FROM
pg_stat_archiver T186
---------------------------------------------------
-- Table system_users
SELECT DISTINCT
T271.activated_at AS "Activated_At (Sys Users)",
T271.activation_code AS "Activation_Code (Sys Users)",
T271.admin_level AS "Admin_Level (Sys Users)",
T271.asset_key_id AS "Asset_Key_ID (Sys Users)",
T271.auth_user_id AS "Auth_User_ID (Sys Users)",
T271.created_at AS "Created_At (Sys Users)",
T271.custom_display_name AS "Custom_Display_Name (Sys Users)",
T271.deleted_at AS "Deleted_At (Sys Users)",
T271.domain_id AS "Domain_ID (Sys Users)",
T271.email AS "Email (Sys Users)",
T271.friendly_name AS "Friendly_Name (Sys Users)",
T271.hashed_password AS "Hashed_Password (Sys Users)",
T271.id AS "Id (Sys Users)",
T271.keychain AS "Keychain (Sys Users)",
T271.lock_version AS "Lock_Version (Sys Users)",
T271.name AS "Name (Sys Users)",
T271.salt AS "Salt (Sys Users)",
T271.state AS "State (Sys Users)",
T271.sys AS "Sys (Sys Users)",
T271.updated_at AS "Updated_At (Sys Users)"
FROM
system_users T271
LEFT JOIN hist_users T91 ON T271.id = T91.system_user_id
INNER JOIN password_tokens T123 ON T271.id = T123.system_user_id
INNER JOIN refresh_token_devices T231 ON T271.id = T231.system_user_id
INNER JOIN refresh_tokens T232 ON T271.id = T232.system_user_id
INNER JOIN site_saml_users T257 ON T271.id = T257.auth_user_id
INNER JOIN domains T60 ON T271.domain_id = T60.id
INNER JOIN user_images T286 ON T271.id = T286.system_user_id
INNER JOIN user_prefs T289 ON T271.id = T289.system_user_id
INNER JOIN users T290 ON T271.id = T290.system_user_id
LEFT JOIN _datasources T4 ON T271.id = T4.system_user_id
INNER JOIN _projects T8 ON T271.id = T8.system_user_id
INNER JOIN _sessions T10 ON T271.id = T10.system_user_id
INNER JOIN _tags T14 ON T271.id = T14.system_user_id
INNER JOIN _users T15 ON T271.id = T15.system_user_id
INNER JOIN _views_stats T17 ON T271.id = T17.system_users_id
INNER JOIN _workbooks T18 ON T271.id = T18.system_user_id
INNER JOIN users_view T291 ON T271.id = T291.system_user_id
---------------------------------------------------
-- Table hist_views
SELECT DISTINCT
T92.id AS "Id (Hist VW)",
T92.name AS "Name (Hist VW)",
T92.repository_url AS "Repository_Url (Hist VW)",
T92.revision AS "Revision (Hist VW)",
T92.view_id AS "View_ID (Hist VW)"
FROM
hist_views T92
LEFT JOIN views T297 ON T92.view_id = T297.id
INNER JOIN historical_events T96 ON T92.id = T96.hist_view_id
---------------------------------------------------
-- Table pg_shseclabel
SELECT DISTINCT
T182.classoid AS "Classoid (PG SH SecLabel)",
T182.label AS "Label (PG SH SecLabel)",
T182.objoid AS "Objoid (PG SH SecLabel)",
T182.provider AS "Provider (PG SH SecLabel)"
FROM
pg_shseclabel T182
---------------------------------------------------
-- Table pg_seclabels
SELECT DISTINCT
T178.classoid AS "Classoid (PG Seclabels)",
T178.label AS "Label (PG Seclabels)",
T178.objname AS "Objname (PG Seclabels)",
T178.objnamespace AS "Objnamespace (PG Seclabels)",
T178.objoid AS "Objoid (PG Seclabels)",
T178.objsubid AS "Objsubid (PG Seclabels)",
T178.objtype AS "Objtype (PG Seclabels)",
T178.provider AS "Provider (PG Seclabels)"
FROM
pg_seclabels T178
---------------------------------------------------
-- Table sql_languages
SELECT DISTINCT
T262.sql_language_binding_style AS "Sql_Language_Binding_Style (SQL Lang)",
T262.sql_language_conformance AS "Sql_Language_Conformance (SQL Lang)",
T262.sql_language_implementation AS "Sql_Language_Implementation (SQL Lang)",
T262.sql_language_integrity AS "Sql_Language_Integrity (SQL Lang)",
T262.sql_language_programming_language AS "Sql_Language_Programming_Language (SQL Lang)",
T262.sql_language_source AS "Sql_Language_Source (SQL Lang)",
T262.sql_language_year AS "Sql_Language_Year (SQL Lang)"
FROM
sql_languages T262
---------------------------------------------------
-- Table schemata
SELECT DISTINCT
T245.catalog_name AS "Catalog_Name (Schemata)",
T245.default_character_set_catalog AS "Default_Character_Set_Catalog (Schemata)",
T245.default_character_set_name AS "Default_Character_Set_Name (Schemata)",
T245.default_character_set_schema AS "Default_Character_Set_Schema (Schemata)",
T245.schema_name AS "Schema_Name (Schemata)",
T245.schema_owner AS "Schema_Owner (Schemata)",
T245.sql_path AS "Sql_Path (Schemata)"
FROM
schemata T245
---------------------------------------------------
-- Table http_requests
SELECT DISTINCT
T97.action AS "Action (Usage)",
T97.completed_at AS "Completed_At (Usage)",
T97.controller AS "Controller (Usage)",
T97.created_at AS "Created_At (Usage)",
T97.currentsheet AS "Currentsheet (Usage)",
T97.http_referer AS "Http_Referer (Usage)",
T97.http_request_uri AS "Http_Request_Uri (Usage)",
T97.http_user_agent AS "Http_User_Agent (Usage)",
T97.id AS "Id (Usage)",
T97.port AS "Port (Usage)",
T97.remote_ip AS "Remote_Ip (Usage)",
T97.session_id AS "Session_ID (Usage)",
T97.site_id AS "Site_ID (Usage)",
T97.status AS "Status (Usage)",
T97.user_cookie AS "User_Cookie (Usage)",
T97.user_id AS "User_ID (Usage)",
T97.user_ip AS "User_Ip (Usage)",
T97.vizql_session AS "Vizql_Session (Usage)",
T97.worker AS "Worker (Usage)"
FROM
http_requests T97
INNER JOIN users T290 ON T97.user_id = T290.id
INNER JOIN sites T259 ON T97.site_id = T259.id
INNER JOIN views T297 ON T97.currentsheet = T297.view_url
INNER JOIN users T290 ON T97.owner_id = T290.id
---------------------------------------------------
-- Table hist_projects
SELECT DISTINCT
T86.id AS "Id (Hist Projects)",
T86.name AS "Name (Hist Projects)",
T86.project_id AS "Project_ID (Hist Projects)"
FROM
hist_projects T86
LEFT JOIN projects T227 ON T86.project_id = T227.id
INNER JOIN historical_events T96 ON T86.id = T96.hist_project_id
---------------------------------------------------
-- Table pg_matviews
SELECT DISTINCT
T160.definition AS "Definition (PG Mat VW)",
T160.hasindexes AS "Hasindexes (PG Mat VW)",
T160.ispopulated AS "Ispopulated (PG Mat VW)",
T160.matviewname AS "Matviewname (PG Mat VW)",
T160.matviewowner AS "Matviewowner (PG Mat VW)",
T160.schemaname AS "Schemaname (PG Mat VW)",
T160.tablespace AS "Tablespace (PG Mat VW)"
FROM
pg_matviews T160
---------------------------------------------------
-- Table sql_packages
SELECT DISTINCT
T263.comments AS "Comments (SQL Packages)",
T263.feature_id AS "Feature_ID (SQL Packages)",
T263.feature_name AS "Feature_Name (SQL Packages)",
T263.is_supported AS "Is_Supported (SQL Packages)",
T263.is_verified_by AS "Is_Verified_By (SQL Packages)"
FROM
sql_packages T263
---------------------------------------------------
-- Table sheet_images
SELECT DISTINCT
T251.cropped_height AS "Cropped_Height (Sheet IMG)",
T251.cropped_width AS "Cropped_Width (Sheet IMG)",
T251.customized_view_id AS "Customized_View_ID (Sheet IMG)",
T251.data_id AS "Data_ID (Sheet IMG)",
T251.data_storage_id AS "Data_Storage_ID (Sheet IMG)",
T251.freshness_verified_at AS "Freshness_Verified_At (Sheet IMG)",
T251.generated_as_user_id AS "Generated_As_User_ID (Sheet IMG)",
T251.generated_at AS "Generated_At (Sheet IMG)",
T251.height AS "Height (Sheet IMG)",
T251.id AS "Id (Sheet IMG)",
T251.language_id AS "Language_ID (Sheet IMG)",
T251.locale_id AS "Locale_ID (Sheet IMG)",
T251.pixel_ratio AS "Pixel_Ratio (Sheet IMG)",
T251.view_id AS "View_ID (Sheet IMG)",
T251.width AS "Width (Sheet IMG)"
FROM
sheet_images T251
LEFT JOIN views T297 ON T251.view_id = T297.id
LEFT JOIN repository_data T234 ON T251.data_storage_id = T234.id
LEFT JOIN users T290 ON T251.generated_as_user_id = T290.id
LEFT JOIN customized_views T46 ON T251.customized_view_id = T46.id
---------------------------------------------------
-- Table exportable_tables
SELECT DISTINCT
T64.custom_sql AS "Custom_Sql (Exp TBL)",
T64.exportable_type_id AS "Exportable_Type_ID (Exp TBL)",
T64.id AS "Id (Exp TBL)",
T64.name AS "Name (Exp TBL)",
T64.primary_key_column_name AS "Primary_Key_Column_Name (Exp TBL)"
FROM
exportable_tables T64
---------------------------------------------------
-- Table tables
SELECT DISTINCT
T275.commit_action AS "Commit_Action (Tables)",
T275.is_insertable_into AS "Is_Insertable_Into (Tables)",
T275.is_typed AS "Is_Typed (Tables)",
T275.reference_generation AS "Reference_Generation (Tables)",
T275.self_referencing_column_name AS "Self_Referencing_Column_Name (Tables)",
T275.table_catalog AS "Table_Catalog (Tables)",
T275.table_name AS "Table_Name (Tables)",
T275.table_schema AS "Table_Schema (Tables)",
T275.table_type AS "Table_Type (Tables)",
T275.user_defined_type_catalog AS "User_Defined_Type_Catalog (Tables)",
T275.user_defined_type_name AS "User_Defined_Type_Name (Tables)",
T275.user_defined_type_schema AS "User_Defined_Type_Schema (Tables)"
FROM
tables T275
---------------------------------------------------
-- Table refresh_token_devices
SELECT DISTINCT
T231.device_id AS "Device_ID (Ref Token Devs)",
T231.device_name AS "Device_Name (Ref Token Devs)",
T231.id AS "Id (Ref Token Devs)",
T231.last_used_at AS "Last_Used_At (Ref Token Devs)",
T231.system_user_id AS "System_User_ID (Ref Token Devs)"
FROM
refresh_token_devices T231
INNER JOIN system_users T271 ON T231.system_user_id = T271.id
INNER JOIN refresh_tokens T232 ON T231.id = T232.refresh_token_device_id
---------------------------------------------------
-- Table pg_stat_database_conflicts
SELECT DISTINCT
T189.confl_bufferpin AS "Confl_Bufferpin (PG Stat DB Conflicts)",
T189.confl_deadlock AS "Confl_Deadlock (PG Stat DB Conflicts)",
T189.confl_lock AS "Confl_Lock (PG Stat DB Conflicts)",
T189.confl_snapshot AS "Confl_Snapshot (PG Stat DB Conflicts)",
T189.confl_tablespace AS "Confl_Tablespace (PG Stat DB Conflicts)",
T189.datid AS "Datid (PG Stat DB Conflicts)",
T189.datname AS "Datname (PG Stat DB Conflicts)"
FROM
pg_stat_database_conflicts T189
---------------------------------------------------
-- Table pg_stat_user_indexes
SELECT DISTINCT
T195.idx_scan AS "Idx_Scan (PG Stat User IDX)",
T195.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat User IDX)",
T195.idx_tup_read AS "Idx_Tup_Read (PG Stat User IDX)",
T195.indexrelid AS "Indexrelid (PG Stat User IDX)",
T195.indexrelname AS "Indexrelname (PG Stat User IDX)",
T195.relid AS "Relid (PG Stat User IDX)",
T195.relname AS "Relname (PG Stat User IDX)",
T195.schemaname AS "Schemaname (PG Stat User IDX)"
FROM
pg_stat_user_indexes T195
---------------------------------------------------
-- Table pg_constraint
SELECT DISTINCT
T139.conbin AS "Conbin (PG Constr)",
T139.condeferrable AS "Condeferrable (PG Constr)",
T139.condeferred AS "Condeferred (PG Constr)",
T139.conexclop AS "Conexclop (PG Constr)",
T139.confdeltype AS "Confdeltype (PG Constr)",
T139.conffeqop AS "Conffeqop (PG Constr)",
T139.confkey AS "Confkey (PG Constr)",
T139.confmatchtype AS "Confmatchtype (PG Constr)",
T139.confrelid AS "Confrelid (PG Constr)",
T139.confupdtype AS "Confupdtype (PG Constr)",
T139.conindid AS "Conindid (PG Constr)",
T139.coninhcount AS "Coninhcount (PG Constr)",
T139.conislocal AS "Conislocal (PG Constr)",
T139.conkey AS "Conkey (PG Constr)",
T139.conname AS "Conname (PG Constr)",
T139.connamespace AS "Connamespace (PG Constr)",
T139.connoinherit AS "Connoinherit (PG Constr)",
T139.conpfeqop AS "Conpfeqop (PG Constr)",
T139.conppeqop AS "Conppeqop (PG Constr)",
T139.conrelid AS "Conrelid (PG Constr)",
T139.consrc AS "Consrc (PG Constr)",
T139.contype AS "Contype (PG Constr)",
T139.contypid AS "Contypid (PG Constr)",
T139.convalidated AS "Convalidated (PG Constr)"
FROM
pg_constraint T139
---------------------------------------------------
-- Table hist_data_connections
SELECT DISTINCT
T82.data_connection_id AS "Data_Connection_ID (Hist Data Conns)",
T82.dbname AS "Dbname (Hist Data Conns)",
T82.id AS "Id (Hist Data Conns)",
T82.name AS "Name (Hist Data Conns)",
T82.server AS "Server (Hist Data Conns)",
T82.table_name AS "Table_Name (Hist Data Conns)"
FROM
hist_data_connections T82
LEFT JOIN data_connections T49 ON T82.data_connection_id = T49.id
INNER JOIN historical_events T96 ON T82.id = T96.hist_data_connection_id
---------------------------------------------------
-- Table auto_saves
SELECT DISTINCT
T27.created_at AS "Created_At (Auto Save)",
T27.guid AS "Guid (Auto Save)",
T27.id AS "Id (Auto Save)",
T27.save_data_repository_id AS "Save_Data_Repository_ID (Auto Save)",
T27.source_id AS "Source_ID (Auto Save)",
T27.source_type AS "Source_Type (Auto Save)",
T27.updated_at AS "Updated_At (Auto Save)",
T27.user_id AS "User_ID (Auto Save)"
FROM
auto_saves T27
---------------------------------------------------
-- Table hist_comments
SELECT DISTINCT
T80.comment AS "Comment (Hist Comments)",
T80.comment_id AS "Comment_ID (Hist Comments)",
T80.id AS "Id (Hist Comments)"
FROM
hist_comments T80
LEFT JOIN comments T42 ON T80.comment_id = T42.id
INNER JOIN historical_events T96 ON T80.id = T96.hist_comment_id
---------------------------------------------------
-- Table pg_ts_parser
SELECT DISTINCT
T220.prsend AS "Prsend (PG TS Parser)",
T220.prsheadline AS "Prsheadline (PG TS Parser)",
T220.prslextype AS "Prslextype (PG TS Parser)",
T220.prsname AS "Prsname (PG TS Parser)",
T220.prsnamespace AS "Prsnamespace (PG TS Parser)",
T220.prsstart AS "Prsstart (PG TS Parser)",
T220.prstoken AS "Prstoken (PG TS Parser)"
FROM
pg_ts_parser T220
---------------------------------------------------
-- Table _comments
SELECT DISTINCT
T2.comment AS "Comment (_Comments)",
T2.commentable_id AS "Commentable_ID (_Comments)",
T2.commentable_type AS "Commentable_Type (_Comments)",
T2.created_at AS "Created_At (_Comments)",
T2.drawing AS "Drawing (_Comments)",
T2.id AS "Id (_Comments)",
T2.site_id AS "Site_ID (_Comments)",
T2.title AS "Title (_Comments)",
T2.user_id AS "User_ID (_Comments)"
FROM
_comments T2
INNER JOIN views T297 ON T2.commentable_id = T297.id
INNER JOIN users T290 ON T2.user_id = T290.id
INNER JOIN sites T259 ON T2.site_id = T259.id
---------------------------------------------------
-- Table datasource_refresh_properties
SELECT DISTINCT
T53.failure_notification_history AS "Failure_Notification_History (DS Ref Prop)",
T53.id AS "Id (DS Ref Prop)",
T53.last_refresh_error AS "Last_Refresh_Error (DS Ref Prop)",
T53.last_refresh_error_client_data AS "Last_Refresh_Error_Client_Data (DS Ref Prop)",
T53.last_refresh_error_time AS "Last_Refresh_Error_Time (DS Ref Prop)",
T53.refresh_mode AS "Refresh_Mode (DS Ref Prop)",
T53.remote_agent_id AS "Remote_Agent_ID (DS Ref Prop)",
T53.remote_agent_reservation_id AS "Remote_Agent_Reservation_ID (DS Ref Prop)",
T53.schedules AS "Schedules (DS Ref Prop)"
FROM
datasource_refresh_properties T53
LEFT JOIN remote_agents T233 ON T53.remote_agent_id = T233.id
LEFT JOIN datasources T55 ON T53.id = T55.id
---------------------------------------------------
-- Table foreign_data_wrappers
SELECT DISTINCT
T71.authorization_identifier AS "Authorization_Identifier (Foreign Data Wrap)",
T71.foreign_data_wrapper_catalog AS "Foreign_Data_Wrapper_Catalog (Foreign Data Wrap)",
T71.foreign_data_wrapper_language AS "Foreign_Data_Wrapper_Language (Foreign Data Wrap)",
T71.foreign_data_wrapper_name AS "Foreign_Data_Wrapper_Name (Foreign Data Wrap)",
T71.library_name AS "Library_Name (Foreign Data Wrap)"
FROM
foreign_data_wrappers T71
---------------------------------------------------
-- Table _schedules
SELECT DISTINCT
T9.active AS "Active (_Sched)",
T9.created_at AS "Created_At (_Sched)",
T9.day_of_month_mask AS "Day_Of_Month_Mask (_Sched)",
T9.day_of_week_mask AS "Day_Of_Week_Mask (_Sched)",
T9.end_at_minute AS "End_At_Minute (_Sched)",
T9.end_schedule_at AS "End_Schedule_At (_Sched)",
T9.hidden AS "Hidden (_Sched)",
T9.id AS "Id (_Sched)",
T9.lock_version AS "Lock_Version (_Sched)",
T9.minute_interval AS "Minute_Interval (_Sched)",
T9.name AS "Name (_Sched)",
T9.priority AS "Priority (_Sched)",
T9.run_next_at AS "Run_Next_At (_Sched)",
T9.schedule_type AS "Schedule_Type (_Sched)",
T9.scheduled_action AS "Scheduled_Action (_Sched)",
T9.scheduled_action_type AS "Scheduled_Action_Type (_Sched)",
T9.serial_collection_id AS "Serial_Collection_ID (_Sched)",
T9.start_at_minute AS "Start_At_Minute (_Sched)",
T9.updated_at AS "Updated_At (_Sched)"
FROM
_schedules T9
LEFT JOIN serial_collections T247 ON T9.serial_collection_id = T247.id
---------------------------------------------------
-- Table pg_auth_members
SELECT DISTINCT
T133.admin_option AS "Admin_Option (PG Auth Members)",
T133.grantor AS "Grantor (PG Auth Members)",
T133.member AS "Member (PG Auth Members)",
T133.roleid AS "Roleid (PG Auth Members)"
FROM
pg_auth_members T133
---------------------------------------------------
-- Table pg_index
SELECT DISTINCT
T154.indcheckxmin AS "Indcheckxmin (PG IDX)",
T154.indclass AS "Indclass (PG IDX)",
T154.indcollation AS "Indcollation (PG IDX)",
T154.indexprs AS "Indexprs (PG IDX)",
T154.indexrelid AS "Indexrelid (PG IDX)",
T154.indimmediate AS "Indimmediate (PG IDX)",
T154.indisclustered AS "Indisclustered (PG IDX)",
T154.indisexclusion AS "Indisexclusion (PG IDX)",
T154.indislive AS "Indislive (PG IDX)",
T154.indisprimary AS "Indisprimary (PG IDX)",
T154.indisready AS "Indisready (PG IDX)",
T154.indisreplident AS "Indisreplident (PG IDX)",
T154.indisunique AS "Indisunique (PG IDX)",
T154.indisvalid AS "Indisvalid (PG IDX)",
T154.indkey AS "Indkey (PG IDX)",
T154.indnatts AS "Indnatts (PG IDX)",
T154.indoption AS "Indoption (PG IDX)",
T154.indpred AS "Indpred (PG IDX)",
T154.indrelid AS "Indrelid (PG IDX)"
FROM
pg_index T154
---------------------------------------------------
-- Table pg_operator
SELECT DISTINCT
T163.oprcanhash AS "Oprcanhash (PG Opr)",
T163.oprcanmerge AS "Oprcanmerge (PG Opr)",
T163.oprcode AS "Oprcode (PG Opr)",
T163.oprcom AS "Oprcom (PG Opr)",
T163.oprjoin AS "Oprjoin (PG Opr)",
T163.oprkind AS "Oprkind (PG Opr)",
T163.oprleft AS "Oprleft (PG Opr)",
T163.oprname AS "Oprname (PG Opr)",
T163.oprnamespace AS "Oprnamespace (PG Opr)",
T163.oprnegate AS "Oprnegate (PG Opr)",
T163.oprowner AS "Oprowner (PG Opr)",
T163.oprrest AS "Oprrest (PG Opr)",
T163.oprresult AS "Oprresult (PG Opr)",
T163.oprright AS "Oprright (PG Opr)"
FROM
pg_operator T163
---------------------------------------------------
-- Table pg_foreign_data_wrapper
SELECT DISTINCT
T150.fdwacl AS "Fdwacl (PG Foreign Data Wrap)",
T150.fdwhandler AS "Fdwhandler (PG Foreign Data Wrap)",
T150.fdwname AS "Fdwname (PG Foreign Data Wrap)",
T150.fdwoptions AS "Fdwoptions (PG Foreign Data Wrap)",
T150.fdwowner AS "Fdwowner (PG Foreign Data Wrap)",
T150.fdwvalidator AS "Fdwvalidator (PG Foreign Data Wrap)"
FROM
pg_foreign_data_wrapper T150
---------------------------------------------------
-- Table subscriptions_customized_views
SELECT DISTINCT
T268.customized_view_id AS "Customized_View_ID (Subscr Cust VW)",
T268.id AS "Id (Subscr Cust VW)",
T268.subscription_id AS "Subscription_ID (Subscr Cust VW)"
FROM
subscriptions_customized_views T268
LEFT JOIN subscriptions T267 ON T268.subscription_id = T267.id
LEFT JOIN customized_views T46 ON T268.customized_view_id = T46.id
---------------------------------------------------
-- Table applicable_roles
SELECT DISTINCT
T20.grantee AS "Grantee (App Roles)",
T20.is_grantable AS "Is_Grantable (App Roles)",
T20.role_name AS "Role_Name (App Roles)"
FROM
applicable_roles T20
---------------------------------------------------
-- Table extracts
SELECT DISTINCT
T68.created_at AS "Created_At (Extracts)",
T68.datasource_id AS "Datasource_ID (Extracts)",
T68.descriptor AS "Descriptor (Extracts)",
T68.id AS "Id (Extracts)",
T68.updated_at AS "Updated_At (Extracts)",
T68.workbook_id AS "Workbook_ID (Extracts)"
FROM
extracts T68
LEFT JOIN workbooks T301 ON T68.workbook_id = T301.id
LEFT JOIN datasources T55 ON T68.datasource_id = T55.id
---------------------------------------------------
-- Table attributes
SELECT DISTINCT
T26.attribute_default AS "Attribute_Default (Attrs)",
T26.attribute_name AS "Attribute_Name (Attrs)",
T26.attribute_udt_catalog AS "Attribute_Udt_Catalog (Attrs)",
T26.attribute_udt_name AS "Attribute_Udt_Name (Attrs)",
T26.attribute_udt_schema AS "Attribute_Udt_Schema (Attrs)",
T26.character_maximum_length AS "Character_Maximum_Length (Attrs)",
T26.character_octet_length AS "Character_Octet_Length (Attrs)",
T26.character_set_catalog AS "Character_Set_Catalog (Attrs)",
T26.character_set_name AS "Character_Set_Name (Attrs)",
T26.character_set_schema AS "Character_Set_Schema (Attrs)",
T26.collation_catalog AS "Collation_Catalog (Attrs)",
T26.collation_name AS "Collation_Name (Attrs)",
T26.collation_schema AS "Collation_Schema (Attrs)",
T26.data_type AS "Data_Type (Attrs)",
T26.datetime_precision AS "Datetime_Precision (Attrs)",
T26.dtd_identifier AS "Dtd_Identifier (Attrs)",
T26.interval_precision AS "Interval_Precision (Attrs)",
T26.interval_type AS "Interval_Type (Attrs)",
T26.is_derived_reference_attribute AS "Is_Derived_Reference_Attribute (Attrs)",
T26.is_nullable AS "Is_Nullable (Attrs)",
T26.maximum_cardinality AS "Maximum_Cardinality (Attrs)",
T26.numeric_precision AS "Numeric_Precision (Attrs)",
T26.numeric_precision_radix AS "Numeric_Precision_Radix (Attrs)",
T26.numeric_scale AS "Numeric_Scale (Attrs)",
T26.ordinal_position AS "Ordinal_Position (Attrs)",
T26.scope_catalog AS "Scope_Catalog (Attrs)",
T26.scope_name AS "Scope_Name (Attrs)",
T26.scope_schema AS "Scope_Schema (Attrs)",
T26.udt_catalog AS "Udt_Catalog (Attrs)",
T26.udt_name AS "Udt_Name (Attrs)",
T26.udt_schema AS "Udt_Schema (Attrs)"
FROM
attributes T26
---------------------------------------------------
-- Table _subscriptions
SELECT DISTINCT
T12.content_type AS "Content_Type (_Subscr)",
T12.customized_view_id AS "Customized_View_ID (_Subscr)",
T12.id AS "Id (_Subscr)",
T12.last_sent AS "Last_Sent (_Subscr)",
T12.schedule_active AS "Schedule_Active (_Subscr)",
T12.schedule_name AS "Schedule_Name (_Subscr)",
T12.schedule_priority AS "Schedule_Priority (_Subscr)",
T12.schedule_run_next_at AS "Schedule_Run_Next_At (_Subscr)",
T12.site_id AS "Site_ID (_Subscr)",
T12.site_name AS "Site_Name (_Subscr)",
T12.subject AS "Subject (_Subscr)",
T12.user_id AS "User_ID (_Subscr)",
T12.user_name AS "User_Name (_Subscr)",
T12.view_url AS "View_Url (_Subscr)",
T12.workbook_url AS "Workbook_Url (_Subscr)"
FROM
_subscriptions T12
INNER JOIN users T290 ON T12.user_id = T290.id
INNER JOIN sites T259 ON T12.site_id = T259.id
---------------------------------------------------
-- Table pg_rewrite
SELECT DISTINCT
T174.ev_action AS "Ev_Action (PG Rewrite)",
T174.ev_class AS "Ev_Class (PG Rewrite)",
T174.ev_enabled AS "Ev_Enabled (PG Rewrite)",
T174.ev_qual AS "Ev_Qual (PG Rewrite)",
T174.ev_type AS "Ev_Type (PG Rewrite)",
T174.is_instead AS "Is_Instead (PG Rewrite)",
T174.rulename AS "Rulename (PG Rewrite)"
FROM
pg_rewrite T174
---------------------------------------------------
-- Table pg_statio_user_sequences
SELECT DISTINCT
T208.blks_hit AS "Blks_Hit (PG Statio User Seq)",
T208.blks_read AS "Blks_Read (PG Statio User Seq)",
T208.relid AS "Relid (PG Statio User Seq)",
T208.relname AS "Relname (PG Statio User Seq)",
T208.schemaname AS "Schemaname (PG Statio User Seq)"
FROM
pg_statio_user_sequences T208
---------------------------------------------------
-- Table user_mapping_options
SELECT DISTINCT
T287.authorization_identifier AS "Authorization_Identifier (User Map Opt)",
T287.foreign_server_catalog AS "Foreign_Server_Catalog (User Map Opt)",
T287.foreign_server_name AS "Foreign_Server_Name (User Map Opt)",
T287.option_name AS "Option_Name (User Map Opt)",
T287.option_value AS "Option_Value (User Map Opt)"
FROM
user_mapping_options T287
---------------------------------------------------
-- Table hist_users
SELECT DISTINCT
T91.domain_name AS "Domain_Name (Hist Users)",
T91.email AS "Email (Hist Users)",
T91.hist_licensing_role_id AS "Hist_Licensing_Role_ID (Hist Users)",
T91.id AS "Id (Hist Users)",
T91.name AS "Name (Hist Users)",
T91.publisher_tristate AS "Publisher_Tristate (Hist Users)",
T91.site_admin_level AS "Site_Admin_Level (Hist Users)",
T91.system_admin_level AS "System_Admin_Level (Hist Users)",
T91.system_user_id AS "System_User_ID (Hist Users)",
T91.user_id AS "User_ID (Hist Users)"
FROM
hist_users T91
LEFT JOIN users T290 ON T91.user_id = T290.id
LEFT JOIN system_users T271 ON T91.system_user_id = T271.id
INNER JOIN hist_licensing_roles T85 ON T91.hist_licensing_role_id = T85.licensing_role_id
INNER JOIN historical_events T96 ON T91.id = T96.hist_actor_user_id
INNER JOIN historical_events T96 ON T91.id = T96.hist_target_user_id
---------------------------------------------------
-- Table routines
SELECT DISTINCT
T242.as_locator AS "As_Locator (Routines)",
T242.character_maximum_length AS "Character_Maximum_Length (Routines)",
T242.character_octet_length AS "Character_Octet_Length (Routines)",
T242.character_set_catalog AS "Character_Set_Catalog (Routines)",
T242.character_set_name AS "Character_Set_Name (Routines)",
T242.character_set_schema AS "Character_Set_Schema (Routines)",
T242.collation_catalog AS "Collation_Catalog (Routines)",
T242.collation_name AS "Collation_Name (Routines)",
T242.collation_schema AS "Collation_Schema (Routines)",
T242.created AS "Created (Routines)",
T242.data_type AS "Data_Type (Routines)",
T242.datetime_precision AS "Datetime_Precision (Routines)",
T242.dtd_identifier AS "Dtd_Identifier (Routines)",
T242.external_language AS "External_Language (Routines)",
T242.external_name AS "External_Name (Routines)",
T242.interval_precision AS "Interval_Precision (Routines)",
T242.interval_type AS "Interval_Type (Routines)",
T242.is_deterministic AS "Is_Deterministic (Routines)",
T242.is_implicitly_invocable AS "Is_Implicitly_Invocable (Routines)",
T242.is_null_call AS "Is_Null_Call (Routines)",
T242.is_udt_dependent AS "Is_Udt_Dependent (Routines)",
T242.is_user_defined_cast AS "Is_User_Defined_Cast (Routines)",
T242.last_altered AS "Last_Altered (Routines)",
T242.max_dynamic_result_sets AS "Max_Dynamic_Result_Sets (Routines)",
T242.maximum_cardinality AS "Maximum_Cardinality (Routines)",
T242.module_catalog AS "Module_Catalog (Routines)",
T242.module_name AS "Module_Name (Routines)",
T242.module_schema AS "Module_Schema (Routines)",
T242.new_savepoint_level AS "New_Savepoint_Level (Routines)",
T242.numeric_precision AS "Numeric_Precision (Routines)",
T242.numeric_precision_radix AS "Numeric_Precision_Radix (Routines)",
T242.numeric_scale AS "Numeric_Scale (Routines)",
T242.parameter_style AS "Parameter_Style (Routines)",
T242.result_cast_as_locator AS "Result_Cast_As_Locator (Routines)",
T242.result_cast_char_max_length AS "Result_Cast_Char_Max_Length (Routines)",
T242.result_cast_char_octet_length AS "Result_Cast_Char_Octet_Length (Routines)",
T242.result_cast_char_set_catalog AS "Result_Cast_Char_Set_Catalog (Routines)",
T242.result_cast_char_set_schema AS "Result_Cast_Char_Set_Schema (Routines)",
T242.result_cast_character_set_name AS "Result_Cast_Character_Set_Name (Routines)",
T242.result_cast_collation_catalog AS "Result_Cast_Collation_Catalog (Routines)",
T242.result_cast_collation_name AS "Result_Cast_Collation_Name (Routines)",
T242.result_cast_collation_schema AS "Result_Cast_Collation_Schema (Routines)",
T242.result_cast_datetime_precision AS "Result_Cast_Datetime_Precision (Routines)",
T242.result_cast_dtd_identifier AS "Result_Cast_Dtd_Identifier (Routines)",
T242.result_cast_from_data_type AS "Result_Cast_From_Data_Type (Routines)",
T242.result_cast_interval_precision AS "Result_Cast_Interval_Precision (Routines)",
T242.result_cast_interval_type AS "Result_Cast_Interval_Type (Routines)",
T242.result_cast_maximum_cardinality AS "Result_Cast_Maximum_Cardinality (Routines)",
T242.result_cast_numeric_precision AS "Result_Cast_Numeric_Precision (Routines)",
T242.result_cast_numeric_precision_radix AS "Result_Cast_Numeric_Precision_Radix (Routines)",
T242.result_cast_numeric_scale AS "Result_Cast_Numeric_Scale (Routines)",
T242.result_cast_scope_catalog AS "Result_Cast_Scope_Catalog (Routines)",
T242.result_cast_scope_name AS "Result_Cast_Scope_Name (Routines)",
T242.result_cast_scope_schema AS "Result_Cast_Scope_Schema (Routines)",
T242.result_cast_type_udt_catalog AS "Result_Cast_Type_Udt_Catalog (Routines)",
T242.result_cast_type_udt_name AS "Result_Cast_Type_Udt_Name (Routines)",
T242.result_cast_type_udt_schema AS "Result_Cast_Type_Udt_Schema (Routines)",
T242.routine_body AS "Routine_Body (Routines)",
T242.routine_catalog AS "Routine_Catalog (Routines)",
T242.routine_definition AS "Routine_Definition (Routines)",
T242.routine_name AS "Routine_Name (Routines)",
T242.routine_schema AS "Routine_Schema (Routines)",
T242.routine_type AS "Routine_Type (Routines)",
T242.schema_level_routine AS "Schema_Level_Routine (Routines)",
T242.scope_catalog AS "Scope_Catalog (Routines)",
T242.scope_name AS "Scope_Name (Routines)",
T242.scope_schema AS "Scope_Schema (Routines)",
T242.security_type AS "Security_Type (Routines)",
T242.specific_catalog AS "Specific_Catalog (Routines)",
T242.specific_name AS "Specific_Name (Routines)",
T242.specific_schema AS "Specific_Schema (Routines)",
T242.sql_data_access AS "Sql_Data_Access (Routines)",
T242.sql_path AS "Sql_Path (Routines)",
T242.to_sql_specific_catalog AS "To_Sql_Specific_Catalog (Routines)",
T242.to_sql_specific_name AS "To_Sql_Specific_Name (Routines)",
T242.to_sql_specific_schema AS "To_Sql_Specific_Schema (Routines)",
T242.type_udt_catalog AS "Type_Udt_Catalog (Routines)",
T242.type_udt_name AS "Type_Udt_Name (Routines)",
T242.type_udt_schema AS "Type_Udt_Schema (Routines)",
T242.udt_catalog AS "Udt_Catalog (Routines)",
T242.udt_name AS "Udt_Name (Routines)",
T242.udt_schema AS "Udt_Schema (Routines)"
FROM
routines T242
---------------------------------------------------
-- Table pg_enum
SELECT DISTINCT
T147.enumlabel AS "Enumlabel (PG Enum)",
T147.enumsortorder AS "Enumsortorder (PG Enum)",
T147.enumtypid AS "Enumtypid (PG Enum)"
FROM
pg_enum T147
---------------------------------------------------
-- Table workbooks
SELECT DISTINCT
T301.asset_key_id AS "Asset_Key_ID (WB)",
T301.checksum AS "Checksum (WB)",
T301.content_version AS "Content_Version (WB)",
T301.created_at AS "Created_At (WB)",
T301.data_engine_extracts AS "Data_Engine_Extracts (WB)",
T301.data_id AS "Data_ID (WB)",
T301.default_view_index AS "Default_View_Index (WB)",
T301.description AS "Description (WB)",
T301.display_tabs AS "Display_Tabs (WB)",
T301.document_version AS "Document_Version (WB)",
T301.embedded AS "Embedded (WB)",
T301.extracts_incremented_at AS "Extracts_Incremented_At (WB)",
T301.extracts_refreshed_at AS "Extracts_Refreshed_At (WB)",
T301.first_published_at AS "First_Published_At (WB)",
T301.id AS "Id (WB)",
T301.incrementable_extracts AS "Incrementable_Extracts (WB)",
T301.last_published_at AS "Last_Published_At (WB)",
T301.lock_version AS "Lock_Version (WB)",
T301.luid AS "Luid (WB)",
T301.name AS "Name (WB)",
T301.owner_id AS "Owner_ID (WB)",
T301.primary_content_url AS "Primary_Content_Url (WB)",
T301.project_id AS "Project_ID (WB)",
T301.published_all_sheets AS "Published_All_Sheets (WB)",
T301.reduced_data_id AS "Reduced_Data_ID (WB)",
T301.refreshable_extracts AS "Refreshable_Extracts (WB)",
T301.repository_data_id AS "Repository_Data_ID (WB)",
T301.repository_extract_data_id AS "Repository_Extract_Data_ID (WB)",
T301.repository_url AS "Repository_Url (WB)",
T301.revision AS "Revision (WB)",
T301.share_description AS "Share_Description (WB)",
T301.show_toolbar AS "Show_Toolbar (WB)",
T301.site_id AS "Site_ID (WB)",
T301.size AS "Size (WB)",
T301.state AS "State (WB)",
T301.thumb_user AS "Thumb_User (WB)",
T301.updated_at AS "Updated_At (WB)",
T301.version AS "Version (WB)",
T301.view_count AS "View_Count (WB)"
FROM
workbooks T301
LEFT JOIN data_alerts T47 ON T301.id = T47.workbook_id
LEFT JOIN data_connections T49 ON T301.id = T49.owner_id AND data_connections.OWNER_TYPE = 'Workbook'
LEFT JOIN datasources T55 ON T301.id = T55.parent_workbook_id
LEFT JOIN extracts T68 ON T301.id = T68.workbook_id
LEFT JOIN hist_workbooks T93 ON T301.id = T93.workbook_id
LEFT JOIN most_recent_refreshes T116 ON T301.id = T116.workbook_id
LEFT JOIN next_gen_permissions T120 ON T301.id = T120.authorizable_id AND next_gen_permissions.authorizable_type = 'Workbook'
INNER JOIN views T297 ON T301.id = T297.workbook_id
INNER JOIN workbook_checksums T299 ON T301.id = T299.workbook_id
INNER JOIN workbook_versions T300 ON T301.id = T300.workbook_id
INNER JOIN users T290 ON T301.owner_id = T290.id
INNER JOIN projects T227 ON T301.project_id = T227.id
INNER JOIN sites T259 ON T301.site_id = T259.id
LEFT JOIN _views T16 ON T301.id = T16.workbook_id
LEFT JOIN _views_stats T17 ON T301.id = T17.views_workbook_id
LEFT JOIN subscriptions_workbooks T270 ON T301.repository_url = T270.repository_url
---------------------------------------------------
-- Table sql_sizing
SELECT DISTINCT
T264.comments AS "Comments (SQL Sizing)",
T264.sizing_id AS "Sizing_ID (SQL Sizing)",
T264.sizing_name AS "Sizing_Name (SQL Sizing)",
T264.supported_value AS "Supported_Value (SQL Sizing)"
FROM
sql_sizing T264
---------------------------------------------------
-- Table hist_tags
SELECT DISTINCT
T89.id AS "Id (Hist Tags)",
T89.name AS "Name (Hist Tags)",
T89.tag_id AS "Tag_ID (Hist Tags)"
FROM
hist_tags T89
LEFT JOIN tags T277 ON T89.tag_id = T277.id
LEFT JOIN historical_events T96 ON T89.id = T96.hist_tag_id
---------------------------------------------------
-- Table view_option_keys
SELECT DISTINCT
T294.default_value AS "Default_Value (VW Opt Keys)",
T294.name AS "Name (VW Opt Keys)",
T294.value_type AS "Value_Type (VW Opt Keys)",
T294.view_option_key_id AS "View_Option_Key_ID (VW Opt Keys)"
FROM
view_option_keys T294
---------------------------------------------------
-- Table _customized_views
SELECT DISTINCT
T3.email AS "Email (_Cust VW)",
T3.id AS "Id (_Cust VW)",
T3.name AS "Name (_Cust VW)",
T3.repository_url AS "Repository_Url (_Cust VW)",
T3.sheet_id AS "Sheet_ID (_Cust VW)",
T3.site_id AS "Site_ID (_Cust VW)",
T3.size AS "Size (_Cust VW)",
T3.user_name AS "User_Name (_Cust VW)",
T3.view_name AS "View_Name (_Cust VW)",
T3.workbook_name AS "Workbook_Name (_Cust VW)",
T3.workbook_url AS "Workbook_Url (_Cust VW)"
FROM
_customized_views T3
INNER JOIN sites T259 ON T3.site_id = T259.id
---------------------------------------------------
-- Table pg_opclass
SELECT DISTINCT
T162.opcdefault AS "Opcdefault (PG OP Class)",
T162.opcfamily AS "Opcfamily (PG OP Class)",
T162.opcintype AS "Opcintype (PG OP Class)",
T162.opckeytype AS "Opckeytype (PG OP Class)",
T162.opcmethod AS "Opcmethod (PG OP Class)",
T162.opcname AS "Opcname (PG OP Class)",
T162.opcnamespace AS "Opcnamespace (PG OP Class)",
T162.opcowner AS "Opcowner (PG OP Class)"
FROM
pg_opclass T162
---------------------------------------------------
-- Table pg_namespace
SELECT DISTINCT
T161.nspacl AS "Nspacl (PG Namespace)",
T161.nspname AS "Nspname (PG Namespace)",
T161.nspowner AS "Nspowner (PG Namespace)"
FROM
pg_namespace T161
---------------------------------------------------
-- Table pg_shdepend
SELECT DISTINCT
T180.classid AS "Classid (PG Shdepend)",
T180.dbid AS "Dbid (PG Shdepend)",
T180.deptype AS "Deptype (PG Shdepend)",
T180.objid AS "Objid (PG Shdepend)",
T180.objsubid AS "Objsubid (PG Shdepend)",
T180.refclassid AS "Refclassid (PG Shdepend)",
T180.refobjid AS "Refobjid (PG Shdepend)"
FROM
pg_shdepend T180
---------------------------------------------------
-- Table usage_privileges
SELECT DISTINCT
T283.grantee AS "Grantee (Usage Privs)",
T283.grantor AS "Grantor (Usage Privs)",
T283.is_grantable AS "Is_Grantable (Usage Privs)",
T283.object_catalog AS "Object_Catalog (Usage Privs)",
T283.object_name AS "Object_Name (Usage Privs)",
T283.object_schema AS "Object_Schema (Usage Privs)",
T283.object_type AS "Object_Type (Usage Privs)",
T283.privilege_type AS "Privilege_Type (Usage Privs)"
FROM
usage_privileges T283
---------------------------------------------------
-- Table _users
SELECT DISTINCT
T15.domain_id AS "Domain_ID (_Users)",
T15.domain_name AS "Domain_Name (_Users)",
T15.domain_short_name AS "Domain_Short_Name (_Users)",
T15.friendly_name AS "Friendly_Name (_Users)",
T15.id AS "Id (_Users)",
T15.licensing_role_id AS "Licensing_Role_ID (_Users)",
T15.licensing_role_name AS "Licensing_Role_Name (_Users)",
T15.login_at AS "Login_At (_Users)",
T15.name AS "Name (_Users)",
T15.site_id AS "Site_ID (_Users)",
T15.system_user_id AS "System_User_ID (_Users)"
FROM
_users T15
INNER JOIN licensing_roles T109 ON T15.licensing_role_id = T109.id
INNER JOIN domains T60 ON T15.domain_id = T60.id
INNER JOIN system_users T271 ON T15.system_user_id = T271.id
INNER JOIN sites T259 ON T15.site_id = T259.id
---------------------------------------------------
-- Table users_view
SELECT DISTINCT
T291.email AS "Email (Users VW)",
T291.id AS "Id (Users VW)",
T291.login_at AS "Login_At (Users VW)",
T291.name AS "Name (Users VW)",
T291.sys AS "Sys (Users VW)",
T291.system_user_id AS "System_User_ID (Users VW)"
FROM
users_view T291
INNER JOIN system_users T271 ON T291.system_user_id = T271.id
---------------------------------------------------
-- Table datasource_versions
SELECT DISTINCT
T54.content_key AS "Content_Key (DS Ver)",
T54.datasource_id AS "Datasource_ID (DS Ver)",
T54.id AS "Id (DS Ver)",
T54.published_at AS "Published_At (DS Ver)",
T54.publisher_id AS "Publisher_ID (DS Ver)",
T54.site_id AS "Site_ID (DS Ver)",
T54.size AS "Size (DS Ver)",
T54.sos_type AS "Sos_Type (DS Ver)",
T54.version_number AS "Version_Number (DS Ver)"
FROM
datasource_versions T54
INNER JOIN sites T259 ON T54.site_id = T259.id
INNER JOIN datasources T55 ON T54.datasource_id = T55.id
---------------------------------------------------
-- Table monitoring_postgresql
SELECT DISTINCT
T115.pk AS "Pk (Mon PSQL)",
T115.primary_ip AS "Primary_Ip (Mon PSQL)",
T115.primary_port AS "Primary_Port (Mon PSQL)",
T115.secondary_ip AS "Secondary_Ip (Mon PSQL)",
T115.secondary_port AS "Secondary_Port (Mon PSQL)",
T115.updated_at AS "Updated_At (Mon PSQL)",
T115.updated_by AS "Updated_By (Mon PSQL)"
FROM
monitoring_postgresql T115
---------------------------------------------------
-- Table user_default_customized_views
SELECT DISTINCT
T284.created_at AS "Created_At (User Def Cust VW)",
T284.customized_view_id AS "Customized_View_ID (User Def Cust VW)",
T284.id AS "Id (User Def Cust VW)",
T284.updated_at AS "Updated_At (User Def Cust VW)",
T284.user_id AS "User_ID (User Def Cust VW)",
T284.view_id AS "View_ID (User Def Cust VW)"
FROM
user_default_customized_views T284
INNER JOIN users T290 ON T284.user_id = T290.id
INNER JOIN views T297 ON T284.view_id = T297.id
INNER JOIN customized_views T46 ON T284.customized_view_id = T46.id
---------------------------------------------------
-- Table routine_privileges
SELECT DISTINCT
T241.grantee AS "Grantee (Routine Privs)",
T241.grantor AS "Grantor (Routine Privs)",
T241.is_grantable AS "Is_Grantable (Routine Privs)",
T241.privilege_type AS "Privilege_Type (Routine Privs)",
T241.routine_catalog AS "Routine_Catalog (Routine Privs)",
T241.routine_name AS "Routine_Name (Routine Privs)",
T241.routine_schema AS "Routine_Schema (Routine Privs)",
T241.specific_catalog AS "Specific_Catalog (Routine Privs)",
T241.specific_name AS "Specific_Name (Routine Privs)",
T241.specific_schema AS "Specific_Schema (Routine Privs)"
FROM
routine_privileges T241
---------------------------------------------------
-- Table pg_pltemplate
SELECT DISTINCT
T165.tmplacl AS "Tmplacl (PG Pl Templ)",
T165.tmpldbacreate AS "Tmpldbacreate (PG Pl Templ)",
T165.tmplhandler AS "Tmplhandler (PG Pl Templ)",
T165.tmplinline AS "Tmplinline (PG Pl Templ)",
T165.tmpllibrary AS "Tmpllibrary (PG Pl Templ)",
T165.tmplname AS "Tmplname (PG Pl Templ)",
T165.tmpltrusted AS "Tmpltrusted (PG Pl Templ)",
T165.tmplvalidator AS "Tmplvalidator (PG Pl Templ)"
FROM
pg_pltemplate T165
---------------------------------------------------
-- Table pg_proc
SELECT DISTINCT
T170.proacl AS "Proacl (PG Proc)",
T170.proallargtypes AS "Proallargtypes (PG Proc)",
T170.proargdefaults AS "Proargdefaults (PG Proc)",
T170.proargmodes AS "Proargmodes (PG Proc)",
T170.proargnames AS "Proargnames (PG Proc)",
T170.proargtypes AS "Proargtypes (PG Proc)",
T170.probin AS "Probin (PG Proc)",
T170.proconfig AS "Proconfig (PG Proc)",
T170.procost AS "Procost (PG Proc)",
T170.proisagg AS "Proisagg (PG Proc)",
T170.proisstrict AS "Proisstrict (PG Proc)",
T170.proiswindow AS "Proiswindow (PG Proc)",
T170.prolang AS "Prolang (PG Proc)",
T170.proleakproof AS "Proleakproof (PG Proc)",
T170.proname AS "Proname (PG Proc)",
T170.pronamespace AS "Pronamespace (PG Proc)",
T170.pronargdefaults AS "Pronargdefaults (PG Proc)",
T170.pronargs AS "Pronargs (PG Proc)",
T170.proowner AS "Proowner (PG Proc)",
T170.proretset AS "Proretset (PG Proc)",
T170.prorettype AS "Prorettype (PG Proc)",
T170.prorows AS "Prorows (PG Proc)",
T170.prosecdef AS "Prosecdef (PG Proc)",
T170.prosrc AS "Prosrc (PG Proc)",
T170.protransform AS "Protransform (PG Proc)",
T170.protrftypes AS "Protrftypes (PG Proc)",
T170.provariadic AS "Provariadic (PG Proc)",
T170.provolatile AS "Provolatile (PG Proc)"
FROM
pg_proc T170
---------------------------------------------------
-- Table pg_class
SELECT DISTINCT
T137.relacl AS "Relacl (PG Class)",
T137.relallvisible AS "Relallvisible (PG Class)",
T137.relam AS "Relam (PG Class)",
T137.relchecks AS "Relchecks (PG Class)",
T137.relfilenode AS "Relfilenode (PG Class)",
T137.relforcerowsecurity AS "Relforcerowsecurity (PG Class)",
T137.relfrozenxid AS "Relfrozenxid (PG Class)",
T137.relhasindex AS "Relhasindex (PG Class)",
T137.relhasoids AS "Relhasoids (PG Class)",
T137.relhaspkey AS "Relhaspkey (PG Class)",
T137.relhasrules AS "Relhasrules (PG Class)",
T137.relhassubclass AS "Relhassubclass (PG Class)",
T137.relhastriggers AS "Relhastriggers (PG Class)",
T137.relispopulated AS "Relispopulated (PG Class)",
T137.relisshared AS "Relisshared (PG Class)",
T137.relkind AS "Relkind (PG Class)",
T137.relminmxid AS "Relminmxid (PG Class)",
T137.relname AS "Relname (PG Class)",
T137.relnamespace AS "Relnamespace (PG Class)",
T137.relnatts AS "Relnatts (PG Class)",
T137.reloftype AS "Reloftype (PG Class)",
T137.reloptions AS "Reloptions (PG Class)",
T137.relowner AS "Relowner (PG Class)",
T137.relpages AS "Relpages (PG Class)",
T137.relpersistence AS "Relpersistence (PG Class)",
T137.relreplident AS "Relreplident (PG Class)",
T137.relrowsecurity AS "Relrowsecurity (PG Class)",
T137.reltablespace AS "Reltablespace (PG Class)",
T137.reltoastrelid AS "Reltoastrelid (PG Class)",
T137.reltuples AS "Reltuples (PG Class)",
T137.reltype AS "Reltype (PG Class)"
FROM
pg_class T137
---------------------------------------------------
-- Table licensing_roles
SELECT DISTINCT
T109.id AS "Id (Lic Role)",
T109.name AS "Name (Lic Role)",
T109.rank AS "Rank (Lic Role)"
FROM
licensing_roles T109
LEFT JOIN hist_licensing_roles T85 ON T109.id = T85.licensing_role_id
LEFT JOIN users T290 ON T109.id = T290.licensing_role_id
INNER JOIN _users T15 ON T109.id = T15.licensing_role_id
---------------------------------------------------
-- Table pg_locks
SELECT DISTINCT
T159.classid AS "Classid (PG Locks)",
T159.database AS "Database (PG Locks)",
T159.fastpath AS "Fastpath (PG Locks)",
T159.granted AS "Granted (PG Locks)",
T159.locktype AS "Locktype (PG Locks)",
T159.mode AS "Mode (PG Locks)",
T159.objid AS "Objid (PG Locks)",
T159.objsubid AS "Objsubid (PG Locks)",
T159.page AS "Page (PG Locks)",
T159.pid AS "Pid (PG Locks)",
T159.relation AS "Relation (PG Locks)",
T159.transactionid AS "Transactionid (PG Locks)",
T159.tuple AS "Tuple (PG Locks)",
T159.virtualtransaction AS "Virtualtransaction (PG Locks)",
T159.virtualxid AS "Virtualxid (PG Locks)"
FROM
pg_locks T159
---------------------------------------------------
-- Table pg_replication_slots
SELECT DISTINCT
T173.active AS "Active (PG Repl Slots)",
T173.active_pid AS "Active_Pid (PG Repl Slots)",
T173.catalog_xmin AS "Catalog_Xmin (PG Repl Slots)",
T173.database AS "Database (PG Repl Slots)",
T173.datoid AS "Datoid (PG Repl Slots)",
T173.plugin AS "Plugin (PG Repl Slots)",
T173.restart_lsn AS "Restart_Lsn (PG Repl Slots)",
T173.slot_name AS "Slot_Name (PG Repl Slots)",
T173.slot_type AS "Slot_Type (PG Repl Slots)",
T173.xmin AS "Xmin (PG Repl Slots)"
FROM
pg_replication_slots T173
---------------------------------------------------
-- Table administrable_role_authorizations
SELECT DISTINCT
T19.grantee AS "Grantee (Admin Role Auth)",
T19.is_grantable AS "Is_Grantable (Admin Role Auth)",
T19.role_name AS "Role_Name (Admin Role Auth)"
FROM
administrable_role_authorizations T19
---------------------------------------------------
-- Table collation_character_set_applicability
SELECT DISTINCT
T35.character_set_catalog AS "Character_Set_Catalog (Coll Char Set App)",
T35.character_set_name AS "Character_Set_Name (Coll Char Set App)",
T35.character_set_schema AS "Character_Set_Schema (Coll Char Set App)",
T35.collation_catalog AS "Collation_Catalog (Coll Char Set App)",
T35.collation_name AS "Collation_Name (Coll Char Set App)",
T35.collation_schema AS "Collation_Schema (Coll Char Set App)"
FROM
collation_character_set_applicability T35
---------------------------------------------------
-- Table site_oidc_configurations
SELECT DISTINCT
T253.access_token_uri AS "Access_Token_Uri (Site OIDC Config)",
T253.client_id AS "Client_ID (Site OIDC Config)",
T253.client_secret AS "Client_Secret (Site OIDC Config)",
T253.is_enabled AS "Is_Enabled (Site OIDC Config)",
T253.known_provider_alias AS "Known_Provider_Alias (Site OIDC Config)",
T253.site_luid AS "Site_Luid (Site OIDC Config)",
T253.user_authorization_uri AS "User_Authorization_Uri (Site OIDC Config)",
T253.user_info_uri AS "User_Info_Uri (Site OIDC Config)"
FROM
site_oidc_configurations T253
---------------------------------------------------
-- Table extract_sessions
SELECT DISTINCT
T67.created_at AS "Created_At (Extract Sess)",
T67.extract_id AS "Extract_ID (Extract Sess)",
T67.id AS "Id (Extract Sess)",
T67.session_guid AS "Session_Guid (Extract Sess)",
T67.session_type AS "Session_Type (Extract Sess)",
T67.worker_name AS "Worker_Name (Extract Sess)"
FROM
extract_sessions T67
---------------------------------------------------
-- Table pg_prepared_xacts
SELECT DISTINCT
T169.database AS "Database (PG Prep Xacts)",
T169.gid AS "Gid (PG Prep Xacts)",
T169.owner AS "Owner (PG Prep Xacts)",
T169.prepared AS "Prepared (PG Prep Xacts)",
T169.transaction AS "Transaction (PG Prep Xacts)"
FROM
pg_prepared_xacts T169
---------------------------------------------------
-- Table exportable_tables_column_transformations
SELECT DISTINCT
T65.column_name AS "Column_Name (Exp TBL Col trans)",
T65.exportable_table_id AS "Exportable_Table_ID (Exp TBL Col trans)",
T65.id AS "Id (Exp TBL Col trans)",
T65.operation AS "Operation (Exp TBL Col trans)"
FROM
exportable_tables_column_transformations T65
---------------------------------------------------
-- Table foreign_table_options
SELECT DISTINCT
T74.foreign_table_catalog AS "Foreign_Table_Catalog (Foreign TBL Opt)",
T74.foreign_table_name AS "Foreign_Table_Name (Foreign TBL Opt)",
T74.foreign_table_schema AS "Foreign_Table_Schema (Foreign TBL Opt)",
T74.option_name AS "Option_Name (Foreign TBL Opt)",
T74.option_value AS "Option_Value (Foreign TBL Opt)"
FROM
foreign_table_options T74
---------------------------------------------------
-- Table pg_default_acl
SELECT DISTINCT
T144.defaclacl AS "Defaclacl (PG Default ACL)",
T144.defaclnamespace AS "Defaclnamespace (PG Default ACL)",
T144.defaclobjtype AS "Defaclobjtype (PG Default ACL)",
T144.defaclrole AS "Defaclrole (PG Default ACL)"
FROM
pg_default_acl T144
---------------------------------------------------
-- Table pg_cursors
SELECT DISTINCT
T141.creation_time AS "Creation_Time (PG Cursor)",
T141.is_binary AS "Is_Binary (PG Cursor)",
T141.is_holdable AS "Is_Holdable (PG Cursor)",
T141.is_scrollable AS "Is_Scrollable (PG Cursor)",
T141.name AS "Name (PG Cursor)",
T141.statement AS "Statement (PG Cursor)"
FROM
pg_cursors T141
---------------------------------------------------
-- Table foreign_server_options
SELECT DISTINCT
T72.foreign_server_catalog AS "Foreign_Server_Catalog (Foreign Server Opt)",
T72.foreign_server_name AS "Foreign_Server_Name (Foreign Server Opt)",
T72.option_name AS "Option_Name (Foreign Server Opt)",
T72.option_value AS "Option_Value (Foreign Server Opt)"
FROM
foreign_server_options T72
---------------------------------------------------
-- Table information_schema_catalog_name
SELECT DISTINCT
T104.catalog_name AS "Catalog_Name (Inform Schema Cat Name)"
FROM
information_schema_catalog_name T104
---------------------------------------------------
-- Table pg_type
SELECT DISTINCT
T222.typacl AS "Typacl (PG Type)",
T222.typalign AS "Typalign (PG Type)",
T222.typanalyze AS "Typanalyze (PG Type)",
T222.typarray AS "Typarray (PG Type)",
T222.typbasetype AS "Typbasetype (PG Type)",
T222.typbyval AS "Typbyval (PG Type)",
T222.typcategory AS "Typcategory (PG Type)",
T222.typcollation AS "Typcollation (PG Type)",
T222.typdefault AS "Typdefault (PG Type)",
T222.typdefaultbin AS "Typdefaultbin (PG Type)",
T222.typdelim AS "Typdelim (PG Type)",
T222.typelem AS "Typelem (PG Type)",
T222.typinput AS "Typinput (PG Type)",
T222.typisdefined AS "Typisdefined (PG Type)",
T222.typispreferred AS "Typispreferred (PG Type)",
T222.typlen AS "Typlen (PG Type)",
T222.typmodin AS "Typmodin (PG Type)",
T222.typmodout AS "Typmodout (PG Type)",
T222.typname AS "Typname (PG Type)",
T222.typnamespace AS "Typnamespace (PG Type)",
T222.typndims AS "Typndims (PG Type)",
T222.typnotnull AS "Typnotnull (PG Type)",
T222.typoutput AS "Typoutput (PG Type)",
T222.typowner AS "Typowner (PG Type)",
T222.typreceive AS "Typreceive (PG Type)",
T222.typrelid AS "Typrelid (PG Type)",
T222.typsend AS "Typsend (PG Type)",
T222.typstorage AS "Typstorage (PG Type)",
T222.typtype AS "Typtype (PG Type)",
T222.typtypmod AS "Typtypmod (PG Type)"
FROM
pg_type T222
---------------------------------------------------
-- Table desktop_reporting
SELECT DISTINCT
T57.action AS "Action (Desktop Rep)",
T57.action_key AS "Action_Key (Desktop Rep)",
T57.app_version AS "App_Version (Desktop Rep)",
T57.company AS "Company (Desktop Rep)",
T57.computer_user_id AS "Computer_User_ID (Desktop Rep)",
T57.department AS "Department (Desktop Rep)",
T57.domain AS "Domain (Desktop Rep)",
T57.edition AS "Edition (Desktop Rep)",
T57.email AS "Email (Desktop Rep)",
T57.expiration_date AS "Expiration_Date (Desktop Rep)",
T57.first_name AS "First_Name (Desktop Rep)",
T57.host_name AS "Host_Name (Desktop Rep)",
T57.id AS "Id (Desktop Rep)",
T57.last_name AS "Last_Name (Desktop Rep)",
T57.last_report_date AS "Last_Report_Date (Desktop Rep)",
T57.mac_address AS "Mac_Address (Desktop Rep)",
T57.maintenance_expiration AS "Maintenance_Expiration (Desktop Rep)",
T57.os_architecture AS "Os_Architecture (Desktop Rep)",
T57.os_version AS "Os_Version (Desktop Rep)",
T57.product_keys AS "Product_Keys (Desktop Rep)",
T57.product_name AS "Product_Name (Desktop Rep)",
T57.registration_date AS "Registration_Date (Desktop Rep)",
T57.serial_number AS "Serial_Number (Desktop Rep)",
T57.type AS "Type (Desktop Rep)",
T57.unique_machine_number AS "Unique_Machine_Number (Desktop Rep)"
FROM
desktop_reporting T57
---------------------------------------------------
-- Table startup_infos
SELECT DISTINCT
T266.id AS "Id (Startup Info)",
T266.level AS "Level (Startup Info)",
T266.module AS "Module (Startup Info)",
T266.value AS "Value (Startup Info)"
FROM
startup_infos T266
---------------------------------------------------
-- Table pg_user_mappings
SELECT DISTINCT
T224.srvid AS "Srvid (PG User Mappings)",
T224.srvname AS "Srvname (PG User Mappings)",
T224.umid AS "Umid (PG User Mappings)",
T224.umoptions AS "Umoptions (PG User Mappings)",
T224.umuser AS "Umuser (PG User Mappings)",
T224.usename AS "Usename (PG User Mappings)"
FROM
pg_user_mappings T224
---------------------------------------------------
-- Table pg_cast
SELECT DISTINCT
T136.castcontext AS "Castcontext (PG Cast)",
T136.castfunc AS "Castfunc (PG Cast)",
T136.castmethod AS "Castmethod (PG Cast)",
T136.castsource AS "Castsource (PG Cast)",
T136.casttarget AS "Casttarget (PG Cast)"
FROM
pg_cast T136
---------------------------------------------------
-- Table repository_data
SELECT DISTINCT
T234.content AS "Content (Repo Data)",
T234.created_at AS "Created_At (Repo Data)",
T234.id AS "Id (Repo Data)",
T234.kind AS "Kind (Repo Data)",
T234.name AS "Name (Repo Data)",
T234.tracking_id AS "Tracking_ID (Repo Data)",
T234.type AS "Type (Repo Data)"
FROM
repository_data T234
INNER JOIN customized_views T46 ON T234.id = T46.repository_data_id
INNER JOIN customized_views T46 ON T234.id = T46.repository_thumbnail_data_id
LEFT JOIN datasources T55 ON T234.id = T55.repository_data_id
LEFT JOIN datasources T55 ON T234.id = T55.repository_extract_data_id
INNER JOIN sheet_images T251 ON T234.id = T251.data_storage_id
INNER JOIN user_images T286 ON T234.id = T286.repository_data_id
LEFT JOIN views T297 ON T234.id = T297.repository_data_id
---------------------------------------------------
-- Table pg_policies
SELECT DISTINCT
T166.cmd AS "Cmd (PG Policies)",
T166.policyname AS "Policyname (PG Policies)",
T166.qual AS "Qual (PG Policies)",
T166.roles AS "Roles (PG Policies)",
T166.schemaname AS "Schemaname (PG Policies)",
T166.tablename AS "Tablename (PG Policies)",
T166.with_check AS "With_Check (PG Policies)"
FROM
pg_policies T166
---------------------------------------------------
-- Table pg_seclabel
SELECT DISTINCT
T177.classoid AS "Classoid (PG Seclabel)",
T177.label AS "Label (PG Seclabel)",
T177.objoid AS "Objoid (PG Seclabel)",
T177.objsubid AS "Objsubid (PG Seclabel)",
T177.provider AS "Provider (PG Seclabel)"
FROM
pg_seclabel T177
---------------------------------------------------
-- Table _tags
SELECT DISTINCT
T14.object_id AS "Object_ID (_Tags)",
T14.object_name AS "Object_Name (_Tags)",
T14.object_type AS "Object_Type (_Tags)",
T14.site_id AS "Site_ID (_Tags)",
T14.system_user_id AS "System_User_ID (_Tags)",
T14.tag_id AS "Tag_ID (_Tags)",
T14.tag_name AS "Tag_Name (_Tags)",
T14.taggable_id AS "Taggable_ID (_Tags)",
T14.user_id AS "User_ID (_Tags)",
T14.user_name AS "User_Name (_Tags)"
FROM
_tags T14
INNER JOIN users T290 ON T14.user_id = T290.id
INNER JOIN system_users T271 ON T14.system_user_id = T271.id
INNER JOIN sites T259 ON T14.site_id = T259.id
---------------------------------------------------
-- Table importable_tables
SELECT DISTINCT
T103.exportable_type_id AS "Exportable_Type_ID (Imp TBL)",
T103.id AS "Id (Imp TBL)",
T103.name AS "Name (Imp TBL)",
T103.primary_key_column_name AS "Primary_Key_Column_Name (Imp TBL)"
FROM
importable_tables T103
---------------------------------------------------
-- Table pg_attrdef
SELECT DISTINCT
T131.adbin AS "Adbin (PG Attr Def)",
T131.adnum AS "Adnum (PG Attr Def)",
T131.adrelid AS "Adrelid (PG Attr Def)",
T131.adsrc AS "Adsrc (PG Attr Def)"
FROM
pg_attrdef T131
---------------------------------------------------
-- Table pg_depend
SELECT DISTINCT
T145.classid AS "Classid (PG Depend)",
T145.deptype AS "Deptype (PG Depend)",
T145.objid AS "Objid (PG Depend)",
T145.objsubid AS "Objsubid (PG Depend)",
T145.refclassid AS "Refclassid (PG Depend)",
T145.refobjid AS "Refobjid (PG Depend)",
T145.refobjsubid AS "Refobjsubid (PG Depend)"
FROM
pg_depend T145
---------------------------------------------------
-- Table pg_ts_dict
SELECT DISTINCT
T219.dictinitoption AS "Dictinitoption (PG TS Dict)",
T219.dictname AS "Dictname (PG TS Dict)",
T219.dictnamespace AS "Dictnamespace (PG TS Dict)",
T219.dictowner AS "Dictowner (PG TS Dict)",
T219.dicttemplate AS "Dicttemplate (PG TS Dict)"
FROM
pg_ts_dict T219
---------------------------------------------------
-- Table import_mappable_tables
SELECT DISTINCT
T99.exportable_type_id AS "Exportable_Type_ID (Imp Map TBL)",
T99.id AS "Id (Imp Map TBL)",
T99.name AS "Name (Imp Map TBL)",
T99.primary_key_column_name AS "Primary_Key_Column_Name (Imp Map TBL)"
FROM
import_mappable_tables T99
---------------------------------------------------
-- Table _datasources
SELECT DISTINCT
T4.created_at AS "Created_At (_DS)",
T4.datasource_url AS "Datasource_Url (_DS)",
T4.dbclass AS "Dbclass (_DS)",
T4.dbname AS "Dbname (_DS)",
T4.domain_id AS "Domain_ID (_DS)",
T4.domain_name AS "Domain_Name (_DS)",
T4.id AS "Id (_DS)",
T4.name AS "Name (_DS)",
T4.owner_id AS "Owner_ID (_DS)",
T4.owner_name AS "Owner_Name (_DS)",
T4.owner_type AS "Owner_Type (_DS)",
T4.port AS "Port (_DS)",
T4.project_id AS "Project_ID (_DS)",
T4.project_name AS "Project_Name (_DS)",
T4.server AS "Server (_DS)",
T4.site_id AS "Site_ID (_DS)",
T4.size AS "Size (_DS)",
T4.system_user_id AS "System_User_ID (_DS)",
T4.updated_at AS "Updated_At (_DS)",
T4.username AS "Username (_DS)"
FROM
_datasources T4
INNER JOIN users T290 ON T4.owner_id = T290.id
INNER JOIN projects T227 ON T4.project_id = T227.id
LEFT JOIN system_users T271 ON T4.system_user_id = T271.id
INNER JOIN sites T259 ON T4.site_id = T259.id
INNER JOIN domains T60 ON T4.domain_id = T60.id
---------------------------------------------------
-- Table pg_stat_all_tables
SELECT DISTINCT
T185.analyze_count AS "Analyze_Count (PG Stat All TBL)",
T185.autoanalyze_count AS "Autoanalyze_Count (PG Stat All TBL)",
T185.autovacuum_count AS "Autovacuum_Count (PG Stat All TBL)",
T185.idx_scan AS "Idx_Scan (PG Stat All TBL)",
T185.idx_tup_fetch AS "Idx_Tup_Fetch (PG Stat All TBL)",
T185.last_analyze AS "Last_Analyze (PG Stat All TBL)",
T185.last_autoanalyze AS "Last_Autoanalyze (PG Stat All TBL)",
T185.last_autovacuum AS "Last_Autovacuum (PG Stat All TBL)",
T185.last_vacuum AS "Last_Vacuum (PG Stat All TBL)",
T185.n_dead_tup AS "N_Dead_Tup (PG Stat All TBL)",
T185.n_live_tup AS "N_Live_Tup (PG Stat All TBL)",
T185.n_mod_since_analyze AS "N_Mod_Since_Analyze (PG Stat All TBL)",
T185.n_tup_del AS "N_Tup_Del (PG Stat All TBL)",
T185.n_tup_hot_upd AS "N_Tup_Hot_Upd (PG Stat All TBL)",
T185.n_tup_ins AS "N_Tup_Ins (PG Stat All TBL)",
T185.n_tup_upd AS "N_Tup_Upd (PG Stat All TBL)",
T185.relid AS "Relid (PG Stat All TBL)",
T185.relname AS "Relname (PG Stat All TBL)",
T185.schemaname AS "Schemaname (PG Stat All TBL)",
T185.seq_scan AS "Seq_Scan (PG Stat All TBL)",
T185.seq_tup_read AS "Seq_Tup_Read (PG Stat All TBL)",
T185.vacuum_count AS "Vacuum_Count (PG Stat All TBL)"
FROM
pg_stat_all_tables T185
---------------------------------------------------
-- Table projects
SELECT DISTINCT
T227.controlled_permissions_enabled AS "Controlled_Permissions_Enabled (Projects)",
T227.created_at AS "Created_At (Projects)",
T227.description AS "Description (Projects)",
T227.id AS "Id (Projects)",
T227.luid AS "Luid (Projects)",
T227.name AS "Name (Projects)",
T227.owner_id AS "Owner_ID (Projects)",
T227.site_id AS "Site_ID (Projects)",
T227.special AS "Special (Projects)",
T227.state AS "State (Projects)",
T227.updated_at AS "Updated_At (Projects)"
FROM
projects T227
INNER JOIN datasources T55 ON T227.id = T55.project_id
LEFT JOIN hist_projects T86 ON T227.id = T86.project_id
LEFT JOIN next_gen_permissions T120 ON T227.id = T120.authorizable_id AND next_gen_permissions.authorizable_type = 'Project'
INNER JOIN permissions_templates T126 ON T227.id = T126.project_id
INNER JOIN users T290 ON T227.owner_id = T290.id
INNER JOIN sites T259 ON T227.site_id = T259.id
INNER JOIN workbooks T301 ON T227.id = T301.project_id
INNER JOIN _datasources T4 ON T227.id = T4.project_id
INNER JOIN _workbooks T18 ON T227.id = T18.project_id
---------------------------------------------------
