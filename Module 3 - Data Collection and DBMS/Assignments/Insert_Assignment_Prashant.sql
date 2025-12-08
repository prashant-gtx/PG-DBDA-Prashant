create database insert_assignment;
use insert_assignment;
SELECT * FROM countries;
drop table countries;   -- only if needed
DROP TABLE COUNTRY_NEW;  -- ONLY IF NEEDED
-- 1. Write a SQL statement to insert a record with your own value into the table countries against each column.
CREATE TABLE countries (
  country_id VARCHAR(2),
  country_name VARCHAR(40),
  region_id DECIMAL(10,0)
);

INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('IN', 'India', 1);

-- 2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME) VALUES ('US', 'USA');

-- 3. Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
CREATE TABLE country_new LIKE countries;
INSERT INTO country_new SELECT * FROM countries;

-- 4. Write a SQL statement to insert NULL values against the region_id column for a row of countries table.
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('FR', 'France', NULL);

-- 5. Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES 
('DE', 'Germany', 2),
('JP', 'Japan', 3),
('BR', 'Brazil', 4);

-- 6. Write a SQL statement insert rows from country_new table to countries table.
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM country_new;

-- 7.Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
CREATE TABLE jobs (
  job_id VARCHAR(10) NOT NULL PRIMARY KEY,
  job_title VARCHAR(50) NOT NULL
);

INSERT INTO jobs(job_id, job_title) VALUES('J001', 'Manager');

-- 8. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
INSERT INTO jobs (job_id, job_title) VALUES ('J002', 'Supervisor');

-- 9. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table. 
ALTER TABLE countries ADD CONSTRAINT unique_country_region UNIQUE (COUNTRY_ID, REGION_ID);
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('IN', 'India', 1);  -- WILL GIVE ERROR BECAUSE OF UNIQUE KEY CONSTRAINT

-- 10. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
ALTER TABLE countries MODIFY COUNTRY_ID INT AUTO_INCREMENT PRIMARY KEY; -- WON'T WORK INITIALLY BECAUSE COUNTRY_ID IS VARCHAR
-- LET'S DROP THE COLUMN AND ADD COUNTRY_ID AS INT SO THAT AUTO INCREMENT WORKS FINE
TRUNCATE TABLE COUNTRIES;
ALTER TABLE countries MODIFY COUNTRY_ID INT AUTO_INCREMENT PRIMARY KEY;
INSERT INTO countries (COUNTRY_NAME, REGION_ID) VALUES ('India', 1);


-- 11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

ALTER TABLE countries ADD CONSTRAINT PRIMARY KEY(COUNTRY_ID);
DESC COUNTRIES;
ALTER TABLE countries ALTER COLUMN COUNTRY_NAME SET DEFAULT 'N/A';

INSERT INTO countries (REGION_ID) VALUES (1);
SELECT * FROM COUNTRIES;

-- 12. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.

CREATE TABLE job_history (
  employee_id INT NOT NULL,
  job_id VARCHAR(10) NOT NULL,
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
INSERT INTO job_history (employee_id, job_id, start_date, end_date) VALUES (101, 'J001', '2024-01-01', '2024-12-31');

-- 13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have existed into the table departments.

CREATE TABLE jobs (
  job_id VARCHAR(10) NOT NULL PRIMARY KEY,
  job_title VARCHAR(50) NOT NULL
);

CREATE TABLE departments (
  department_id INT NOT NULL PRIMARY KEY,
  manager_id INT NOT NULL,
  UNIQUE(department_id, manager_id)
);

CREATE TABLE employees (
  employee_id INT NOT NULL PRIMARY KEY,
  department_id INT,
  manager_id INT,
  job_id VARCHAR(10),
  FOREIGN KEY (department_id, manager_id) REFERENCES departments(department_id, manager_id),
  FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
INSERT INTO employees(employee_id, department_id, manager_id, job_id) VALUES(201, 10, 1001, 'J001');

-- 14. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.
INSERT INTO employees(employee_id, department_id, manager_id, job_id) VALUES(202, 20, 1002, 'J002');









