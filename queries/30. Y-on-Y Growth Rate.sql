"""
  Wayfair SQL Interview Question

This is the same question as problem #32 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table containing information about Wayfair user transactions for different products. 
Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

The output should include the year in ascending order, product ID, current year's spend, 
previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.

"""
WITH current_year AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year_1,
    product_id,
    SUM(spend) curr_year_spend
  FROM user_transactions
  GROUP BY 
    year_1,
    product_id
),
previous_year AS (
  SELECT
    year_1,
    product_id,
    curr_year_spend,
    LAG(curr_year_spend) OVER(PARTITION BY product_id ORDER BY year_1) prev_year_spend
  FROM current_year
)
SELECT 
  year_1,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(((curr_year_spend/prev_year_spend) -1)*100.0, 2) yoy_rate
FROM previous_year
ORDER BY 
  product_id,
  year_1;
  
