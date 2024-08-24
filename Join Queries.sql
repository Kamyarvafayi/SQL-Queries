use Northwind;

Declare @maxdate nvarchar(50)
set @maxdate = (select max(OrderDate) from dbo.Orders)
Select @maxdate;

with
	customerorders as (select Customers.CustomerID, Customers.ContactName, Customers.Country, Orders.OrderID, Orders.OrderDate 
	from Customers inner join Orders 
	on Customers.CustomerID = Orders.CustomerID)
	
select CustomerID, OrderDate from customerorders
where DateDiff(day, OrderDate, @maxdate) < 180
order by OrderDate Desc;


-- Second Example
with
	customerorders as (select Customers.CustomerID, Customers.ContactName, Customers.Country, Orders.OrderID, Orders.OrderDate 
	from Customers inner join Orders 
	on Customers.CustomerID = Orders.CustomerID)

select CustomerID, ContactName, Country, max(OrderDate) as maxorderdate
from customerorders
group by CustomerID, ContactName, Country
order by CustomerID ASC, max(OrderDate) DESC


-- Third Example
use Northwind

select * from Orders
select * from Customers
select * from Employees

select Employees.EmployeeID, Employees.FirstName, Employees.LastName,
Customers.CustomerID, Customers.ContactName, 
Orders.OrderDate, Orders.Freight, Orders.ShipCountry
from Orders full outer join Customers on Orders.CustomerID = Customers.CustomerID
full outer join Employees on Orders.EmployeeID = Employees.EmployeeID

select Employees.EmployeeID, Employees.FirstName, Employees.LastName,
Customers.CustomerID, Customers.ContactName, 
Orders.OrderDate, Orders.Freight, Orders.ShipCountry
from Orders inner join Customers on Orders.CustomerID = Customers.CustomerID
inner join Employees on Orders.EmployeeID = Employees.EmployeeID

select Employees.EmployeeID, Employees.FirstName, Employees.LastName,
Customers.CustomerID, Customers.ContactName, 
Orders.OrderDate, Orders.Freight, Orders.ShipCountry
from Orders inner join Customers on Orders.CustomerID = Customers.CustomerID
Right join Employees on Orders.EmployeeID = Employees.EmployeeID

select Employees.EmployeeID, Employees.FirstName, Employees.LastName,
Customers.CustomerID, Customers.ContactName, 
Orders.OrderDate, Orders.Freight, Orders.ShipCountry
from Orders  full outer join Customers on Orders.CustomerID = Customers.CustomerID
inner join Employees on Orders.EmployeeID = Employees.EmployeeID


-- Forth Example
select CustomerID , max(OrderDate) as maxorderdate from Orders
group by CustomerID
having year(max(OrderDate)) = 1998 and month(max(OrderDate)) = 3;

with tempTBL as 
	(select CustomerID , max(OrderDate) as maxorderdate from Orders
	group by CustomerID
	having year(max(OrderDate)) = 1998 and month(max(OrderDate)) = 3)

select tempTBL.CustomerID, tempTBL.maxorderdate, Customers.CustomerID,Customers.City  from 
tempTBL inner join Customers on tempTBL.CustomerID = Customers.CustomerID