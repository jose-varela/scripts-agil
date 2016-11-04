
-- LIS_DATA
create tablespace LIS_DATA
 datafile 'C:\APP\ORADATA\LIS\LIS_DATA01' size 2048M
 autoextend off
default storage ( initial 65536 minextents 1 maxextents unlimited) ;  

alter tablespace LIS_DATA ADD 
 datafile 'C:\APP\ORADATA\LIS\LIS_DATA02' size 2048M
 autoextend off ;

-- LIS_INDEX
create tablespace LIX_INDX 
 datafile 'C:\APP\ORADATA\LIS\LIX_INDX01' size 2048 
 autoextend off 
default storage ( initial 65536 minextents 1 maxextents unlimited) ; 


-- USUARIO
CREATE USER LIS 
DEFAULT TABLESPACE LIS_DATA
TEMPORARY TABLESPACE TEMP
ACCOUNT UNLOCK ;

ALTER USER LIS DEFAULT ROLE "DBA";

