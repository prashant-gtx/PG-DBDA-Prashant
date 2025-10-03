-- altering table and adding a new column
alter table regions add column country_id int(20);
SHOW TABLES;
SELECT * FROM employees;
select * from countries;
select * from departments;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;

-- add column with some constraint

alter table regions add column dept_id VARCHAR(10) default 'IT';

-- ADDING 2 COLUMNS
alter table regions add column emp_id int(100), 
add column depart_name varchar(30) default 'Developer';

-- add column using datatype enum
alter table employees add column status  enum('Active', 'Inactive')
default 'Inactive';

select * from employees;

create table emp_ex(
	emp_id int(10),
    ename varchar(20),
    dept_id int);


desc emp_ex;

-- add primary key
alter table emp_ex modify column emp_id int(10) primary key;


create table emp_ex1(
	emp_id int(10),
    ename varchar(20),
    dept_id int);


desc emp_ex;

-- add primary key constraint to the column
alter table emp_ex1 add primary key(emp_id);

create table emp_ex2(
	emp_id int(10),
    ename varchar(20),
    dept_id int, salary int(10));
    
    -- alter with constraint primary key
alter table emp_ex2 add constraint pk_emp_id primary key(emp_id);
desc emp_ex2;

-- alter with check constraint

alter table emp_ex2 add constraint chk_salary check(salary>50000);


create table emp_ex3(
	emp_id int(10),
    ename varchar(20),
    dept_id int, salary int(10));
    
alter table emp_ex3 add constraint pk_emp_id primary key(emp_id), add constraint chk1_salary check(salary>40000), modify column dept_id int default '1';

desc emp_ex3;
select * from emp_ex3;

create table emp_ex4(
	emp_id int(10),
    ename varchar(20),
    dept_id int, salary int(10));

alter table emp_ex4 add constraint pk_emp_id primary key(emp_id); 
alter table emp_ex4 add constraint chk2_salary check(salary>40000);
alter table emp_ex4 modify column dept_id int default '1' ;
ALTER TABLE emp_ex4 ADD COLUMN email VARCHAR(50);
ALTER TABLE emp_ex4 ADD CONSTRAINT email_chk CHECK (email LIKE '%@%');

desc emp_ex4;

ALTER TABLE emp_ex4 add index (emp_id);
show indexes from emp_ex4;


-- modify

-- modify the datatype of the column

desc employees;

alter table employees modify column PHONE_NUMBER INT(10);

create table emp_ex5(
	emp_id int(10),
    ename varchar(20),
    dept_id int
);

desc emp_ex5;

alter table emp_ex5 modify column emp_id varchar(10);

-- modift the current timestamp

alter table emp_ex5 add column doj datetime;

alter table emp_ex5 modify column doj timestamp default current_timestamp();

select * from emp_ex5;

alter table employees modify column status enum('Active','Inactive','Resigned','Long Leave') default 'Long Leave';

-- modify auto increment
create table emp_ex6(
	emp_id int(10) auto_increment primary key,
    ename varchar(20),
    dept_id int
);

alter table emp_ex6 modify column emp_id int(10) auto_increment, auto_increment=2000;

insert into emp_ex6(ename, dept_id) values('SAM',10);
SELECT * FROM emp_ex6;





-- rename
use hr;
-- using rename
alter table regions rename column region_id to r_id;                    -- used only to rename the column
-- using change
alter table regions change column region_name r_name varchar(25);     -- also used to change the datatype and the name
alter table regions change column r_name region_name char(30);         -- in this query we changed the datatype of the column also
alter table regions rename column country_id to c_id, rename column depart_name to d_name;
desc regions;


-- drop column

alter table regions drop column dept_id;

alter table regions drop column d_name, drop column emp_id;    -- dropping multiple columns

alter table employees drop column status;


desc emp_ex;
-- first we remove the auto increment and then we remove the primary key
alter table emp_ex add column emp_id int auto_increment primary key, auto_increment=1;
-- removing primary key
alter table emp_ex drop column emp_id;


-- modify 

create table cdac(
	s_name int 


);


select * from employees;

drop table employees;

truncate table employees;

rollback;
rollback;
rollback;