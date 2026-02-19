"""
  LinkedIn SQL Interview Question
Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
Write a query to retrieve the count of companies that have posted duplicate job listings.

Definition:
- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.
  
"""


SELECT
  COUNT(*)
FROM(
SELECT
  ROW_NUMBER() OVER(PARTITION BY company_id ORDER BY title)
  company_id,
  title,
  LEAD(title) OVER(PARTITION BY company_id) duplicate
FROM job_listings
)t
WHERE title = duplicate;
