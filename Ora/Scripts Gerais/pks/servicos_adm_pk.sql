alter table SERVICOS_ADM
  add constraint SERVICOS_ADM_PK primary key (ID_SERVICO_ADM)
  using index 
  tablespace LIS_INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 512K
    minextents 1
    maxextents 121
    pctincrease 0
  )
