use sakila;

-- Data Types
-- numeric,  string data,  date time

-- numeric 
	-- int 
	-- integer -> 4 bytes -> 4*8 = 32 # 1 byte conter 8 bit -> 2**32 for range
    -- -2 147 483 648 to 2 147 483 647  (4 byte storage)

-- int
create database regex2;
use regex2;

create table employee1(eid int);
insert into employee1 values(-2147483647);
select * from employee1;

-- zerofill ->  basically we have given 4 in the int so it will fix the min length 4 and max can be anything.
create table employee3(eid int(4) zerofill);
insert into employee3 values(7);
select * from employee3;

-- unsigned -> if we created an unsigned table then it will not contain -ve values only contain +ve values.
  -- range is 0 to 2**32
create table employee4(eid int unsigned);
insert into employee4 values(4294967295);
select * from employee4;

-- bigint
  --  big int is of 8 byte
-- small int ->  2 byte
-- medium int -> 3 byte

-- tinyint -> 1 byte => -128 to 127 and for unsigned 0 - 255
 --  True and false value are also tiny int and store the values in the form of 0 and 1

-- float is of 4 byte and double is of 8 byte
create table emp1(salary float);
insert into emp1 values(15.3356354); # max digit size is 5-6
select * from emp1;

create table emp2(salary float(4,2));
insert into emp2 values(15.3356354);
select * from emp2;

-- string
	-- varchar -> var length char --> max storage 65535 char
		-- varchar takes the wide space up to the length given of the char size and extra widespace it will truncate.
    -- char ->  fixed length char -->  max storage 255 char
		-- char truncate all the last wide space
    
create table emp3(name1 char(4));
insert into emp3 values("zz ");
select name1, length(name1) from emp3;

create table emp4(name1 varchar(4));
insert into emp4 values("zz   ");
select name1, length(name1) from emp4;

-- Date and Time
create table test1 (dob date);
-- YYYY-MM-DD -- hh:mm:ss
insert into test1 values("2022-05-12");
select * from test1;

-- Learning Assignment
	-- blob data type
	-- how we store images in mysql database