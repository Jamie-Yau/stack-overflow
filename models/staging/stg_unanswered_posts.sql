SELECT 
  id as post_id, 
  answer_count, 
  comment_count, 
  creation_date, 
  favorite_count, 
  tags, 
  view_count

FROM 
  `bigquery-public-data.stackoverflow.stackoverflow_posts` 

WHERE 
  favorite_count > 0 and -- favourited at least once
  accepted_answer_id is null and -- no accepted answer
  date_diff( extract( date from creation_date) , date "2015-01-01", day) >= 0 -- posted not a million years ago