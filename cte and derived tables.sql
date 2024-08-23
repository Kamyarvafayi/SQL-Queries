use Northwind
select * from dbo.products;

-- CTE and derived Tables

select * from dbo.Employees

select Distinct  LonSeaEmpl.TitleOfCourtesy 
from (select * from dbo.Employees 
		where city in (N'London' , N'Seattle') ) as LonSeaEmpl;


-- first Example
with 
	temptable as (select Top 5 * from dbo.products
	order by UnitPrice Asc)

select top 1 * from temptable order by UnitPrice DESC;

-- Second Example
with 
	seatleemployee as (select * from dbo.Employees where city = N'Seattle' or city = N'London'),
	MenSeatleEmployee as (select * from seatleemployee where seatleemployee.TitleOfCourtesy = N'Mr.')

select * from MenSeatleEmployee
	order by (BirthDate)

-- third example
select * from dbo.Customers;

go
create or alter view VMexicanCustomer
as (select * from (select * from dbo.Customers where dbo.Customers.country = N'Mexico') as mexican)

go

select * from VMexicanCustomer

