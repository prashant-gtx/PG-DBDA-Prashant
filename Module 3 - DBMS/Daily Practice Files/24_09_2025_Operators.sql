-- arithmetic operators (=,-,/,%,*)

create database operators;
use operators;

create table employees as select * from practice.employees;

select salary, salary+ 1000 as bonus from employees;

alter table employees add column check_bonus int default null;

select * from employees;

select check_bonus+1000 as bonus from employees;    -- doing any operation on Null will give null values


select *, salary-salary as new_salary from employees;

select *, salary*100 as mult_bonus from employees;
select *, salary/100 as div_bonus from employees;
select *, salary%10 as mod_bonus from employees;

-- comparison operators (=,<>,<=,>=,<,>)
select *, concat(first_name,' ' ,last_name) as Full_Name from employees where first_name='Steven';

select * from employees where salary=12000;

select * from employees where check_bonus is null;  -- wrong way to use null


select * from employees where department_id != 90;

select * from employees where manager_id <> 103;

select * from employees where year(hire_date)!= '1987';

select * from employees where salary>10000 order by salary desc;

-- find employees who are working since 1987-8-01

select * from employees where hire_date> '1987-08-01';

select * from employees where salary<10000;
select * from employees where salary>=10000;
select * from employees where salary<10000;
select * from employees where commission_pct<0.15;
select * from employees where salary between 10000 and 20000;

select * from employees where hire_date between '1987-08-01' and '1987-08-31';

select * from employees where department_id between 70 and 100;

select * from employees where first_name between 'A' and 'D';

select * from employees where salary NOT between 5000 and 10000;

select * from employees where MANAGER_ID NOT between 70 and 105;

select * from employees where DEPARTMENT_ID IN (70,40,90,100);

select * from employees where JOB_ID IN ('AD_VP','IT_PROG','FI_MGR');

select * from employees where JOB_ID NOT IN ('HR_REP','AD_PRES','AD_VP');

-- LIKE
select * from employees where FIRST_NAME LIKE 'D%';   -- START NAME WITH D

select * from employees where FIRST_NAME LIKE '%EN';   -- ENDS WITH EN

select * from employees where FIRST_NAME LIKE '%AH%';    -- NAME CONTAINS AH IN BETWEEN/ANY POSITION

select * from employees where FIRST_NAME LIKE '__E%';    -- NAME HAS 3 AT 3RD PLACE

select * from employees where FIRST_NAME LIKE '%A_';

select * from employees where FIRST_NAME LIKE 'A%%' OR FIRST_NAME LIKE'E%%' OR FIRST_NAME LIKE 'I%%'OR FIRST_NAME LIKE'O%%'OR FIRST_NAME LIKE'U%%';

select * from employees where FIRST_NAME REGEXP '^[AEIOU]';  -- USING REGEXP

select * from employees where salary>10000 and department_id in(70,80,90,100);


select * from employees where job_id = 'IT_PROG' AND HIRE_DATE= '1987-08-01' AND SALARY>10000 ;

select * from employees where SALARY>15000 OR COMMISSION_PCT<0.30 ;

select * from employees where not(salary between 5000 and 10000) and salary is not null;  -- first the bracket will be checked because of the highest priority and then the next condition

select * from employees where not year(hire_date)=1987;

select * from employees where FIRST_NAME REGEXP '^[A]';

select * from employees where phone_number REGEXP '^[0-9]+$';



