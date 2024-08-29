use Northwind
select * from [dbo].[Order Details];

go

create or alter function ChooseBetweenPrice (@First_Row int, @Last_Row int)
returns Table
as
return 
(with 
			temp1 as(select top (@Last_Row) * from [dbo].[Products] order by [dbo].[Products].[UnitPrice] Desc)


select top (@Last_Row - @First_Row) with ties * from temp1 order by temp1.[UnitPrice] ASC)

go

select * from ChooseBetweenPrice (30, 40)

go

create or alter Function NthPrice (@FirstRow int)
returns Table
as

return 
with temp1 as 
				(select top (@FirstRow) * from [Products] order by [UnitPrice] Desc)

select top 1 with ties *  from temp1 order by [UnitPrice] ASC

go

select * from NthPrice (10)

select top (40) * from [Products] order by [UnitPrice] Desc