with temTBl  as (
				select *
							from etl.AMARDB.pbi.vwBestEstimationForBI 
							 where InsertDate = (select max(insertdate)
												 from etl.AMARDB.pbi.vwBestEstimationForBI
												 where CenterName = N'Adora Teb')
												 and CenterName = N'Adora Teb'
				Union all

				select *
							from etl.AMARDB.pbi.vwBestEstimationForBI 
							 where InsertDate = (select max(insertdate)
												 from etl.AMARDB.pbi.vwBestEstimationForBI
												 where CenterName = N'Razi')
							 and CenterName = N'Razi'

				Union all

				select *
							from etl.AMARDB.pbi.vwBestEstimationForBI 
							 where InsertDate = (select max(insertdate)
												 from etl.AMARDB.pbi.vwBestEstimationForBI
												 where CenterName = N'DarouPakhsh')
							 and CenterName = N'DarouPakhsh'),
temp2 as
(
				select Rayvarzid, CenterName, Count(Rayvarzid) over(Partition by Rayvarzid, CenterName) as RecordCount from temTBl
)

SELECT * FROM temp2
where RecordCount > 1



select Rayvarzid, ProductNameEn, ConfigName, ConfigId, CenterName, InsertDate
			from etl.AMARDB.pbi.vwBestEstimationForBI 
				where InsertDate = (select max(insertdate)
									from etl.AMARDB.pbi.vwBestEstimationForBI
									where CenterName = N'Adora Teb')
				and CenterName = N'Adora Teb'
				and ConfigName <> 'AVG'
Union all

select Rayvarzid, ProductNameEn, ConfigName, ConfigId, CenterName, InsertDate
			from etl.AMARDB.pbi.vwBestEstimationForBI 
				where InsertDate = (select max(insertdate)
									from etl.AMARDB.pbi.vwBestEstimationForBI
									where CenterName = N'Razi')
				and CenterName = N'Razi'
				and ConfigName <> 'AVG'

Union all

select Rayvarzid, ProductNameEn, ConfigName, ConfigId, CenterName, InsertDate
			from etl.AMARDB.pbi.vwBestEstimationForBI 
				where InsertDate = (select max(insertdate)
									from etl.AMARDB.pbi.vwBestEstimationForBI
									where CenterName = N'DarouPakhsh')
				and CenterName = N'DarouPakhsh'
				and ConfigName <> 'AVG'