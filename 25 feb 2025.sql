use sakila;

-- self join -> part of equi join
-- when a table is match with it's own table

use test1;
create table staff(eid int,ename varchar(20),manager_id int);
insert into staff values(10,'tushar',null),(11,'aman',13),(12,'sakshi',10),(13,'shubham',11),(14,'ujjwal',12);
select * from staff;

select emp.eid,emp.ename,emp.manager_id,mng.ename from staff as emp join staff as mng where emp.manager_id=mng.eid;
-- Leetcode 181 done

use sakila;
-- set opertor
-- used to combine the two tables
-- column count must be same but column name can be different

-- what is diff b/w set operation vs join
-- union will append the result of the other query horizontally where as join join the table vertically.

select * from actor where actor_id in (2,3)
union -- remove the duplicate elements
select * from actor where actor_id in (3,5);

select * from actor where actor_id in (2,3)
union all -- doesn't remove the duplicate elements
select * from actor where actor_id in (3,5);

select * from actor where actor_id in (2,3,4)
except -- will return the column which is in first query but not in second query
select * from actor where actor_id in (3,5);

select * from actor;
desc actor;
select * from film_actor;
desc film_actor;

-- find out a common column and join it and count movie on each respective actor_id
select a.actor_id,a.first_name,count(fa.film_id) as movies from actor as a join film_actor as fa on a.actor_id=fa.actor_id
 group by a.actor_id order by movies;
 
 -- learning assignment
 -- data types in sql
 