CREATE OR REPLACE FUNCTION PRC_VALIDACOES(V_MNEMONICO     IN VALIDACOES.MNEMONICO%TYPE,
                                            V_NUMERO       IN VALIDACOES.NUMERO%TYPE,
                                            V_CORREL       IN VALIDACOES.CORREL%TYPE,
                                            V_VARIAVEL     IN VALIDACOES.VARIAVEL%TYPE,
                                            V_CONDICAO     IN VALIDACOES.CONDICAO%TYPE,
                                            V_RESULTADO    IN VALIDACOES.RESULTADO%TYPE,
                                            V_MENSAGEM     IN VALIDACOES.MENSAGEM%TYPE,
                                            V_TIP_VALID    IN VALIDACOES.TIP_VALID%TYPE,
                                            V_FUNCAO       IN INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO VALIDACOES VALUES (V_MNEMONICO, V_NUMERO,   V_CORREL   , V_VARIAVEL, V_CONDICAO,
                                          V_RESULTADO, V_MENSAGEM, V_TIP_VALID); 

  ELSIF V_FUNCAO = 2 THEN
     UPDATE VALIDACOES SET CONDICAO = V_CONDICAO, RESULTADO = V_RESULTADO,
                                  MENSAGEM = V_MENSAGEM, TIP_VALID = V_TIP_VALID
                        WHERE MNEMONICO = V_MNEMONICO AND NUMERO = V_NUMERO AND CORREL = V_CORREL AND VARIAVEL = V_VARIAVEL;

  ELSIF V_FUNCAO = 3 THEN
     DELETE VALIDACOES WHERE MNEMONICO = V_MNEMONICO AND NUMERO = V_NUMERO AND CORREL = V_CORREL AND VARIAVEL = V_VARIAVEL;


  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_VALIDACOES;
/
