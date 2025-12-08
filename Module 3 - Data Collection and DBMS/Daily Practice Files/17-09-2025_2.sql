show databases;

create database keys_learn;

use keys_learn;
use cdac;
Show tables;

Create table demo_pk(
	s_id int primary key,
    s_name varchar(30),
    age int,
    m_no int
    );
    
drop demo_pk;


create table demo_cpk(
	plot_no int,
    house_no int,
    area varchar(100),
    pin_code int(6),
    primary key(plot_no, pin_code)
);


create table demo_pk_01(
	emp_id int auto_increment primary key,
    emp_name varchar(40),
    dept_id int
    );
    
    
desc demo_cpk;

insert into demo_pk value(1,'ABC',22,19012);
insert into demo_pk value('ABC',22,19012); -- error due to col count
insert into demo_pk value('bc','ABC',22,19012); -- error due to data type difference
insert into demo_pk(s_id, s_name, age, m_no) value(2,'ABC',22,19012);
SELECT * FROM demo_pk;






INSERT INTO customer VALUES(1,'Anil');
	
INSERT INTO customer VALUES(2,'Akash');


INSERT INTO orders VALUES(111,'Business',1,100);
INSERT INTO orders VALUES(112,'Home',2,1000);
INSERT INTO orders VALUES(113,'Business',1,1500);


select * from customer;
select * from orders;

delete from customer where Customer_ID = 1;

Create Table orders(
OrderID INT PRIMARY KEY,
Order_Type VARCHAR(20),
Customer_ID INT,
Amt INT,
Foreign Key(Customer_ID) references customer(Customer_ID)
on delete cascade
);

DESC customer;
DESC orders;

CREATE TABLE customer2(
   Customer_ID int primary key,
   CustomerName varchar(45);
  -- on delete cascade);
   
Create Table orders2(
OrderID INT PRIMARY KEY,
Order_Type VARCHAR(20),
Customer_ID INT,
Amt INT,
Foreign Key(Customer_ID) REFERENCES customer2(Customer_ID)
);

INSERT INTO orders2 VALUES(111,'Business',1,100);
INSERT INTO orders2 VALUES(112,'Home',2,1000);
INSERT INTO orders2 VALUES(113,'Business',1,1500);

INSERT INTO customer2 VALUES(1,'Anil');
	
INSERT INTO customer2 VALUES(2,'Akash');

create table department(
d_id int primary key,
dept_mname varchar(30));

create table employee(
emp_id int primary key,
emp_name varchar(30),
d_id int,
foreign key(d_id) references department(d_id)
on delete set null);

create table department1(
d_id int primary key,
dept_mname varchar(30));

create table employee1(
emp_id int primary key,
emp_name varchar(30),
d_id int,
foreign key(d_id) references department1(d_id)
on update cascade);


insert into employee1 values(101,'Prashant',1);

insert into department1 values(1,'HR');

UPDATE department1 set dept_mname = 'IT' where d_id = 1;

select * from department1;
select * from employee1;
select * from employee1;



