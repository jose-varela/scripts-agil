CREATE OR REPLACE PROCEDURE PRC_TABELAS_RECEBIDAS(V_POSTO            IN TABELAS_RECEBIDAS.POSTO%TYPE,
                                                  V_NOME_TABELA      IN TABELAS_RECEBIDAS.NOME_TABELA%TYPE,
                                                  V_DATA_RECEBIMENTO IN TABELAS_RECEBIDAS.DATA_RECEBIMENTO%TYPE,
                                                  V_HORA_RECEBIMENTO IN TABELAS_RECEBIDAS.HORA_RECEBIMENTO%TYPE,
                                                  V_STATUS_TABELA    IN TABELAS_RECEBIDAS.STATUS_TABELA%TYPE,
                                                  V_CONTEUDO0        IN VARCHAR2(2000),
                                                  V_CONTEUDO1        IN VARCHAR2(2000),
                                                  V_CONTEUDO2        IN VARCHAR2(2000),
                                                  V_CONTEUDO3        IN VARCHAR2(2000),
                                                  V_CONTEUDO4        IN VARCHAR2(2000),
                                                  V_CONTEUDO5        IN VARCHAR2(2000),
                                                  V_CONTEUDO6        IN VARCHAR2(2000),
                                                  V_CONTEUDO7        IN VARCHAR2(2000),
                                                  V_CONTEUDO8        IN VARCHAR2(2000),
                                                  V_CONTEUDO9        IN VARCHAR2(2000),
                                                  V_FUNCAO           IN NUMBER) IS

BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO TABELAS_RECEBIDAS VALUES (V_POSTO,  V_NOME_TABELA, V_DATA_RECEBIMENTO,
                                                 V_HORA_RECEBIMENTO, V_STATUS_TABELA,
                                                 V_CONTEUDO0 || V_CONTEUDO1 || V_CONTEUDO2 || 
                                                 V_CONTEUDO3 || V_CONTEUDO4 || V_CONTEUDO5 || 
                                                 V_CONTEUDO6 || V_CONTEUDO7 || V_CONTEUDO8 || 
                                                 V_CONTEUDO9);

  ELSIF V_FUNCAO = 3 THEN
     DELETE TABELAS_RECEBIDAS WHERE POSTO = V_POSTO AND NOME_TABELA = V_NOME_TABELA
                                      AND DATA_RECEBIMENTO = V_DATA_RECEBIMENTO 
                                      AND HORA_RECEBIMENTO = V_HORA_RECEBIMENTO;

  END IF;

  COMMIT WORK;

END PRC_TABELAS_RECEBIDAS;
/
