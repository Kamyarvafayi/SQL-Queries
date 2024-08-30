use Northwind

select * from [dbo].[Employees]

-- Like statement

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '7%'  -- 2 records

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '%7%'  -- 4 records

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '%7'  -- 0 records

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '7_2%'  -- 1 record ( starts with 0 then after beingg followed by any charcter 2 is the third character)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '%[0-9]%'  -- 7 records (all recordes with Number)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] Not like '%[0-9]%'  -- 7 records (all records without Number)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] Not like '%[0-9]%'  -- 2 records (all recordes with Number)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '%[0,1,2,3,9]%'  -- 6 records (all recordes with the numbers in brackets)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '[0-9][0-9][^0-9]%'  -- 1 record (all recordes with the 2 numbers followed by a char at first)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '[a-z]%'  -- 2 records (all recordes begins with characters)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '[a-z]%'  -- 2 records (all recordes begins with characters)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] like '[^C]%'  -- 8 records (all recordes do not begin with c)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] is not Null  -- 9 records (all recordes do not begin with c)

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] is Null  -- 1 record

Select EmployeeID, LastName, [Address] from [dbo].[Employees]
where [Address] is not Null  -- 9 records

select * from [dbo].[Employees]

-- Aggregator functions
select sum(convert(decimal(10,2),Extension)) from [dbo].[Employees] -- in decimal function the first arg is total number of digits and the second one is the number of decimals

select cast(avg(convert(float,Extension)) as decimal(10,2)) from [dbo].[Employees]

select cast(Min(convert(float,Extension)) as decimal(10,2)) from [dbo].[Employees]

select cast(Max(convert(float,Extension)) as decimal(10,2)) from [dbo].[Employees]

select cast(var(convert(float,Extension)) as decimal(10,2)) from [dbo].[Employees]

select cast(stdev(convert(float,Extension)) as decimal(10,2)) from [dbo].[Employees]

