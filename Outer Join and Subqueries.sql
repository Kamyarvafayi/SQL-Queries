-- Part 1

-- Example --> Dar moghabele name har karmand, tedade sefareshete oo ra neshan dahid (Ali alizadeh ham add she)

-- LEFT/FULL/RIGHT OUTER JOIN

SELECT * FROM Orders

SELECT * FROM Employees

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E INNER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY GROUPING SETS((E.EmployeeID, E.FirstName, E.LastName, E.Country), ())
ORDER BY [Total_Orders] DESC


SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY GROUPING SETS((E.EmployeeID, E.FirstName, E.LastName, E.Country), ())
ORDER BY [Total_Orders] DESC

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E LEFT OUTER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY GROUPING SETS((E.EmployeeID, E.FirstName, E.LastName, E.Country), ())
ORDER BY [Total_Orders] DESC

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E FULL JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY GROUPING SETS((E.EmployeeID, E.FirstName, E.LastName, E.Country), ())
ORDER BY [Total_Orders] DESC

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E FULL OUTER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY GROUPING SETS((E.EmployeeID, E.FirstName, E.LastName, E.Country), ())
ORDER BY [Total_Orders] DESC


SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, O.OrderID 
FROM Employees E INNER JOIN Orders O
ON E.EmployeeID = O.EmployeeID

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, O.OrderID 
FROM Employees E LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, O.OrderID 
FROM Orders O RIGHT JOIN Employees E
ON E.EmployeeID = O.EmployeeID



INSERT INTO Orders(CustomerID, EmployeeID, OrderDate, Freight)
VALUES ('ALFKI', NULL, GETDATE(), 80), ('BONAP', NULL, GETDATE(), 120)


SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, O.OrderID 
FROM Employees E RIGHT JOIN Orders O
ON E.EmployeeID = O.EmployeeID


SELECT E.EmployeeID, E.FirstName, E.LastName, E.Country, O.OrderID 
FROM Employees E FULL JOIN Orders O
ON E.EmployeeID = O.EmployeeID
ORDER BY EmployeeID DESC


/*SELECT E.EmployeeID, E.FirstName, E.LastName , COUNT(*) AS [Total_Orders]
FROM Employees E LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER By [Total_Orders]
*/

SELECT COUNT(*) FROM Employees

-- COUNT Does not count ALL --> COUNT(*) Kollan is a BULLSHIT!!


-- Exercise --> Peyda konid customer hayei k order nadaran

SELECT COUNT(*) AS [Total_Customers_No_Orders]
FROM Customers C LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
where o.OrderID is Null


SELECT *
FROM Customers C LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE O.OrderID is Null


-- In Query Design, to use right or left join. right cick on the mid 'Lozi'

-- Exercise --> dar moghabele customers, kharide dollari ra neshan dahid

SELECT C.CustomerID, C.ContactName, C.CompanyName, C.Country, SUM(OD.Quantity * OD.UnitPrice) AS [Total_Purchase]
FROM Customers C FULL JOIN Orders O
ON C.CustomerID = O.CustomerID
FULL JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName, C.CompanyName, C.Country


SELECT C.CustomerID, C.ContactName, C.CompanyName, C.Country, SUM(OD.Quantity * OD.UnitPrice) AS [Total_Purchase]
FROM Customers C RIGHT JOIN Orders O
ON C.CustomerID = O.CustomerID
RIGHT JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName, C.CompanyName, C.Country


SELECT C.CustomerID, C.ContactName, C.CompanyName, C.Country, SUM(OD.Quantity * OD.UnitPrice) AS [Total_Purchase]
FROM Customers C LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
LEFT JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName, C.CompanyName, C.Country


SELECT C.CustomerID, C.ContactName, C.CompanyName, C.Country, SUM(OD.Quantity * OD.UnitPrice) AS [Total_Purchase]
FROM Customers C FULL JOIN Orders O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD
ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.ContactName, C.CompanyName, C.Country

 -- Outer speed kamtari nesbat be INNER darad.



 -- Part 2

 -- Exercise --> 1 jadval besazid be nam T1 (ID int NOT NUll PK, Number int), T2(Similar structure)
 -- Gozareshi benevisid k dar on agar dar har 2 jadval baraye on ID meghdar vojood darad, meghdar bozorgtar vali agar 1 ja bood, faghat hamoon

 /* INSERT INTO T1 VALUES (1,10),(2,15),(5,26),(6,40),(7,20), (10,80)
    INSERT INTO T2 VALUES (1,12),(2,11),(5,26),(8,45),(9,30),(10,80)

	 -- OUTPUT
	    ID         NUMBER
		--           --
	     1            12
	     2            15
		 5            26 
		 6            40
		 7            20
		 8            45
		 9            30
		 10           80
	*/





-- SUBQUERY (NESTED SELECT)

-- TYPE 1 --> Harkoja j dar 1 Query bekhaym 1 adad estefade konim (Chon 1 satr va 1 sotoon (1 cell ya meghdar ) barmigardad.

SELECT * FROM Orders

SELECT E.FirstName, E.LastName, (SELECT COUNT(OrderID) FROM Orders) AS [Total_Orders]
FROM Employees E

-- SUBQUERY Type 1 baraye har satr select birooni 1 bar run mishavad

SELECT E.EmployeeID, E.FirstName, E.LastName, (SELECT COUNT(OrderID) FROM Orders WHERE Orders.EmployeeID = E.EmployeeID) AS [Total_Orders]
FROM Employees E
ORDER BY [Total_Orders] DESC


-- Har Query k ba JOIN neveshte mishavad, ba SUBQUERY ham ghabele neveshtan ast

SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(O.OrderID) AS [Total_Orders]
FROM Employees E LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY [Total_Orders] DESC



-- Exercise --> Dar moghabele name har karmand, tedade sefareshate oo va in k che nesbati az kol hast?

DECLARE @Total_Ord DECIMAL 
SET @Total_Ord = (SELECT COUNT(*) FROM Orders)

SELECT E.EmployeeID, E.FirstName + E.LastName AS [Full_Name], COUNT(O.OrderID) AS [Total_Orders] , FORMAT(COUNT(O.OrderID)/@Total_Ord , 'P') AS [Percentage%]
FROM Employees E LEFT JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY [Total_Orders] DESC

select E.EmployeeID, E.FirstName + E.LastName AS [Full_Name],
(select count(OrderID) from Orders where Orders.EmployeeID = E.EmployeeID) as [Total_Orders],
format((select count(OrderID) from Orders where Orders.EmployeeID = E.EmployeeID)/(1.0*(select count(OrderID) from Orders)), 'P') AS [Percentage%]
FROM Employees E 
ORDER BY [Total_Orders] DESC


-- shomare nam va geymat gerantarin kalaye category moghabel har kala group
select * from Products

select Ca.CategoryID, Ca.CategoryName, 
	(select ProductID, ProductName, max(unitprice)
	from Products
	where Products.CategoryID = Ca.CategoryID
	group by ProductID, ProductName)
from Categories ca



select Ca.CategoryID, Ca.CategoryName, 
		(select Top 1 ProductID
	from Products
	where Products.CategoryID = Ca.CategoryID
	order by unitprice Desc) as [ProductID],
		(select Top 1  ProductName
	from Products
	where Products.CategoryID = Ca.CategoryID
	order by unitprice Desc) as [ProductName],
		(select Top 1 unitprice
	from Products
	where Products.CategoryID = Ca.CategoryID
	order by unitprice Desc) as [unitprice]
from Categories ca



select C.CategoryID, C.CategoryName, Max(P.UnitPrice) As [MostExpensive]
from Categories C inner join Products P 
on C.CategoryID = P.CategoryID
group by C.CategoryID, C.CategoryName


-- Dar moghabel nam har karmand be soorat pivot Tedad Sefareshat Baraye Sal haye 96, 97, 98 va total namayesh

select E.EmployeeID, E.FirstName, E.LastName, 
		(select Count(orderID) 
		from Orders
		where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1996) as TotalOrder_1996,
		(select Count(orderID) 
		from Orders
		where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1997) as TotalOrder_1997,
		(select Count(orderID) 
		from Orders
		where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1998) as TotalOrder_1998,
		(select Count(orderID) 
		from Orders
		where Orders.EmployeeID = E.EmployeeID) as TotalOrder
from Employees E;


-- Total Row with CTE
with TempTable as 
	(select E.EmployeeID, E.FirstName, E.LastName, 
			(select Count(orderID) 
			from Orders
			where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1996) as TotalOrder_1996,
			(select Count(orderID) 
			from Orders
			where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1997) as TotalOrder_1997,
			(select Count(orderID) 
			from Orders
			where Orders.EmployeeID = E.EmployeeID and year(Orders.OrderDate) = 1998) as TotalOrder_1998,
			(select Count(orderID) 
			from Orders
			where Orders.EmployeeID = E.EmployeeID) as TotalOrder
	from Employees E)

select EmployeeID, FirstName, LastName, Sum(TotalOrder_1996), Sum(TotalOrder_1997), Sum(TotalOrder_1998), Sum(TotalOrder)
from TempTable 
Group by Grouping sets ((EmployeeID, FirstName, LastName), ())




-- Exercise: Dar moghabel nam har karmand be soorat pivot Mablagh Foroosh Baraye Sal haye 96, 97, 98 va total namayesh




-- Dar Yek Ghozaresh dar moghabel nam har kala Geymatash ra neshan dahid va neshan dahid in geymat chand darsad geymat gerantarin kala ast

select ProductID, ProductName, UnitPrice, format(UnitPrice/(select max(UnitPrice) from Products), 'P') as [price_Percentage]
From Products
Order by ProductID

-- Dar Yek Ghozaresh dar moghabel nam har kala Geymatash ra neshan dahid va neshan dahid in geymat chand darsad geymat gerantarin kalaye hamrade ast

select P.CategoryID, P.ProductID, P.ProductName, P.UnitPrice, format(UnitPrice/(select max(UnitPrice) from Products where Products.CategoryID = P.CategoryID), 'P') as [price_Percentage]
From Products P
Order by P.CategoryID ASC, P.UnitPrice Desc


-- Exercise: Ghozeresh zir ra besazid

/* 
Date		SalesAmount   CumulativeSalesAmount
----		---------		---------------
1997-01-01		150				150
1997-01-02		100				250

*/

select * from Orders

select Convert(Date,OrderDate) [Date], count(OrderID) as SalesAmount, (select Count(OrderID) from Orders where Convert(Date,OrderDate) <= Convert(Date,O.OrderDate) and year(Convert(Date,OrderDate)) = 1997) as CumulativeSalesAmount
from Orders O
where year(Convert(Date,OrderDate)) = 1997
group by Convert(Date,OrderDate)
order by [Date] ASC


-- SUBQUERY AND WHERE

-- Example --> kalahayi ra list jonid k az motrvasete kalahaye sherkat gerantar hastand

SELECT P.ProductID, P.ProductName, P.UnitPrice, P.CategoryID 
FROM Products P
WHERE UnitPrice > (SELECT Avg(UnitPrice) FROM Products)


--Exercise --> kalahayi ra list jonid k az motrvasete kalahaye Ham rade khod gerantar hastand


SELECT P.ProductID, P.ProductName, P.UnitPrice, P.CategoryID, (SELECT Avg(UnitPrice) FROM Products WHERE CategoryID = P.CategoryID) AS [Avg_Price_Per_category]
FROM Products P
WHERE P.UnitPrice >= (SELECT Avg(UnitPrice) FROM Products WHERE CategoryID = P.CategoryID) -- Correlated SUBQUERY

-- Exercise --> find the highest price for each category by mixing "WHERE" AND "SUBQUERY"

SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName, P.UnitPrice
FROM Categories C INNER JOIN Products P
ON C.categoryID = P.CategoryID
WHERE P.UnitPrice = (SELECT MAX(UnitPrice) from Products where Products.CategoryID = C.CategoryID)
GROUP BY C.CategoryID, C.CategoryName, P.ProductID, P.ProductName , P.UnitPrice