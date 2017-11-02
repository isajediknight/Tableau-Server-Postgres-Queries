--Historical Disk Usage
--Last tested on Tableau Server 10.3
SELECT "a"."id" AS "id",
  "a"."worker_id" AS "worker_id",
  "a"."resource_type" AS "resource_type",
  "a"."path" AS "path",
  "a"."total_space_bytes" AS "total_space_bytes",
  "a"."used_space_bytes" AS "space_bytes",
  "a"."state" AS "state",
  "a"."record_timestamp" AS "record_timestamp",
  1 AS "space_type"
FROM "public"."historical_disk_usage" "a"

UNION ALL

SELECT "b"."id" AS "id",
  "b"."worker_id" AS "worker_id",
  "b"."resource_type" AS "resource_type",
  "b"."path" AS "path",
  "b"."total_space_bytes" AS "total_space_bytes",
  ("b"."total_space_bytes"-"b"."used_space_bytes") AS "space_bytes",
  "b"."state" AS "state",
  "b"."record_timestamp" AS "record_timestamp",
  0 AS "space_type"
FROM "public"."historical_disk_usage" "b"