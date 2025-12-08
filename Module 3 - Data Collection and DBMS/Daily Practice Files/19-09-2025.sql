-- date

create table date_1(
	s_name varchar(20),
    dob date
);

-- insert into the table

insert into date_1 value('Prashant', '2003-10-11');

select * from date_1;

select length(dob) from date_1;

insert into date_1 value('Prashant', null);

-- time datatype  HH:MM:SS

create table date_2(
	s_name varchar(20),
    dob date,
    birth_time time
);
insert into date_2 value('Prashant', '2003-10-11','20:30:00');

SELECT * FROM date_2;

-- datetime
create table date_33(
	s_name varchar(20),
    birth_date_time datetime
);
insert into date_33 value('Prashant', '2003-10-11 20:30:00');

select * from date_33;
insert into date_33 value('Prashant', '2003-02-28 20:30:00');


-- timestamp
create table date_3(
	s_name varchar(20),
    birth_date_time timestamp
);
insert into date_3 value('Prashant', current_timestamp());

select * from date_3;

-- year  default range is 1901-2155
create table date_4(
	s_name varchar(20),
    birth_year year
);
insert into date_4 value('Prashant', '2003');

select * from date_4;


select now();    -- gives current date and time
select current_timestamp();  --  also gives current date and time
select current_time();  -- gives the current time
select current_date();  -- gives the current date
select curdate();  -- also gives the current date
select current_date() as cur_date;

-- utc
select utc_timestamp();
select utc_date();
select utc_time;





-- Constraints

create database constraints;
use constraints;

-- Unique 
create table Student_UK(s_name varchar(20), age int, email varchar(100) unique);
insert into Student_UK VALUE('Prashant', 21, 'prashant@gmail.com');
insert into Student_UK VALUE('Deependra', 21, 'prashant@gmail.com');  -- error because email accepts only unique values

-- 
drop TABLE Student_UK1;
create table Student_UK1(s_name varchar(20), age int, email varchar(100), mobile_no BIGINT(10), unique(email, mobile_no));
insert into Student_UK1 VALUE('Prashant', 21, 'prashant@gmail.com',9029140773); -- 2,147,483,647


-- 
create table Student_UK2(s_name varchar(20), age int, email varchar(100) unique , u_email varchar(100), alter_email varchar(100), unique(email, alter_email));
insert into Student_UK2 VALUE('Prashant', 21, 'prashant@gmail.com', 'p@gmail.com', 'p@gmail.com'); -- unique checks if the column has unique value or not


-- unique can hold a null value and in a table multiple attributes can be made

-- unique not null
create table Emp(emp_name varchar(20) not null, u_email varchar(100) unique , email varchar(100) not null, alter_email varchar(100), unique(email, alter_email));

desc Emp;

-- default 
create table Emp_default(emp_name varchar(20) primary key not null, u_email varchar(100) unique , email varchar(100) not null, dept_name varchar(20) default 'IT');

insert into Emp_default VALUE('Patrick', 'patrick@gmail.com', 'patty@gmail.com', default);
-- delete from Emp_default where emp_name='Patrick';
select * from Emp_default;
insert into Emp_default(emp_name, u_email, email) value ('Prashant', 'prashant@gmail.com','prashantcdac@gmail.com'); -- specifying the column names without dept_name, then the default value will be set in the table.

-- check constraint

Create table check_cons(
	emp_name varchar(20) primary key not null, u_email varchar(50) unique, email varchar(50) not null, dept_name varchar(20) default 'IT', age int check(age>20));


insert into check_cons value('Shyam', 'shyam@gmail.com', 'shyam@yahoo.in', default, 19);  -- will not run because age will require value greater than 20
insert into check_cons value('Shyam', 'shyam@gmail.com', 'shyam@yahoo.in', default, 21);  -- will successfully run

select * from check_cons;

desc check_cons;

create table employee_check(
	username varchar(10) not null,
    password_c varchar(20) check(char_length(password_c)>=8));
    
insert into employee_check value('prashant', '1234567');   -- not allowed because of check value accepts value greater than or equal to 8
insert into employee_check value('prashant', '12345678');  -- allowed because the check condition is true

select * from employee_check;

create table employee_check2(
	username varchar(10) not null,
    password_c varchar(20), check(char_length(password_c)>=8 and char_length(username)>=6)
);

create table employee_check3(
	username varchar(10) not null,
    password_c varchar(20), check(char_length(password_c)>=8 and char_length(username)>=6 and username regexp '^[A-Za-z]')
);


insert into employee_check3 value('prashant', '12345678'); -- will work
insert into employee_check3 value('1prashant', '12345678'); -- check is violated

create table employee_check4(
	username varchar(10) not null,
    password_c varchar(20), check(char_length(password_c)>=8 and char_length(username)>=6 and username regexp '^[A-Za-z]+$')
);
insert into employee_check4 value('prashant', '12345678'); -- will work
insert into employee_check4 value('prash1ant', '12345678'); -- will not work

select * from employee_check4;


-- -- --------------------------------------------------------------------------
create table department(
	dept_id int,
    dept_name varchar(20),
    location varchar(20),
    constraint pk_dept_id primary key(dept_id)
);

desc department;

create table employee(
	emp_id int,
    emp_name varchar(20),
    dept_id int,
    constraint fk_emp_dept foreign key(dept_id)
    references department(dept_id)
);

desc employee;

-- ------------------------------------------------------------------------------

select table_name, constraint_name from information_schema.Table_constraints where table_schema = database() and table_name = 'employee';

-- db.table

select table_name, 
constraint_name, constraint_type 
from information_schema.Table_constraints 
where table_schema = database() and 
table_name in ('employee', 'department', 'employee_check', 'employee_check2', 'employee_check3');















