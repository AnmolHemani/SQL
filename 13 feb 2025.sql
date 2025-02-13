show databases;

use sakila;
show tables;

describe actor;
select * from actor;
select actor_id, first_name, ACTOR_ID*100 FROM ACTOR;
select * from actor;

-- select * from table => saare column select hore the
-- where clause is use for condition
select * from actor
	where actor_id=2;

-- operator => > , < , >= ,<= , = , != or <> , between , in , and like
-- between => range of values
select * from actor
	where actor_id between 1 and 5;
select * from actor
	where actor_id in (2,5,500);

-- Now get the actor_id of first_name where username is nick or ed
select * from actor
	where first_name in ('nick','ed');

-- like operator => find a pattern on certain things
-- wildcard character has two character =>
	-- % => zero or more character
    -- _ => only one character
select * from actor
	where first_name='A'; -- this will not show anything on single char

select * from actor
	where first_name like 'E%';
select * from actor
	where first_name like '%Y';
select * from actor
	where first_name like 'S%Y';
select * from actor
	where first_name like '%A';
select * from actor
	where first_name like '%A%';
select * from actor
	where first_name like '%SA%';

select * from actor
	where first_name like 'E_';
select * from actor
	where first_name like '_A%';

-- Get those name whose first_name has only 4 char 
	-- get all info whose first name start with i
    -- get those data where u have letter e in the middle
    -- get those user which have atleast 4 char and last 3rd char should be r 
    -- ee present together
    -- get those data where 2 letter is h and the 2 last letter is z
select * from actor
	where first_name like '____';
select * from actor
	where first_name like 'i%';
select * from actor
	where first_name like '_%e%_';
select * from actor
	where first_name like '_%ee%_';
select * from actor
	where first_name like '__%r__';
select * from actor
	where first_name like '_h%z_';
