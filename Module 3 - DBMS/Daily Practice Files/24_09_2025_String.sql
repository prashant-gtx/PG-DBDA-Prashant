use operators;
select * from employees;
CREATE TABLE COUNTRIES AS SELECT * FROM HR.COUNTRIES;
select employee_id, concat(first_name,' ',last_name) as full_name from employees;

select employee_id, concat(first_name,' ',department_id) as name_department from employees;

select employee_id, concat("Name: ",first_name," Department ID: ",department_id) as name_department from employees;

select concat(first_name,' ', last_name) as Full_Name, concat(" Email: ",email," ", " Phone Number: ",phone_number) as contact_details from employees;

select first_name,length(first_name) as length_of_first_name from employees;

select * from employees where length(first_name)-length(last_name)=0;

select * from employees where length(first_name)<=3;

-- where doesnt works with the alias

select first_name, length(first_name) as len_first_name from employees where length(first_name)<=3;

select upper(first_name), lower(last_name) from employees;

select first_name, substring(first_name,1,5) as sub_string from employees;

-- to find first 2 chars from first name
 select first_name, substring(first_name,1,2) as sub_string from employees;
 
  select *, substring(phone_number,length(phone_number)-1,length(phone_number)-2) as sub_string from employees;
  SELECT *, RIGHT(PHONE_NUMBER,2) FROM EMPLOYEES;
select * from employees where substring(FIRST_NAME,1,1)= UPPER(substring(FIRST_NAME,1,1));

SELECT * FROM EMPLOYEES WHERE FIRST_NAME REGEXP '^[A-Z]';
select COUNTRY_ID,CONCAT(UPPER(SUBSTRING(COUNTRY_ID,1,1)),LOWER(SUBSTRING(COUNTRY_ID,2,1)),'-', LOWER(COUNTRY_NAME)) AS NEW_NAME from COUNTRIES;

-- FINDING NAMES STARTING WITH VOWEL USING SUBSTRING
SELECT FIRST_NAME, SUBSTRING(FIRST_NAME,1,1) FROM EMPLOYEES WHERE SUBSTRING(FIRST_NAME,1,1) IN ('A','E','I','O','U');

-- LEFT AND RIGHT
SELECT FIRST_NAME,LEFT(FIRST_NAME,2), RIGHT(FIRST_NAME,2) FROM EMPLOYEES;

-- LTRIM AND RTRIM  USED TO REMOVE WHITESPACES
SELECT FIRST_NAME,LTRIM(FIRST_NAME), RTRIM(FIRST_NAME) FROM EMPLOYEES;

-- LPAD AND RPAD  USED TO GIVE PADDING
SELECT FIRST_NAME,RPAD(FIRST_NAME,6,'$') FROM EMPLOYEES;

SELECT FIRST_NAME, REVERSE(FIRST_NAME) FROM EMPLOYEES;  -- reverse

select first_name, phone_number, replace(phone_number,'.','-') as Updated_Number from employees;

select first_name, job_id, replace(job_id,'AD_VP','President') from employees;


-- -------------------------------------------------------------------------------------
-- query to find country id country name and replace usa with united states where the country name belongs to uk and usa
SELECT * FROM COUNTRIES;
select country_id, country_name, replace(country_name,'United States of America','USA') from countries where country_name in ('United Kingdom', 'United States of America');

SELECT NOW(),CURDATE(),CURTIME(),SYSDATE(),SYSTEM_USER();


SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE, YEAR(HIRE_DATE), MONTH(HIRE_DATE), DAY(HIRE_DATE), MONTHNAME(HIRE_DATE), dayname(HIRE_DATE) FROM EMPLOYEES;

-- ---------------------------------------------------------------------------------------------------------------------------------------------


