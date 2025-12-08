-- Prashant Gupta
-- Assignment on Alias
-- Q.1: Display EMPLOYEE_ID as ID, FIRST_NAME as First, LAST_NAME as Last
select 
    employee_id as ID,
    first_name as First,
    last_name as Last
from employees;


-- Q.2: Display JOB_ID as JobCode, JOB_TITLE as Title, MIN_SALARY as MinimumSalary
select 
    job_id as JobCode,
    job_title as Title,
    min_salary as MinimumSalary
from jobs;


-- Q.3: Display FIRST_NAME and LAST_NAME using alias e for employees table
select 
    e.first_name,
    e.last_name
from employees e;


-- Q.4: Display EMPLOYEE_ID and full name (FIRST_NAME + ' ' + LAST_NAME as FullName), sorted descending
select 
    employee_id,
    concat(first_name,' ',last_name) as FullName
from employees
order by FullName desc;


-- Q.5: Display EMPLOYEE_ID as ID, FIRST_NAME as Name, SALARY as Income for salary > 5000
select 
    employee_id as ID,
    first_name as Name,
    salary as Income
from employees
where salary > 5000;


-- Q.6: Display EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME using aliases e and d
select 
    e.employee_id,
    e.first_name,
    d.department_name
from employees e
join departments d on e.department_id = d.department_id;


-- Q.7: Display COUNTRY_NAME and REGION_NAME using aliases c and r where REGION_ID > 2
select 
    c.country_name,
    r.region_name
from countries c
join regions r on c.region_id = r.region_id
where r.region_id > 2;


-- Q.8: Display FIRST_NAME and LAST_NAME of employees whose department is "IT"
select 
    e.first_name,
    e.last_name
from employees e
join departments d on e.department_id = d.department_id
where d.department_name = 'IT';


-- Q.9: Display average salary (AVG(SALARY) as AverageSalary) for each department
select 
    d.department_name,
    avg(e.salary) as AverageSalary
from employees e
join departments d on e.department_id = d.department_id
group by d.department_name;


-- Q.10: Display REGION_NAME and total number of countries in each region (as CountryCount)
select 
    r.region_name,
    count(c.country_id) as CountryCount
from countries c
join regions r on c.region_id = r.region_id
group by r.region_name;
