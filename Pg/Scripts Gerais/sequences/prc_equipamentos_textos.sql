CREATE OR REPLACE FUNCTION PRC_EQUIPAMENTOS_TEXTOS(V_EQUIPAMENTO           IN CEDRO.EQUIPAMENTOS_TEXTOS.EQUIPAMENTO%TYPE,
                                                    V_MNEMONICO             IN CEDRO.EQUIPAMENTOS_TEXTOS.MNEMONICO%TYPE,
                                                    V_NUMERO                IN CEDRO.EQUIPAMENTOS_TEXTOS.NUMERO%TYPE,
                                                    V_FUNCAO                IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO CEDRO.EQUIPAMENTOS_TEXTOS VALUES (V_EQUIPAMENTO, V_MNEMONICO, V_NUMERO);

  ELSIF V_FUNCAO = 3 THEN
     DELETE CEDRO.EQUIPAMENTOS_TEXTOS 
            WHERE EQUIPAMENTO = V_EQUIPAMENTO AND MNEMONICO = V_MNEMONICO 
              AND NUMERO = V_NUMERO;
                                                                                               
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_EQUIPAMENTOS_TEXTOS;
/
