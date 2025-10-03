use triggers;
show tables;

-- Before Insert:
delimiter $$
create trigger before_insert_into_employee
before insert on employee
for each row
begin
	-- new === this take new value 
    -- old == this take old vvalues in the table
    if new.salary is null then
		set new.salary=15000.0;
	end if;
    
end;;
$$
delimiter ;

drop trigger before_insert_into_employee;
select * from  employee;

Before Insert:
delimiter $$
create trigger before_insert_into_employee
before insert on employee
for each row
begin
	-- new === this take new value 
    -- old == this take old vvalues in the table
    if new.salary is null then
		set new.salary=15000.0;
	end if;
    
end;;
$$
delimiter ;

drop trigger before_insert_into_employee;
select * from  employee;
 
INSERT INTO employee (employee_id, name,  department_id)
VALUES(6, 'Karen Smith', 101);



delimiter $$
create trigger before_insert_into_employee_eg2
before insert on employee
for each row
begin
	
    if new.department_id is null then
		set new.department_id=100;
	end if;
    
end;;
$$
delimiter ;

show triggers;








