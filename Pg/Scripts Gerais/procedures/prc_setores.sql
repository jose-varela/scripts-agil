CREATE OR REPLACE FUNCTION PRC_SETORES(V_SETOR           IN OUT SETORES.SETOR%TYPE,
                                        V_NOME            IN     SETORES.NOME%TYPE,
                                        V_LINHAS          IN     SETORES.LINHAS%TYPE,
                                        V_FICHA           IN     SETORES.FICHA%TYPE,
                                        V_ORDEM_IMPRESSAO IN     SETORES.ORDEM_IMPRESSAO%TYPE,
                                        V_COLUNAS         IN     SETORES.COLUNAS%TYPE,
                                        V_FUNCAO          IN     INT) RETURNS VOID AS $$                         
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_SETOR.NEXTVAL INTO V_SETOR FROM DUAL;
     INSERT INTO SETORES VALUES (V_SETOR, V_NOME, V_LINHAS, V_FICHA, V_ORDEM_IMPRESSAO, V_COLUNAS);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE SETORES SET NOME = V_NOME, LINHAS = V_LINHAS, FICHA = V_FICHA, ORDEM_IMPRESSAO = V_ORDEM_IMPRESSAO, COLUNAS = V_COLUNAS 
                           WHERE SETOR = V_SETOR;

  ELSIF V_FUNCAO = 3 THEN
     DELETE SETORES WHERE SETOR = V_SETOR;
     
  ELSIF V_FUNCAO = 4 THEN
     UPDATE SETORES SET ORDEM_IMPRESSAO = V_ORDEM_IMPRESSAO 
                           WHERE SETOR = V_SETOR;
  END IF;             

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_SETORES;
/
