CREATE OR REPLACE FUNCTION PRC_WORKLIST_RESULTADOS(V_POSTO          IN WORKLIST_RESULTADOS.POSTO%TYPE,
                                                    V_ATENDIMENTO    IN WORKLIST_RESULTADOS.ATENDIMENTO%TYPE,
                                                    V_CORREL         IN WORKLIST_RESULTADOS.CORREL%TYPE,
                                                    V_EQUIPAMENTO    IN WORKLIST_RESULTADOS.EQUIPAMENTO%TYPE,
                                                    V_DATA_RESULTADO IN WORKLIST_RESULTADOS.DATA_RESULTADO%TYPE,
                                                    V_DATA_CAD       IN WORKLIST_RESULTADOS.DATA_CAD%TYPE,
                                                    V_USUARIO        IN WORKLIST_RESULTADOS.USUARIO%TYPE,
                                                    V_RESULTADO      IN WORKLIST_RESULTADOS.RESULTADO%TYPE,
                                                    V_VERSAO         IN WORKLIST_RESULTADOS.VERSAO%TYPE,
                                                    V_FUNCAO         IN INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO WORKLIST_RESULTADOS VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL, V_EQUIPAMENTO, 
                                                   V_DATA_RESULTADO, V_DATA_CAD, V_USUARIO, V_RESULTADO, V_VERSAO); 

  ELSIF V_FUNCAO = 2 THEN
     UPDATE WORKLIST_RESULTADOS SET RESULTADO = V_RESULTADO, DATA_CAD = V_DATA_CAD, USUARIO = V_USUARIO, VERSAO = V_VERSAO
                                      WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO AND
                                            DATA_RESULTADO = V_DATA_RESULTADO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE WORKLIST_RESULTADOS WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE WORKLIST_RESULTADOS SET RESULTADO = V_RESULTADO, DATA_CAD = V_DATA_CAD, USUARIO = V_USUARIO, VERSAO = V_VERSAO
                                      WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_WORKLIST_RESULTADOS;
/
