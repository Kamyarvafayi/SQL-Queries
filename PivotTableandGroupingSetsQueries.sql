-- Grouping Sets
-- Example 1
select EmployeeID, year(OrderDate), count(OrderID) 
from Orders
group by Grouping Sets ((EmployeeID,  year(OrderDate)), ())

-- Example 2
select EmployeeID, year(OrderDate), count(OrderID) 
from Orders
group by Grouping Sets ((EmployeeID,  year(OrderDate)), (EmployeeID), ())

-- pivot Table
-- Example 1
select EmployeeId, year(OrderDate),	Case when year(OrderDate) = 1996 then 1 else 0 end as Order1996,
								Case when year(OrderDate) = 1997 then 1 else 0 end as Order1997,
								Case when year(OrderDate) = 1998 then 1 else 0 end as Order1998
from Orders

select EmployeeId,	sum(Case when year(OrderDate) = 1996 then 1 else 0 end) as Order1996,
								sum(Case when year(OrderDate) = 1997 then 1 else 0 end) as Order1997,
								sum(Case when year(OrderDate) = 1998 then 1 else 0 end) as Order1998,
								count(OrderID) as TotalCount
from Orders
where year(OrderDate) in (1996, 1997, 1998)
group by EmployeeId
order by EmployeeId

-- Example 1-1
select EmployeeId,	Count(Case when year(OrderDate) = 1996 then 1 end) as Order1996,
								Count(Case when year(OrderDate) = 1997 then 1 end) as Order1997,
								Count(Case when year(OrderDate) = 1998 then 1 end) as Order1998,
								count(OrderID) as TotalCount
from Orders
where year(OrderDate) in (1996, 1997, 1998)
group by EmployeeId
order by EmployeeId

-- Example 2 Creating A table then inserting rows and finally doing pivot Table on the table

--Create DataBase Pivot_DB

--Use Pivot_DB

Create Table Emplo_Inf (Emp_ID int NOT NULL PRIMARY KEY IDENTITY,
						FirstName nvarchar(50), 
                        LastName nvarchar(50),
						Gender nvarchar(50) Check (Gender in ('F','M')), 
						Salary int Check (Salary Between 1 AND 80000)
						)

--Use Northwind
--DROP Table dbo.Emplo_Inf

Insert into Emplo_Inf (FirstName, LastName, Gender, Salary) Values ('Mahyar', 'Vafaeinejad', 'M', 27000),
																   ('Kamyar', 'Vafaeinejad', 'M', 33000),
																   ('Ramtin', 'Rostamian', 'M', 5000),
																   ('Mozhgan', 'Rafie', 'F', 10000),
																   ('Sara', 'Bayat', 'F', 20000),
																   ('Ali', 'Fazli', 'M', 75000),
																   ('Narges', 'Shahgholi', 'F', 45000),
																   ('Maryam', 'Iranshahi', 'F', 55000),
																   ('Reza', 'Koohi', 'M', 4700),
																   ('Shideh', 'Safaei', 'F', 16000),
																   ('Afsaneh', 'Soltani', 'F', 64000),
																   ('MohammadHossein', 'Vafaeinejad', 'M', 31000)



/* Male count    Female Count    Total Count      Male Salary      Female Salary    Total Salary

Young
Middle-Aged
Old

*/
select * from Emplo_Inf

-- alter Table Emplo_Inf 
-- add BirthDate DateTime Not Null Default('1996-07-30')

/*update Emplo_Inf 
set BirthDate = '1994-09-21' where Emp_ID = 1

update Emplo_Inf 
set BirthDate = '1994-03-09' where Emp_ID = 3

update Emplo_Inf 
set BirthDate = '1978-05-28' where FirstName = 'Mozhgan'

update Emplo_Inf 
set BirthDate = '2006-11-03' where FirstName = 'Sara'

update Emplo_Inf 
set BirthDate = '1946-12-06' where Emp_ID = 6

update Emplo_Inf 
set BirthDate = '1952-04-14' where Emp_ID = 7

update Emplo_Inf 
set BirthDate = '1974-01-17' where Emp_ID = 8

update Emplo_Inf 
set BirthDate = '1985-07-20' where Emp_ID = 9

update Emplo_Inf 
set BirthDate = '2001-06-10' where Emp_ID = 10

update Emplo_Inf 
set BirthDate = '1969-04-23' where Emp_ID = 11

update Emplo_Inf 
set BirthDate = '1961-07-24' where Emp_ID = 12*/


Alter Table Emplo_Inf
Add [Salary_Range] nvarchar(20) 

Update Emplo_Inf
Set [Salary_Range] = Case
				WHEN Salary Between 0 AND 6000 THEN 'Poor'
				WHEN Salary Between 6001 AND 20000 THEN 'Normal'
				WHEN Salary Between 20001 AND 50000 THEN 'Rich'
				Else 'Wealthy'
				END



select * from Emplo_Inf

Alter Table Emplo_Inf
Add [Age] int 

Update Emplo_Inf
Set [Age] = DateDiff(Year, BirthDate, GetDate())


Alter Table Emplo_Inf
Add [Age_Range] nvarchar(50) 

Update Emplo_Inf
Set [Age_Range] = Case 
					when [Age] <= 35 then 'Young'
					when [Age] between 36 and 60 then 'MiddleAged'
					when [Age] >= 61 then 'Octogenerian'
					end





Select Emp_ID, FirstName, Gender, Salary,  CASE WHEN Gender = 'M' Then 1 else 0 END AS [Male],
                                   CASE WHEN Gender = 'F' Then 1 else 0 END AS [Female],
								   CASE WHEN Gender = 'M' Then Salary else 0 END AS [Male_Salary],
								   CASE WHEN Gender = 'F' Then Salary else 0 END AS [Female_Salary]
From Emplo_Inf

select * from Emplo_Inf

Select [Age_Range], sum(CASE WHEN Gender = 'M' Then 1 else 0 END) AS [Male],
					sum(CASE WHEN Gender = 'F' Then 1 else 0 END) AS [Female],
					Count(FirstName) As [Total_Person],
					sum(CASE WHEN Gender = 'M' Then Salary else 0 END) AS [Male_Salary],
					sum(CASE WHEN Gender = 'F' Then Salary else 0 END) AS [Female_Salary],
					sum(Salary) As [Total_Salary]
From Emplo_Inf
--GROUP BY [Age_Range]
GROUP BY Grouping Sets (([Age_Range]), ())