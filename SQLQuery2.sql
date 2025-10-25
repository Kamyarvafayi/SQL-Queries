select top 100 * from ETL.PBI.pbi.ReceiptDetails 
where PartNo = '1101550'
and DocDate <> '4352005010'
and cast(DocDate as nvarchar(20)) >= N'14040601'

select count(*) from ETL.PBI.pbi.ReceiptDetails 

select max(QCApprovalDate) from ETL.PBI.pbi.ReceiptDetails 
where PartNo = '1101550'
and DocDate <> '4352005010'
and cast(DocDate as nvarchar(20)) >= N'14040601'


Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = '2025-10-08'
                                   and CAST(ReciveQtyDate AS Date) between N'2025-09-01' and '2026-12-30'
								   and ProductCode in (1110058, 2228575)
                                   and VersionId = 55
                                   order by [Receive Date] ASC

select * from etl.amardb.qv.MPS
                             where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType = 'Forecast')
                             and Month = (select min(Month) from etl.amardb.qv.MPS
                                          where RevId = (select max(revid) from etl.amardb.qv.MPS where TargetType = 'Forecast'))

select max(ActualStartTime) from etl.amardb.qv.performancereport


Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = (select max(ReportDate) from etl.ABDDashboardDW.fact.OpenOrderHistory)
                                   and CAST(ReciveQtyDate AS Date) between '2025-10-08' and '2025-11-21'
                                   and VersionId = 1
								   and ProductCode = '1165640'
                                   order by [Receive Date] DESC



etl.pbi.pbi.[RayvarzReportHistorical_26]



