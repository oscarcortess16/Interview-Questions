"""
  Snapchat SQL Interview Question

Assume you're given tables with information on Snapchat users, 
including their ages and time spent sending and opening snaps.

Write a query to obtain a breakdown of the time spent sending vs. 
opening snaps as a percentage of total time spent on these activities grouped by age group. 
Round the percentage to 2 decimal places in the output.

Notes:
Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100. 
  
"""
SELECT
  age_bucket,
  ROUND((sending_time*100.0)/(opening_time+sending_time),2) send_percent,
  ROUND((opening_time*100.0)/(opening_time+sending_time),2) open_percent
FROM (
SELECT
  age_bucket,
  SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) opening_time,
  SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) sending_time
FROM activities act
LEFT JOIN age_breakdown ab
  ON act.user_id = ab.user_id
GROUP BY age_bucket
) t;
