select Anbar_Code, VaziatMasraf,
                                              CodeKala,
                                              Mojoodi, MandehMovaghat
                                              from etl.pbi.pbi.[RayvarzReportHistorical_26]
                                              where ReportDate = (select max(ReportDate)
                                                                  from etl.pbi.pbi.[RayvarzReportHistorical_26])
                                              --and (Anbar_Code in (1, 13, 40, 41, 50, 51, 2, 22, 21,
                                                                --  24, 26, 35, 42, 52, 69, 25)
                                                  -- or (Anbar_Code in (30, 67, 27, 68, 21, 68.00)
                                                      -- and CodeKala in (2221408, 2211407, 1118580,
                                                                      --  1117902, 1118580, 2231406, 2236816)))
                                              and VaziatMasraf in (N'تست مجدد/قرنطينه(برگه زرد)', N'در دست بررسي')
                                              and Mojoodi + MandehMovaghat > 0
											  and CodeKala = '1165530'


select Anbar_Code, VaziatMasraf,
                                              CodeKala,
                                              Mojoodi, MandehMovaghat
                                              from etl.pbi.pbi.[RayvarzReportHistorical_26]
                                              where ReportDate = (select max(ReportDate)
                                                                  from etl.pbi.pbi.[RayvarzReportHistorical_26])
                                              --and (Anbar_Code in (1, 13, 40, 41, 50, 51, 2, 22, 21,
                                                                --  24, 26, 35, 42, 52, 69, 25)
                                                  -- or (Anbar_Code in (30, 67, 27, 68, 21, 68.00)
                                                      -- and CodeKala in (2221408, 2211407, 1118580,
                                                                      --  1117902, 1118580, 2231406, 2236816)))
                                              --and VaziatMasraf in (N'تست مجدد/قرنطينه(برگه زرد)', N'در دست بررسي')
                                              and Mojoodi + MandehMovaghat > 0
											  and CodeKala = '1165530'



----------------------------------------------------
----------------------------------------------------
----------------------------------------------------

Select Distinct RayvarzId, BatchNo
                                       from etl.[AMARDB].[qv].[VwQctagDtl];


with T1 as (
Select *
                                       from etl.[AMARDB].[qv].[VwQctagDtl]
                                       where FIsicalYear >= '1403'
                                       and FIsicalYear <= '1404'
                                      -- order by RayvarzId, BatchNo
									   ),
T2 as (

select *,
                                           Convert(Date, DateOfGreenIssuance) as DateOfGreenIssuance2
                                           from etl.[AMARDB].[qc].[QCTag]
                                           --where
                                            --Convert(nvarchar(10), Convert(Date, DateOfGreenIssuance)) >= '1403'
                                           --order by FIsicalYear DESC, DateOfGreenIssuance Desc
										   )
select T1.*, T2.*
from T1
inner join T2
on T1.QCTagId = T2.QCTagId

use [AMARDB]
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'qc' 

SELECT * FROM OPENQUERY(ETL, 
'SELECT * 
 FROM INFORMATION_SCHEMA.TABLES');


 SELECT * FROM OPENQUERY(ETL,
'SELECT owner AS TABLE_SCHEMA, table_name AS TABLE_NAME
 FROM all_tables 
 WHERE owner NOT IN (''SYS'', ''SYSTEM'')');

  SELECT * FROM OPENQUERY(ETL, 'SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
						  FROM INFORMATION_SCHEMA.TABLES 
						  ');




select Distinct Product, BatchNo
                                 from ETL.rayvarz.ray.aarep33
                                 where (ProccesName like N'%بلیستر%' or ProccesName like N'%کانتر%' or
                                        ProccesName like N'%شرینک%' or ProccesName like N'%بسته%'
                                        or ProccesName like N'%کارتونینگ%'
                                        or CategoryDsc in (N'Lable', N'Cap',
                                                           N'Carton', N'Brochure',
                                                           N'Box', N'Foil', 'Isinglass',
                                                           N'Flacon', N'ولت', N'Bottle'))
                                 and (docdate > '14040701')
								 and Product = '7005030'