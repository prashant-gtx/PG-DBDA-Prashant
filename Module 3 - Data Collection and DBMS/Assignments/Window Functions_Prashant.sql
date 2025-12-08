use hr;
-- Q.1: Top 3 highest paid employees in each department using RANK()
with ranked as (
    select 
        department_id,
        employee_id,
        concat(first_name,' ',last_name) as full_name,
        salary,
        rank() over (partition by department_id order by salary desc) as rnk
    from employees
    where department_id is not null
)
select * 
from ranked
where rnk <= 3;


-- Q.2: Unique row number per employee within department using ROW_NUMBER()
select 
    department_id,
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    salary,
    row_number() over (partition by department_id order by salary desc) as row_num
from employees
where department_id is not null;


-- Q.3: Departments where at least two employees share the same salary rank using DENSE_RANK()
with ranked as (
    select 
        department_id,
        employee_id,
        salary,
        dense_rank() over (partition by department_id order by salary desc) as d_rnk
    from employees
    where department_id is not null
)
select department_id, d_rnk, count(*) as emp_count
from ranked
group by department_id, d_rnk
having count(*) >= 2;


-- Q.4: Divide employees into 4 salary groups using NTILE(4)
select 
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    department_id,
    salary,
    ntile(4) over (order by salary desc) as salary_group
from employees;


-- Q.5: Salary and department average salary using AVG() window function
select 
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    department_id,
    salary,
    avg(salary) over (partition by department_id) as dept_avg_salary
from employees;


-- Q.6: Running total of salaries per department ordered by hire_date
select 
    department_id,
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    hire_date,
    salary,
    sum(salary) over (partition by department_id order by hire_date) as running_total
from employees;


-- Q.7: Compare each employee’s salary with department max salary
select 
    department_id,
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    salary,
    max(salary) over (partition by department_id) as dept_max_salary
from employees;


-- Q.8: Salary and previous employee’s salary using LAG()
select 
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    hire_date,
    salary,
    lag(salary) over (order by hire_date) as prev_salary
from employees;


-- Q.9: Salary and next employee’s salary in same department using LEAD()
select 
    employee_id,
    concat(first_name,' ',last_name) as full_name,
    department_id,
    hire_date,
    salary,
    lead(salary) over (partition by department_id order by hire_date) as next_salary
from employees;


-- Q.10: First and last hired employee in each department
select distinct
    department_id,
    first_value(concat(first_name,' ',last_name)) over (
        partition by department_id order by hire_date
    ) as first_hired,
    last_value(concat(first_name,' ',last_name)) over (
        partition by department_id order by hire_date 
        rows between unbounded preceding and unbounded following
    ) as last_hired
from employees;
