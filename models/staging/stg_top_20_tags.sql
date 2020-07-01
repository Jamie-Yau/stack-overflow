SELECT 
    tag_name 

FROM 
    `bigquery-public-data.stackoverflow.tags`

ORDER BY count DESC 

LIMIT 20