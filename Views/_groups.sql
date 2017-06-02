SELECT g.id,
  g.name,
  s.name AS site_name,
  d.name AS domain_name,
  d.short_name AS domain_short_name,
  d.family AS domain_family
FROM groups g,
  domains d,
  sites s
WHERE
  g.domain_id = d.id
  AND s.id = g.site_id;