SELECT count(1) AS nviews,
  max(historical_events.created_at) AS last_access_time,
  hist_datasources.datasource_id,
  hist_sites.site_id
FROM historical_events,
  hist_datasources,
  hist_sites,
  historical_event_types
WHERE
  historical_events.hist_datasource_id = hist_datasources.id
  AND historical_events.hist_target_site_id = hist_sites.id
  AND historical_events.historical_event_type_id = historical_event_types.type_id
  AND (historical_event_types.name = 'Access Data Source'::text OR historical_event_types.name = 'Download Data Source'::text)
GROUP BY hist_datasources.datasource_id, hist_sites.site_id;