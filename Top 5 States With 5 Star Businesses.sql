-- Top 5 States With 5 Star Businesses
-- Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

with t as (select state, stars, count(*) as fives  from yelp_business where stars = 5 group by state, stars order by fives desc, state)

select state, fives as n_businesses from t where fives in (select distinct fives from t order by fives desc limit 4) ;