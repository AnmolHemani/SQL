-- functions
-- numerical functions
-- date functions

use sakila;
-- single row category functions
select first_name,substr(first_name,2) from actor;

-- numeric
-- round, truncate, mod, pow
select round(12.48), round(12.48,1) from dual;
select round(846.41,-1) from dual; -- ones place
select round(842.41,-1) from dual; 
select round(846.41,-2) from dual; -- tens place
select round(876.41,-2) from dual;
select round(879.41,-3) from dual; -- hundredth place
select round(479.41,-3) from dual;

-- truncate will use mostly to extract decimal value
select truncate(279.48,1) from dual;
select truncate(279.48,-1) from dual;

select mod(21,2) from dual;
select 21%2 from dual;

select pow(21,2) from dual;

-- date functions
select curdate(), curtime(), now(), current_timestamp() from dual;
-- curdate() is current date
-- curtime() is current time
-- now() show both current time and date
-- current_timestamp() show both current time and date
-- now and current_stamp both are same

select curdate(),adddate(curdate(),1) from dual; 
-- we added one day in it
select curdate(),adddate(curdate(),interval 1 month) from dual;
-- we added one month
-- we can add month year week day anything we can add

-- datediff is to find the date diff between two dates
select
	datediff(curdate(),adddate(curdate(),interval -1 week)) 
    from dual;

select now(),last_day(now()) from dual;
select month(now()),last_day(now()) from dual;
select date_format(now(),'current month is %M') from dual;

-- YYYY-MM-DD
select curdate(),str_to_date('17 2025 02','%d %Y %m') from dual;

