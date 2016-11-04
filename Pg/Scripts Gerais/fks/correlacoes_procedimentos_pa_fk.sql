ALTER TABLE CORRELACOES ADD CONSTRAINT CORRELACOES_PROCEDIMENTO_PA_FK 
      FOREIGN KEY (MNEMONICO_PARA) REFERENCES PROCEDIMENTOS(MNEMONICO)
      ON DELETE CASCADE;                                                                                                                       
