CREATE OR REPLACE FUNCTION PRC_COMPRAS_RECEBIMENTOS(V_NUMERO              IN OUT COMPRAS_RECEBIMENTOS.NUMERO%TYPE,
                                        		    V_CORREL               IN     COMPRAS_RECEBIMENTOS.CORREL%TYPE,
                                        		    V_DATA_RECEBIMENTO     IN     COMPRAS_RECEBIMENTOS.DATA_RECEBIMENTO%TYPE,
                                        		    V_NFISCAL              IN     COMPRAS_RECEBIMENTOS.NFISCAL%TYPE,
                                        		    V_DEPARTAMENTO         IN     COMPRAS_RECEBIMENTOS.DEPARTAMENTO%TYPE,
                                        		    V_USER_ID              IN     COMPRAS_RECEBIMENTOS.USER_ID%TYPE,
                                        		    V_DATA_CAD             IN     COMPRAS_RECEBIMENTOS.DATA_CAD%TYPE,
                                        		    V_FUNCAO               IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO COMPRAS_RECEBIMENTOS VALUES (V_NUMERO , V_CORREL, V_DATA_RECEBIMENTO, 
                                                    V_NFISCAL, V_DEPARTAMENTO, V_USER_ID, V_DATA_CAD);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE COMPRAS_RECEBIMENTOS SET DATA_RECEBIMENTO = V_DATA_RECEBIMENTO, 
                              NFISCAL = V_NFISCAL, DEPARTAMENTO = V_DEPARTAMENTO
                              WHERE NUMERO = V_NUMERO AND CORREL = V_CORREL;
  ELSIF V_FUNCAO = 3 THEN
     DELETE COMPRAS_RECEBIMENTOS WHERE NUMERO = V_NUMERO AND CORREL = V_CORREL;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_COMPRAS_RECEBIMENTOS;
/
