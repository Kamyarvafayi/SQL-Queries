select  * from [dbo].[Employees]

-- Adding a new Computed Column 
Alter Table [dbo].[Employees]
add Age as DateDiff(year, [BirthDate], getdate())

Alter Table [dbo].[Employees]
add Gender as Case 
					when DateDiff(year, [BirthDate], getdate()) <= 60 then 'not old'
					when DateDiff(year, [BirthDate], getdate()) < 70 and DateDiff(year, [BirthDate], getdate()) > 60 then 'So So'
					when DateDiff(year, [BirthDate], getdate()) > 70 then 'Old'
					else 'Unknown'
				end
-- removing a column
Alter Table [dbo].[Employees]
add Age as (year([BirthDate]))


-- Adding A new fix Column
Alter Table [dbo].[Employees]
add Exercise_Column nvarchar(50)

-- Upadating the values in a table
UPDATE [dbo].[Employees]
SET [Exercise_Column]= N'Middle Aged'
where [Gender] = N'So So';


-- insert a new row
INSERT INTO [dbo].[Employees] ([LastName], [FirstName], [Title], [BirthDate])
VALUES ('Vafaeinejad', 'Kamyar', 'CEO', '1996-07-30');

Update [dbo].[Employees]
set [TitleOfCourtesy] = 'Mr.'
Where [LastName] = 'Vafaeinejad'

Update [dbo].[Employees]
set [Exercise_Column] = [Gender]
Where [Exercise_Column] is Null

Select * from [dbo].[Employees]

-- remove a row in a table
delete from [dbo].[Employees] where [LastName] = 'Vafaeinejad';

delete from [dbo].[Employees] where EmployeeID = 10;

delete from [dbo].[Employees] where EmployeeID in (11, 12);