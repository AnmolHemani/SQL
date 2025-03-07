-- windows function
-- it is a special type of func where we perform calculation on a set of records and whatever a result comes we relates it with a current row.
-- these type of calculation we do on specific data and this specific data is known as window.
-- we use over function and we define window with it and we perform calculation and apply window func or aggregate func.

use sakila;
create table employees(id int primary key auto_increment, dept varchar(20), salary int);
insert into employees(dept, salary) values ("hr",200),("hr",300),("hr",100),("marketing",70),("marketing",50),("marketing",200),("marketing",400),("marketing",200),("marketing",600);
insert into employees(dept, salary) values ("dsa",150),("dsa",120),("dsa",40),("dsa",90),("dsa",500);
select *,(select sum(salary) from employees) from employees;

select *,sum(salary) over(), max(salary) over(), avg(salary) over() from employees;

-- windows partition by
select *, sum(salary) over(),sum(salary) over(partition by dept ) from employees;

-- running sum is cumulative sum
select *,sum(salary) over(order by salary) from employees;
select *,sum(salary) over(order by salary desc) from employees;
select *,sum(salary) over(partition by dept order by salary) from employees;

-- find avg salary of each dept running avg of each dept
select *, avg(salary) over(partition by dept), avg(salary) over(partition by dept order by salary) from employees;

-- row_number
select *,row_number() over(partition by dept order by salary) from employees;

-- rank -> if values are similar the rank are shares and next ranking will be skipped based on the num of records.
select *, rank() over(order by salary) from employees;
select *, rank() over(partition by dept order by salary) from employees;
select *, rank() over(partition by dept order by salary desc) from employees;

-- dense_rank ->  it will not skipped the ranking when the values are similar in the records.
select *, rank() over(order by salary),dense_rank() over(order by salary) from employees;

-- leg , lead , ntile
select *,lag(salary) over(partition by dept order by salary) from employees;
select *,lead(salary) over(partition by dept order by salary) from employees;
select *,ntile(2) over(partition by dept order by salary) from employees;
select *,lead(salary,2) over(partition by dept order by salary) from employees;
