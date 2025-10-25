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