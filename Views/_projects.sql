SELECT projects.id,
  projects.name,
  projects.created_at,
  projects.owner_id,
  owner.name AS owner_name,
  users.system_user_id,
  projects.site_id
FROM projects,
  system_users owner,
  users
WHERE projects.owner_id = users.id
  AND users.system_user_id = owner.id
  AND projects.site_id = users.site_id;