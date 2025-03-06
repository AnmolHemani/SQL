-- TCL Statement
-- Transcation Control Language
-- Transcation : Set of Logical Statement or Collection of multiple statement
-- DDL, DML, DCL : we run these cmd and these are transcation
-- Start Transcation or Stop Transcation
-- Start : DML Task happened as insert update delete then transcation will start
-- stop : DDL,DCL Task happened then transcation stopped
-- TCL : commit, savepoint, rollback

select @@autocommit; -- bydefault it will save the data permanentely
set autocommit=0; -- it will close the autocommit 

use regex1;
create table yash(id int, fname varchar(20));
insert into yash values(10,'shubham');
select * from yash;
commit; -- will save the data permanently and stop the transcation

insert into yash values(11,'aman');
select * from yash;
rollback; -- will dicard the running transcation which is temporary and not saved permanently and stop the transcation

insert into yash values(11,'aman');
select * from yash;
commit;

insert into yash values(12,'shubham');
update yash set fname='regex';
create table dd(id int); 
-- if we run ddl or dcl cmd then transcation will automatically commit and saved permanently and 
	-- we don't need to use commit or rollback in this case.
select * from yash;

insert into yash values(13,'isha');
select * from yash;
update yash set fname='uu';
select * from yash;
savepoint yash_raj_sv;
insert into yash values(14,'pp');
select * from yash;
rollback;
select * from yash; -- if we use savepoint and we rollback it then also all trascation will be deleted.alter

insert into yash values(13,'isha');
select * from yash;
update yash set fname='uu';
select * from yash;
savepoint yash_raj_sv;
insert into yash values(14,'pp');
select * from yash;
rollback to yash_raj_sv;
select * from yash; 
-- if we have given specific savepoint name in the rollback then transcation will be rollbacked after the savepoint the transcation done in it.

-- Learning Assignment
-- What is windows function and rank denserank and rownumber
-- what are acid properties in database and why we use it
-- normalization