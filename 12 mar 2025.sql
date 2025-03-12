-- Revision

use sakila;
select * from payment;
select amount,count(amount),sum(amount) from payment group by amount;

-- windows => aggregate function apply har row k sath hoga
select payment_id,amount,avg(amount) over() from payment;
select payment_id,amount,avg(amount) over(order by amount desc) from payment;
select payment_id,amount,sum(amount) over(order by amount desc) from payment;

select payment_id,amount,sum(amount) over(partition by amount) from payment;
select payment_id,amount,sum(amount) over(partition by amount),sum(amount) over(partition by amount order by amount) from payment;

-- find out the customer_id and the total num of orders has placed
-- we need to indentify the customer_name and the customer_id who has placed more than 1 order
use regex1;
show tables;
create table customer(customer_id int, customer_name varchar(20));
insert into customer values(10,'prakul'),(11,'vineet'),(12,'anmol'),(13,'gursewak');
create table orders(order_id int , customer_id int , price int);
insert into orders values(1,10,100),(2,10,200),(3,11,300),(4,12,400);

select customer_id,count(order_id) as total_order from orders group by customer_id;
select c.customer_id,count(o.order_id) as total_order from orders as o right join customer as c on c.customer_id=o.customer_id group by customer_id;

select c.customer_id,count(o.order_id) as total_order from orders as o right join customer as c on c.customer_id=o.customer_id group by customer_id having count(o.order_id)>1;

select customer_id,customer_name from customer as c where 
	(select count(o.order_id) as total_order from orders as o where c.customer_id=o.customer_id group by c.customer_id)>1;

