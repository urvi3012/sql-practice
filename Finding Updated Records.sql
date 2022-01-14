-- Finding Updated Records
-- We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.
-- Table: ms_employee_salary

-- Ans
-- id
-- fname
-- lname
-- did
-- cur sal
-- order by emp id asc


-- select id, first_name, last_name, department_id, max(salary) from ms_employee_salary group by id, first_name, last_name, department_id order by id;

with t1 as (select id, first_name, last_name, salary, department_id, dense_rank() over (partition by id order by salary desc) as drk  from ms_employee_salary) 
select id, first_name, last_name, salary, department_id from t1 where drk = 1;

