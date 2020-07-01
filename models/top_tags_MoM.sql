WITH base as (
    SELECT
        post_month, tag_name 

    FROM 
        {{ ref('stg_get_datemonth')}}, 
        {{ ref('stg_top_20_tags') }}
)

SELECT 
    post_month,
    tag_name, 
    countif( strpos( concat('!!', replace( tags, '|', '!!|!!'), '!!') ,
      concat('!!', tag_name, '!!')) > 0 ) as total_posts
    
FROM base 
LEFT JOIN {{ ref('stg_unanswered_posts') }}
ON post_month = TIMESTAMP_TRUNC( creation_date, MONTH)
GROUP BY 1, 2 