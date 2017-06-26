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
-- Table _sites
SELECT DISTINCT
T11.id AS "Id (_Sites)",
T11.name AS "Name (_Sites)",
T11.status AS "Status (_Sites)",
T11.url_namespace AS "Url_Namespace (_Sites)"
FROM
_sites T11
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
-- Table big_texts
SELECT DISTINCT
T29.id AS "Id (Big Text)",
T29.txt AS "Txt (Big Text)",
T29.updated_at AS "Updated_At (Big Text)"
FROM
big_texts T29
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
-- Table core_licenses
SELECT DISTINCT
T45.allocated_cores AS "Allocated_Cores (Core Lic)",
T45.machine_cores AS "Machine_Cores (Core Lic)",
T45.machine_ip AS "Machine_Ip (Core Lic)",
T45.update_ts AS "Update_Ts (Core Lic)"
FROM
core_licenses T45
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
-- Table domains
SELECT DISTINCT
T60.active AS "Active (Domains)",
T60.family AS "Family (Domains)",
T60.id AS "Id (Domains)",
T60.name AS "Name (Domains)",
T60.short_name AS "Short_Name (Domains)"
FROM
domains T60
INNER JOIN groups T78 ON T60.id = T78.domain_id
INNER JOIN system_users T271 ON T60.id = T271.domain_id
INNER JOIN _datasources T4 ON T60.id = T4.domain_id
INNER JOIN _users T15 ON T60.id = T15.domain_id
INNER JOIN _workbooks T18 ON T60.id = T18.domain_id
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
-- Table exportable_tables_column_transformations
SELECT DISTINCT
T65.column_name AS "Column_Name (Exp TBL Col trans)",
T65.exportable_table_id AS "Exportable_Table_ID (Exp TBL Col trans)",
T65.id AS "Id (Exp TBL Col trans)",
T65.operation AS "Operation (Exp TBL Col trans)"
FROM
exportable_tables_column_transformations T65
---------------------------------------------------
-- Table exportable_types
SELECT DISTINCT
T66.id AS "Id (Exp Types)",
T66.name AS "Name (Exp Types)"
FROM
exportable_types T66
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
-- Table hist_configs
SELECT DISTINCT
T81.id AS "Id (Hist Configs)",
T81.key AS "Key (Hist Configs)",
T81.value AS "Value (Hist Configs)"
FROM
hist_configs T81
LEFT JOIN historical_events T96 ON T81.id = T96.hist_config_id
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
-- Table import_mappable_tables
SELECT DISTINCT
T99.exportable_type_id AS "Exportable_Type_ID (Imp Map TBL)",
T99.id AS "Id (Imp Map TBL)",
T99.name AS "Name (Imp Map TBL)",
T99.primary_key_column_name AS "Primary_Key_Column_Name (Imp Map TBL)"
FROM
import_mappable_tables T99
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
-- Table import_mapping_excluded_system_users
SELECT DISTINCT
T101.domain_name AS "Domain_Name (Imp Map Excl Sys Users)",
T101.id AS "Id (Imp Map Excl Sys Users)",
T101.user_name AS "User_Name (Imp Map Excl Sys Users)"
FROM
import_mapping_excluded_system_users T101
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
-- Table importable_tables
SELECT DISTINCT
T103.exportable_type_id AS "Exportable_Type_ID (Imp TBL)",
T103.id AS "Id (Imp TBL)",
T103.name AS "Name (Imp TBL)",
T103.primary_key_column_name AS "Primary_Key_Column_Name (Imp TBL)"
FROM
importable_tables T103
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
-- Table keychain_entry_usage
SELECT DISTINCT
T107.datasource_id AS "Datasource_ID (Keychain Entries Usage)",
T107.id AS "Id (Keychain Entries Usage)",
T107.keychain_entry_id AS "Keychain_Entry_ID (Keychain Entries Usage)",
T107.workbook_id AS "Workbook_ID (Keychain Entries Usage)"
FROM
keychain_entry_usage T107
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
-- Table permission_reasons
SELECT DISTINCT
T125.precedence AS "Precedence (Perm Reasons)",
T125.reason AS "Reason (Perm Reasons)"
FROM
permission_reasons T125
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
-- Table postgres_heartbeat
SELECT DISTINCT
T226.id AS "Id (PSQL Heartbeat)",
T226.last_update AS "Last_Update (PSQL Heartbeat)"
FROM
postgres_heartbeat T226
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
-- Table projects_view_option_rights
SELECT DISTINCT
T228.project_id AS "Project_ID (Projects VW Opt Rights)",
T228.view_option_key_id AS "View_Option_Key_ID (Projects VW Opt Rights)",
T228.view_option_right_id AS "View_Option_Right_ID (Projects VW Opt Rights)"
FROM
projects_view_option_rights T228
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
-- Table schema_migrations
SELECT DISTINCT
T244.version AS "Version (Schema Migrations)"
FROM
schema_migrations T244
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
-- Table site_user_prefs
SELECT DISTINCT
T258.id AS "Id (Site User Prefs)",
T258.refresh_failure_notification_enabled AS "Refresh_Failure_Notification_Enabled (Site User Prefs)",
T258.user_id AS "User_ID (Site User Prefs)"
FROM
site_user_prefs T258
LEFT JOIN users T290 ON T258.user_id = T290.id
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
-- Table startup_infos
SELECT DISTINCT
T266.id AS "Id (Startup Info)",
T266.level AS "Level (Startup Info)",
T266.module AS "Module (Startup Info)",
T266.value AS "Value (Startup Info)"
FROM
startup_infos T266
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
-- Table table_revisions
SELECT DISTINCT
T274.id AS "Id (TBL Revs)",
T274.name AS "Name (TBL Revs)",
T274.nonce AS "Nonce (TBL Revs)",
T274.revision AS "Revision (TBL Revs)"
FROM
table_revisions T274
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
-- Table view_option_keys
SELECT DISTINCT
T294.default_value AS "Default_Value (VW Opt Keys)",
T294.name AS "Name (VW Opt Keys)",
T294.value_type AS "Value_Type (VW Opt Keys)",
T294.view_option_key_id AS "View_Option_Key_ID (VW Opt Keys)"
FROM
view_option_keys T294
---------------------------------------------------
-- Table views
SELECT DISTINCT
T297.caption AS "Caption (Views)",
T297.created_at AS "Created_At (Views)",
T297.datasource_id AS "Datasource_ID (Views)",
T297.description AS "Description (Views)",
T297.edit_count AS "Edit_Count (Views)",
T297.fields AS "Fields (Views)",
T297.first_published_at AS "First_Published_At (Views)",
T297.for_cache_updated_at AS "For_Cache_Updated_At (Views)",
T297.id AS "Id (Views)",
T297.index AS "Index (Views)",
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
T297.thumbnail_id AS "Thumbnail_ID (Views)",
T297.title AS "Title (Views)",
T297.updated_at AS "Updated_At (Views)",
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
-- Table workbooks_view_options
SELECT DISTINCT
T302.value AS "Value (WB View Opt)",
T302.view_option_id AS "View_Option_ID (WB View Opt)",
T302.view_option_key_id AS "View_Option_Key_ID (WB View Opt)",
T302.workbook_id AS "Workbook_ID (WB View Opt)"
FROM
workbooks_view_options T302
---------------------------------------------------
