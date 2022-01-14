-- Customer Revenue In March
-- Calculate the total revenue from each customer in March 2019. 

-- Output the revenue along with the customer id and sort the results based on the revenue in descending order.

-- ans
-- select * from orders;

-- total rev for each cust
-- op: rev + cust id
-- order by rev decs

with 
cte1 as 
(select * from orders where EXTRACT('MONTH' FROM order_date::TIMESTAMP) = 3)

select cust_id, sum(total_order_cost) as rev from cte1 group by cust_id order by rev;

