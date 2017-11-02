--Resources and Extracts
--Last tested on Tableau Server 10.3
SELECT "Get Names"."id" AS "id",
  "Get Names"."created_at" AS "created_at",
  "Get Names"."owner_name" AS "owner_name",
  "Get Names"."domain" AS "domain",
  "Get Names"."project" AS "project",
  "Get Names"."project_id" AS "project_id",
  CAST("Get Names"."url" AS TEXT) AS "url",
  "Get Names"."name" AS "name",
  "Get Names"."size" AS "size",
  CAST("Get Names"."type" AS TEXT) AS "type",
  "Get Names"."last_access_time" AS "last_access_time",
  "Get Names"."site" AS "site",
  "Get Names"."site_id" AS "site_id",
  "Data Source Extracts"."id" AS "id (extracts)",
  "Data Source Extracts"."workbook_id" AS "workbook_id",
  "Data Source Extracts"."descriptor" AS "descriptor",
  "Data Source Extracts"."created_at" AS "created_at (extracts)",
  "Data Source Extracts"."updated_at" AS "updated_at",
  "Data Source Extracts"."datasource_id" AS "datasource_id",
  "Workbook Extracts"."id" AS "id (extracts) #1",
  "Workbook Extracts"."workbook_id" AS "workbook_id (extracts)",
  "Workbook Extracts"."descriptor" AS "descriptor (extracts)",
  "Workbook Extracts"."created_at" AS "created_at (extracts) #1",
  "Workbook Extracts"."updated_at" AS "updated_at (extracts)",
  "Workbook Extracts"."datasource_id" AS "datasource_id (extracts)"
FROM (
  (
  select workbooks.id as id, workbooks.created_at as created_at,
  workbooks.owner_name as owner_name, workbooks.domain_name as domain,
  workbooks.project_name as project, workbooks.project_id as project_id,
  workbooks.workbook_url as url,workbooks.name,size,'workbook' as type, NULL as last_access_time, sites.name as site, sites.url_namespace as site_id
  from _workbooks workbooks, _sites sites
  where sites.id = workbooks.site_id
  )
  union
  (
  select datasources.id as id, datasources.created_at as created_at,
  datasources.owner_name as owner_name, datasources.domain_name as domain,
  datasources.project_name as project, datasources.project_id as project_id,
  datasources.datasource_url as url,datasources.name,size,'datasource' as type, last_access_time, sites.name as site, sites.url_namespace as site_id
  from _datasources datasources, _sites sites, _datasources_stats datasources_stats
  where sites.id = datasources.site_id
  and datasources.id = datasources_stats.datasource_id
  )
) "Get Names"
  LEFT JOIN "public"."extracts" "Data Source Extracts" ON ("Get Names"."id" = "Data Source Extracts"."datasource_id")
  LEFT JOIN "public"."extracts" "Workbook Extracts" ON ("Get Names"."id" = "Workbook Extracts"."workbook_id")