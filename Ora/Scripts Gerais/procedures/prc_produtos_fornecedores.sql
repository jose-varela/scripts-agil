CREATE OR REPLACE PROCEDURE PRC_PRODUTOS_FORNECEDORES(V_PRODUTO     IN     PRODUTOS_FORNECEDORES.PRODUTO%TYPE,
                                                      V_FORNECEDOR  IN     PRODUTOS_FORNECEDORES.FORNECEDOR%TYPE,
                                                      V_PRODUTO_ID  IN OUT PRODUTOS_FORNECEDORES.PRODUTO_ID%TYPE,
                                                      V_CONTEUDO    IN     PRODUTOS_FORNECEDORES.CONTEUDO%TYPE,
                                                      V_PRECO       IN     PRODUTOS_FORNECEDORES.PRECO%TYPE,
                                                      V_QTD_ATUAL   IN     PRODUTOS_FORNECEDORES.QTD_ATUAL%TYPE,
                                                      V_CODIGO      IN     PRODUTOS_FORNECEDORES.CODIGO%TYPE,
                                                      V_OBSERVACOES IN     PRODUTOS_FORNECEDORES.OBSERVACOES%TYPE,
                                                      V_FUNCAO      IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_PRODUTOS_FORNECEDORES.NEXTVAL INTO V_PRODUTO_ID FROM DUAL;
     INSERT INTO PRODUTOS_FORNECEDORES VALUES (V_PRODUTO,  V_FORNECEDOR, V_PRODUTO_ID, 
                                                     V_CONTEUDO, V_PRECO, V_QTD_ATUAL, V_CODIGO, V_OBSERVACOES);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE PRODUTOS_FORNECEDORES SET CONTEUDO = V_CONTEUDO, PRECO = V_PRECO, 
                                            QTD_ATUAL = V_QTD_ATUAL, CODIGO = V_CODIGO,
                                            OBSERVACOES = V_OBSERVACOES
        WHERE PRODUTO_ID = V_PRODUTO_ID;

  ELSIF V_FUNCAO = 3 THEN
     DELETE PRODUTOS_FORNECEDORES WHERE PRODUTO_ID = V_PRODUTO_ID;

  END IF;

  COMMIT WORK;

END PRC_PRODUTOS_FORNECEDORES;
/
