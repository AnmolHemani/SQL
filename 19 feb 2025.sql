use sakila;

select amount,sum(amount) from payment 
	where amount!=0.99
		group by amount having sum(amount)>8000;

select amount,sum(amount) from payment 
	group by amount having amount!=0.99;
    
-- order by
-- alias --> as

select amount,amount*10 as new from payment;
select amount,amount*10 as 'select' from payment;

select * from payment order by amount desc,rental_id desc;

-- subquery
-- case statement
-- flow control function

-- use of if else
select amount,if(amount=0.99,'correct','incorrect')
	from payment;

-- use of if elseif else
select amount,if(amount=0.99,'correct',
	if(amount=2.99,'yes','incorrect'))
		from payment;

-- this is the basic syntax of case statement

-- select col,
-- 	case
-- 		when condition then statement
--      when condition then statement
-- 	end
-- 

select * from payment;
select amount,
case
	when amount=0.99 then 'value is 0.99'
    when amount=2.99 then 'yes'
    else amount
end as cond
from payment;

-- Question: take a payment table and now if 
-- the count of payment done by each amount is greater then 1000
-- print amount greater then 1000 otherwise less then 1000

-- if the amount is greater then 1 the print amount is greater then 1 
-- for 3 and for 7
-- otherwise amount is less then 1

select * from payment;

select amount,count(amount),
case
	when count(amount)>1000 then 'count of amount is greater then 1000'
    else 'count of amount is less then 1000'
end as cond
from payment group by amount;

select amount,
case
	when amount>1 then 'amount greater then 1'
    when amount>3 then 'amount greater then 3'
    when amount>7 then 'amount greater then 7'
    else 'amount less then 1'
end as cond
from payment;

-- subquery
-- query with in a query is known as subquery

select * from payment;
select * from payment where amount=
	(select amount from payment where payment_id=5);
    
-- Learning Assignment

-- What are keys and its uses
-- type of relationship in sql
-- primary key , candidate key , super key , foreign key
