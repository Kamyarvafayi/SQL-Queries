select  [Anbar_Code] as [انبار],
[Anbar_Name] as [انبار],
CodeKala as [کد كالا],
SharheKala as [شرح كالا],
SerialBatch as [سريال يا بج],
Mojoodi as [موجودي],
Model as [مدل],
ControlNo as [كنترل],
ShomarehSefaresh as [شماره سفارش],
ShenasehPart as [شناسه پارت],
Mojavez as [مجوز],
ShomarehMovaghat as [ش موقت],
ShomarehDaem as [ش دائم],
Sazandeh_Code as [سازنده],
Sazandeh_Name as [نام سازنده],
TaminKonandeh_Code as [تامين کننده],
TaminKonandeh_Name as [نام تامين کننده],
TarikhMovaghat as [تاريخ موقت],
TarikhDaem as [تاريخ دائم],
BehineSazandeh as [بهينه سازنده],
BehineQC as [بهينه QC],
EnghezaSazandeh as [انقضا سازنده],
MabnayeHavaleh as [مبناي حواله],
VaziatMasraf as [وضعيت مصرف],
MojoodiVaredeh as [موجودي وارده],
MojoodiSadereh as [موجودي صادره],
MandehMovaghat as [مانده موقت],
AkharinAnbarEnteghali_Code as [آخرين انبار انتقالي],
AkharinAnbarEnteghali_Name as [آخرين انبار انتقالي]

from ABDPBI.abdetl.[SUP].[RayvarzReportHistorical_26]
where cast(ReportDate as Date)  = '2025-09-23'
--where ReportDate = (select max(ReportDate)
					--from ABDPBI.abdetl.[SUP].[RayvarzReportHistorical_26])


select RayvarzId, BranchID, BranchName, DateID,
		sum(cast(Nextmonth1 as float)) over(partition by RayvarzId, BranchID Order by DateID, RayvarzId, BranchID)
		from iedb.[DSP].[Demand_LP]
		where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP])
		and subVersion = (select max(subVersion) from iedb.[DSP].[Demand_LP]
							where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP]))


select RayvarzId, BranchID, BranchName,
		row_number() over(Partition by RayvarzId order by RayvarzId, BranchID, BranchName) as [row-number]
		from iedb.[DSP].[Demand_LP]
		where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP])
		and subVersion = (select max(subVersion) from iedb.[DSP].[Demand_LP]
							where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP]))
go;

with TemTBL as
(select RayvarzId, BranchID, BranchName,
		dense_rank() over(Partition by RayvarzId order by RayvarzId, BranchID, BranchName) as [Rank]
		from iedb.[DSP].[Demand_LP]
		where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP])
		and subVersion = (select max(subVersion) from iedb.[DSP].[Demand_LP]
							where VersionName = (select max(VersionName) from iedb.[DSP].[Demand_LP])))

select * from TemTBL order by RayvarzId, [Rank]
