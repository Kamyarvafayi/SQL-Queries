use Northwind

-- Inner join
select E.EmployeeID, E.FirstName, E.LastName, O.OrderID, O.Freight, OD.ProductID,OD.Quantity, OD.UnitPrice
from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
inner join [Order Details] OD on O.OrderID = OD.OrderID

-- Wrong Example for Aggregator Functions 1
select E.EmployeeID, E.FirstName, E.LastName, Count(Distinct(O.OrderID)), sum(O.Freight),sum(OD.Quantity*OD.UnitPrice)
from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
inner join [Order Details] OD on O.OrderID = OD.OrderID
Group by E.EmployeeID, E.FirstName, E.LastName

-- Wrong Example for Aggregator Functions 2
select E.EmployeeID, E.FirstName, E.LastName, Count(Distinct(O.OrderID)), sum(O.Freight),sum(OD.Quantity*OD.UnitPrice)
from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
inner join [Order Details] OD on O.OrderID = OD.OrderID
Group by E.EmployeeID, E.FirstName, E.LastName

-- Correct Example for Aggregator Functions Usage
select E.EmployeeID, E.FirstName, E.LastName, Count(Distinct(O.OrderID)), (select sum(Freight) from Orders where Orders.EmployeeID = E.EmployeeID),sum(OD.Quantity*OD.UnitPrice)
from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
inner join [Order Details] OD on O.OrderID = OD.OrderID
Group by Grouping sets ((E.EmployeeID, E.FirstName, E.LastName), ())


-- 