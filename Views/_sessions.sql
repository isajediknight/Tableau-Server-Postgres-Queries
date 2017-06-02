SELECT sessions.session_id,
  sessions.updated_at,
  sessions.user_id,
  system_users.name AS user_name,
  users.system_user_id,
  users.site_id
 FROM sessions,
  system_users,
  users
WHERE sessions.user_id = users.id
  AND users.system_user_id = system_users.id;