create database joins;
use joins;
CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);

insert into employee_jn(emp_id,e_name,salary) values(207,'Jane Doe',90989),
(208,'Brown Wilson',90011);


use hr;
create table employees as select * from practice.employees;
-- --------------------------------------------------------------------------------------------------
select e.emp_id, e.e_name, e.salary, e.department_id from employee_jn e join department_jn d on e.department_id=d.dept_id;
use joins;
create table employees as select * from practice.employees;
create table jobs as select * from hr.jobs;
select concat(first_name,' ', last_name) full_name, j.job_id, job_title from employees e join jobs j on e.job_id=j.job.id;

-- find all the employees along with the departments
select * from employees;
select employee_id,department_name,salary from employees e join departments d on e.department_id=d.department_id where salary between 5000 and 15000;

use northwind;

select category_name, avg(unit_price) as avg_u from products p join categories c
on c.category_id=p.category_id
group by category_name;

-- -------------------------------------------------------------------------------------------------------------------------------------
use joins;
select department_name, count(emp_id) from department_jn d join employee_jn e on d.dept_id=e.department_id group by department_name;

-- employee table hai order table hai and display konsa employee kitne order handle karrta hai 

use northwind;
select concat(first_name,' ', last_name) employee_name, count(o.order_id) from employees e join orders o on e.employee_id=o.employee_id group by 1; 