"""
  NEW YORK TIMES SQL INTERVIEW QUESTION
Assume you're given the table on user viewership categorised by device type 
where the three types are laptop, tablet, and phone.

Write a query that calculates the total viewership for laptops and mobile devices 
where mobile is defined as the sum of tablet and phone viewership. 
Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views. 

"""
#MySQL SOLUTION

SELECT
  laptop_reviews,
  mobile_views
FROM (
SELECT
  ROW_NUMBER() OVER(ORDER BY (SELECT COUNT(*) FROM viewership WHERE device_type IN ('phone', 'tablet'))) numbers,
   (SELECT COUNT(*) FROM viewership WHERE device_type IN ('phone', 'tablet')) mobile_views,
   (SELECT COUNT(*) FROM viewership WHERE device_type = 'laptop') laptop_reviews
FROM viewership
)t;
WHERE numbers = 1

#PostgreSQL SOLUTION
  
SELECT
  COUNT(*) FILTER(WHERE device_type = 'laptop') AS laptop_reviews,
  COUNT(*) FILTER (WHERE device_type = 'tablet' OR device_type = 'phone') AS mobile_reviews
FROM viewership;
