-- TRIGGERS
create database triggers;
use triggers;

CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    department_id INT
);


CREATE TABLE employee (
  employee_id INT,
  name VARCHAR(50),
  salary FLOAT,
  department_id INT
);


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);


create table employee_log(
	log_id int auto_increment primary key,
    log_message varchar(255),
    log_timestamp timestamp default current_timestamp
    );
    
    
DELIMITER $$
select dayname(hire_date) from employees;

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Insert the message into the logging table
    INSERT INTO employee_log (log_message)
    VALUES (CONCAT('A new employee has been inserted with ID: ', NEW.employee_id));
END;
$$


DELIMITER ;
INSERT INTO employee (employee_id, name, salary)
VALUES (10, 'John Doe', 50000.00);


select * from employee;
select * from employee_log;

create table employee_emails(
	emp_id int,
    email varchar(100),
    create_data timestamp default current_timestamp
);

DELIMITER $$

CREATE TRIGGER trg_generate_email
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Generate email: firstname.employeeid@company.com
    INSERT INTO employee_emails (emp_id, email)
    VALUES (
        NEW.employee_id,
        CONCAT(LOWER(REPLACE(NEW.name, ' ', '.')), 
               '@company.com')
    );
END$$

DELIMITER ;

INSERT INTO employee (employee_id, name, salary, department_id)
VALUES (78, 'Yogesh', 80000.0, 101);

SELECT * FROM employee_emails;
select * from employee;

create table department_stats(
	department_id int primary key,
    total_employees int default 0,
    total_salary_budget decimal(15,2) default 0,
    last_updated timestamp default current_timestamp
    );
    
    
DELIMITER $$

CREATE TRIGGER trg_update_dept_stats
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Update or insert department statistics
    INSERT INTO department_stats (
        department_id, 
        total_employees, 
        total_salary_budget,
        last_updated
    )
    VALUES (
        NEW.department_id, 
        1, 
        NEW.salary,
        NOW()
    )
    ON DUPLICATE KEY UPDATE
        total_employees = total_employees + 1,
        total_salary_budget = total_salary_budget + NEW.salary,
        last_updated = NOW();
END$$

DELIMITER ;

INSERT INTO employee (employee_id, name, salary, department_id)
VALUES (10, 'Alice Johnson', 55000.0, 101);


SELECT * FROM department_stats WHERE department_id = 101;
-- Result: total_employees=1, total_salary_budget=55000.00


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES (11, 'Bob Williams', 60000.0, 101);

-- Check updated stats
SELECT * FROM department_stats WHERE department_id = 101;



INSERT INTO employee (employee_id, name, salary, department_id)
VALUES (12, 'Carol Davis', 75000.0, 102);


SELECT * FROM department_stats ORDER BY department_id;

-- delete 
create table deleted_employee(
	archive_id int auto_increment primary key,
    employee_id int,
    name varchar(100),
    salary float,
    department_id int,
    deleted_date timestamp default current_timestamp,
    deleted_by varchar(50)
    );

DELIMITER $$

CREATE TRIGGER trg_before_employee_delete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    -- Archive the employee data before deletion
    INSERT INTO deleted_employee (
        employee_id,
        name,
        salary,
        department_id,
        deleted_by
    )
    VALUES (
        OLD.employee_id,
        OLD.name,
        OLD.salary,
        OLD.department_id,
        USER()  -- Current MySQL user
    );
END$$

DELIMITER ;

-- Step 1: Check current employees
SELECT * FROM employee;

-- Step 2: Delete an employee
DELETE FROM employee WHERE employee_id = 3;

-- Step 3: Verify employee is deleted
SELECT * FROM employee WHERE employee_id = 3;


-- Step 4: Check the archive
SELECT * FROM deleted_employee;

drop TRIGGER trg_before_employee_delete;

-- hr
use hr;
DELIMITER $$

CREATE TRIGGER before_employe_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    -- cancel the delete operation if the employee has been with the company for more than 10 years
    IF DATEDIFF(NOW(), OLD.hire_date) > 3650 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employee - has been with company for more than 10 years';
    END IF;

END$$

DELIMITER ;

-- Step 1: Check current employees
SELECT * FROM employees;

-- Step 2: Delete an employee
DELETE FROM employees WHERE hire_date = '1987-06-17';

select now();













    