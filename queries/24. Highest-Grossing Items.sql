"""
  Amazon SQL Interview Question
  
Assume you're given a table containing data on Amazon customers 
and their spending on products in different category, write a query 
to identify the top two highest-grossing products within each category in the year 2022. 
The output should include the category, product, and total spend.
"""
SELECT
  category,
  product,
  total_spend
FROM(
SELECT
  category,
  product,
  SUM(spend) total_spend,
  RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) rnk
FROM product_spend
WHERE YEAR(transaction_date) = '2022'
GROUP BY
  product,
  category
)t
WHERE rnk IN (1,2);
