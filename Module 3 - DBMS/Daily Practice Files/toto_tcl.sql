use bank_demo;
select * from accounts;

update accounts set balance=balance+500 where account_id=2;
select * from accounts where account_id in (1,2);
