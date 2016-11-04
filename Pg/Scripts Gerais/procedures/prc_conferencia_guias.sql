CREATE OR REPLACE FUNCTION PRC_CONFERENCIA_GUIAS(V_POSTO               IN CONFERENCIA_GUIAS.POSTO%TYPE,
                                                  V_ATENDIMENTO         IN CONFERENCIA_GUIAS.ATENDIMENTO%TYPE,
                                                  V_CORREL_CONFERENCIA  IN CONFERENCIA_GUIAS.CORREL_CONFERENCIA%TYPE,
                                                  V_LIB_FAT             IN CONFERENCIA_GUIAS.LIB_FAT%TYPE,
                                                  V_USUARIO             IN CONFERENCIA_GUIAS.USUARIO%TYPE,
                                                  V_DATA_CAD            IN CONFERENCIA_GUIAS.DATA_CAD%TYPE,
                                                  V_OBSERVACOES         IN CONFERENCIA_GUIAS.OBSERVACOES%TYPE,
                                                  V_FUNCAO              IN INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO CONFERENCIA_GUIAS
            VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL_CONFERENCIA, V_LIB_FAT,
                    V_USUARIO, V_DATA_CAD, V_OBSERVACOES);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE CONFERENCIA_GUIAS SET LIB_FAT     = V_LIB_FAT,
                                               USUARIO     = V_USUARIO,
                                               DATA_CAD    = V_DATA_CAD,
                                               OBSERVACOES = V_OBSERVACOES
                          WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL_CONFERENCIA = V_CORREL_CONFERENCIA;

  ELSIF V_FUNCAO = 3 THEN
            DELETE CONFERENCIA_GUIAS WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL_CONFERENCIA = V_CORREL_CONFERENCIA;

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_CONFERENCIA_GUIAS;