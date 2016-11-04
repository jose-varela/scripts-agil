--Coloco o campo PRODUTO_ID p/ ter um codigo único de produto p/ utilização das tabelas Children.
CREATE TABLE PRODUTOS_FORNECEDORES
(PRODUTO        NUMBER(4),
 FORNECEDOR     NUMBER(4),
 PRODUTO_ID     NUMBER(6),
 CONTEUDO       NUMBER(10,3),
 PRECO          NUMBER(10,2),
 QTD_ATUAL      NUMBER(6),
 CODIGO         VARCHAR2(20),
 OBSERVACOES    VARCHAR2(255))
TABLESPACE DADOS4;
