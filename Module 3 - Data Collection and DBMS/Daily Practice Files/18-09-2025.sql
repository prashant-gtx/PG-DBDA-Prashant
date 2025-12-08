create database datatype_lab;

use datatype_lab;

-- create a table
create table char_1(s_name char(5), s_id int);

-- insert
insert into char_1 value ('Radha', 10);
insert into char_1 value ('Raadha', 10);  -- we will get an error
insert into char_1 value (1000, 10);  -- implicit conversion to string


-- select
select * from char_1;

-- create a table with char size of 256
create table char_2(s_name char(256), s_id int);  -- Error: length too big for column 's_name' (max = 255); use BLOB or TEXT instead

-- create varchar
create table varchar_1(s_name varchar(10), s_id int);

desc varchar_1;

create table blob_ex( tag varchar(10), img blob);

insert into blob_ex value( 'cdac image', 'C:\Users\Prashant\Desktop\2.jpg');
desc blob_ex;

insert into blob_ex value('img2', load_file('C:\Users\Prashant\Desktop\2.jpg'));
select * from blob_ex;

-- text example

create table text_ex(tag varchar(50), about text);

insert into text_ex value('about cdac','C-DAC was created in November 1987,[3] initially as the Centre for Development of Advanced Computing Technology (C-DACT).[4][3] In 1988, the US Government refused to sell India a Cray supercomputer due to concerns about India using it to develop nuclear weapons.[5] In response India started development of its own supercomputer, and C-DACT was created as part of this programme.[6][7]
Dr Vijay Bhatkar was hired as the director of C-DACT.[7] The project was given an initial run of three years and an initial funding of ₹30,00,00,000, the cost of a Cray supercomputer.[7]
A prototype computer was benchmarked at the 1990 Zurich Super-computing Show. It demonstrated that India had the second most powerful, publicly demonstrated, supercomputer in the world after the United States.[7][8]
The final result of the effort was the PARAM 8000, released in 1991.[9]
The National Centre for Software Technology (NCST), Electronic Research and Development Centre (ER&DC) and CEDTI were merged into C-DAC in 2003.[10][11]');

select * from text_ex;

select length(about) as no_of_byte from text_ex;

select length(s_name) from char_1;

-- set 

create table set_ex(order_id int, c_name varchar(20), food_type set('veg','spicy','medium spicy','no onion','no garlic'));


insert into set_ex value(11,'Prashant','veg');
insert into set_ex value(11,'Prashant','veg','spicy'); -- error
insert into set_ex value(11,'Prashant','veg,spicy');
insert into set_ex value(11,'Prashant','veg,nonveg'); -- error: should be chosen from the set only

select * from set_ex;

create table job_in(app_name varchar(50), resume_upload blob, contact_me set('Phone Number', 'Email', 'Text Message', 'Letters'));

insert into job_in value('Prashant', 'C:\Users\Prashant\Desktop\2.jpg','Phone Number,Email,Text Message');

select * from job_in;

-- enum example
create table form_app(app_name varchar(50), course_type varchar(50), gender enum('Male','Female','Others'));

insert into form_app value ('Prashant', 'DBDA', 'Male');

desc form_app;

select * from form_app;

-- question

CREATE TABLE Students_Details(
	Student_ID INT,
    Student_Name VARCHAR(50),
    Gender ENUM('Male','Female','Others'),
    Passport_Photo blob,
    Food_Choice SET('Veg','Non-Veg','Jain','Chinese'),
    About text
);

INSERT INTO Students_Details VALUE (5, 'Prashant Gupta', 'Male', 'C:\Users\Prashant\Desktop\2.jpg','Non-Veg','I am a 2025 Graduate, I am studying in CDAC-MUMBAI. I live in Seawoods, Navi Mumbai. I like to sing, cook and travel');

select * from Students_Details;


create table numeric_example (
student_id int(12),
student_name varchar(50),
age int);

insert into  numeric_example value(123,'sai',25);
Select length(age) as age_len, length(student_id) as len_st_id from numeric_example;

create table numeric_example1 (
student_id int(12),
student_name varchar(50),
age int,
marks float(3,2));

insert into  numeric_example1 value(123, 'sai', 25, 1.23);

select * from numeric_example1;

Select length(age) as age_len, length(marks) as len_marks from numeric_example1;

create table studenttt (
student_id int(12),
student_name varchar(50),
age int,
marks float(7,2));

insert into  studenttt value(123, 'Prashant', 21, 10.50);
insert into  studenttt value(121, 'Pravin', 23, 15.50);
insert into  studenttt value(125, 'Deependra', 22, 12.50);
insert into  studenttt value(127, 'Rahul', 23, 6.50);


Select length(age) as age_len, length(marks) as len_marks from studenttt;

create table studentttt (
student_id int(12),
student_name varchar(50),
age int,
marks float(7,2),
marks2 decimal);

insert into  studentttt value(123, 'Prashant', 21, 10.50, 10.50);
insert into  studentttt value(121, 'Pravin', 23, 15.50, 10.50);

select * from studentttt;

Select length(age) as age_len, length(marks) as len_marks, length(marks2) as len_marks2 from studentttt;

use datatype_lab;



