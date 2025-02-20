use sakila;

-- subquery
-- now get those info from the payment table where amount =rental_id =1185
select * from payment where 
	amount>(select amount from payment where rental_id=1185);

-- get those info payments where the month matches with month of payment id =3
select * from payment where month
	(payment_date)=(select month(payment_date) from payment where payment_id=3);

-- get those amount where the total num of payments 
	-- for the amount should be greater then the total payment of amount 0.99
select amount,count(amount) from payment group by amount having 
	count(amount)>(select count(amount) from payment where amount=0.99);
    
-- get each customer id and the total amount spend where 
	-- the total amount should be greater then 
		-- the total amount spended by customer_id =9
select customer_id,sum(amount) from payment group by customer_id having 
	sum(amount)>(select sum(amount) from payment where customer_id=9);

-- multi-row subquery
-- if we have a multi-row subquery then we aren't able to use =,>,< etc.
-- the operator use in multi-row subquery : in , =any >any <any , >all
-- >any means greater then the min value of subquery
-- <any means less then the max value of subquery

select * from payment where amount in 
	(select amount from payment where payment_id in (1,3));

select * from payment where amount =any 
	(select amount from payment where payment_id in (1,3));
select * from payment where amount >any 
	(select amount from payment where payment_id in (1,3));
select * from payment where amount <any 
	(select amount from payment where payment_id in (1,3));

-- >all means greater then the max value of subquery
-- <all means less then the min value of subquery

select * from payment where amount >all 
	(select amount from payment where payment_id in (1,3));
select * from payment where amount <all 
	(select amount from payment where payment_id in (1,3));
    
-- assignment
-- what is co-related subquery
-- what is database 
-- what is dbms
-- type of dbms with example
-- dbms vs rdbms
-- where vs having clause 
-- sql and type of sql languages
-- key and its types with example