SELECT users.id,
  system_users.name,
  users.login_at,
  system_users.friendly_name,
  users.licensing_role_id,
  licensing_roles.name AS licensing_role_name,
  system_users.domain_id,
  users.system_user_id,
  domains.name AS domain_name,
  domains.short_name AS domain_short_name,
  users.site_id
 FROM system_users,
  users,
  licensing_roles,
  domains
WHERE
  users.licensing_role_id = licensing_roles.id
  AND system_users.domain_id = domains.id
  AND users.system_user_id = system_users.id;