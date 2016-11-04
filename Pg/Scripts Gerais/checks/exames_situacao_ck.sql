ALTER TABLE EXAMES 
      ADD CONSTRAINT EXAMES_SITUACAO_CK 
          CHECK (SITUACAO  IN ('E', 'I', 'L', 'N', 'R', 'U', 'F', 'P', 'C'));
