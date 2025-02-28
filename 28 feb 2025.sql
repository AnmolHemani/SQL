-- foreign key constraint
-- relationship define krna => entity
-- parent and child

use regex1;
create table product123(pid int primary key, amount int);
insert into product123 values (101,876),(102,745);
select * from product123;

create table order123(oid int, city varchar(20), product_id int, foreign key (product_id) references product123(pid));
insert into order123 values (9632,'jaipur',101);
insert into order123 values (9634,'jaipur',102);
insert into order123 values (9652,'jaipur',107); -- this will not insert because we have no id as 107 in product123 table.
select * from order123;

-- Cascade

create table product1(pid int primary key, amount int);
insert into product1 values (101,876),(102,745);
select * from product1;

create table order1(oid int, city varchar(20), product_id int, foreign key (product_id) references product1(pid)
	on delete cascade on update cascade);
insert into order123 values (9632,'jaipur',101);
insert into order123 values (9634,'jaipur',102);

-- on delete cascade
delete from product1 where pid=102;

-- on update cascade
update product1 set  pid=103 where pid=101;

