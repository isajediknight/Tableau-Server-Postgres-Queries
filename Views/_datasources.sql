SELECT datasources.id,
  datasources.name,
  datasources.repository_url AS datasource_url,
  datasources.owner_id,
  owner.name AS owner_name,
  datasources.created_at,
  datasources.updated_at,
  datasources.size,
  datasources.project_id,
  projects.name AS project_name,
  data_connections.server,
  data_connections.dbclass,
  data_connections.port,
  data_connections.username,
  data_connections.dbname,
  data_connections.owner_type,
  users.system_user_id,
  data_connections.site_id,
  domains.id AS domain_id,
  domains.name AS domain_name
 FROM datasources,
  system_users owner,
  projects,
  data_connections,
  users,
  domains
WHERE datasources.id = data_connections.owner_id
AND datasources.owner_id = users.id
AND datasources.project_id = projects.id
AND data_connections.owner_type::text = 'Datasource'::text
AND users.system_user_id = owner.id
AND data_connections.site_id = users.site_id
AND owner.domain_id = domains.id;