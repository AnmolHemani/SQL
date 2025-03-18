-- DCL => Data Control Language

-- Authentication => Making sure that a user can access the mysql server
-- Authorization => Making sure that a user can interact with objects in the databases.

create user test identified by 'test123';
select * from mysql.user; 

-- Data dict : it is an internal table which is used by mysql
revoke all privileges on *.* from test;
grant all privileges on sakila.* to test;
show grants for test;
select * from anmol;
revoke all privileges on sakila.* from test;

grant select on sakila.* to test;

grant select(staff_id, first_name) on sakila.staff to test;

alter user 'test' identified by 'regex';

-- to lock
alter user 'test' account lock;

-- to unlock
alter user 'test' account unlock;

-- creating role
create role sales2;
grant select on sakila.* to sales2;

create user 'isha' identified by 'isha';
show grants for 'isha';

-- grant role to user
grant sales2 to isha;
set default role all to isha;