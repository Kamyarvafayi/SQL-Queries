use Northwind;

go
create or alter schema dsp
Go

create Table dsp.firstdsp_tbl 
(id int Primary Key Identity, FirstName nvarchar(50), LastName nvarchar(50))


