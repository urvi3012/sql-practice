-- Highest Cost Orders
-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output their first name, total cost of their items, and the date.
 
--  For simplicity, you can assume that every first name in the dataset is unique.
 
--  -- select * from orders;

-- highest daily order cost date between
-- if +1 order, sum on daily
-- fname, cost, date

with cte as
(select c.first_name, o.order_date, sum(o.total_order_cost) as total_cost from customers c join orders o on o.cust_id = c.id where o.order_date between '2019-02-01' and '2019-05-01' group by o.order_date, c.first_name order by o.order_date)

select * from cte where total_cost = (select max(total_cost) from cte) ;

