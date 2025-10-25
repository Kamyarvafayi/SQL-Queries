select top 10000 * from [ABDDashboardDW].fact.openorderhistory


Select top 1000 ProductCode as [SKU Code], ProductNameEn,
                                       NewValue as QTY, format(CAST(NeedDate AS Date), 'yyyy-MM-dd', 'Fa-IR') as [Min Need Date],
                                       row_number() over(partition by ProductCode order by NeedDate) as row_Number
                                       from etl.ABDDashboardDW.fact.OpenOrderHistory
                                       where ReportDate = (select max(ReportDate) from etl.ABDDashboardDW.fact.OpenOrderHistory)
                                       and VersionId = 1

select top 1000 * from ETL.PBI.pbi.QCTagResult


