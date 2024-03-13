ALTER TABLE CATALOGO_TABELAS ADD(PORTE_MED VARCHAR2(1), CUSTO_OPERACIONAL VARCHAR2(1), CH VARCHAR2(1), FILME VARCHAR2(1), MATERIAL  VARCHAR2(1))
/
UPDATE CATALOGO_TABELAS SET PORTE_MED  = 'N', CUSTO_OPERACIONAL = 'N', CH = 'N', FILME = 'S', MATERIAL = 'S'
/
ALTER TABLE CATALOGO_TABELAS MODIFY(PORTE_MED NOT NULL, CUSTO_OPERACIONAL NOT NULL, CH NOT NULL, FILME NOT NULL, MATERIAL NOT NULL)
/
COMMIT
/

CREATE OR REPLACE PROCEDURE PRC_CATALOGO_TABELAS(V_ID_TABELA_PROCEDIMENTOS IN OUT CIS.CATALOGO_TABELAS.ID_TABELA_PROCEDIMENTOS%TYPE,
                                                 V_NOME                    IN     CIS.CATALOGO_TABELAS.NOME%TYPE,
                                                 V_DATA_HORA_ALT           IN     CIS.CATALOGO_TABELAS.DATA_HORA_ALT%TYPE,
                                                 V_USUARIO_ALT             IN     CIS.CATALOGO_TABELAS.USUARIO_ALT%TYPE,
                                                 V_TABELA_PADRAO           IN     CIS.CATALOGO_TABELAS.TABELA_PADRAO%TYPE,
                                                 V_PORTE_MED               IN     CIS.CATALOGO_TABELAS.CUSTO_OPERACIONAL%TYPE,
                                                 V_CUSTO_OPERACIONAL       IN     CIS.CATALOGO_TABELAS.PORTE_MED%TYPE,
                                                 V_CH                      IN     CIS.CATALOGO_TABELAS.CH%TYPE,
                                                 V_FILME                   IN     CIS.CATALOGO_TABELAS.FILME%TYPE,
                                                 V_MATERIAL                IN     CIS.CATALOGO_TABELAS.MATERIAL%TYPE,
                                                 V_FUNCAO                  IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT CIS.SQ_CATALOGO_TABELAS.NEXTVAL INTO V_ID_TABELA_PROCEDIMENTOS FROM DUAL;
     INSERT INTO CIS.CATALOGO_TABELAS VALUES (V_ID_TABELA_PROCEDIMENTOS, V_NOME, V_DATA_HORA_ALT, V_USUARIO_ALT, V_TABELA_PADRAO, V_PORTE_MED, V_CUSTO_OPERACIONAL, V_CH, V_FILME, V_MATERIAL);
     

  ELSIF V_FUNCAO = 2 THEN
     UPDATE CIS.CATALOGO_TABELAS SET NOME = V_NOME, DATA_HORA_ALT = V_DATA_HORA_ALT, 
                                     USUARIO_ALT = V_USUARIO_ALT, 
                                     TABELA_PADRAO = V_TABELA_PADRAO,
                                     PORTE_MED = V_PORTE_MED, 
                                     CUSTO_OPERACIONAL = V_CUSTO_OPERACIONAL, 
                                     CH = V_CH, 
                                     FILME = V_FILME, 
                                     MATERIAL = V_MATERIAL
                           WHERE ID_TABELA_PROCEDIMENTOS = V_ID_TABELA_PROCEDIMENTOS;
  ELSIF V_FUNCAO = 3 THEN
     DELETE CIS.CATALOGO_TABELAS WHERE ID_TABELA_PROCEDIMENTOS = V_ID_TABELA_PROCEDIMENTOS;
  END IF;

  COMMIT WORK;

END PRC_CATALOGO_TABELAS;
/
