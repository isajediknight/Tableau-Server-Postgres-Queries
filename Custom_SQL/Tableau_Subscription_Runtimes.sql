SELECT
D1.created_at AS "Started",
CAST(EXTRACT(SECOND FROM (D1.completed_at - D1.created_at)) AS INT) AS "Runtime_Seconds",
D1.notes AS "Subscription_Results",
D4.name AS "Subscriber",
D3.name AS "Subscribed_By",
D2.subject AS "Subscribed_Content",
CASE
WHEN (D7.customized_view_id IS NULL AND false OR NOT D7.customized_view_id IS NULL AND NOT false) AND (D5.subscription_id IS NULL AND false OR NOT D5.subscription_id IS NULL AND NOT false) THEN 'Customized View - Single View'::text
WHEN (D7.customized_view_id IS NULL AND false OR NOT D7.customized_view_id IS NULL AND NOT false) AND (D6.subscription_id IS NULL AND false OR NOT D6.subscription_id IS NULL AND NOT false) THEN 'Customized View - Workbook'::text
WHEN D5.subscription_id IS NULL AND false OR NOT D5.subscription_id IS NULL AND NOT false THEN 'Single View'::text
WHEN D6.subscription_id IS NULL AND false OR NOT D6.subscription_id IS NULL AND NOT false THEN 'Workbook'::text
ELSE 'Unknown'::text
END AS "Content_Type",
CASE
WHEN D13.name IS NULL THEN D10.name
ELSE D13.name
END AS "Workbook",
CASE
WHEN D5.repository_url IS NULL THEN D6.repository_url
ELSE regexp_replace(D5.repository_url, '/sheets'::text, ''::text)
END AS "URL",
CASE 
WHEN D11.name IS NULL THEN D12.name
ELSE D11.name
END AS "Workbook Owner",
D1.site_id AS "Background_Jobs_Site_ID",
D2.site_id AS "Subscription_Site_ID",
D2.is_refresh_extract_triggered AS "Extract_Refreshed",
D1.processed_on_worker AS "Worker",
D2.ID AS "Subscription_ID",
D1.id AS "Background_Jobs_ID",
D7.customized_view_id AS "Customized_View_ID"
--regexp_replace(D5.repository_url, '/sheets'::text, ''::text) AS "View_URL",
--D6.repository_url AS "Workbook_URL",
FROM
background_jobs D1
INNER JOIN subscriptions D2 ON D2.id = D1.correlation_id
INNER JOIN system_users D3 ON D3.ID = D2.creator_id
INNER JOIN system_users D4 ON D4.ID = D2.user_id
LEFT JOIN subscriptions_views D5 ON D2.id = D5.subscription_id
LEFT JOIN subscriptions_workbooks D6 ON D2.id = D6.subscription_id
LEFT JOIN subscriptions_customized_views D7 ON D2.id = D7.subscription_id
LEFT JOIN views D8 ON D5.repository_url = D8.repository_url--D5.id = D8.id doesnt work
LEFT JOIN workbooks D10 ON D8.workbook_id = D10.id
LEFT JOIN system_users D12 ON D12.id = D10.owner_id
LEFT JOIN workbooks D13 ON D13.repository_url = D6.repository_url--D13.id = D6.id
LEFT JOIN system_users D11 ON D11.id = D13.owner_id
WHERE
D1.job_name = 'Subscription Notifications'
ORDER BY D1.created_at ASC