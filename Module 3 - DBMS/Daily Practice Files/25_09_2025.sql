use practice;
select * from employees;
desc employees;
insert into employees value(1010,'Prashant','Gupta','prashant@gmail.com',9029.1407773,'2025-09-25','President',100000,0.50,150,1);
insert into employees value(1011,'Prashant','Gupta','prashan1t@gmail.com',9029.1407773,'2025-08-27','President',100000,0.50,150,1);
insert into employees value(1012,'Prashant','Gupta','prashanttt@gmail.com',9029.1407773,'2025-08-24','President',100000,0.50,150,1);
-- yyyy-mm-dd             date
-- hh:mm:ss               time
-- yyyy-mm-dd hh:mm:ss    datetime

-- ---------------------------------------------------------------------------------------
select employee_id,concat(first_name,' ',last_name), hire_date from employees where HIRE_DATE=curdate();

select curtime();
select count(*) as no_of_employees, curtime() as report_generated_time from employees;

-- date_add / date_sub

select date_add("2025-09-25", interval 1 year);
select date_add("2025-09-25", interval 1 day);
select date_add("2025-09-25", interval 1 month);

select date_sub("2025-09-25", interval 1 year);
select date_sub("2025-09-25", interval 1 day);
select date_sub("2025-09-25", interval 1 month);

select date_add(curdate(), interval "2_6" year_month);

select employee_id, concat(first_name,' ', last_name) as full_name,hire_date, date_add(hire_date, interval 30 day) as probation_end_date from employees;

-- find empl whose probation ends in 30 days

-- find empl who has been hired in last 30 days
select employee_id from employees where hire_date between date_sub(curdate(), interval 30 day) and curdate();


-- to find customers who ordered in the last 30 days
-- select c.cust_id from customers c join orders o on c.cust_id=o.cust_id where o.order_date between date_sub(curdate(), interval 30 day) and curdate();

select datediff(curdate(),hire_date) from employees;

select * from employees where datediff(curdate(),hire_date)<=30;

-- find datediff in year format

select round(datediff(curdate(),hire_date)/365) from employees;  -- diff in years

select timestampdiff(year,hire_date,curdate()) from employees;
select timestampdiff(month,hire_date,curdate()) from employees;
select timestampdiff(day,hire_date,curdate()) from employees;
select timestampdiff(month,hire_date,curdate()),timestampdiff(year,hire_date,curdate()) from employees;

select * from employees where timestampdiff(day,hire_date,curdate())<=30;

select date_format("2025-09-25",'%d-%m-%Y');

select date_format(hire_date,'%d-%m-%Y');

-- fnd employees who have served for more than 35+ years

select * from employees where timestampdiff(year,hire_date,curdate())>=35;

-- find the emp who were hired in the month of august

select * from employees where monthname(hire_date)='August';

-- find the empl who are having work anniververy in next 30 days

select employee_id, concat(first_name,' ', last_name) as full_name, hire_date from employees where timestampdiff(day,hire_date,curdate())<=30 and monthname(curdate())='September';

select employee_id, concat(first_name,' ', last_name) as full_name, hire_date from employees 
where month(hire_date)>=month(curdate()) and day(hire_date) between day(curdate()) and day(hire_date)+30;