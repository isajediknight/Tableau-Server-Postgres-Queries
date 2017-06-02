SELECT background_jobs.backgrounder_id,
  background_jobs.id,
  background_jobs.created_at,
  background_jobs.completed_at,
  background_jobs.finish_code,
  background_jobs.job_type,
  background_jobs.progress,
  background_jobs.args,
  background_jobs.notes,
  background_jobs.started_at,
  background_jobs.job_name,
  background_jobs.priority,
  background_jobs.title,
  background_jobs.processed_on_worker,
  background_jobs.subtitle,
  background_jobs.language,
  background_jobs.site_id,
  background_jobs.locale
 FROM background_jobs
UNION
SELECT async_jobs.worker AS backgrounder_id,
  async_jobs.id,
  async_jobs.created_at,
  async_jobs.completed_at,
      CASE
          WHEN async_jobs.success = true THEN 0
          ELSE 1
      END AS finish_code,
  async_jobs.job_type,
  async_jobs.progress,
  NULL::text AS args,
  async_jobs.notes,
  async_jobs.created_at AS started_at,
  async_jobs.job_type AS job_name,
  0 AS priority,
  NULL::character varying(255) AS title,
  async_jobs.worker AS processed_on_worker,
  NULL::character varying(255) AS subtitle,
  NULL::character varying(255) AS language,
  async_jobs.site_id,
  NULL::character varying(255) AS locale
 FROM async_jobs;