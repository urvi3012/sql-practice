

-- Acceptance Rate By Date
-- What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.


with t2 as 
(select date,count(*) as d from fb_friend_requests where action = 'sent'group by date order by date),

t1 as (
select f1.date, count(*) as n from fb_friend_requests f1 
join fb_friend_requests f2 
on f1.user_id_sender = f2.user_id_sender 
and f1.user_id_receiver = f2.user_id_receiver 
where f1.action != f2.action and f1.action = 'sent'
group by f1.date order by f1.date )

select t1.date, (t1.n * 1.0 / t2.d) from t2  join t1 on t1.date = t2.date;
