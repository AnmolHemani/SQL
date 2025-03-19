-- index()
	-- index => sequential searching 
    -- index => reference of your data which helps in optimize the query (fast)
    -- primary key , unique key create new column these key will be identifier makes all unique elements and make it a primary key
    -- we store indexes generally in bst tree (binary search tree)
    -- clustered index comes by default in mysql
    -- index are not good in terms on writing but it is oy good while reading
    -- we use indexes for query optimization
    
use regex1;
drop table users;
create table users (id int primary key, fname varchar(20));
insert into users values(10,'tushar'),(11,'aman'),(12,'prakul'),(13,'anmol'),(14,'om'),(15,'naina'),(16,'anmol');

explain select * from users where id=11;
show indexes from users;
-- cardinality means uniqueness of the rows

explain select * from users where fname='om';

create index user_f on users(fname);
show indexes from users;
explain select * from users where fname='om';
explain select * from users where fname='anmol';

drop index `primary` on users;
drop index user_f on users;

-- difference between cluster index and non cluster index
	-- cluster index are primary and unique key
    -- non cluster index are except primary key and unique key like we create index .....
    
-- if we create index on two column then it is called composite index

-- create table id name lastname insert 4 record 
-- filter fname and last name 
-- create index for 2 column 
-- again explain query 
-- run query again but invert names

create table users1 (id int, fname varchar(20), lname varchar(20));
insert into users1 values(10,'tushar','goyal'),(11,'aman','sharma'),(12,'prakul','jain'),(13,'anmol','hemani');
explain select * from users1 where fname='anmol' and lname='hemani';  
create index userf on users1(fname,lname); -- composite index
explain select * from users1 where fname='anmol' and lname='hemani';  
explain select * from users1 where lname='hemani' and fname='anmol';
explain select * from users1 where lname='hemani'; -- it depends on sequence because we have the lname on 2 index that's why it will search all the rows.
explain select * from users1 where fname='anmol';

-- learning assignment
-- prefix index and invisible index
-- oracle 11g express edition

create index user_f ON users(fname(5));
explain select * from users1 where fname='anmol';
  