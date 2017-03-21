select  info_sq from  
  (select cmj.info_sq , count(*) as cnt    
    from info cmj  , 
     (select  info_sq, price         
        from info_detail         
        group by  info_sq , price 
     ) cms     
    where  cmj.info_sq = cms.info_sq
    and cmj.ymd is not null
    and cmj.test_no <> 2500001
    group by      cmj.info_sq  
  ) AS TabAl 
where  cnt >= 1 and info_sq in (10000,20000 );
