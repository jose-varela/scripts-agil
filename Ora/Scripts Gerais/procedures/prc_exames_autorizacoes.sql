CREATE OR REPLACE PROCEDURE PRC_EXAMES_AUTORIZACOES(V_POSTO              IN EXAMES_AUTORIZACOES.POSTO%TYPE,
                                                    V_ATENDIMENTO        IN EXAMES_AUTORIZACOES.ATENDIMENTO%TYPE,
                                                    V_CORREL             IN EXAMES_AUTORIZACOES.CORREL%TYPE,
                                                    V_AUTORIZACAO        IN EXAMES_AUTORIZACOES.AUTORIZACAO%TYPE,
                                                    V_FUNCAO             IN NUMBER) IS
BEGIN                                                       
  IF V_FUNCAO = 1 THEN                                      
     INSERT INTO EXAMES_AUTORIZACOES
            VALUES (V_POSTO, V_ATENDIMENTO, V_CORREL, V_AUTORIZACAO);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE EXAMES_AUTORIZACOES SET AUTORIZACAO = V_AUTORIZACAO
                          WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL   = V_CORREL;

  ELSIF V_FUNCAO = 3 THEN
            DELETE EXAMES_AUTORIZACOES WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  END IF;

  COMMIT WORK;
END PRC_EXAMES_AUTORIZACOES;
/
