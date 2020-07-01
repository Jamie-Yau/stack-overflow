SELECT DISTINCT 
    TIMESTAMP_TRUNC( creation_date, MONTH) as post_month

FROM 
    {{ ref('stg_unanswered_posts') }}