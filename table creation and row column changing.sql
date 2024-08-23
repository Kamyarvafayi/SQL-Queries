-- create Table
use Northwind

create Table Northwind.dsp.complete
(completeId int primary key identity,
firstname nvarchar(50) unique,
lastname nvarchar(100));

select * from dsp.complete

-- insert a new instance
insert into dsp.complete(firstname, lastname)
values('Kamyar', 'Vafaei')

insert into dsp.complete(firstname, lastname)
values('Mahyar', 'Vafaei')

insert into dsp.complete(firstname, lastname)
values('Ramtin', 'Rostamian')

-- alter table
-- adding a new row
alter table dsp.complete
add age int NOT NULL  DEFAULT (1)

-- adding a new row as a calculated field
alter table dsp.complete
add lable as (left(firstname,2))

-- deleting a row
alter table dsp.complete
drop column lable

-- Update Table
update dsp.complete
set age = 28 where firstname = N'Kamyar'

update dsp.complete
set dsp.complete.age = 30 where firstname = N'Mahyar'

-- delete a row in a table
delete dsp.complete where firstname = N'Ramtin'

--drop table
drop Table Northwind.dsp.complete
