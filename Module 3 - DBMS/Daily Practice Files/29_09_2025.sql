select full_name, department_name,city,country_name
from
(select concat(first_name,' ',last_name) as full_name,
d.department_id,d.department_name,l.location_id,l.city,
c.country_id,c.country_name
from employees e
join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
join locations l
on d.LOCATION_ID=l.LOCATION_ID
join countries c
on c.country_id=l.COUNTRY_ID) as join_till_country
where city ='Seattle';
use hr;

select salary from employees where salary > (select avg(salary) from employees);
select avg(Salary) from employees;

-- employees earning more than department average
select employee_id, first_name, salary, department_name, e.department_id from employees e join departments d
on e.department_id=d.department_id
where salary>(select avg(salary) from employees e1 where e1.department_id=e.department_id);

select avg(salary) from employees where department_id=50;

select count(employee_id), department_name, e.department_id
from employees e
join departments d on e.department_id = d.department_id
group by department_name, e.department_id
having count(employee_id) > 10;


with select_all as(
select first_name,last_name,salary,department_id from employees
)
select * from select_all;

-- find the employees earning more than their department avg salary

with avg_count as
(
	select department_id, avg(Salary) dept_avg from employees
    group by department_id
)
select first_name,salary,c.department_id,dept_avg from employees e
join avg_count c on e.department_id=c.department_id
where e.salary>=dept_avg;

-- find the department where there are 0 employees working
select d.department_id, d.department_name
from departments d
left join employees e on d.department_id = e.department_id
where e.employee_id is null;

with emp_count as (
    select department_id, count(employee_id) as employee_count from employees
    group by department_id
)
select d.department_id, d.department_name
from departments d
left join emp_count e on d.department_id = e.department_id
where e.employee_count is null or e.employee_count = 0;

-- number of emp working in each department including where there are zero department


-- find the department where there is no manager assigned
with dept_managers as (
    select department_id,department_name, manager_id
    from departments
)
select department_id,department_name
from dept_managers
where manager_id is null;

with emp_dept as
(
	select employee_id,department_id,salary
    from employees
), r_map as(
	select d.department_id,d.department_name,l.city,c.country_name,
    trim(replace(r.region_name,'\r','')) as region_name
    from departments d
    join locations l
    on d.location_id=l.location_id
    join countries c
    on c.country_id=l.country_id
    join regions r
    on r.region_id=c.region_id
    ),dept_co as 
    (select department_id,count(*) as numb_of_emp from emp_dept
    group by department_id)
    
    select e.employee_id,d.department_id,r.city,r.region_name,d.numb_of_emp
    from emp_dept e
    join r_map r
    on r.department_id=e.department_id
    join dept_co d
    on d.department_id=r.department_id;
    
    -- write a query to find job_id,job_title,count_of_job_id and region name

with 
emp_det as(
select employee_id, job_id, department_id from employees),
job_t as(
select job_title from jobs),
r_map as(
	select d.department_id,d.department_name,l.city,c.country_name,
    trim(replace(r.region_name,'\r','')) as region_name
    from departments d
    join locations l
    on d.location_id=l.location_id
    join countries c
    on c.country_id=l.country_id
    join regions r
    on r.region_id=c.region_id
    ),
job_t as(
select job_title from jobs)
    select e.employee_id, e.job_id,j.job_title,count(e.job_id),r.region_name
    from emp_det e
    join r_map r
    on r.department_id=e.department_id
    join job_t j
    on e.job_id=j.job_id;
-- -----------------------------------------------------------------------------------------------------------------------
with 
emp_det as (
    select employee_id, job_id, department_id from employees
),
r_map as (
    select d.department_id, 
           d.department_name, 
           l.city, 
           c.country_name,
           trim(replace(r.region_name, '\r', '')) as region_name
    from departments d
    join locations l on d.location_id = l.location_id
    join countries c on c.country_id = l.country_id
    join regions r on r.region_id = c.region_id
)
select 
    e.job_id, 
    j.job_title, 
    count(e.job_id) as count_of_job_id, 
    r.region_name
from emp_det e
join r_map r on r.department_id = e.department_id
right join jobs j on e.job_id = j.job_id
group by e.job_id, j.job_title, r.region_name;


-- ---------------------------------------------------------------------------------------------------------------------------------
select department_id from employees
union select department_id from departments;

select department_id from employees union all
select department_id from departments;

select employee_id,salary, 'High Earner' as Sal_cat from employees where salary>=5000
union all select employee_id,salary,'Low Earner' as Sal_cat from employees where salary<=5000;

with ex_rec as(
	select employee_id,manager_id, department_id,first_name,0 as level
    from employees
    where department_id=80
    
    union all
    select employee_id,manager_id,department_id,first_name, 1 as level
    from employees
    where department_id=90
    )
    select * from ex_rec;
    
    -- ---- ---- ---- ---- ---- ---- ---- ----------------------------------------------------------------------------
	with cte1 as (select employee_id,first_name,
    e.salary, j.job_id,job_title,min_salary, max_salary,
    case
		when e.salary<j.min_salary then 'Underpaid Employee'
        when e.salary>j.max_salary then 'Overpaid Employee'
        else 'OK'
	end as sal_cat
    from employees e
    right join jobs j
    on e.job_id=j.job_id
    
    union all
    
    select employee_id,first_name,
    e.salary, j.job_id,job_title,min_salary, max_salary,
    case
		when e.salary<j.min_salary then 'Underpaid Employee'
        when e.salary>j.max_salary then 'Overpaid Employee'
        else 'OK'
	end as sal_cat
    from employees e
    right join jobs j
    on e.job_id=j.job_id)

select distinct employee_id,sal_cat from cte1 where sal_cat like 'Overpaid%' or sal_cat like 'Underpaid%';



