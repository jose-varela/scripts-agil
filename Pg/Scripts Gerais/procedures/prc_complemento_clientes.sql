CREATE OR REPLACE FUNCTION PRC_COMPLEMENTO_CLIENTES(V_REGISTRO               IN     COMPLEMENTO_CLIENTES.REGISTRO%TYPE,
                                                     V_TIPAGEM_SANGUINEA      IN     COMPLEMENTO_CLIENTES.TIPAGEM_SANGUINEA%TYPE,
                                                     V_NOME_RESPONSAVEL       IN     COMPLEMENTO_CLIENTES.NOME_RESPONSAVEL%TYPE,
                                                     V_PARENTESCO_RESPONSAVEL IN     COMPLEMENTO_CLIENTES.PARENTESCO_RESPONSAVEL%TYPE,
                                                     V_FOTO                   IN     COMPLEMENTO_CLIENTES.FOTO%TYPE,
                                                     V_FUNCAO                 IN     INT) RETURNS VOID AS $$
     DECLARE
            V_ACHEI  INT;
            
            CURSOR CUR_PROCURA IS
                   SELECT REGISTRO FROM COMPLEMENTO_CLIENTES 
                    WHERE REGISTRO = V_REGISTRO;

     BEGIN
BEGIN
          IF V_FUNCAO = 1 THEN
             INSERT INTO COMPLEMENTO_CLIENTES VALUES (V_REGISTRO, V_TIPAGEM_SANGUINEA, V_NOME_RESPONSAVEL, V_PARENTESCO_RESPONSAVEL, EMPTY_BLOB());

          ELSIF V_FUNCAO = 2 THEN
             UPDATE COMPLEMENTO_CLIENTES SET TIPAGEM_SANGUINEA  = V_TIPAGEM_SANGUINEA,  
                                             NOME_RESPONSAVEL = V_NOME_RESPONSAVEL,
                                             PARENTESCO_RESPONSAVEL = V_PARENTESCO_RESPONSAVEL
              WHERE REGISTRO = V_REGISTRO;

          ELSIF V_FUNCAO = 3 THEN
              DELETE COMPLEMENTO_CLIENTES WHERE REGISTRO = V_REGISTRO;


          ELSIF V_FUNCAO = 4 THEN
                OPEN CUR_PROCURA;
                FETCH CUR_PROCURA INTO V_ACHEI;
  
                IF CUR_PROCURA%NOTFOUND THEN
                   INSERT INTO COMPLEMENTO_CLIENTES VALUES (V_REGISTRO, V_TIPAGEM_SANGUINEA, V_NOME_RESPONSAVEL, V_PARENTESCO_RESPONSAVEL, EMPTY_BLOB());
                ELSE
                   UPDATE COMPLEMENTO_CLIENTES SET TIPAGEM_SANGUINEA  = V_TIPAGEM_SANGUINEA,  
                                                   NOME_RESPONSAVEL = V_NOME_RESPONSAVEL,
                                                   PARENTESCO_RESPONSAVEL = V_PARENTESCO_RESPONSAVEL
                    WHERE REGISTRO = V_REGISTRO;
                END IF;
                CLOSE CUR_PROCURA;
          END IF;

     END;
     /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_COMPLEMENTO_CLIENTES;
/
