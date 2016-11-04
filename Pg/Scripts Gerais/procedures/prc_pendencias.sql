CREATE OR REPLACE FUNCTION PRC_PENDENCIAS(V_POSTO       IN PENDENCIAS.POSTO%TYPE,
                                           V_ATENDIMENTO IN PENDENCIAS.ATENDIMENTO%TYPE,
                                           V_CORREL      IN PENDENCIAS.CORREL%TYPE,
                                           V_MNEMONICO   IN PENDENCIAS.MNEMONICO%TYPE,
                                           V_MATERIAL    IN PENDENCIAS.MATERIAL%TYPE,
                                           V_USUARIO     IN PENDENCIAS.USUARIO%TYPE,
                                           V_DATA_CAD    IN PENDENCIAS.DATA_CAD%TYPE,
                                           V_FUNCAO      IN INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
         INSERT INTO PENDENCIAS VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL,  V_MNEMONICO,
                                              V_MATERIAL, V_USUARIO,  V_DATA_CAD);
  ELSIF V_FUNCAO = 2 THEN
            UPDATE PENDENCIAS SET MNEMONICO = V_MNEMONICO,
                                        MATERIAL  = V_MATERIAL
                          WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 3 THEN
            DELETE PENDENCIAS WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_PENDENCIAS;
/
