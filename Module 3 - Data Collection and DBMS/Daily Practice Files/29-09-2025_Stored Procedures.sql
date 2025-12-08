delimiter $$
create function get_emp_details(emp_id int)
returns varchar(100)
deterministic
begin
	declare f_name varchar(100);
    select concat(First_name,' ',Last_name) into f_name
    from employees where employee_id=emp_id;
    
    return f_name;
end;;
$$
delimiter ;
select get_emp_details(100);


delimiter $$
create function get_dep_details(f_name varchar(30))
returns int
deterministic
begin
	declare d_id int;
    select department_id into d_id
    from employees where first_name=f_name;
    return d_id;
end;;
$$
delimiter ;
select get_dep_details('Lex');

-- find the employees year of experience by their employee id

delimiter $$
create function get_expr_details(emp_id int)
returns int
deterministic
begin
	declare yrs int;
    select timestampdiff(year,hire_date,curdate()) into yrs
    from employees where employee_id=emp_id;
    return yrs;
end;;
$$
delimiter ;

select get_expr_details(101);


drop function get_expr_details;

delimiter $$
create function get_emp_count(jobb_id varchar (30))
returns int
deterministic
begin
	declare cnt int;
    select count(*) into cnt
    from employees where job_id=jobb_id;
    return cnt;
end;;
$$
delimiter ;

select get_emp_count('IT_PROG');


delimiter $$
create function get_emp_by_job_details(jb_id varchar (100), sal int)
returns int
deterministic
begin
	declare count_emp int;
    select count(*) into count_emp
    from employees where job_id=jb_id and salary>sal;
    return count_emp;
end;;
$$
delimiter ;

select get_emp_by_job_details('IT_PROG',5000);



delimiter $$
create function get_emp_by_job_detailss(jb_id varchar (100))
returns varchar(5000)
deterministic
begin
	declare emp_lst varchar(5000);
    select group_concat(concat(first_name,' ',last_name)separator',') into emp_lst
    from employees e
    join departments d
    on e.department_id=d.department_id;
    return emp_lst;
end;;
$$
delimiter ;

select get_emp_by_job_detailss('IT');
