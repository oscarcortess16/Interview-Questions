"""
  TWITTER SQL INTERVIEW QUESTION
Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.
  
"""
  
SELECT
  tweets_bucket,
  COUNT(user_id) users_num
FROM(
SELECT 
  user_id,
  COUNT(*) tweets_bucket
FROM tweets
WHERE YEAR(tweet_date) = '2022'
GROUP BY 
  user_id
) t
GROUP BY tweets_bucket;
