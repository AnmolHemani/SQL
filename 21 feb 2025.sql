use sakila;

-- join
-- one or more table join
-- consistency
-- doesn't contain null

create database test1;
use test1;

create table product(pid int,name varchar(20),price int);
insert into product values(10,'tv',100),(20,'apple',200),(30,'mobile',300),(40,'shoe',1500);
select * from product;

create table orders(oid varchar(20),city varchar(20),product_id int);
insert into orders values('A1012','Jaipur',10),('B21012','Goa',20),('C3012','Japan',30),('D4012','uK',60);
select * from orders;

select pid, name, price, city from product join orders; -- this is known as cross join
-- cross join is where we haven't defined any condition in it and the rows of will match with the all rows.
-- cross join = cartesian join and the formula is m*n

-- equi join -> with where we use only equal to operator and it is older synatx
select p.pid, p.name, p.price, o.city from product as p join orders as o where p.pid=o.product_id;

-- inner join is the latest update and latest syntax and same as equi join
select p.pid, p.name, p.price, o.city from product as p inner join orders as o on p.pid=o.product_id;
-- we can use where also in inner join and on keyword also in place of where

-- left join -> the left table will always include
select p.pid, p.name, p.price, o.city from product as p left join orders as o on p.pid=o.product_id;

-- right join -> the right table will always include
select p.pid, p.name, p.price, o.city from product as p right join orders as o on p.pid=o.product_id;

-- non-equi join -> if we don't use join and in place of join we type ',' and 
	-- with where we can use any operator then it is non-equi join
select pid,city from product,orders where pid=product_id;

select * from orders;
insert into orders values('E2132','JK',10),('F213','MH',30);

select p.pid, p.name, p.price, o.oid, o.city from product as p inner join orders as o on p.pid=o.product_id;
select p.pid, p.name, p.price, o.oid, o.city from product as p left join orders as o on p.pid=o.product_id;
select p.pid, p.name, p.price, o.oid, o.city from product as p right join orders as o on p.pid=o.product_id;

-- natural join ->  we will not use this join anywhere -> bakwas join
-- in natural join if column name not match this behave like cross join
-- in natural join if we have common column and same value then it behaves like inner join
-- if column match with column name but values doesn"t match then it will not give any output

select p.pid, p.name, p.price, o.oid, o.city from product as p natural join orders as o;


desc orders; -- desc will describe the table
alter table orders rename column product_id to pid;
select p.pid, p.name, p.price, o.oid, o.city from product as p natural join orders as o;  