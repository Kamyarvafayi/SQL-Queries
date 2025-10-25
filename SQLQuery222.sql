select * from [DSP].[vwProductset]
where namekala like N'%ÒÇáÑÈÇä%'

select * from [DSP].[vwProductset]
where namekala like N'%Ò%˜æÑ%'

select * from [DSP].[vwProductset]
where rayvarzid = 7009741


select Distinct Product, BatchNo, *
                                   from ETL.rayvarz.ray.aarep33
                                   where 
                                    docdate > 14040701
									and Product = 7000115



