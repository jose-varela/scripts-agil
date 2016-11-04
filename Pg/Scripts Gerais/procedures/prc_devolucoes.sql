CREATE OR REPLACE FUNCTION PRC_DEVOLUCOES(V_DEVOLUCAO        IN OUT DEVOLUCOES.DEVOLUCAO%TYPE,
                                           V_DEPTO_ORIGEM     IN     DEVOLUCOES.DEPTO_ORIGEM%TYPE,
                                           V_DEPTO_DESTINO    IN     DEVOLUCOES.DEPTO_DESTINO%TYPE,
                                           V_DATA_DEVOLUCAO   IN     DEVOLUCOES.DATA_DEVOLUCAO%TYPE,
                                           V_HORA_DEVOLUCAO   IN     DEVOLUCOES.HORA_DEVOLUCAO%TYPE,
                                           V_STATUS           IN     DEVOLUCOES.STATUS%TYPE,
                                           V_OBSERVACAO       IN     DEVOLUCOES.OBSERVACAO%TYPE,
                                           V_USUARIO          IN     DEVOLUCOES.USUARIO%TYPE,
                                           V_DATA_CAD         IN     DEVOLUCOES.DATA_CAD%TYPE,
                                           V_USUARIO_RECEPTOR IN     DEVOLUCOES.USUARIO_RECEPTOR%TYPE,
                                           V_HORA_RECEBIMENTO IN     DEVOLUCOES.HORA_RECEBIMENTO%TYPE,
                                           V_DATA_RECEBIMENTO IN     DEVOLUCOES.DATA_RECEBIMENTO%TYPE,
                                           V_FUNCAO           IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_DEVOLUCOES.NEXTVAL INTO V_DEVOLUCAO FROM DUAL;
     INSERT INTO DEVOLUCOES VALUES (V_DEVOLUCAO,      V_DEPTO_ORIGEM,     V_DEPTO_DESTINO,    V_DATA_DEVOLUCAO,
                                           V_HORA_DEVOLUCAO, V_STATUS,           V_OBSERVACAO,       V_USUARIO,
              				       V_DATA_CAD,       V_USUARIO_RECEPTOR, V_HORA_RECEBIMENTO, V_DATA_RECEBIMENTO);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE DEVOLUCOES SET STATUS        = V_STATUS,   OBSERVACAO = V_OBSERVACAO, 
                        DATA_CAD         = V_DATA_CAD, 
                        USUARIO_RECEPTOR = V_USUARIO_RECEPTOR, 
                        HORA_RECEBIMENTO = V_HORA_RECEBIMENTO, 
                        DATA_RECEBIMENTO = V_DATA_RECEBIMENTO
            WHERE DEVOLUCAO = V_DEVOLUCAO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE DEVOLUCOES WHERE DEVOLUCAO = V_DEVOLUCAO;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE DEVOLUCOES SET STATUS = V_STATUS WHERE DEVOLUCAO = V_DEVOLUCAO;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_DEVOLUCOES;
/
