alter table POSTOS_SERVICOS
  add constraint POSTOS_SERVICOS_PK primary key (ID_SERVICO_ADM,ID_POSTO)
  LIS_INDX
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
