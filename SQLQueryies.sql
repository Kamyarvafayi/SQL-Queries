select * from etl.amardb.qv.MPS
                             where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType = 'Forecast'
                                                                                     and IsLastF = 'TRUE')
                             and Month = (select min(Month) from etl.amardb.qv.MPS
                                          where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType = 'Forecast'
                                                                                                  and IsLastF = 'TRUE')) 
select * from etl.amardb.qv.MPS
                             where RevName = 'Production F10, 25'
							 and Month = (select min(Month) from etl.amardb.qv.MPS
                                          where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType = 'Forecast'))

use abdetl
Select RequestDate, Cast(NeedDate as Date) as [NeedDate], Dscp, CreateDate, MeetingNo,
                               CAST(ReciveQtyDate AS Date) as [Receive Date], SupplierName, RecivePlanName, ReportDate,
                               ProductNameEn, BuyGroupName, DefReciveDate, ManufacturerName,
                               PartyStatus, EarlyDefReciveDate, ExchangeAbv, PaymentType,
                               UnitName, IRCExpireDate, EstimateDate, IRC, OrderingNumber,
                               MethodName, CommitteeDscp, dscpContract, LtOrderNo,
                               ConfirmDate, BuyGroupNameParty, BCon, IsFinal, IsLast,
                               isbalancing,  ProductID, RequestNo, ReqQty, OrderNo,
                               OrderQty, ReciptQty, ordQty, PartyQty, SupplierId,
                               ProductCode as [SKU Code],
                               OrderDtlId, BuyGroupHdrId,
                               ReciveMonth, PartyID,
                               BudgetYear,
                               EstimateMonth, PaymentConditionId,
                               PaymentConditionParentId,
                               MakerId, ParentPartyId,
                               ReciptPartyId, MethodId,
                               LastStartedRecivePlanID,
                               FirstStartedRecivePlanID,
                               BuyGroupHdrIdParty, OrderTypeId,
                               Allocation, ExchangeId,
                               ExchangeDtlId, ExchangeRate,
                               VersionId,
                               NewValue as QTY, RecivePlanId,
                               CAST(PartyNeedDate AS Date) as [PartyNeedDate]
                               from etl.ABDDashboardDW.fact.OpenOrderHistory
                               where ReportDate = N'2025-09-09'
                               and CAST(ReciveQtyDate AS Date) between N'{}' and N'{}'
                               and BuyGroupHdrId in ('6', '7', '8', '17', '39', '23', 6, 7, 8, 17, 39, 23)
                               and VersionId in (54, '54')

select distinct versionId
from [SUP].[OpenOrderHistory] 
where ReportDate > N'2025-09-01'
--and VersionId in (54, '54')

select * from etl.ABDDashboardDW.fact.OpenOrderHistory
                               where ReportDate = N'2025-09-09'
							   and VersionId in (54, '54')



select Distinct Month, TargetType from etl.amardb.qv.MPS
                    where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType in ('Budget'))
                                  Order by Month


select PurchaseRevName from etl.pbi.pbi.TargetRelation






select PurchaseRevName from etl.pbi.pbi.TargetRelation
                                           --where PurchaseRevName like '%B%'
                                           --and PurchaseRevName like '%{}%'

select  [Anbar_Code] as [«‰»«—],
[Anbar_Name] as [«‰»«—],
CodeKala as [òœ ﬂ«·«],
SharheKala as [‘—Õ ﬂ«·«],
SerialBatch as [”—Ì«· Ì« »Ã],
Mojoodi as [„ÊÃÊœÌ],
Model as [„œ·],
ControlNo as [ﬂ‰ —·],
ShomarehSefaresh as [‘„«—Â ”›«—‘],
ShenasehPart as [‘‰«”Â Å«— ],
Mojavez as [„ÃÊ“],
ShomarehMovaghat as [‘ „Êﬁ ],
ShomarehDaem as [‘ œ«∆„],
Sazandeh_Code as [”«“‰œÂ],
Sazandeh_Name as [‰«„ ”«“‰œÂ],
TaminKonandeh_Code as [ «„Ì‰ ò‰‰œÂ],
TaminKonandeh_Name as [‰«„  «„Ì‰ ò‰‰œÂ],
TarikhMovaghat as [ «—ÌŒ „Êﬁ ],
TarikhDaem as [ «—ÌŒ œ«∆„],
BehineSazandeh as [»ÂÌ‰Â ”«“‰œÂ],
BehineQC as [»ÂÌ‰Â QC],
EnghezaSazandeh as [«‰ﬁ÷« ”«“‰œÂ],
MabnayeHavaleh as [„»‰«Ì ÕÊ«·Â],
VaziatMasraf as [Ê÷⁄Ì  „’—›],
MojoodiVaredeh as [„ÊÃÊœÌ Ê«—œÂ],
MojoodiSadereh as [„ÊÃÊœÌ ’«œ—Â],
MandehMovaghat as [„«‰œÂ „Êﬁ ],
AkharinAnbarEnteghali_Code as [¬Œ—Ì‰ «‰»«— «‰ ﬁ«·Ì],
AkharinAnbarEnteghali_Name as [¬Œ—Ì‰ «‰»«— «‰ ﬁ«·Ì]

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




Select *, CAST(MachineStartDateTime AS Date) as [StartDate]
                                  from [PR].[V_LabratryLogBook]
                                  where Type like '%Plan%'
                                  and SampleType = 'Product Laboratory'
                                  and CAST(MachineStartDateTime AS Date) between N'2025-09-23' and N'2025-11-22'

go

declare @max_CD date = (select cast(max(CreateDate) as Date) from etl.ABDDashboardDW.[buy].[vwOpenOrderHistory])

Select *, CAST(ReciveQtyDate AS Date) as [Receive Date]  
                               from etl.ABDDashboardDW.[buy].[vwOpenOrderHistory]
                               where VersionId = 1
							   and cast(CreateDate as Date) = '2'

select top 1000 * from etl.pbi.pbi.productionmat


select * from etl.ABDDashboardDW.fact.OpenOrderHistory
where ReportDate = N'2025-09-09' and VersionId = 54