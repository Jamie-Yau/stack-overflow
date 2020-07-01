SELECT  
  a.id as tag_id,
	tag_name,
	count(*) as total_posts,
  sum( answer_count) as total_answers,
  sum( comment_count) as total_comments,
  sum( favorite_count) as total_favorites,
  sum( view_count) as total_views,
  min( creation_date) as oldest_post,
  max( creation_date) as newest_post
  
FROM 
	`bigquery-public-data.stackoverflow.tags` a, -- list of unique tags
	{{ ref('stg_unanswered_posts') }} b 

WHERE
  strpos( concat('!!', replace( tags, '|', '!!|!!'), '!!') ,
      concat('!!', tag_name, '!!')) > 0  -- count if the unique tag is in the list of tags
  
GROUP BY 
  1, 2