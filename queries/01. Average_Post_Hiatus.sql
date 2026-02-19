"""
  Facebook SQL Interview Question
Given a table of Facebook posts, for each user who posted at least twice in 2021, 
write a query to find the number of days between each user’s first post of the year 
and last post of the year in the year 2021. Output the user and number of the days 
between each user's first and last post.
"""

SELECT
  user_id,
  DATEDIFF(MAX(post_date), MIN(post_date)) days_between
FROM posts
WHERE post_date >= '2021-01-01' and post_date <= '2021-12-31' 
GROUP BY user_id
LIMIT 2;
