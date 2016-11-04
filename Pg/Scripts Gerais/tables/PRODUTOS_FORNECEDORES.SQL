--Coloco o campo PRODUTO_ID p/ ter um codigo único de produto p/ utilização das tabelas Children.
CREATE TABLE PRODUTOS_FORNECEDORES
(PRODUTO        SMALLINT,
 FORNECEDOR     SMALLINT,
 PRODUTO_ID     INT,
 CONTEUDO       DECIMAL(10,3),
 PRECO          DECIMAL(10,2),
 QTD_ATUAL      INT,
 CODIGO         VARCHAR(20),
 OBSERVACOES    VARCHAR(255))
;
