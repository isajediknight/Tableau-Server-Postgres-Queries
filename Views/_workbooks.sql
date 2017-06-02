SELECT workbooks.id,
  workbooks.name,
  workbooks.repository_url AS workbook_url,
  workbooks.created_at,
  workbooks.updated_at,
  workbooks.owner_id,
  workbooks.project_id,
  workbooks.size,
  workbooks.view_count,
  owner.name AS owner_name,
  projects.name AS project_name,
  users.system_user_id,
  workbooks.site_id,
  domains.id AS domain_id,
  domains.name AS domain_name
FROM workbooks,
  system_users owner,
  projects,
  users,
  domains
WHERE
  workbooks.owner_id = users.id
  AND workbooks.project_id = projects.id
  AND users.system_user_id = owner.id
  AND workbooks.site_id = users.site_id
  AND owner.domain_id = domains.id;