use hr;

create table if not exists employee_archive (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    job_id varchar(20),
    department_id int,
    salary decimal(10,2),
    hire_date date,
    termination_date date
);


create table if not exists hr_notifications (
    id int primary key auto_increment,
    action varchar(20),
    employee_id int,
    message varchar(255),
    created_at datetime
);

-- Q.1: Update employee records when a department is changed
delimiter //
create trigger after_department_update
after update on departments
for each row
begin
    update employees
    set department_id = new.department_id
    where department_id = old.department_id;
end;
//
delimiter ;

-- Q.2: Prevent deletion of an employee if assigned to a department
delimiter //
create trigger before_employee_delete
before delete on employees
for each row
begin
    if old.department_id is not null then
        signal sqlstate '45000'
        set message_text = 'Cannot delete employee assigned to a department';
    end if;
end;
//
delimiter ;

-- Q.3: Log notification when employee is hired or terminated
delimiter //
create trigger after_employee_insert
after insert on employees
for each row
begin
    insert into hr_notifications (action, employee_id, message, created_at)
    values ('HIRE', new.employee_id, concat('New hire: ', new.first_name, ' ', new.last_name), now());
end;
//
delimiter ;

delimiter //
create trigger after_employee_delete
after delete on employees
for each row
begin
    insert into hr_notifications (action, employee_id, message, created_at)
    values ('TERMINATION', old.employee_id, concat('Employee terminated: ', old.first_name, ' ', old.last_name), now());
end;
//
delimiter ;

-- Q.4: Auto-assign department based on job title
delimiter //
create trigger before_employee_insert
before insert on employees
for each row
begin
    if new.job_id = 'IT_PROG' then
        set new.department_id = 60; -- IT dept
    elseif new.job_id = 'SA_REP' then
        set new.department_id = 80; -- Sales dept
    end if;
end;
//
delimiter ;

-- Q.5: Update department salary budget
delimiter //
create trigger after_employee_insert_budget
after insert on employees
for each row
begin
    update departments
    set salary_budget = salary_budget + new.salary
    where department_id = new.department_id;
end;
//
delimiter ;

delimiter //
create trigger after_employee_update_budget
after update on employees
for each row
begin
    if new.salary <> old.salary then
        update departments
        set salary_budget = salary_budget - old.salary + new.salary
        where department_id = new.department_id;
    end if;
end;
//
delimiter ;

-- Q.6: Enforce max employees in a department (50 limit)
delimiter //
create trigger before_employee_insert_limit
before insert on employees
for each row
begin
    declare emp_count int;
    select count(*) into emp_count
    from employees
    where department_id = new.department_id;
    
    if emp_count >= 50 then
        signal sqlstate '45000'
        set message_text = 'Department cannot exceed 50 employees';
    end if;
end;
//
delimiter ;

-- Q.7: Update department manager when supervised employee promoted/leaves
delimiter //
create trigger after_employee_update_manager
after update on employees
for each row
begin
    if old.manager_id is not null and new.job_id <> old.job_id then
        update departments
        set manager_id = new.employee_id
        where manager_id = old.manager_id;
    end if;
end;
//
delimiter ;

delimiter //
create trigger after_employee_delete_manager
after delete on employees
for each row
begin
    update departments
    set manager_id = null
    where manager_id = old.employee_id;
end;
//
delimiter ;

-- Q.8: Archive terminated employees
delimiter //
create trigger after_employee_delete_archive
after delete on employees
for each row
begin
    insert into employee_archive
    (employee_id, first_name, last_name, job_id, department_id, salary, hire_date, termination_date)
    values
    (old.employee_id, old.first_name, old.last_name, old.job_id, old.department_id, old.salary, old.hire_date, now());
end;
//
delimiter ;
