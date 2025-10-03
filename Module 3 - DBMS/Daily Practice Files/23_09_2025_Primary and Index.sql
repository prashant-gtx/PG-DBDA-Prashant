create table emp_primary(
	s_id int,
    s_name varchar(30),
    email varchar(50) primary key
);

create database practice; use practice;

desc emp_primary;

alter table emp_primary modify column s_id int unique not null;

desc emp_primary;

alter table emp_primary add index(s_id);
show indexes from emp_primary;

alter table emp_primary drop primary key;

