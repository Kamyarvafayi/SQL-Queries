select * from [Material2].[BatchMaterialTestStatus]
order by InsertDateTime

select * from [Material2].[BatchMaterialTestStatus]
order by InsertDateTime


select * from [Material2].[OMC_Result]
order by InsertDateTime   

[Material].[MDC_WPRT]
[Material].[MDC_WIP_Mizan]
[Material2].[OMC_Result]


select  [Anbar_Code] as [«‰»«—],
                                    [Anbar_Name] as [‰«„ «‰»«—],
                                    CodeKala,
                                    SharheKala as [‘—Õ ﬂ«·«],
                                    SerialBatch,
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
                                    AkharinAnbarEnteghali_Code as [òœ ¬Œ—Ì‰ «‰»«— «‰ ﬁ«·Ì],
                                    AkharinAnbarEnteghali_Name as [‰«„ ¬Œ—Ì‰ «‰»«— «‰ ﬁ«·Ì]
                                    from etl.pbi.pbi.[RayvarzReportHistorical_26]
                                    where ReportDate  = (select max(ReportDate)
                                                         from etl.pbi.pbi.[RayvarzReportHistorical_26])



select * from [Material].[Rayvarz26ExpiryInfo]


select * from [Material].[Rayvarz26ExpiryInfo]
where insertDatetime = (select max(insertDatetime) from [Material].[Rayvarz26ExpiryInfo])
order by 2, 3


