use Pln_Db
select * from [Material].[FMC_Daily_Result]

use Pln_Db
select * from [Material].[MDC_WIP_Mizan]

use Pln_Db
select * from [Material].[MDC_WPRT]

use Pln_Db
insert into [Material].[MDC_WPRT]([Material Code]) values('2231')


use Pln_Db
insert into [testschema].[test1] ([Name]) values('2231')

truncate table [testschema].[test1]

select * from [testschema].[test1]
