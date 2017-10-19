--Sessions
--Last tested on Tableau Server 10.3
SELECT "_sessions"."session_id" AS "session_id",
  "_sessions"."updated_at" AS "updated_at",
  "_sessions"."user_id" AS "user_id",
  "_sessions"."user_name" AS "user_name",
  "_sessions"."system_user_id" AS "system_user_id",
  "_sessions"."site_id" AS "site_id",
  "_sites"."id" AS "id",
  "_sites"."name" AS "name",
  "_sites"."url_namespace" AS "url_namespace",
  "_sites"."status" AS "status"
FROM "public"."_sessions" "_sessions"
  INNER JOIN "public"."_sites" "_sites" ON ("_sessions"."site_id" = "_sites"."id")