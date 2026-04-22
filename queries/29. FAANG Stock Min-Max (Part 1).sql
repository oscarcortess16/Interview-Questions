"""
  Bloomberg SQL Interview Question

The Bloomberg terminal is the go-to resource for financial professionals, 
offering convenient access to a wide array of financial datasets. As a Data Analyst at Bloomberg,
you have access to historical data on stock performance.

Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') 
with the corresponding highest and lowest open prices (refer to the Example Output format). 
Ensure that the results are sorted by ticker symbol.
  
"""
WITH cte_max AS (
  SELECT
    ticker,
    open open_max,
    date date_max,
    ROW_NUMBER() OVER(
    PARTITION BY ticker 
    ORDER BY open DESC, date ASC) rn
  FROM stock_prices
),
cte_min AS (
  SELECT
    ticker,
    open open_min,
    date date_min,
    ROW_NUMBER() OVER (
    PARTITION BY ticker 
    ORDER BY open ASC, date ASC) AS rn
  FROM stock_prices
)
SELECT 
  cte_max.ticker,
  TO_CHAR(date_max, 'Mon-YYYY') highest_mth,
  open_max,
  TO_CHAR(date_min, 'Mon-YYYY') lowest_mth,
  open_min
FROM cte_max
LEFT JOIN cte_min
  ON cte_max.ticker = cte_min.ticker
WHERE 
  cte_max.rn = 1 AND
  cte_min.rn = 1;
