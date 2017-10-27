SELECT DISTINCT
T271.friendly_name AS "Friendly_Name (Sys Users)",
T271.name AS "Name (Sys Users)",
SUM(T298.nviews) AS "Nviews (VW Stats)",
MAX(T298.time) AS "Time (VW Stats)",
T301.name AS "Name (WB)",
T297.name AS "Name (Views)"
FROM
views_stats T298
INNER JOIN users T290 ON T298.user_id = T290.id
INNER JOIN views T297 ON T298.view_id = T297.id
INNER JOIN workbooks T301 ON T297.workbook_id = T301.id
INNER JOIN system_users T271 ON T290.system_user_id = T271.id
GROUP BY
T271.friendly_name,
T271.name,
T301.name,
T297.name
