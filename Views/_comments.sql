SELECT comments.id,
  comments.title,
  comments.comment,
  comments.commentable_type,
  comments.created_at,
  comments.drawing,
  comments.commentable_id,
  comments.user_id,
  users.site_id
 FROM comments,
  users
WHERE comments.user_id = users.id;