
Select WeeklyplanSmlP as PlanNumber, MachineId as MachineCode, MachineDscFa as MachineName,
ProcessId, M_rayId as MrayId, ProcessNameFa as Process,
ProductId, RayvarzId, ProductNameFa as ProductName, BacthNo as BatchNum, SubBacthNo as subBatch, DateID as Date, Unit as Count, Kilo as Weight, Box, NetTimeP, Shift as ShiftId,
shiftName as Shift, version as [Version], BatchBox, StartTime as [Start Time], FinishTime as [Finish Time], TimeMin as [Total Time],
NetTime as [Net Required Time], PlanTypeId as [Plan Type], Duration, BomVersion
from Etl.amardb.qv.comparedailyplanallversion
where PlanTypeId = 26
and BatchBox > 0 and DateID
between '14040624' and '14040701'


Select Distinct *
from ETL.amardb.qv.SizepartIndex
where M_rayId= 'S1600' and Time > 0

Select avg([Time])
from ETL.amardb.qv.SizepartIndex
where M_rayId= 'S1600' and Time > 0