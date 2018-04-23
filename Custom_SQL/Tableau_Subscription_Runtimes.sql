SELECT DISTINCT
T28.created_at AS "Started",
CAST(EXTRACT(SECOND FROM (T28.completed_at - T28.created_at)) AS INT) AS "Runtime_Seconds",
T28.notes AS "Subscription_Results",
D4.name AS "Subscriber",
D3.name AS "Subscribed_By",
T267.subject AS "Subscribed_Content",
CASE
WHEN (T268.customized_view_id IS NULL AND false OR NOT T268.customized_view_id IS NULL AND NOT false) AND (T269.subscription_id IS NULL AND false OR NOT T269.subscription_id IS NULL AND NOT false) THEN 'Customized View - Single View'::text
WHEN (T268.customized_view_id IS NULL AND false OR NOT T268.customized_view_id IS NULL AND NOT false) AND (T270.subscription_id IS NULL AND false OR NOT T270.subscription_id IS NULL AND NOT false) THEN 'Customized View - Workbook'::text
WHEN T269.subscription_id IS NULL AND false OR NOT T269.subscription_id IS NULL AND NOT false THEN 'Single View'::text
WHEN T270.subscription_id IS NULL AND false OR NOT T270.subscription_id IS NULL AND NOT false THEN 'Workbook'::text
ELSE 'Unknown'::text
END AS "Content_Type",
CASE
WHEN T301.name IS NULL THEN D10.name
ELSE T301.name
END AS "Workbook",
CASE
WHEN T269.repository_url IS NULL THEN T270.repository_url
ELSE regexp_replace(T269.repository_url, '/sheets'::text, ''::text)
END AS "URL",
CASE 
WHEN D11.name IS NULL THEN D12.name
ELSE D11.name
END AS "Workbook Owner",
T28.site_id AS "Background_Jobs_Site_ID",
T267.site_id AS "Subscription_Site_ID",
T267.is_refresh_extract_triggered AS "Extract_Refreshed",
T28.processed_on_worker AS "Worker",
T267.ID AS "Subscription_ID",
T28.id AS "Background_Jobs_ID",
T268.customized_view_id AS "Customized_View_ID"
--Add T28. Columns Here
--Add T1. Columns Here
--regexp_replace(T269.repository_url, '/sheets'::text, ''::text) AS "View_URL",
--T270.repository_url AS "Workbook_URL",
FROM
background_jobs T28
INNER JOIN subscriptions T267 ON T267.id = T28.correlation_id
INNER JOIN system_users D3 ON D3.ID = T267.creator_id
INNER JOIN system_users D4 ON D4.ID = T267.user_id
LEFT JOIN subscriptions_views T269 ON T267.id = T269.subscription_id
LEFT JOIN subscriptions_workbooks T270 ON T267.id = T270.subscription_id
LEFT JOIN subscriptions_customized_views T268 ON T267.id = T268.subscription_id
LEFT JOIN views T297 ON T269.repository_url = T297.repository_url--T269.id = T297.id doesnt work
LEFT JOIN workbooks D10 ON T297.workbook_id = D10.id
LEFT JOIN system_users D12 ON D12.id = D10.owner_id
LEFT JOIN workbooks T301 ON T301.repository_url = T270.repository_url--T301.id = T270.id
LEFT JOIN system_users D11 ON D11.id = T301.owner_id
LEFT JOIN _background_tasks T1 ON T1.backgrounder_id = T28.backgrounder_id
WHERE
T28.job_name = 'Subscription Notifications'
ORDER BY T28.created_at ASC
