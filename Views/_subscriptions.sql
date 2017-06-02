SELECT subscriptions.id,
  subscriptions.subject,
      CASE
          WHEN (subscriptions_customized_views.customized_view_id IS NULL AND false OR NOT subscriptions_customized_views.customized_view_id IS NULL AND NOT false) AND (subscriptions_views.subscription_id IS NULL AND false OR NOT subscriptions_views.subscription_id IS NULL AND NOT false) THEN 'Customized View - Single View'::text
          WHEN (subscriptions_customized_views.customized_view_id IS NULL AND false OR NOT subscriptions_customized_views.customized_view_id IS NULL AND NOT false) AND (subscriptions_workbooks.subscription_id IS NULL AND false OR NOT subscriptions_workbooks.subscription_id IS NULL AND NOT false) THEN 'Customized View - Workbook'::text
          WHEN subscriptions_views.subscription_id IS NULL AND false OR NOT subscriptions_views.subscription_id IS NULL AND NOT false THEN 'Single View'::text
          WHEN subscriptions_workbooks.subscription_id IS NULL AND false OR NOT subscriptions_workbooks.subscription_id IS NULL AND NOT false THEN 'Workbook'::text
          ELSE 'Unknown'::text
      END AS content_type,
  regexp_replace(subscriptions_views.repository_url, '/sheets'::text, ''::text) AS view_url,
  subscriptions_workbooks.repository_url AS workbook_url,
  subscriptions_customized_views.customized_view_id,
  subscriptions.last_sent,
  subscriptions.user_id,
  _users.name AS user_name,
  _sites.id AS site_id,
  _sites.name AS site_name,
  schedules.name AS schedule_name,
  schedules.active AS schedule_active,
  schedules.run_next_at AS schedule_run_next_at,
  schedules.priority AS schedule_priority
 FROM subscriptions subscriptions
   LEFT JOIN subscriptions_views subscriptions_views ON subscriptions.id = subscriptions_views.subscription_id
   LEFT JOIN subscriptions_workbooks subscriptions_workbooks ON subscriptions.id = subscriptions_workbooks.subscription_id
   LEFT JOIN subscriptions_customized_views subscriptions_customized_views ON subscriptions.id = subscriptions_customized_views.subscription_id
   JOIN schedules schedules ON subscriptions.schedule_id = schedules.id
   JOIN _users _users ON subscriptions.user_id = _users.id
   JOIN _sites _sites ON _users.site_id = _sites.id;