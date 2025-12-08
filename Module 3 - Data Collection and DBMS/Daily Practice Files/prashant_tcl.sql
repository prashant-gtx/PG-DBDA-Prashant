create user 'toto@localhost' identified by '123';
create user 'floro@localhost' identified by '123';

-- grant
grant all privileges on hr.* to 'toto@localhost';

show grants for 'toto@localhost';

grant select on hr.* to 'floro@localhost';  -- giving only select rights
grant select on northwind.* to 'floro@localhost';  -- giving only select rights
grant select, delete on northwind.* to 'floro@localhost';  -- giving only select and delete rights


-- revoke
revoke delete on northwind.* from 'floro@localhost';

flush privileges;

-- Create database
CREATE DATABASE IF NOT EXISTS bank_demo;
USE bank_demo;

-- Drop tables if they exist (for clean start)
DROP TABLE IF EXISTS transaction_log;
DROP TABLE IF EXISTS accounts;

-- Create accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transaction log table
CREATE TABLE transaction_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Alice Johnson', 5000.00),
(2, 'Bob Smith', 3000.00),
(3, 'Charlie Brown', 7000.00),
(4, 'Diana Prince', 2000.00),
(5, 'Eve Wilson', 4500.00);

-- View initial data
SELECT * FROM accounts;


-- --------------------------------------------------------------------
use bank_demo;
show tables;

grant all privileges on bank_demo.* to 'toto@localhost';
grant all privileges on bank_demo.* to 'floro@localhost';

select * from transaction_log;
select * from accounts;

start transaction;

update accounts set balance = balance-500 where account_id=1;
commit;

start transaction;

update accounts set balance=balance-500 where account_id=1;
update accounts set balance=balance+500 where account_id=2;


start transaction;

update accounts set balance=balance+500 where account_id=2;
select * from accounts where account_id in (1,2);


-- rollback and savepoints
start transaction;

update accounts set balance= balance + 500 where account_id = 1;

savepoint p1;

update accounts set balance= balance - 2500 where account_id = 3;
select * from accounts;

rollback;

----
start transaction;
update accounts set balance= balance + 500 where account_id = 5;

savepoint p2;

update accounts set balance= balance + 500 where account_id = 5;

rollback to p2;





