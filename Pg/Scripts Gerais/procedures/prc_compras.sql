CREATE OR REPLACE FUNCTION PRC_COMPRAS(V_NUMERO           IN OUT COMPRAS.NUMERO%TYPE,
                                        V_FORNECEDOR       IN     COMPRAS.FORNECEDOR%TYPE,
                                        V_DATA_COMPRA      IN     COMPRAS.DATA_COMPRA%TYPE,
                                        V_VALOR            IN     COMPRAS.VALOR%TYPE,
                                        V_TIPO_DESCONTO    IN     COMPRAS.TIPO_DESCONTO%TYPE,
                                        V_DESCONTO         IN     COMPRAS.DESCONTO%TYPE,
                                        V_DESCONTO_PRODUTO IN     COMPRAS.DESCONTO_PRODUTO%TYPE,
                                        V_FRETE            IN     COMPRAS.FRETE%TYPE,
                                        V_MULTA            IN     COMPRAS.MULTA%TYPE,
                                        V_JUROS            IN     COMPRAS.JUROS%TYPE,
                                        V_IPI              IN     COMPRAS.IPI%TYPE,
                                        V_PARCELAS         IN     COMPRAS.PARCELAS%TYPE,
                                        V_OBS              IN     COMPRAS.OBS%TYPE,
                                        V_USER_ID          IN     COMPRAS.USER_ID%TYPE,
                                        V_DATA_CAD         IN     COMPRAS.DATA_CAD%TYPE,
                                        V_FUNCAO           IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_COMPRAS.NEXTVAL INTO V_NUMERO FROM DUAL;
     INSERT INTO COMPRAS VALUES (V_NUMERO,   V_FORNECEDOR,       V_DATA_COMPRA, V_VALOR, V_TIPO_DESCONTO,
                                       V_DESCONTO, V_DESCONTO_PRODUTO, V_FRETE,       V_MULTA, V_JUROS, V_IPI,
                                       V_PARCELAS, V_OBS,              V_USER_ID,     V_DATA_CAD);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE COMPRAS SET FORNECEDOR    = V_FORNECEDOR,    DATA_COMPRA = V_DATA_COMPRA, VALOR   = V_VALOR, 
                              TIPO_DESCONTO = V_TIPO_DESCONTO, DESCONTO    = V_DESCONTO,    FRETE   = V_FRETE, 
                              MULTA		  = V_MULTA,         JUROS       = V_JUROS,       IPI     = V_IPI, 
                              PARCELAS      = V_PARCELAS,      OBS         = V_OBS,         USER_ID = V_USER_ID, 
                              DATA_CAD      = V_DATA_CAD WHERE NUMERO = V_NUMERO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE COMPRAS WHERE NUMERO = V_NUMERO;

  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_COMPRAS;
/
