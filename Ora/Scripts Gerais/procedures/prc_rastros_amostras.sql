CREATE OR REPLACE PROCEDURE PRC_RASTROS_AMOSTRAS(V_POSTO           IN RASTROS_AMOSTRAS.POSTO%TYPE,
                                                 V_ATENDIMENTO     IN RASTROS_AMOSTRAS.ATENDIMENTO%TYPE,
                                                 V_CORREL          IN RASTROS_AMOSTRAS.CORREL%TYPE,
                                                 V_AMOSTRA         IN RASTROS_AMOSTRAS.AMOSTRA%TYPE,
                                                 V_CENTRO_RASTREIO IN RASTROS_AMOSTRAS.CENTRO_RASTREIO%TYPE,
                                                 V_USUARIO_RASTRO  IN RASTROS_AMOSTRAS.USUARIO_RASTRO%TYPE,
                                                 V_DATA_RASTRO     IN RASTROS_AMOSTRAS.DATA_RASTRO%TYPE,
                                                 V_ESTACAO_RASTRO  IN RASTROS_AMOSTRAS.ESTACAO_RASTRO%TYPE,
                                                 V_POSTO_RASTRO    IN RASTROS_AMOSTRAS.POSTO_RASTRO%TYPE,
                                                 V_ID_LOTE_RASTRO  IN RASTROS_AMOSTRAS.ID_LOTE_RASTRO%TYPE,
                                                 V_FUNCAO          IN NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO RASTROS_AMOSTRAS VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL, V_AMOSTRA,
                                          V_CENTRO_RASTREIO, V_USUARIO_RASTRO, V_DATA_RASTRO, V_ESTACAO_RASTRO, 
                                          V_POSTO_RASTRO, V_ID_LOTE_RASTRO);

  ELSIF V_FUNCAO = 4 THEN
     UPDATE RASTROS_AMOSTRAS SET ID_LOTE_RASTRO = V_ID_LOTE_RASTRO
                                 WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO
                                   AND CORREL = V_CORREL AND AMOSTRA = V_AMOSTRA;
  ELSIF V_FUNCAO = 3 THEN
     DELETE RASTROS_AMOSTRAS WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO
                                   AND CORREL = V_CORREL AND AMOSTRA = V_AMOSTRA;
  END IF;

  COMMIT WORK;

END PRC_RASTROS_AMOSTRAS;
/
