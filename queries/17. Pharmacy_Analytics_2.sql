"""
CVS Health SQL Interview Question

CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. 
Each drug is exclusively manufactured by a single manufacturer.

Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health 
and calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses,
and the total losses in absolute value. 
Display the results sorted in descending order with the highest losses displayed at the top.  
"""
SELECT
  manufacturer,
  COUNT(drug) drug_count,
  ABS(SUM(total_losses)) total_loss
FROM(
SELECT 
  manufacturer,
  drug,
  total_sales - cogs AS total_losses
FROM pharmacy_sales
) t
WHERE total_losses < 0
GROUP BY manufacturer
ORDER BY drug_count DESC;
