delimiter $$
create procedure get_all_emp_name_details()
-- deterministic
begin
	select * from employees;
end;;
$$
delimiter ;

call get_all_emp_name_details();

show function status;

use hr;

delimiter $$
create procedure get_emp_by_id(in emp_id int)
deterministic
begin
	select * from employees where employee_id=emp_id;
end;;
$$
delimiter ;

call get_emp_by_id(101);


delimiter $$
create procedure in_out_emp(in a int)
deterministic
begin 
	select employee_id, concat(first_name,' ',last_name)as full_name,job_id from employees where department_id=a;
end;;
$$
delimiter ;

drop procedure in_out_emp;
use practice;
call in_out_emp(60);
