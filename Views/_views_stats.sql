SELECT views_stats.user_id AS users_id,
  system_users.name AS system_users_name,
  users.login_at AS users_login_at,
  system_users.friendly_name AS system_users_friendly_name,
  views_stats.view_id AS views_id,
  system_users.id AS system_users_id,
  views.name AS views_name,
  views.repository_url AS views_url,
  views.workbook_id AS views_workbook_id,
  views.created_at AS views_created_at,
  views.owner_id AS views_owner_id,
  views.index AS views_index,
  views.title AS views_title,
  views.caption AS views_caption,
  views_stats.device_type,
  views_stats.nviews,
  views_stats."time" AS last_view_time,
  users.site_id
FROM views_stats,
  system_users,
  users,
  views
WHERE
  views_stats.user_id = users.id
  AND views_stats.view_id = views.id
  AND system_users.id = users.system_user_id;