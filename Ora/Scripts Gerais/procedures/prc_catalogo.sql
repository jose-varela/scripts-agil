CREATE OR REPLACE PROCEDURE PRC_CATALOGO(V_CATALOGO            IN OUT CATALOGO.CATALOGO%TYPE,
                                         V_NOME                IN     CATALOGO.NOME%TYPE,
                                         V_TABELA_PADRAO       IN     CATALOGO.TABELA_PADRAO%TYPE,
                                         V_CATALOGO_TISS       IN     CATALOGO.CATALOGO_TISS%TYPE,
                                         V_PORTE_MED           IN     CATALOGO.CUSTO_OPERACIONAL%TYPE,
                                         V_CUSTO_OPERACIONAL   IN     CATALOGO.PORTE_MED%TYPE,
                                         V_CH                  IN     CATALOGO.CH%TYPE,
                                         V_MATERIAL            IN     CATALOGO.MATERIAL%TYPE,
                                         V_FUNCAO              IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_CATALOGO.NEXTVAL INTO V_CATALOGO FROM DUAL;
     INSERT INTO CATALOGO VALUES (V_CATALOGO, V_NOME, V_TABELA_PADRAO, V_CATALOGO_TISS, V_PORTE_MED, V_CUSTO_OPERACIONAL, V_CH, V_MATERIAL);
     

  ELSIF V_FUNCAO = 2 THEN
     UPDATE CATALOGO SET NOME = V_NOME, TABELA_PADRAO = V_TABELA_PADRAO, CATALOGO_TISS = V_CATALOGO_TISS,
                         PORTE_MED = V_PORTE_MED, CUSTO_OPERACIONAL = V_CUSTO_OPERACIONAL, CH = V_CH, 
                         MATERIAL = V_MATERIAL
                     WHERE CATALOGO = V_CATALOGO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE CATALOGO WHERE CATALOGO = V_CATALOGO;
  END IF;

  COMMIT WORK;

END PRC_CATALOGO;
/
