use employees;
select * from employees;
select * from departments;
select * from salaries;
select * from titles;
select * from dept_emp;

-- get those emp salary who salary is less than the emp no 10003
select emp_no,salary from salaries where salary<all(select salary from salaries where emp_no=10003);

desc employees;
desc titles;

select e.emp_no,e.first_name,t.title from employees as e join titles as t on e.emp_no=t.emp_no where title='manager';
select e.emp_no,e.first_name,t.title from employees as e join titles as t on e.emp_no=t.emp_no where e.emp_no='110085';
select e.emp_no,e.first_name,t.title from employees as e join titles as t on e.emp_no=t.emp_no where title!='manager';

-- i need to get the emp_no the first name last name the title from this emp table where the current position in manager and also work on anyother position before
select distinct e.emp_no,e.first_name,e.last_name,t.title from employees as e join titles as t on e.emp_no=t.emp_no 
	where title='manager' and e.emp_no in (select e.emp_no from employees as e join titles as t on e.emp_no=t.emp_no where title!='manager');
    
-- the emp_no first name title and hire date for all the emp
select e.emp_no,e.first_name,t.title,e.hire_date from employees as e left join titles as t on e.emp_no=t.emp_no;
select emp_no,first_name,title,hire_date from employees left join titles using (emp_no); 

-- we use using clause when we have the same column name to match.

select e.emp_no,e.first_name,t.title,e.hire_date from employees as e left join titles as t on e.emp_no=t.emp_no where title='assistant engineer';

-- info of assitant engineer the hire date is before the hiring date of that current emp working on manager position

select e.emp_no,e.first_name,t.title,e.hire_date from employees as e join titles as t on e.emp_no=t.emp_no where title='assistant engineer' and 
	e.hire_date <any (select e.hire_date from employees as e join titles as t on e.emp_no=t.emp_no where title='manager');
    
-- from the titles table get the emp_no the title of a person and year of hiring date for the current manager position where the person has been promoted in the same year if he was working on any other
 -- position
 
select emp_no, title, year(from_date) from titles where title='manager' and  (emp_no,year(from_date)) in (select emp_no,year(from_date) from titles where title!='manager');

-- single row subquery -- we use = < >
-- multi row subquery -- in =any all and in this =all doesn't work
-- multi column subquery -- in and in this any all opertor doesn't work
-- corelated -- any dynamic condition 



