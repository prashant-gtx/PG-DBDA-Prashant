-- Name: Prashant
-- Constraint Assignment 

-- Q1
CREATE TABLE students (
    id INT,
    name VARCHAR(100) NOT NULL,
    age INT DEFAULT 18
);

-- Q2
INSERT INTO students VALUES (1, NULL, 20); -- FAIL: name cannot be NULL because of NOT NULL constraint

-- Q3
INSERT INTO students (id, name) VALUES (2, 'Ravi'); -- age will be default 18

-- Q4
INSERT INTO students (id) VALUES (3); -- FAIL: name column is NOT NULL and not provided

-- Q5
ALTER TABLE students ALTER age SET DEFAULT 21;

-- Q6
ALTER TABLE students MODIFY name VARCHAR(100); -- removes NOT NULL

-- Q7
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Q8
INSERT INTO department VALUES (1, 'IT');
INSERT INTO department VALUES (1, 'HR'); -- FAIL: duplicate value for PRIMARY KEY dept_id

-- Q9
CREATE TABLE demo (a INT PRIMARY KEY, b INT PRIMARY KEY); -- FAIL: a table can only have one PRIMARY KEY

-- Q10
CREATE TABLE enrollment (
    student_id INT,
    course_id VARCHAR(50),
    PRIMARY KEY (student_id, course_id)
);

-- Q11
INSERT INTO enrollment VALUES (101, 'DBMS');
INSERT INTO enrollment VALUES (101, 'DBMS'); -- FAIL: duplicate entry for composite primary key

-- Q12
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE
);

-- Q13
INSERT INTO users (email) VALUES ('abc@mail.com');
INSERT INTO users (email) VALUES ('abc@mail.com'); -- FAIL: duplicate entry for UNIQUE email

-- Q14
INSERT INTO users (email) VALUES (NULL);
INSERT INTO users (email) VALUES (NULL); -- Works: UNIQUE allows multiple NULLs in MySQL

-- Q15
CREATE TABLE products (
    sku VARCHAR(50),
    region VARCHAR(50),
    UNIQUE (sku, region)
);

-- Q16
INSERT INTO products VALUES ('A1', 'US');
INSERT INTO products VALUES ('A1', 'US'); -- FAIL: violates UNIQUE (sku, region)

-- Q17
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Q18
INSERT INTO employee VALUES (1, 'Asha', 99); -- FAIL: dept_id=99 not found in department table

-- Q19
DELETE FROM department WHERE dept_id=1; -- FAIL: cannot delete parent row when child rows exist

-- Q20
DROP TABLE employee;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE
);

-- Q21
DROP TABLE employee;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL
);

-- Q22
ALTER TABLE employee DROP FOREIGN KEY fk_emp_dept;

-- Q23
ALTER TABLE employee
ADD CONSTRAINT fk_manager FOREIGN KEY (dept_id) REFERENCES employee(emp_id); -- self-referencing FK

-- Q24
CREATE TABLE accounts (
    id INT PRIMARY KEY,
    balance INT CHECK (balance >= 0)
);

-- Q25
INSERT INTO accounts VALUES (1, -100); -- FAIL: violates CHECK (balance >= 0)

-- Q26
ALTER TABLE accounts DROP CHECK balance;
ALTER TABLE accounts ADD CONSTRAINT chk_balance CHECK (balance BETWEEN 100 AND 1000000);

-- Q27
INSERT INTO accounts VALUES (2, 50); -- FAIL: violates CHECK (balance >= 100)

-- Q28
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    amount INT
);
INSERT INTO invoices (amount) VALUES (100), (200), (300); -- IDs = 1,2,3

-- Q29
DELETE FROM invoices WHERE invoice_id=3;
INSERT INTO invoices (amount) VALUES (400); -- next ID = 4, MySQL does not reuse deleted IDs

-- Q30
ALTER TABLE users ADD CONSTRAINT uq_phone UNIQUE (user_id);
ALTER TABLE users DROP INDEX uq_phone;

-- Q31
CREATE TABLE library (
    book_id INT,
    branch_id INT,
    isbn VARCHAR(50),
    PRIMARY KEY (book_id, branch_id),
    UNIQUE (isbn, branch_id)
);

-- Q32
INSERT INTO library VALUES (1, 101, 'A123');
INSERT INTO library VALUES (1, 101, 'A123'); -- FAIL: violates UNIQUE (isbn, branch_id)

-- Q33
INSERT INTO library VALUES (1, 102, 'A123'); -- Works: same isbn allowed in different branch

-- Q34
CREATE TABLE demo_constraints (
    id INT PRIMARY KEY,
    col1 VARCHAR(50) UNIQUE,
    col2 VARCHAR(50) UNIQUE
);

-- Q35
CREATE TABLE invalid_demo (id INT PRIMARY KEY, UNIQUE(id)); -- FAIL: UNIQUE on PRIMARY KEY column

-- Q36
CREATE TABLE exam_results (
    student_id INT,
    exam_id INT,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    PRIMARY KEY (student_id, exam_id)
);

-- Q37
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE
);

-- Q38
CREATE TABLE demo_fk (
    id INT,
    pid INT,
    FOREIGN KEY (pid) REFERENCES customers(customer_id) ON DELETE SET DEFAULT
); -- FAIL: MySQL does not support ON DELETE SET DEFAULT

-- Q39
CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
);
INSERT INTO categories VALUES (1, 'Electronics', NULL);
INSERT INTO categories VALUES (2, 'Mobiles', 1);

-- Q40
DELETE FROM categories WHERE id=1; -- FAIL: cannot delete parent row because child rows exist

-- Q41
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO employee VALUES (99, 'Ghost', 999); -- Works because FK check disabled
SET FOREIGN_KEY_CHECKS=1;

-- Q42
SET FOREIGN_KEY_CHECKS=1;

-- Q43
ALTER TABLE orders ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- Explanation: MySQL automatically creates an index on customer_id for this FK

-- Q44
CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    salary INT CHECK (salary > 20000)
);

-- Q45
INSERT INTO employees2 VALUES (1, 15000); -- FAIL: salary not greater than 20000

-- Q46
ALTER TABLE employees2 ADD gender CHAR(1);
ALTER TABLE employees2 ADD CONSTRAINT chk_gender CHECK (gender IN ('M','F'));

-- Q47
INSERT INTO employees2 VALUES (2, 30000, 'X'); -- FAIL: violates CHECK gender IN ('M','F')

-- Q48
ALTER TABLE employee
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES department(dept_id);

-- Q49
ALTER TABLE library DROP PRIMARY KEY;

-- Q50
ALTER TABLE employee RENAME INDEX fk_emp_dept TO fk_employee_department;
