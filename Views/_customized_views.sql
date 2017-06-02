SELECT (((s.name::text || '/'::text) || c.name::text))::character varying(255) AS name,
  ((((((((w.repository_url || '/'::text) || v.sheet_id::text) || '/'::text) || s.name::text) || COALESCE('@'::text || d.name::text, ''::text)) || '/'::text) || c.url_id::text))::character varying(255) AS repository_url,
  c.id,
  c.size,
  v.name AS view_name,
  v.sheet_id,
  w.repository_url AS workbook_url,
  w.name AS workbook_name,
  s.email,
  s.name AS user_name,
  c.site_id
 FROM customized_views c,
  users u,
  views v,
  workbooks w,
  system_users s
   LEFT JOIN domains d ON d.id = s.domain_id AND d.family::text = 'ActiveDirectory'::text
WHERE c.creator_id = u.id AND c.view_id = v.id AND v.workbook_id = w.id AND s.id = u.system_user_id;