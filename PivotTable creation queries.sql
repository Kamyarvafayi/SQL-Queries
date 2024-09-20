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



-- Method 3 (PIVOT)
-- first create cte, in this cte we add columns which are required before aggregated columns
-- Example 1

with T as
 (Select E.EmployeeID, E.LastName, Year(O.OrderDate) as Sal, O.OrderID
			from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID)

select * , [1996] + [1997] + [1998] as Total
 from T 
 pivot (count(OrderID) for sal in ([1996], [1997], [1998])) as SalesAmount
 order by EmployeeID
			

--Example 2

with T as
 (Select E.EmployeeID, E.LastName, Year(O.OrderDate) as Sal, sum(OD.Quantity*OD.UnitPrice) as SalesAmount
			from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
								inner join [Order Details] OD on OD.OrderID = O.OrderID
			group by E.EmployeeID, E.LastName, Year(O.OrderDate))

select * , [1996] + [1997] + [1998] as Total
 from T 
 pivot (sum(SalesAmount) for sal in ([1996], [1997], [1998])) as SalesAmount
 order by EmployeeID;


 -- Example 3 
 -- a report with these Columns Employee Id LastName USA UK Germany France Total and fill the table with the dollar sale value for each Employee

 with T as
  (Select E.EmployeeID, E.LastName, C.Country, OD.Quantity*OD.UnitPrice as SalesAmount
			from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
								inner join [Order Details] OD on OD.OrderID = O.OrderID
								inner join Customers C on C.CustomerID = O.CustomerID
								where C.Country in ('USA', 'UK', 'France', 'Germany')
								--Group by E.EmployeeID, E.LastName, C.Country
								)

select *, [USA] + [UK] + [France] + [Germany] as Total
from T
 pivot(sum(SalesAmount) for Country in ([USA], [UK], [France], [Germany])) as MyPivot
