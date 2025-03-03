use sakila;

-- to find the second highest num
select max(amount) from payment
	where amount<(select max(amount) from payment);
    
-- DDL statement
-- Data definition language
-- with data
-- create, drop, alter, truncate

-- DML statement
-- insert, update, delete

create database march3;
use march3;

create table regex(id int, name varchar(20));
insert into regex values(1,'anmol');
insert into regex(name) values('anmol');
insert into regex(name) values('anmol'),('aman');
select * from regex;

-- ctas --> create table as select statement
create table y2 as select * from sakila.actor;
select * from y2;

drop table y3;
create table y3 as select actor_id ,first_name  from sakila.actor;
select * from y3;

create table y1 as select actor_id as aid,first_name as fname  from sakila.actor;
select * from y1;

-- delete
delete from y3; -- will delete full data
-- we use where condition with delete to delete the specific elements
delete from y3 where actor_id in (2,4);

-- update
update y3 set first_name='regex';
select * from y3;

update y3 set first_name='regex' where actor_id>1 and actor_id<5;
select * from y3;

-- drop
drop table y3; -- in drop we can't able to apply any condition
select * from y3; -- this will cause an error because the table is dropped

-- truncate
select * from y1;
truncate table y1;

-- difference b/w delete drop and truncate
-- delete --> delete one or more rows based on the condition -- dml -- delete is very slower 
-- truncate --> delete all the rows -- ddl -- truncate is extremely faster then drop an delete
--  drop --> delete the tables -- ddl -- drop is faster then delete but slower then truncate
-- delete and truncate doesn't affect the table structure where drop affect the table structure
-- truncate delete the old table and recreate the new table with same structure
-- delete can be roll backed means we can undo the task where as drop and truncate can't be roll backed

-- alter
create table companies(id int);
insert into companies values(10);
select * from companies;
desc companies;

-- add table columns
alter table companies add column phone varchar(15);
select * from companies;
desc companies;

alter table companies add column employee_count3 int not null; -- it will give bt default 0 not null
select * from companies;

-- drop column
alter table companies drop column employee_count3;
select * from companies;

-- rename tables
rename table companies to newcompany;
select * from newcompany;

alter table newcompany rename to companies;
select * from companies;

-- rename column name
alter table companies rename column phone to company_name;
select * from companies;

update companies set company_name='anmol' where id=10;
select * from companies;

-- adding keys
alter table companies add primary key(id);
desc companies;

alter table companies add constraint march3_company_name unique key(company_name);
desc companies;

alter table companies drop constraint march3_company_name;
desc companies;

-- changing column datatype
alter table companies modify company_name int; 
-- this will raise an error because we have the char in the company column and if there is no char then it will change the 
	-- datatype
-- for changing the datatype first change the str to null or 0 then convery it to int

update companies set company_name=null where id=10;
select * from companies;
alter table companies modify company_name int; 
desc companies;

-- sqlzoo 0123568