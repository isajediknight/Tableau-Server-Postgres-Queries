SELECT taggings.tag_id,
  tags.name AS tag_name,
  taggings.taggable_type AS object_type,
  taggings.taggable_id,
  workbooks.id AS object_id,
  workbooks.name AS object_name,
  taggings.user_id,
  system_users.name AS user_name,
  users.system_user_id,
  tags.site_id
FROM taggings,
  tags,
  workbooks,
  system_users,
  users
WHERE
  taggings.tag_id = tags.id
  AND taggings.taggable_type::text = 'Workbook'::text
  AND taggings.taggable_id = workbooks.id
  AND taggings.user_id = users.id
  AND users.system_user_id = system_users.id
UNION
 SELECT taggings.tag_id,
    tags.name AS tag_name,
    taggings.taggable_type AS object_type,
    taggings.taggable_id,
    views.id AS object_id,
    views.name AS object_name,
    taggings.user_id,
    system_users.name AS user_name,
    users.system_user_id,
    tags.site_id
  FROM taggings,
    tags,
    views,
    system_users,
    users
  WHERE
    taggings.tag_id = tags.id
    AND taggings.taggable_type::text = 'View'::text
    AND taggings.taggable_id = views.id
    AND taggings.user_id = users.id
    AND users.system_user_id = system_users.id
UNION
 SELECT taggings.tag_id,
    tags.name AS tag_name,
    taggings.taggable_type AS object_type,
    taggings.taggable_id,
    datasources.id AS object_id,
    datasources.name AS object_name,
    taggings.user_id,
    system_users.name AS user_name,
    users.system_user_id,
    tags.site_id
  FROM taggings,
    tags,
    datasources,
    system_users,
    users
  WHERE
    taggings.tag_id = tags.id
    AND taggings.taggable_type::text = 'Datasource'::text
    AND taggings.taggable_id = datasources.id
    AND taggings.user_id = users.id
    AND users.system_user_id = system_users.id;