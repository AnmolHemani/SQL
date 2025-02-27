-- constraint
	-- set of rules and regulation 
    -- if we have applied rules and regulation on a data then the data will not match with rules and regulation 
		-- then it is an invalid data and it will not store in the table.

create database regex1;
use regex1;

create table employee01(id int);
insert into employee01 values (10),(20),(null),(30);
select count(*) from employee01; -- count(*) will count the num of rows
select count(id) from employee01;
select id,id+5 from employee01; 
-- if we apply any operation on the null then it will give us numm because there is no data

create table employee02(id int not null);
insert into employee02 values (10),(20);
insert into employee02 values (null); -- null will not store but duplicate value can store in it
select id,id+5 from employee02;

drop table employee02;
create table employee02(id int, salary int default 0);
insert into employee02 values (10,99),(20,100);
insert into employee02(id) values (10); 
-- in default if we want to give one value then we have to defined the column name in which we want to add it
	-- and in the other column it will take the default value.
insert into employee02(id,salary) values (20,null);
select * from employee02;

drop table employee02;
create table employee02(id int, salary int unique);
insert into employee02 values (10,99),(20,100);
insert into employee02(id,salary) values (20,100);
-- in unique we can't able to add duplicate value but we can add null value and it can add multiple null value because 
	-- null has no data and we can't able to compare it with anything.
insert into employee02(id,salary) values (20,1002);
insert into employee02(id,salary) values (20,null);
insert into employee02(id,salary) values (22,null);
select * from employee02;

-- Primary key -> we will create primary key for unique values and doesn't contain  any null value.
drop table employee02;
create table employee02(id int primary key, salary int unique);
insert into employee02 values (10,99),(20,100);
insert into employee02(id,salary) values (null,1002);
insert into employee02(id,salary) values (10,null);
insert into employee02(id,salary) values (11,100); 
select * from employee02;

drop table employee02;
-- constraint is a better way to find the error that where the error occurs
create table employee02(id int primary key, fname varchar(20),salary int, constraint regex_emp_salary_uk unique(salary));
insert into employee02 values (10,'a',99),(20,'b',99);
insert into employee02 values (10,'a',99),(20,'b',100);
select * from employee02;

-- Ques: create a table name as student in which student id name fees clg name and phone num where id and name 
	-- will be primary key and fee can't be null. The college default value will be regex and the most imp part
		-- the phone num will be a unique constraint and you have to give the constraint name for each and every value
        
create table student(sid int, sname varchar(20),fee int not null, clg_name varchar(20) default 'regex', phone_num int, 
	constraint regex_student_id_name_pk primary key(sid,sname), constraint regex_student_num_uk unique(phone_num));
insert into student values (1,'anmol',50000,'cu',78549662);
insert into student(sid,sname,fee,phone_num) values (2,'gursewak',40000,78549661);
select * from student;

-- what is normalization and its types
-- what is acid property and its uses 
-- read again about corelated subquery