use hr;
select first_name,department_id from employees where department_id in (Select department_id from departments);

-- we need to find employee details who is earning max salary
select max(salary) from employees where salary=(select max(salary) from employees);

select concat(first_name,' ',last_name) full_name, job_id,salary from employees where salary=(Select max(Salary) from employees);

-- find the employee with same job  and salary as employee id 100
select first_name,job_id,salary from employees where (job_id,salary)=(select job_id,salary from employees where employee_id=100);


-- find the third highest paid employee

select employee_id, salary from employees where salary<(select max(salary) from employees) limit 2,1;

select salary from employees order by salary desc limit 3;
select first_name, salary from employees where salary in (select salary from employees order by salary desc) limit 3;
select salary from employees order by salary desc limit 1 offset 3;

-- find all customers who have placed atleast 1 order
use northwind;

select customer_id,contact_name from customers where customer_id in(select distinct customer_id from orders);

-- find all employees working in department located in the regions = 'Americas'
use hr;



select employee_id,first_name from employees e join departments d
on e.department_id=d.department_id
where d.location_id in (select l.location_id from departments d join locations l on d.location_id=l.location_id
join countries c on c.country_id=l.country_id
join regions r on r.region_id=c.region_id
where r.region_name='Americas');


select employee_id, first_name,salary from employees where salary <=all(select salary from employees);

-- find department wheer all employees earn more than 4000;
select department_id, department_name from departments where department_id in (select department_id from employees where salary>=5000);


-- find products that has same supplier and category as product chai

use northwind;
select * from products;
select * from suppliers;
select product_id, product_name, category_id from products where supplier_id in (select supplier_id from products where category_id=1);
select product_id,product_name,supplier_id,category_id from products where product_id=(select product_id from products where product_name='Chai');

-- ----------------------------------------------------------------------------------------------------------------------------------------
use hr;
select first_name,salary,department_id
from employees where department_id>any(select department_id from departments where department_name='Executive');




