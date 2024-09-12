-- Pivot Table Creation
-- Method 1
select O.EmployeeID, sum(Case when year(O.OrderDate) = 1996 then Od.Quantity*OD.UnitPrice end) as [1996Sale],
				  sum(Case when year(O.OrderDate) = 1997 then Od.Quantity*OD.UnitPrice end) as [1997Sale],
				  sum(Case when year(O.OrderDate) = 1998 then Od.Quantity*OD.UnitPrice end) as [1998Sale],
				  sum(Case when year(O.OrderDate) in  (1996, 1997, 1998) then Od.Quantity*OD.UnitPrice end) as [TotalSale]
from Orders O inner join [Order Details] OD
on O.OrderID = OD.OrderID
group by Grouping sets ((O.EmployeeID), ())
Order By isnull(O.EmployeeID, 10000) ASC

select (sum(Od.Quantity*OD.UnitPrice)) from [Order Details] OD

-- Method 2 (with Subquery)
-- Example 1
select E.EmployeeID, (select count(OrderID) from Orders where year(Orders.OrderDate) = 1996 and Orders.EmployeeID = E.EmployeeID) as [1996SaleAmount],
				  (select count(OrderID) from Orders where year(Orders.OrderDate) = 1997 and Orders.EmployeeID = E.EmployeeID) as [1997SaleAmount],
				  (select count(OrderID) from Orders where year(Orders.OrderDate) = 1998 and Orders.EmployeeID = E.EmployeeID) as [1998SaleAmount],
				  (select count(OrderID) from Orders where year(Orders.OrderDate) in (1996, 1997, 1998) and Orders.EmployeeID = E.EmployeeID) as [1996SaleAmount]
from Employees E 
Order By E.EmployeeID ASC;

-- Example 2
with Temp as
	(select E.EmployeeID, E.FirstName, E.LastName, year(O.OrderDate) As orderyear,OD.Quantity*OD.UnitPrice as [TotalSale]
	from Employees E inner join Orders O
	on E.EmployeeID = O.EmployeeID
	inner join [Order Details] OD
	on O.OrderID = OD.OrderID)

select E.EmployeeID, E.FirstName, E.LastName,
		(select sum([TotalSale]) from Temp where Temp.EmployeeID = E.EmployeeID and orderyear = 1996) as [1996Sale],
		(select sum([TotalSale]) from Temp where Temp.EmployeeID = E.EmployeeID and orderyear = 1997) as [1997Sale],
		(select sum([TotalSale]) from Temp where Temp.EmployeeID = E.EmployeeID and orderyear = 1998) as [1998Sale],
		(select sum([TotalSale]) from Temp where Temp.EmployeeID = E.EmployeeID and orderyear in (1996, 1997, 1998)) as [TotalSale]

from Employees E
