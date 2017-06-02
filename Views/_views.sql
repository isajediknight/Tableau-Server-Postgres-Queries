SELECT views.id,
  views.name,
  regexp_replace(views.repository_url, '/sheets'::text, ''::text) AS view_url,
  views.created_at,
  views.owner_id,
  owner.name AS owner_name,
  views.workbook_id,
  views.index,
  views.title,
  views.caption,
  views.site_id
FROM views,
  users,
  system_users owner
WHERE
  views.owner_id = users.id
  AND users.system_user_id = owner.id
  AND views.site_id = users.site_id;