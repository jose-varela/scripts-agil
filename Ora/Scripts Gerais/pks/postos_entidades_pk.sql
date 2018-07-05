alter table POSTOS_ENTIDADES
  add constraint POSTOS_ENTIDADES_PK primary key (ID_POSTO, ID_ENTIDADE)
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
