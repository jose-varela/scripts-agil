ALTER TABLE FATORES ADD CONSTRAINT FATORES_PROCEDIMENTO_FK 
      FOREIGN KEY (MNEMONICO) REFERENCES PROCEDIMENTOS(MNEMONICO)
      ON DELETE CASCADE;                                                                                                                       
