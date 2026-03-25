"""
IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter 
of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.

Display the number of unique queries as histogram categories, along with the count of employees 
who executed that number of unique queries.
"""
SELECT
  unique_query_count,
  COUNT(*)
FROM(
SELECT
  e.employee_id,
  COUNT(DISTINCT query_id) unique_query_count
FROM employees e
LEFT JOIN queries q
  ON e.employee_id = q.employee_id
  AND query_starttime >= '07/01/2023'
  AND query_starttime < '10/01/2023'
GROUP BY e.employee_id
) t
GROUP BY unique_query_count
ORDER BY unique_query_count
