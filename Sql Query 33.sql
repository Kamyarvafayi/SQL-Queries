select Distinct InsertDateTime from [Material2].[OMC_Result]
order by 1;


with T as(
select ROW_NUMBER() over(partition by [material code] order by [Anbar name]) as Row_Num, * from [Material2].[OMC_Result]
where InsertDateTime = (select max(InsertDateTime) from [Material2].[OMC_Result]))

select * from T
order by [Material code], Row_Num


select [Anbar name], sum([Company Shortage]) over(Partition by [Anbar name]) from [Material2].[OMC_Result]

select Distinct InsertDateTime
from [Pln_Db].[Material2].[OMC_Result]
order by 1 DESC

select * from [Pln_Db].[Material2].[OMC_Result]
where InsertDateTime = (select max(InsertDateTime) 
					    from [Pln_Db].[Material2].[OMC_Result])

create Table [Pln_Db].[Material].[FMC_Production_Risk] (id int Primary key identity(0, 1), 
														RayvarzId nvarchar(20),
														ProductNameEn nvarchar(300),
														[Under Risk Production (RM)] float,
														[Ok Production (RM)] float,
														InsertDateTime DateTime)


select * from [Pln_Db].[Material].[FMC_Production_Risk]


-- execute [dbo].[USP_RemoveOldTableData] '30', '[Pln_Db].[Material].[FMC_Production_Risk]'


-- execute [dbo].[USP_RemoveOldTableData] '30', '[Pln_Db].[Material].[FMC_Daily_Result]'

create Table [Pln_Db].[Material].[FMC_Production_Risk_Details] (id bigint Primary key identity(0, 1),
																RayvarzId nvarchar(20),
																ProductNameEn nvarchar(300),
																ForecastActualDeviation float,
																[OP Type] nvarchar(50),
														        [Material Code] nvarchar(20),
																[Material Description] nvarchar(400),
																[Material Unit] nvarchar(50),
																[Type] nvarchar(50),
																[BOM Type] nvarchar(50),
																[Alt_MaterialId] nvarchar(20),
																[Alt_MaterialName] nvarchar(400),
																[Main Code Inv] float,
																[Alternative  Code Inv] float,
																[Total Green Inv] float,
																[Total Material Usage] float,
																InsertDateTime DateTime)

--execute [dbo].[USP_RemoveOldTableData] '30', '[Pln_Db].[Material].[FMC_Production_Risk_Details]'


select T1.*, T2.[Under Risk Production (RM)], T2.[Ok Production (RM)] from [Pln_Db].[Material].[FMC_Production_Risk_Details] T1
inner join 
[Material].[FMC_Production_Risk] T2
on T1.RayvarzId = T2.RayvarzId
where T1.[BOM Type] in ('RM', 'Coat')
and T1.[Total Material Usage] is not null
and T1.[Total Material Usage] > T1.[Total Green Inv]


