SELECT DISTINCT
--Users
T271.name AS "Name (Operator ID)",
T271.friendly_name AS "Friendly_Name (Full Name)",
T1001.name AS "Name (WB Owner Operator ID)",
T1001.friendly_name AS "Friendly_Name (WB Owner Full Name)",
--Usage
T97.completed_at AS "Completed_At (Usage)",
T97.controller AS "Controller (Usage)",
T97.currentsheet AS "Currentsheet (Usage)",
T97.http_referer AS "Http_Referer (Usage)",
T97.http_request_uri AS "Http_Request_Uri (Usage)",
T97.http_user_agent AS "Http_User_Agent (Usage)",
T97.remote_ip AS "Remote_Ip (Usage)",
T97.status AS "Status (Usage)",
T97.user_id AS "User_ID (Usage)",
T97.user_ip AS "User_Ip (Usage)",
T97.worker AS "Worker (Usage)",
--Views
T297.name AS "Name (Views)",
T297.title AS "Title (Views)",
T297.revision AS "Revision (Views)",
T297.sheet_id AS "Sheet_ID (Views)",
T297.sheettype AS "Sheettype (Views)",
T297.for_cache_updated_at AS "For_Cache_Updated_At (Views)",
--Workbooks
T301.name AS "Name (WB)",
T301.revision AS "Revision (WB)",
T301.content_version AS "Content_Version (WB)",
T301.repository_url AS "Repository_Url (WB)",
--Projects
T227.name AS "Name (Projects)",
--ID's
T297.id AS "Id (Views)",
T301.id AS "Id (WB)",
T97.site_id AS "Site_ID (Usage)",
T97.id AS "Id (Usage)"
FROM
http_requests T97 -- Usage
LEFT JOIN users T290 ON T97.user_id = T290.id -- Users
LEFT JOIN system_users T271 ON T290.system_user_id = T271.id -- System Users
LEFT JOIN views T297 ON T97.currentsheet = REPLACE(T297.repository_url,'/sheets','') -- Views
LEFT JOIN workbooks T301 ON T297.workbook_id = T301.id -- Workbooks
LEFT JOIN projects T227 ON T227.id = T301.project_id -- Projects
LEFT JOIN users T1000 ON T301.owner_id = T1000.id -- Workbook Owner (Users)
LEFT JOIN system_users T1001 ON T1000.system_user_id = T1001.id -- Workbook Owner (System Users)
WHERE T97.action = 'show'
