create database Assignment;

use Assignment;

-- Q1.
Create Table Department(
	dept_id int primary key,
    dept_name varchar(20)
);

-- Q2.
Create Table Employee(
	emp_id int primary key,
    emp_name varchar(30),
    salary float,
    dept_id int,
    Foreign Key(dept_id) references Department(dept_id)
);

-- Q3.
insert into Department Values
	(101,'HR'),
    (102,'IT'),
    (103,'JANITOR')
;

INSERT INTO Employee VALUES
	(1101,'PRASHANT',25000,101),
    (1102,'PRAVIN',2500,103),
    (1103,'ANIRUDDHA',20000,102),
    (1104,'YASH',22000,101),
    (1105,'DEEPENDRA',2000,103)
    ;
    
-- Q4. 
Select e.emp_name, d.dept_name from Employee e Join Department d on e.dept_id = d.dept_id;

-- Q5. 
Select e.emp_name, d.dept_name from Employee e Join Department d on e.dept_id = d.dept_id where d.dept_name = 'IT';

-- Q6.
SELECT d.dept_name, count(*) from Employee e JOIN Department d on e.dept_id = d.dept_id Group by d.dept_name;

-- Q7. 
INSERT INTO Department VALUE (104, 'FINANCE');

INSERT INTO Employee VALUE (1106, 'MEENA', 30000, 104);

-- Q.8 Cannot add or update a child row. Foreign key constraint
INSERT INTO Employee VALUE (1107, 'SEETA', 30000, 105);

-- Q.9 Cannot delete or update a parent row. Foreign key constraint
DELETE FROM Department where dept_id = 104;

-- Q10. Modify the Employee table so that if a department is deleted, all its employees are also deleted (ON DELETE CASCADE)

show tables;
desc employee;
desc department;

ALTER TABLE Employee
DROP FOREIGN KEY Employee_ibfk_1;

ALTER TABLE Employee
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
ON DELETE CASCADE;

-- Q11. 
DELETE FROM Department WHERE dept_id = 104;
SELECT * FROM Employee WHERE dept_id = 104;

-- Q12. 
ALTER TABLE Employee
DROP FOREIGN KEY fk_dept;

ALTER TABLE Employee
ADD CONSTRAINT fk_dept_update
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Q13. 
UPDATE Department SET dept_id = 999 WHERE dept_id = 102;
SELECT * FROM Employee WHERE dept_id = 999;


-- Q14. 
ALTER TABLE Employee
DROP FOREIGN KEY fk_dept_update;

ALTER TABLE Employee
ADD CONSTRAINT fk_dept_null
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Q15. 
DELETE FROM Department WHERE dept_id = 101;
SELECT * FROM Employee WHERE dept_id IS NULL;













    