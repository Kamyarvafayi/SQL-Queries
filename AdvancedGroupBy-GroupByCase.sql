-- Group by Case
-- Example 1

select Case
		when UnitPrice <= 10 then N'Cheap'
		when UnitPrice <= 30 then N'Moderate'
		when UnitPrice >= 30 then N'Expensive'
		else 'Unknown'
		end as PriceStatus , count(ProductID) as ProdCount
from Products
Group by Case
		when UnitPrice <= 10 then N'Cheap'
		when UnitPrice <= 30 then N'Moderate'
		when UnitPrice >= 30 then N'Expensive'
		else 'Unknown'
		end;

-- Example 2 
with temptable as (select Case
		when UnitPrice <= 10 then N'Cheap'
		when UnitPrice <= 30 then N'Moderate'
		when UnitPrice >= 30 then N'Expensive'
		else 'Unknown'
		end as PriceStatus , count(ProductID) as ProdCount
from Products
Group by Case
		when UnitPrice <= 10 then N'Cheap'
		when UnitPrice <= 30 then N'Moderate'
		when UnitPrice >= 30 then N'Expensive'
		else 'Unknown'
		end)

select * from temptable
order by Case PriceStatus
		when N'Cheap'then 1
		when N'Moderate' then 2
		when N'Expensive' then 3
		else 4
		end


-- Example 3
select * from Employees

select Case
		when DATEDIFF(year,BirthDate, getDate()) < 60 then N'Young'
		when DATEDIFF(year,BirthDate, getDate()) < 70 then N'MiddleAged'
		when DATEDIFF(year,BirthDate, getDate()) < 70 then N'Old'
		else N'Unknown'
		end as AgeRange, count(EmployeeId) as EmployeeCount
from Employees
Group by Case
		when DATEDIFF(year,BirthDate, getDate()) < 60 then N'Young'
		when DATEDIFF(year,BirthDate, getDate()) < 70 then N'MiddleAged'
		when DATEDIFF(year,BirthDate, getDate()) < 70 then N'Old'
		else N'Unknown'
		end

-- Example 4
Declare @MinOrderDate datetime
set @MinOrderDate = (select Min(BirthDate) from Employees)
select @MinOrderDate 
-- select DATEDIFF(year,BirthDate, @MinOrderDate) from Employees
select Case
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) > 25 then N'Young'
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) >= 7 then N'MiddleAged'
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) < 7 then N'Old'
		else N'Unknown'
		end as AgeRange, count(EmployeeId) as EmployeeCount
from Employees
Group by Case
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) > 25 then N'Young'
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) >= 7 then N'MiddleAged'
		when abs(DATEDIFF(year,BirthDate, @MinOrderDate)) < 7 then N'Old'
		else N'Unknown'
		end
