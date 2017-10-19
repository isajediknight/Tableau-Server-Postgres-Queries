--Background Tasks
--Last tested on Tableau Server 10.3
SELECT "_background_tasks"."backgrounder_id" AS "backgrounder_id",
  "_background_tasks"."id" AS "id",
  "_background_tasks"."created_at" AS "created_at",
  "_background_tasks"."completed_at" AS "completed_at",
  "_background_tasks"."finish_code" AS "finish_code",
  "_background_tasks"."job_type" AS "job_type",
  "_background_tasks"."progress" AS "progress",
  CAST("_background_tasks"."args" AS TEXT) AS "args",
  CAST("_background_tasks"."notes" AS TEXT) AS "notes",
  "_background_tasks"."started_at" AS "started_at",
  "_background_tasks"."job_name" AS "job_name",
  "_background_tasks"."priority" AS "priority",
  "_background_tasks"."title" AS "title",
  "_background_tasks"."processed_on_worker" AS "processed_on_worker",
  "_background_tasks"."subtitle" AS "subtitle",
  "_background_tasks"."language" AS "language",
  "_background_tasks"."site_id" AS "site_id",
  "_background_tasks"."locale" AS "locale",
  "_sites"."id" AS "id (_sites)",
  "_sites"."name" AS "name",
  "_sites"."url_namespace" AS "url_namespace",
  "_sites"."status" AS "status"
FROM "public"."_background_tasks" "_background_tasks"
  LEFT JOIN "public"."_sites" "_sites" ON ("_background_tasks"."site_id" = "_sites"."id")