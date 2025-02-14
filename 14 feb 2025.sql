use sakila;
select * from actor;

-- and and or
select * from actor
	where actor_id>2 and first_name='JOHNNY';
select * from actor
	where actor_id>2 or first_name='JOHNNY';

-- and get more priority then or
select * from actor
	where (first_name='NICK' or first_name='ED') and actor_id>2; 

-- functions
-- block of code => code reusuable and code readable

-- pre-defined func
-- string function
select first_name, lower(first_name), upper(lower(first_name)) 
	from actor;
select first_name, last_name, concat(first_name,'_',last_name)
	from actor;
select first_name, last_name, concat_ws('_',first_name,last_name,'xyz')
	from actor;
select * from actor
	where concat(first_name,last_name)='EDCHASE';

-- substr
select first_name, substr(first_name,-3), substr(first_name,1,4) 
	from actor;

-- instr (to find the position of any char)
select first_name, instr(first_name,'E') 
	from actor;
-- locate (to find the specific postion of char)
select first_name, instr(first_name,'E'), locate('E',first_name,3)
	from actor;

-- char=> char read the data in byte and 
-- length => return the length of a str in bytes
-- char_length=> count the char
select first_name, instr(first_name,'E'), locate('E',first_name,3),
	char_length(first_name)
		from actor;

-- dual table => dummy table
select 'hey','hello' from dual;
select length('字'),char_length('字') from dual;

-- lpad and rpad => to make the specific/certain length of str
select first_name, lpad(first_name,5,'$'), rpad(first_name,5,'$')
	from actor;

-- trim => remove the space or given specific char
select '  hey  ', trim('  hey  ') from dual;
select '  hey  ', trim(leading 'z' from 'zzzheyzzz') from dual;
select '  hey  ', trim(trailing 'z' from 'zzzheyzzz') from dual;
select '  hey  ', trim(both 'z' from 'zzzheyzzz') from dual;

-- replace => to replace any char with another char from str
select first_name, replace(first_name,'E','G') from actor;

-- distinct => return distinct values
select distinct(first_name) from actor
	where first_name='NICK';
