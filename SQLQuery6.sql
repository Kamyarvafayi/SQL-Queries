Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = (select max(ReportDate) from etl.ABDDashboardDW.fact.OpenOrderHistory)
                                   and CAST(ReciveQtyDate AS Date) between N'2025-10-05' and N'2025-12-23'
                                   and VersionId = 1
								   and ProductCode = 2239400
                                   order by [Receive Date] DESC






Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = '2025-09-20'
                                   and CAST(ReciveQtyDate AS Date) between N'2025-09-20' and N'2025-12-23'
                                   and VersionId = 1
								   and ProductCode = 2239400
                                   order by [Receive Date] DESC

Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from abdpbi.abdetl.[SUP].[OpenOrderHistory]
                                   where ReportDate = '2025-10-04'
                                   and CAST(ReciveQtyDate AS Date) between N'2025-10-04' and N'2025-12-23'
                                   and VersionId = 1
								   and ProductCode = 2239400
                                   order by [Receive Date] DESC

Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
                                   CAST(ReciveQtyDate AS Date) as [Receive Date],
                                   NewValue as QTY, ReportDate
                                   from etl.ABDDashboardDW.fact.OpenOrderHistory
                                   where ReportDate = '2025-10-05'
                                   and CAST(ReciveQtyDate AS Date) between N'2025-10-06' and N'2025-10-22'
                                   and VersionId = 1
								   and ProductCode = 1101585
                                   order by [Receive Date] DESC;

with T as(
	Select RequestNo, ProductCode as [SKU Code], ProductNameEn,
									   CAST(ReciveQtyDate AS Date) as [Receive Date],
									   NewValue as QTY, ReportDate
									   from etl.ABDDashboardDW.fact.OpenOrderHistory
									   where ReportDate = '2025-10-05'
									   and CAST(ReciveQtyDate AS Date) between N'2025-10-06' and N'2025-10-22'
									   and VersionId = 1
									   and ProductCode = 1101585)
select sum(QTY) as [Total Open Order] from T




SELECT d_beh.DateId AS ShamsiBehineSazandeh,
       d_beh.DateG AS MiladiBehineSazandeh,
       CASE LEFT(rrh.BehineQC, 1)
           WHEN 1 THEN
               rrh.BehineQC
           WHEN 2 THEN
               FORMAT(CAST(CAST(rrh.BehineQC AS VARCHAR(8)) AS DATE), 'yyyyMMdd', 'fa')
           ELSE
               NULL
       END AS ShamsiBehineQC,
       rrh.*
INTO #temp1
FROM ABDETL.SUP.RayvarzReportHistorical_26 rrh
    LEFT JOIN GNR.dimdate d_beh
        ON d_beh.DateId = rrh.BehineSazandeh
WHERE LEFT(rrh.BehineSazandeh, 1) = '1' /*Shamsi*/
      AND rrh.ReportDate >= DATEADD(DAY, -60, GETDATE())
UNION ALL
SELECT d_beh.DateId AS ShamsiBehineSazandeh,
       d_beh.DateG AS MiladiBehineSazandeh,
       CASE LEFT(rrh.BehineQC, 1)
           WHEN 1 THEN
               rrh.BehineQC
           WHEN 2 THEN
               FORMAT(CAST(CAST(rrh.BehineQC AS VARCHAR(8)) AS DATE), 'yyyyMMdd', 'fa')
           ELSE
               NULL
       END AS ShamsiBehineQC,
       rrh.*
FROM ABDETL.SUP.RayvarzReportHistorical_26 rrh
    LEFT JOIN GNR.dimdate d_beh
        ON d_beh.DateIDM = rrh.BehineSazandeh
WHERE LEFT(rrh.BehineSazandeh, 1) != '1' /*Miladi*/
      AND rrh.ReportDate >= DATEADD(DAY, -60, GETDATE());



SELECT DATEADD(DAY, -1, ReportDate) AS ReportDate_Closing,
       CASE
           WHEN x.EnghezaSazandeh != 0 THEN
               d_engh.DateId
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 67, 72, 734 ) /*API,Cobel Supp.,SP*/
       THEN
               FORMAT(DATEADD(YEAR, 2, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 73, 74, 75, 76, 77 ) /*Excipient*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 79, 84, 90, 160047, 160051 ) /*Foil,Filter Paper,Other,Silicagel,syring*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 69, 160048, 91, 70, 71, 160050, 160092, 744, 81, 82 ) /*Box,volumetric measure,Wallet,Brochure,Cardboard,Carton,Heat sticker,Holder,Hologram,Lable,Mother Box,Paper*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 68, 95 ) /*Bottle,Cap*/
       THEN
               FORMAT(DATEADD(YEAR, 3, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 80, 742, 743 ) /*Isinglass */
                AND
                (
                    a.ProductNameEn LIKE N'%PVC%'
                    OR a.ProductNameEn LIKE N'%PVDC%'
                ) THEN
               FORMAT(DATEADD(YEAR, 1, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 80, 742, 743 ) /*Isinglass */
                AND a.ProductNameEn LIKE N'%Alu%' THEN
               FORMAT(DATEADD(YEAR, 2, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 67, 72, 734, 73, 74, 75, 76, 77 ) THEN
               NULL
           WHEN a.CategoryId IN ( 79, 84, 90, 160047, 160051 )
                OR a.CategoryId IN ( 69, 160048, 91, 70, 71, 160050, 160092, 744, 81, 82 ) THEN
               FORMAT(DATEADD(YEAR, 4, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 68, 95 ) THEN
               FORMAT(DATEADD(YEAR, 3, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 80, 742, 743 )
                AND
               (
                    a.ProductNameEn LIKE N'%PVC%'
                    OR a.ProductNameEn LIKE N'%PVDC%'
                ) THEN
               FORMAT(DATEADD(YEAR, 1, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 80, 742, 743 )
                AND a.ProductNameEn LIKE N'%Alu%' THEN
               FORMAT(DATEADD(YEAR, 2, d_mov.DateG), 'yyyyMMdd', 'fa')
       END AS FinalExpiryDate,
       DATEDIFF(MONTH, d_mov.DateG, GETDATE()) AS TemporaryDate_DiffMonths,
       d_engh.DateId AS ShamsiEnghezaSazandeh,
       d_mov.DateId AS ShamsiTarikhMovaghat,
       x.*
INTO #temp2
FROM #temp1 x
    LEFT JOIN SUP.AllParts a
        ON a.RayvarzId = x.CodeKala
    LEFT JOIN GNR.dimdate d_engh
        ON d_engh.DateIDM = x.EnghezaSazandeh
    LEFT JOIN GNR.dimdate d_mov
        ON d_mov.DateId = x.TarikhMovaghat;

                                SELECT DISTINCT MaterialID, MaterialName 
INTO #temp3
FROM pr.bomdetailsallversion
WHERE SelectVersion <> 0
AND PreviousBomDtl = 0

SELECT #temp2.*, #temp3.materialname AS IsBOM FROM #temp2
LEFT JOIN #temp3
ON #temp3.materialid = #temp2.CodeKala

----------------
-------------------------------
-----------------------------------------------------------
drop table if exists #temp1
drop table if exists #temp2
drop table if exists #temp3

SELECT d_beh.DateId AS ShamsiBehineSazandeh,
       d_beh.DateG AS MiladiBehineSazandeh,
       CASE LEFT(rrh.BehineQC, 1)
           WHEN 1 THEN
               rrh.BehineQC
           WHEN 2 THEN
               FORMAT(CAST(CAST(rrh.BehineQC AS VARCHAR(8)) AS DATE), 'yyyyMMdd', 'fa')
           ELSE
               NULL
       END AS ShamsiBehineQC,
       rrh.*
INTO #temp1
FROM ABDETL.SUP.RayvarzReportHistorical_26 rrh
    LEFT JOIN GNR.dimdate d_beh
        ON d_beh.DateId = rrh.BehineSazandeh
WHERE LEFT(rrh.BehineSazandeh, 1) = '1' /*Shamsi*/
      AND rrh.ReportDate >= DATEADD(DAY, -1, GETDATE())
UNION ALL
SELECT d_beh.DateId AS ShamsiBehineSazandeh,
       d_beh.DateG AS MiladiBehineSazandeh,
       CASE LEFT(rrh.BehineQC, 1)
           WHEN 1 THEN
               rrh.BehineQC
           WHEN 2 THEN
               FORMAT(CAST(CAST(rrh.BehineQC AS VARCHAR(8)) AS DATE), 'yyyyMMdd', 'fa')
           ELSE
               NULL
       END AS ShamsiBehineQC,
       rrh.*
FROM ABDETL.SUP.RayvarzReportHistorical_26 rrh
    LEFT JOIN GNR.dimdate d_beh
        ON d_beh.DateIDM = rrh.BehineSazandeh
WHERE LEFT(rrh.BehineSazandeh, 1) != '1' /*Miladi*/
      AND rrh.ReportDate >= DATEADD(DAY, -1, GETDATE());



SELECT DATEADD(DAY, -1, ReportDate) AS ReportDate_Closing,
       CASE
           WHEN x.EnghezaSazandeh != 0 THEN
               d_engh.DateId
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 67, 72, 734 ) /*API,Cobel Supp.,SP*/
       THEN
               FORMAT(DATEADD(YEAR, 2, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 73, 74, 75, 76, 77 ) /*Excipient*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 79, 84, 90, 160047, 160051 ) /*Foil,Filter Paper,Other,Silicagel,syring*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 69, 160048, 91, 70, 71, 160050, 160092, 744, 81, 82 ) /*Box,volumetric measure,Wallet,Brochure,Cardboard,Carton,Heat sticker,Holder,Hologram,Lable,Mother Box,Paper*/
       THEN
               FORMAT(DATEADD(YEAR, 4, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 68, 95 ) /*Bottle,Cap*/
       THEN
               FORMAT(DATEADD(YEAR, 3, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 80, 742, 743 ) /*Isinglass */
                AND
                (
                    a.ProductNameEn LIKE N'%PVC%'
                    OR a.ProductNameEn LIKE N'%PVDC%'
                ) THEN
               FORMAT(DATEADD(YEAR, 1, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN x.BehineSazandeh != 0
                AND a.CategoryId IN ( 80, 742, 743 ) /*Isinglass */
                AND a.ProductNameEn LIKE N'%Alu%' THEN
               FORMAT(DATEADD(YEAR, 2, x.MiladiBehineSazandeh), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 67, 72, 734, 73, 74, 75, 76, 77 ) THEN
               NULL
           WHEN a.CategoryId IN ( 79, 84, 90, 160047, 160051 )
                OR a.CategoryId IN ( 69, 160048, 91, 70, 71, 160050, 160092, 744, 81, 82 ) THEN
               FORMAT(DATEADD(YEAR, 4, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 68, 95 ) THEN
               FORMAT(DATEADD(YEAR, 3, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 80, 742, 743 )
                AND
               (
                    a.ProductNameEn LIKE N'%PVC%'
                    OR a.ProductNameEn LIKE N'%PVDC%'
                ) THEN
               FORMAT(DATEADD(YEAR, 1, d_mov.DateG), 'yyyyMMdd', 'fa')
           WHEN a.CategoryId IN ( 80, 742, 743 )
                AND a.ProductNameEn LIKE N'%Alu%' THEN
               FORMAT(DATEADD(YEAR, 2, d_mov.DateG), 'yyyyMMdd', 'fa')
       END AS FinalExpiryDate,
       DATEDIFF(MONTH, d_mov.DateG, GETDATE()) AS TemporaryDate_DiffMonths,
       d_engh.DateId AS ShamsiEnghezaSazandeh,
       d_mov.DateId AS ShamsiTarikhMovaghat,
       x.*

INTO #temp2
FROM #temp1 x
    LEFT JOIN etl.amardb.qv.AllParts a
        ON a.RayvarzId = x.CodeKala
    LEFT JOIN GNR.dimdate d_engh
        ON d_engh.DateIDM = x.EnghezaSazandeh
    LEFT JOIN GNR.dimdate d_mov
        ON d_mov.DateId = x.TarikhMovaghat;

                                SELECT DISTINCT MaterialID, MaterialName 
INTO #temp3
FROM etl.amardb.qv.bomdetailsallversion
WHERE SelectVersion <> 0
AND PreviousBomDtl = 0

SELECT #temp2.*, #temp3.materialname AS IsBOM FROM #temp2
LEFT JOIN #temp3
ON #temp3.materialid = #temp2.CodeKala


