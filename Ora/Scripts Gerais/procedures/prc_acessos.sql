CREATE OR REPLACE PROCEDURE PRC_ACESSOS(V_USER_CODIGO  IN ACESSOS.USER_CODIGO%TYPE,
                                        V_MODULO       IN ACESSOS.MODULO%TYPE,
                                        V_ACTION       IN ACESSOS.ACTION%TYPE,
                                        V_LEITURA      IN ACESSOS.LEITURA%TYPE,
                                        V_GRAVACAO     IN ACESSOS.GRAVACAO%TYPE,
                                        V_ELIMINACAO   IN ACESSOS.ELIMINACAO%TYPE,
                                        V_CRIACAO      IN ACESSOS.CRIACAO%TYPE,
                                        V_ACESSO       IN ACESSOS.ACESSO%TYPE,
                                        V_SUPERVISOR   IN ACESSOS.SUPERVISOR%TYPE,
                                        V_FUNCAO       IN NUMBER) IS

BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO ACESSOS VALUES (V_USER_CODIGO, V_MODULO,     V_ACTION,  V_LEITURA,
                                        V_GRAVACAO,    V_ELIMINACAO, V_CRIACAO, V_ACESSO,
                                        V_SUPERVISOR); 
 
  ELSIF V_FUNCAO = 2 THEN
     UPDATE ACESSOS SET MODULO   = V_MODULO,       ACTION = V_ACTION,     LEITURA = V_LEITURA,
                               GRAVACAO = V_GRAVACAO, ELIMINACAO = V_ELIMINACAO, CRIACAO = V_CRIACAO,
                               ACESSO   = V_ACESSO,   SUPERVISOR = V_SUPERVISOR 
                          WHERE USER_CODIGO = V_USER_CODIGO;
                         
  ELSIF V_FUNCAO = 3 THEN
     DELETE ACESSOS WHERE USER_CODIGO = V_USER_CODIGO;

  ELSIF V_FUNCAO = 4 THEN
     DELETE ACESSOS WHERE MODULO = V_MODULO AND ACTION = V_ACTION;

  END IF;

  COMMIT WORK;

END PRC_ACESSOS;
/
