-- to find the n highest salary using windows function
use sakila;
select * from payment;
select * from 
	(select amount, dense_rank() over(order by amount desc) as rating from payment) 
		as tab where rating=2;
        
-- CTE ->  Common Table Expression
-- It store the temporary result set we we use insert update delete.
-- with the help of with keyword we use cte
-- we refer it multiple times
-- cte are used to breakdown from complex logic to simpler logic
-- cte makes the code readable
-- we use cte for recursively work
-- syntax: with cte as select statement   # we don't use semicolon after this
	-- select * from cte
-- we can write any word in place of cte like anmol etc;
with cte as (select amount, dense_rank() over(order by amount desc) as rating from payment)
select * from cte; 

create temporary table anmol as select * from payment;
-- temporary table doesn't exist after the session ended
select * from anmol;

with 
cte1 as (select * from actor where actor_id>2),
cte2 as (select * from film_actor where film_id=30)
select cte1.actor_id,film_id from cte1 join cte2 where cte1.actor_id=cte2.actor_id;

set @aa = 33;
with 
cte1 as (select * from actor where actor_id>@aa),
cte2 as (select * from film_actor where film_id=30)
select cte1.actor_id,film_id from cte1 join cte2 where cte1.actor_id=cte2.actor_id;

-- recursive cte -< until some condition is satisfied
with recursive num_table as (select 10 as num from dual
	union select num+1 from num_table where num<13)
select * from num_table;

-- get actor_id first name full name from tha table where either the actor id is > then 5 or the name is nick
select * from actor;
with recursive name as (select actor_id,first_name,concat(first_name,last_name) from actor where actor_id>5
	union select actor_id,first_name,concat(first_name,last_name) from actor where first_name='nick'
)
select * from name;

-- cte temporary table and views difference
-- recursive subquery
