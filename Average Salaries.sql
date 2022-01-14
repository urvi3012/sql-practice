-- Average Salaries
-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.
-- Table: employee

-- Ans
-- select department , first_name, salary, (select avg(salary) from employee e2 where e1.department = e2.department) from employee e1;

select department , first_name, salary, avg(salary) over(partition by department) from employee;