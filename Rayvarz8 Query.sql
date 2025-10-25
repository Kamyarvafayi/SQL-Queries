select top 1000 * from ETL.rayvarz.ray.aarep33-- #(lf)where InsertDate = (select max(InsertDate) from pr.Planning_rep33)
--order by docdate DESC"]

select * from ABDETL.[PR].[Planning_Rep33]
where InsertDate = (select max(InsertDate) from ABDETL.[PR].[Planning_Rep33])



select * from ETL.rayvarz.ray.aarep33
where docdate between N'14040401' and N'14040705'

go;

with T as 
	(select [Product], [partno], [PartNoDsc], [serial],
			[qty], [OrderQty], [ProducerDesc], [SupplierName],
			[docdate], [tmpRcptDate], [Receiptdate], [ProductReceiptDate],
			[ExpirationDate], [StoreDsc], [QcNo], [ProccesName],
			[BatchRatio], [ConsTypeDesc], [CategoryDsc],
			[UntName], [DocTypeDesc], [BatchNo]
		from ETL.rayvarz.ray.aarep33
		where docdate between N'14040704' and N'14040705'
		and [SeriDesc] <> N'Èí ÇËÑ'),
Product as (Select RayvarzId, ProductNameEn
                   from ETL.amardb.qv.productexcel
                    where [IsActive] = 'True'),
TempJoin as (select T.*, Product.ProductNameEn from T
			left join Product
			on T.[Product] = Product.RayvarzId)

select	[Product], Coalesce(ProductNameEn, [PartNoDsc]) as ProductName, [serial], [partno], [PartNoDsc], [serial], [qty],
		[OrderQty], [ProducerDesc], [SupplierName], [docdate], [tmpRcptDate],
		[Receiptdate], [ProductReceiptDate], [ExpirationDate],
		[StoreDsc], [QcNo], [ProccesName], [BatchRatio],
		[ConsTypeDesc], [CategoryDsc], [UntName], [DocTypeDesc], [BatchNo] from TempJoin


-- BOM Details All Version




select * from etl.amardb.qv.bomdetailsallversion
                           where SelectVersionName not in (N'Na', N'NA', N'na', N'[NA]', N'[Na]')

						   
-- Demand
select top 1000 * from etl.pbi.pbi.SalesMAT
where
--revisionName Like '%F10'
--and
FiscalYear = '2025'

select * from etl.pbi.pbi.SalesMAT
where revisionName Like '%F10%'
and FiscalYear = '2025'


-- OpenOrder DB

Select * from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = N'2025-09-09'
                                   --and CAST(ReciveQtyDate AS Date) between N'2025-09-01' and N'2027-01-01'
                                   and VersionId = 54

-- Landing
select * from ABDETL.sup.Landing
where RevisionName like '%F10, 25%'


-- Product Inventory
Select  CenterId, BranchId, Date,
        Stock as [Stock(Qty)], RayvarzId
        from ETL.pbi.[pbi].DailyBranchSales
        where Date = '2025-09-27' 

select *
                                  from [PR].[V_LabratryLogBook]
								  where SampleTypeId in (52, 2)
								  and 
								  --where
								  Type = 'Plan'
								  order by MachineEndDateTime DESC
								  where CAST(MachineStartDateTime AS Date) between N'2025-10-01' and N'2025-11-01'
                                  --where CAST(StartDateTime AS Date) between N'2025-10-01' and N'2025-11-01'
                                  --and Cast(LoadedAt as Date) = N'2025-10-01'

								  Select ProductId, RayvarzId as [SKU Code],
                                  ProductNameEn as [SKU name], ProductNameFa,
                                  ProductFaAbr, ProductEnAbr, ProductCode,
                                  StrategicVariation as [Strategic Group],
                                  FranchiseIdDesc as Franchise,
                                  TypeIdDesc as [TYPE1],
                                  TypeCoatingIdDesc as Coated_Status,
                                  BrandName as Brand
                                  from ETL.amardb.qv.productexcel
                                  where [IsActive] = 'True'
                                  order by rayvarzid ASC

								  Select*
                                  from ETL.amardb.qv.productexcel
                                  where [IsActive] = 'True'
								  and rayvarzid = 7003662
                                  order by rayvarzid ASC

select 
CodeKala as [˜Ï ßÇáÇ],
SharheKala,
SerialBatch as [ÓÑíÇá íÇ ÈÌ],
Mojoodi + MandehMovaghat as Inv,
EnghezaSazandeh,
MandehMovaghat
from ABDPBI.abdetl.[SUP].[RayvarzReportHistorical_26]
where cast(ReportDate as Date)  = '2025-10-01'


SELECT CodeKala, OnvanKala, OnvanKalaLtn, ShomareSefaresh,
                              left(cast(TarikhSanad as nvarchar(10)), 6) ShMon,
                                KhalesTolid, TedadDarJabe
                                FROM  etl.[ABDDashboardDW].[pbi].[ProductProducedAmount_RayvarzRep84] 
                                WHERE ((storeno=59 and codekala in (7003331,7009150,7009165,7009160,7009175,7009180,7009170,7009101,7009103))
                                       or noeresid = 72 or (storeno=57 and codekala in (9000012,7006130))
                                       or (storeno  =18 and CodeKala IN ( 7005070, 7005516,7006110,7006120,7000500 )))
                                and
								left(cast(TarikhSanad as nvarchar(10)), 6) in ('140404', '140405', '140406')
                                and TedadDarJabe > 0
                                --and ShomareSefaresh > 1
								and codekala = 7009150
select  ShomareSefaresh, sum(KhalesTolid)
from etl.[ABDDashboardDW].[pbi].[ProductProducedAmount_RayvarzRep84] 
where codekala = 7009150
and left(cast(TarikhSanad as nvarchar(10)), 6) in ('140404', '140405', '140406')
group by ShomareSefaresh