delimiter $$
create procedure get_all_emp_name_details()
deterministic
begin
	select * from employees;
end;;
$$
delimiter ;

call get_all_emp_name_details();

show function status;


delimiter $$
create procedure get_emp_by_id(in emp_id int)
deterministic
begin
	select * from employees where employee_id=emp_id;
end;;
$$
delimiter ;

call get_emp_by_id(101);