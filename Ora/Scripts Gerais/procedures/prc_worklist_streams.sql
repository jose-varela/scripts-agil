CREATE OR REPLACE PROCEDURE PRC_WORKLIST_STREAMS(V_POSTO          IN WORKLIST_STREAMS.POSTO%TYPE,
                                                 V_ATENDIMENTO    IN WORKLIST_STREAMS.ATENDIMENTO%TYPE,
                                                 V_CORREL         IN WORKLIST_STREAMS.CORREL%TYPE,
                                                 V_EQUIPAMENTO    IN WORKLIST_STREAMS.EQUIPAMENTO%TYPE,
                                                 V_DATA_RESULTADO IN WORKLIST_STREAMS.DATA_RESULTADO%TYPE,
                                                 V_DATA_CAD       IN WORKLIST_STREAMS.DATA_CAD%TYPE,
                                                 V_USUARIO        IN WORKLIST_STREAMS.USUARIO%TYPE,
                                                 V_STREAM         IN WORKLIST_STREAMS.STREAM%TYPE,
                                                 V_VERSAO         IN WORKLIST_STREAMS.VERSAO%TYPE,
                                                 V_FUNCAO         IN NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO WORKLIST_STREAMS VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL, V_EQUIPAMENTO, 
                                                   V_DATA_RESULTADO, V_DATA_CAD, V_USUARIO, V_STREAM, V_VERSAO); 

  ELSIF V_FUNCAO = 2 THEN
     UPDATE WORKLIST_STREAMS SET STREAM = V_STREAM, DATA_CAD = V_DATA_CAD, USUARIO = V_USUARIO, VERSAO = V_VERSAO
                                      WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO AND
                                            DATA_RESULTADO = V_DATA_RESULTADO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE WORKLIST_STREAMS WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE WORKLIST_STREAMS SET STREAM = V_STREAM, DATA_CAD = V_DATA_CAD, USUARIO = V_USUARIO, VERSAO = V_VERSAO
                                      WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND
                                            CORREL = V_CORREL AND EQUIPAMENTO = V_EQUIPAMENTO;
  END IF;

  COMMIT WORK;

END PRC_WORKLIST_STREAMS;
/
