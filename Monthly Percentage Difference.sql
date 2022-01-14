-- Monthly Percentage Difference
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
-- The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

-- yyyy - dd

with 
cte1 as 
(select 
extract(month from created_at::timestamp) as month, 
sum(value) as total from sf_transactions 
group by month order by month),

cte2 as
(select *, 
Lag(total, 1) 
over(order by month asc) as lagged_total from cte1)

select 
case when month::int<10 then concat('2019','-0',month)
else concat('2019','-',month)
end as month,
round(((total-lagged_total)*100/ lagged_total),2) as revenue_diff_pct from cte2;



