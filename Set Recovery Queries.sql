/*

ALTER DATABASE [SSISDB] SET RECOVERY SIMPLE;

ALTER DATABASE [Pln_Db]  SET RECOVERY SIMPLE;

ALTER DATABASE [Pln_DB_Logs]  SET RECOVERY SIMPLE;

ALTER DATABASE [Pln_DB_Logs]  SET RECOVERY SIMPLE;


*/

select distinct InsertDateTime
from [Pln_Db].[Material].[FMC_Daily_Result]
Order by 1

select distinct InsertDateTime
from [Pln_Db].[Material].[MDC_WIP_Mizan]
Order by 1

select distinct InsertDateTime
from [Pln_Db].[Material].[MDC_WPRT]
Order by 1

select distinct InsertDateTime
from [Material2].[OMC_Result]
Order by 1


