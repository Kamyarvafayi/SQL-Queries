use Pln_Db

-- drop table Lab.SampleConflictManagement
create table Lab.SampleConflictManagement (id int identity (0, 1) Primary Key,
										   [ProcessId] nvarchar(5),
										   [Process] nvarchar(30),
										   [ProductId] nvarchar(20),
										   [RayvarzId] nvarchar(20),
										   [ProductName] nvarchar(200),
										   [BatchNum] nvarchar(20),
										   [BatchBox] float,
										   [Date] nvarchar(50),
										   [Sample Possible Date] nvarchar(50),
										   [Earliest Scheduled Test Date] nvarchar(50),
										   [ConflictStatus] nvarchar(50),
										   [InsertDateTime] DateTime)

go;

select * from Lab.SampleConflictManagement
select * from [Lab].[ReleaseEstimationResult]

exec USP_StoringSampleConflictManagement 10

-- truncate table Lab.SampleConflictManagement

-- truncate table [Lab].[ReleaseEstimationResult]

--ALTER TABLE [Material].[MDC_WIP_Mizan] 
--DROP CONSTRAINT [DF__MDC_WIP_M__Mater__7F2BE32F];

--Alter Table [Material].[MDC_WIP_Mizan]
--drop column [Material_Rabge_Status]


select * from [Material].[MDC_WIP_Mizan] where [Material_Range_Status] = 1

select *, case Comment
					when N'No Problem!' then 0
					else 1
					end as [Materail Status] from [Material].[FMC_Daily_Result] where InsertDateTime = (select max(InsertDateTime) from [Material].[FMC_Daily_Result])

select * from [Material].[FMC_Daily_Result]  where [Material Code] = '2200044'
Order by InsertDateTime


select * from [Material].[MDC_WIP_Mizan]

exec [dbo].[USP_StoringMDCMizan] 5