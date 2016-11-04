alter table POSTOS_MEDICOS_RESPONSAVEIS
  add constraint POSTOS_MEDICOS_RESPONSAVEIS_PK primary key (POSTO, CRM_RESPONSAVEL, SETOR)
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
