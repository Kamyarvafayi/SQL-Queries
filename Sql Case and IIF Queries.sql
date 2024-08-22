use Northwind
select All * 
from [dbo].[Employees] E

--
select FirstName, LastName, Case 
								when E.[TitleOfCourtesy] = N'Mr.' Then N'Male'
								when E.[TitleOfCourtesy] = N'Ms.' Then N'Female'
								when E.[TitleOfCourtesy] = N'Mrs.' Then N'Female'
								else 'Unknown'
								end as [Gender]
from [dbo].[Employees] E

--
select FirstName, LastName, IIF(E.[TitleOfCourtesy] = N'Mr.', 'Male', 'Not Male') as [Gender]
from [dbo].[Employees] E

--
select Distinct E.FirstName, E.LastName,
IIF(E.[TitleOfCourtesy] = N'Mr.', 'Male', 'Not Male')  as [Gender]
from [dbo].[Employees] E
order by [Gender] ASC

--
select Top 5 E.FirstName, E.LastName,
IIF(E.[TitleOfCourtesy] = N'Mr.', 'Male', 'Not Male')  as [Gender]
from [dbo].[Employees] E
order by [Gender] ASC


select Top 20 Percent E.FirstName, E.LastName,
IIF(E.[TitleOfCourtesy] = N'Mr.', 'Male', 'Not Male')  as [Gender]
from [dbo].[Employees] E
order by [Gender] ASC

--
select Top 2 with ties FirstName, LastName, Case 
								when E.[TitleOfCourtesy] = N'Mr.' Then N'Male'
								when E.[TitleOfCourtesy] = N'Ms.' Then N'Female'
								when E.[TitleOfCourtesy] = N'Mrs.' Then N'Female'
								else 'Unknown'
								end as [Gender]
from [dbo].[Employees] E
order by [Gender]

select TitleOfCourtesy, Count(City) from [dbo].[Employees]
group by TitleOfCourtesy
order by TitleOfCourtesy Desc

