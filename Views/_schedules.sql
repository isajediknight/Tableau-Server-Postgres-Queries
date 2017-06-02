SELECT schedules.id,
  schedules.name,
  schedules.active,
  schedules.priority,
  schedules.schedule_type,
  schedules.day_of_week_mask,
  schedules.day_of_month_mask,
  schedules.start_at_minute,
  schedules.minute_interval,
  schedules.end_at_minute,
  schedules.end_schedule_at,
  schedules.run_next_at,
  schedules.created_at,
  schedules.updated_at,
  schedules.hidden,
  schedules.serial_collection_id,
  schedules.lock_version,
  schedules.scheduled_action,
    CASE schedules.scheduled_action
      WHEN 0 THEN 'Refresh Extracts'::text
      WHEN 1 THEN 'Subscriptions'::text
        ELSE 'Others'::text
      END AS scheduled_action_type
FROM schedules;