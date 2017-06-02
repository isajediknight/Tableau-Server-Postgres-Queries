SELECT sysuser.id,
  sysuser.name,
  sysuser.email,
  sysuser.friendly_name,
  sysuser.custom_display_name,
  sysuser.state,
  sysuser.admin_level,
  domain.name AS domain_name,
  domain.short_name AS domain_short_name,
  domain.family AS domain_family
FROM system_users sysuser,
  domains domain
WHERE sysuser.domain_id = domain.id;