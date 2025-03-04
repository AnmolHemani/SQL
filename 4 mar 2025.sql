use regex1;
show tables;

-- corelated subquery

create table emp(eid int primary key, name varchar(20));
insert into emp values(1,'aman'),(2,'shubham'),(3,'abc');
select * from emp;

create table emp_family(eid int, name varchar(20), father varchar(20));
insert into emp_family values(1,'aman','raj'),(2,'shubham','kamal'),(3,'abc','aman'),(4,'ujjwal','kaluram');
insert into emp_family values(3,'abc','abc');
select * from emp_family;

drop table e1;
create table e1(eid int primary key, fname varchar(20), salary int, dept_id int);
insert into e1 values(1,'anmol',900,10),(2,'shubham',100,10),(3,'aman',50,10),(4,'sakshi',200,11),(5,'naina',300,11);
insert into e1 values(6,'isha',350,12);
select * from e1;
-- find to get the eid fname salary deptid only for those emp where the salary of the emp should be greater then the avg salary of that dept
select * from e1 where salary>(select avg(salary) from e1 as e where e1.dept_id=e.dept_id group by dept_id);

-- multi column 
select * from e1 where (dept_id,salary) in (select e.dept_id,avg(salary) from e1 as e group by e.dept_id);

-- exists and non exists
create table p1(pid int,pname varchar(20));
insert into p1 values(101,'Mobile'),(102,'Laptop');

create table o1(oid int, oname varchar(20), pid int);
insert into o1 values (1001,'escooter',103),(1002,'clothes',104);

select * from p1 where exists (select 1 from o1 where o1.pid=p1.pid);
select * from p1 where not exists (select 1 from o1 where o1.pid=p1.pid);

