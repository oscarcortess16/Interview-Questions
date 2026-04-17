"""
  Google SQL Interview Question

Assume you're given a table with measurement values obtained from a Google sensor 
over multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements
separately for a particular day and display the results in two different columns. 
Refer to the Example Output below for the desired format.

Definition:

Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements,
and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.
"""
WITH cte_rank AS (
  SELECT
    DATE(measurement_time) measurement_day,
    measurement_value,
    RANK() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time) rnk
  FROM measurements
)
SELECT
  measurement_day,
  SUM(CASE WHEN rnk % 2 = 1 THEN measurement_value ELSE 0 END) odd_sum,
  SUM(CASE WHEN rnk % 2 = 0 THEN measurement_value ELSE 0 END) even_sum
FROM cte_rank
GROUP BY measurement_day;
