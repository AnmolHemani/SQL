-- Views
	-- Virtual table
    -- user => we can interact with queries easily.
    -- Don't store data on the disk
    -- reference to your original table
    -- using query
    -- views are easily to make complex query simpler
    -- It is used to enchance the security =>  row and column
    -- views is the virtual table and take the reference from the query and enhace the security.
    -- view is updatable or simple view where there is one-to-one rlnships
    -- view is not updatable or complex view if it contains aggregate function , distinct, group by , having, union or union all , subquery in the selected list
    
use regex1;
show tables;
create table payment as select * from sakila.payment;
select * from payment;

create view pay_view as select payment_id, customer_id from payment;
select * from pay_view;



create table payment2 as select payment_id,customer_id from sakila.payment where payment_id<5;
create view payment_v2 as select * from payment2;
select * from payment2;
insert into payment_v2 values(5,10);
select * from payment2;

select * from sakila.actor;
select * from sakila.film_actor;
drop view actor1;
create view actor1 as select a.actor_id,a.first_name,a.last_name,a.last_update,f.film_id from sakila.actor as a join sakila.film_actor as f on a.actor_id=f.actor_id;
select * from actor1;

-- for updating the table we use with check option , with check option local, with check option cascaded
-- when a view is built on top of another view, WITH CHECK OPTION works differently based on LOCAL or CASCADED.
-- LOCAL
-- Only the current view's WHERE condition is checked.
-- Does not check conditions of underlying views.
-- CASCADED (default behavior)

-- Checks this view’s WHERE condition.
-- Also checks the conditions of all underlying views.

CREATE TABLE t1 (a INT);
CREATE VIEW v1 AS SELECT * FROM t1 WHERE a < 2
WITH CHECK OPTION;
CREATE VIEW v2 AS SELECT * FROM v1 WHERE a > 0
WITH LOCAL CHECK OPTION;
CREATE VIEW v3 AS SELECT * FROM v1 WHERE a > 0
WITH CASCADED CHECK OPTION;

INSERT INTO v2 VALUES (2);
INSERT INTO v3 VALUES (3);
INSERT INTO v2 VALUES (1);
INSERT INTO v3 VALUES (1);