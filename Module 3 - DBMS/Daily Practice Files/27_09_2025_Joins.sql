use hr;
select* from employees;
select* from departments;
select* from locations;
select* from countries;
select* from jobs;
select* from regions;
-- ------------------------------------------------------------------
select e.employee_id,e.first_name, j.job_title 
from employees e
join jobs j
on e.job_id=j.job_id;

-- 3 table join
-- find the full name, employee, city where they are working

select e.employee_id, concat(e.first_name,' ', last_name) as full_name, l.city, c.country_name,r.region_name
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
join countries c
on c.country_id=l.country_id
join regions r
on c.region_id=r.region_id;

-- write a query to display department id and the number of distinct location 
select d.department_id, count(distinct d.location_id) from departments d join locations l on d.location_id=l.location_id
 group by d.department_id;
 
 -- to find distinct department where employees work
 select d.department_id,d.department_name,count(e.employee_id) as count_emp from employees e join departments d on e.department_id=d.department_id
 group by d.department_id, d.department_name order by count_emp desc;

-- find the no of employees working in each country that has more than 15 employees
select count(e.employee_id), c.country_name 
from employees e 
join departments d 
on e.department_id=d.department_id 
join locations l 
on d.location_id=l.location_id 
join countries c 
on l.country_id=c.country_id
group by c.country_name having count(e.employee_id)>15;
-- ----------------------------------------------------------------------------------------------------------------------------

use hr;

-- find the employees by their employee fullname job id job title, department id where department_id are either 90 30 40 100

select concat(e.first_name,' ', e.last_name) as full_name, e.job_id, j.job_title,e.department_id
from employees e
join jobs j
on j.job_id=e.job_id
having e.department_id in (90,30,40,100);
-- --------------------------------------------------------------------------------------------------------------------------------
use joins;

select * from employee_jn;
select * from department_jn;

select e.*,d.*
from employee_jn e
left join department_jn d
on e.department_id=d.dept_id;

-- hr
use hr;
select e.*,d.*
from employees e
left join departments d
on e.employee_id=d.department_id;

-- ----------------------------------------------------------------------------------------------------------
use northwind;
select * from employees;
select * from orders;

-- employees who have never handled any orders
select e.employee_id,concat(first_name,' ',last_name),
e.title from employees e left join orders o
on e.employee_id=o.employee_id
where o.employee_id is null;

-- display all the products with category information ensuring all products are shown even if category data is missing

select * from products;
select * from categories;


select p.*,c.*
from products p join categories c
on p.category_id=c.category_id
where c.category_id is not null;



