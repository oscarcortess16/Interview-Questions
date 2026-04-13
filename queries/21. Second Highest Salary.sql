"""
  FAANG SQL Interview Question

Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries.
our manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.

It's possible that multiple employees may share the same second highest salary. In case of duplicate, display the salary only once.
"""

SELECT
  salary
FROM (
SELECT 
  employee_id, 
  name,
  salary,
  RANK() OVER(ORDER BY salary DESC) rnk
FROM employee
) t
WHERE rnk = 2;
