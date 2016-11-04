ALTER TABLE CORRELACOES ADD CONSTRAINT CORRELACOES_PROCEDIMENTO_DE_FK 
      FOREIGN KEY (MNEMONICO_DE) REFERENCES PROCEDIMENTOS(MNEMONICO)
      ON DELETE CASCADE;                                                                                                                       
