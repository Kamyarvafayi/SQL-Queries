use northwind
select * from Customers

-- Group By Example 1
select country, STRING_AGG(CustomerID, ',') within group(order by CustomerID) as Customers
from Customers
group by country
order by country

-- example 2 
select * from Orders;

with temptable as
(select * from Orders
where EmployeeID = 5)

select * from temptable where OrderDate = (select max(OrderDate) from temptable)


-- Example 3
select * from Customers;

with temptable
	as (select Distinct (Country) as DistinctCountry from Customers)

select string_Agg(DistinctCountry,',') within group (order by DistinctCountry) as countries
from temptable


-- Example 4
select * from orders

select DateName(Month, OrderDate) as [Month] from Orders

select CustomerID, DateName(Month, OrderDate) as [Month] , count(OrderID) OrderCount
from Orders
group by CustomerID, DateName(Month, OrderDate)
order by CustomerID, [Month]

-- Example 4
select EmployeeID, count(OrderID) as ordercount
from Orders
where year(OrderDate) = 1997
group by EmployeeID
having count(OrderID) > 40
order by EmployeeID

-- Example 5
select O.EmployeeID, E.LastName, E.FirstName, count(O.OrderID) as ordercount
from Orders O
inner join Employees E
on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997
group by O.EmployeeID, E.LastName, E.FirstName
having count(O.OrderID) > 40
order by O.EmployeeID, E.LastName, E.FirstName

-- Example 5-1
select O.EmployeeID, E.LastName, E.FirstName, count(O.OrderID) as ordercount
from Orders O
inner join Employees E
on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997 and O.EmployeeID > 3  -- pay attention
group by O.EmployeeID, E.LastName, E.FirstName
having count(O.OrderID) > 40  -- pay attention
order by O.EmployeeID, E.LastName, E.FirstName

-- or Example 5-2
select O.EmployeeID, E.LastName, E.FirstName, count(O.OrderID) as ordercount
from Orders O
inner join Employees E
on O.EmployeeID = E.EmployeeID
where year(OrderDate) = 1997  -- pay attention
group by O.EmployeeID, E.LastName, E.FirstName
having count(O.OrderID) > 40 and O.EmployeeID > 3 -- pay attention
order by O.EmployeeID, E.LastName, E.FirstName


-- ORDER BY
-- order by rules
-- 1. if there is no group by, then we can use order by for all columns even for columns which are not available in select (not recommended)
-- 2. if there is group by, then we can use all aggregator functions, but other columns which are available can be used


-- Example 1 (Important)
select * from Customers;
with tempTable as (select CustomerID, CompanyName, ContactName, Country, City, Case Country
															when  N'USA' Then 1
															when N'Germany' Then 2
															when N'UK' Then 3
															when N'France' then 4
															else 5 
															end as CountryPriority
						from Customers)
select * from tempTable 
order by CountryPriority ASC, Country ASC;

-- Example 1-1
with tempTable as (select CustomerID, CompanyName, ContactName, Country, City, Case Country
															when  N'USA' Then 1
															when N'Germany' Then 2
															when N'UK' Then 3
															when N'France' then 4
															else 5 
															end as CountryPriority
						from Customers)
select * from tempTable 
order by 6 ASC, 4 ASC

-- Offset Fetch -- It is exclusively useful for number paging
-- Example 1
select * from Customers
order by CustomerID
offset 10 rows fetch next 10 rows only -- from customer #11 to #20

-- Example 2
Declare @StartRow int = 10
Declare @FinishRow int = 20

select * from Customers
order by CustomerID
offset (@StartRow) + 1 rows fetch next (@FinishRow) rows only

-- Example 3 Paging (Important)
Declare @PageNumber int = 3
Declare @RowCount int = 10

select * from Customers
order by CustomerID
offset (@PageNumber - 1) * @RowCount rows fetch next (@RowCount) rows only
