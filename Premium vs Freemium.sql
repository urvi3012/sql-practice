-- Premium vs Freemium
-- Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

with T as (
select u.user_id as user_id, a.paying_customer from ms_user_dimension u join ms_acc_dimension a
on u.acc_id = a.acc_id
)

select * from
(
    select d.date as date, 
            sum(case when T.paying_customer = 'no' then d.downloads end) as non_paying,
            sum(case when T.paying_customer = 'yes' then d.downloads end) as paying
    from T join 
    ms_download_facts d 
    on T.user_id = d.user_id 
    group by d.date
    order by d.date
) data
where non_paying > paying;