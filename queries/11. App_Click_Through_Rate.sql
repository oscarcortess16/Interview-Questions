"""
  Facebook SQL Interview Question

Assume you have an events table on Facebook app analytics. 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
  
Definition and note:

Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100. 
"""
  
SELECT
  app_id,
  ROUND(100.0 * clicks_count/impression_count, 2) AS ctr
FROM(
SELECT
  app_id,
  COUNT(*) FILTER(WHERE event_type = 'impression') impression_count,
  COUNT(*) FILTER(WHERE event_type = 'click') clicks_count
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id
) t
