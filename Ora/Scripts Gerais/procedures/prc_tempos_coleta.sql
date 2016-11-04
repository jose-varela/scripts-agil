CREATE OR REPLACE PROCEDURE PRC_TEMPOS_COLETA(V_ID_TEMPO_COLETA    IN OUT TEMPOS_COLETA.ID_TEMPO_COLETA%TYPE,
                                              V_NOME               IN TEMPOS_COLETA.NOME%TYPE,
                                              V_STATUS             IN TEMPOS_COLETA.STATUS%TYPE,
                                              V_FUNCAO             IN NUMBER) IS
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     SELECT SQ_TEMPO_COLETA.NEXTVAL INTO V_ID_TEMPO_COLETA FROM DUAL;
     INSERT INTO TEMPOS_COLETA VALUES(V_ID_TEMPO_COLETA, V_NOME, V_STATUS);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE TEMPOS_COLETA SET NOME       = V_NOME,
                                     STATUS     = V_STATUS
                          WHERE ID_TEMPO_COLETA = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 3 THEN
            DELETE TEMPOS_COLETA WHERE ID_TEMPO_COLETA = V_ID_TEMPO_COLETA;	

  END IF;

  COMMIT WORK;
END PRC_TEMPOS_COLETA;
/

