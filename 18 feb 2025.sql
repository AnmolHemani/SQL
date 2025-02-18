use sakila;
-- multi row function

-- 1. aggregate function are those which help in some of the calculation
-- takes data in multiple rows and gives one output
select sum(amount) from payment;
select count(amount) from payment;
select avg(amount),sum(amount)/count(amount) from payment;

select distinct(amount) from payment; -- gives unique values
select count(distinct(amount)),count(amount) from payment;

select count(amount) from payment where amount=0.99;
select count(*) from payment where amount=0.99;
-- if the value is not present the count will skip those column and doesn't count them
-- primary key is a unique value and can't be empty
select count(amount) from payment where amount=2.99;

-- group by -> it ia a clause and collect the similar values together.
-- column should be same in select and group by clause
select amount,count(amount) from payment group by amount;
select amount,count(payment_id),sum(amount),avg(amount) 
	from payment group by amount;

-- found payment id amount payment date month
-- the total the total amount on each month group by on month

select * from payment;

select payment_id,amount,payment_date,month(payment_date) from payment;

select month(payment_date),sum(amount)
	from payment group by month(payment_date);

-- get the total amount and the avg amount spend by each customer
-- get the total amount and the max and min amount for each staff id
-- get the total no of payment done by each staff
-- get the total amount the total no of entries
	-- the avg amount the min amount and 
	-- the max amount by each customer 
	-- where amount value should be greater then 2 
	-- and payment id should be greater then 10
    
select customer_id,sum(amount),avg(amount) from payment 
	 group by customer_id;
     
select staff_id,sum(amount),max(amount),min(amount) from payment 
	group by staff_id;

select staff_id,count(amount) from payment group by staff_id;

select customer_id,sum(amount),count(amount),
	avg(amount),min(amount),max(amount) from payment 
		where amount>2 and payment_id>10 group by customer_id;

-- if we use aggregate function then we are not able to use where clause on it.
-- we apply where clause in which the column is physically present in the table.
-- we use having clause with aggregate function but we don't use where clause with aggregate function.

select amount,sum(amount) from payment
	where amount>5 group by amount 
		having sum(amount)>5000;


