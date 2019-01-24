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
 FROM OPENQUERY(TABLEAU,'select * from public.background_jobs')background_jobs
UNION
SELECT async_jobs.worker AS backgrounder_id,
  async_jobs.id,
  async_jobs.created_at,
  async_jobs.completed_at,
      CASE
          WHEN async_jobs.success = 1 THEN 0
          ELSE 1
      END AS finish_code,
  async_jobs.job_type,
  async_jobs.progress,
  -NULL AS args,
  async_jobs.notes,
  async_jobs.created_at AS started_at,
  async_jobs.job_type AS job_name ,
  0 AS priority,
  NULL AS title,
  async_jobs.worker AS processed_on_worker,
  NULL AS subtitle,
  NULL AS language,
  async_jobs.site_id,
  NULL AS locale
FROM OPENQUERY(TABLEAU,'select * from public.async_jobs')async_jobs
