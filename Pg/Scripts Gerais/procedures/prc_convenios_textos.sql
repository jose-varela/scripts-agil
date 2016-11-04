CREATE OR REPLACE FUNCTION PRC_CONVENIOS_TEXTOS(V_CONVENIO              IN CONVENIOS_TEXTOS.CONVENIO%TYPE,
                                                 V_EQUIPAMENTO           IN CONVENIOS_TEXTOS.EQUIPAMENTO%TYPE,
                                                 V_MNEMONICO             IN CONVENIOS_TEXTOS.MNEMONICO%TYPE,
                                                 V_NUMERO                IN CONVENIOS_TEXTOS.NUMERO%TYPE,
                                                 V_NUMERO_DIRECIONADO    IN CONVENIOS_TEXTOS.NUMERO_DIRECIONADO%TYPE,
                                                 V_FUNCAO                IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO CONVENIOS_TEXTOS VALUES (V_CONVENIO, V_EQUIPAMENTO, V_MNEMONICO, V_NUMERO, V_NUMERO_DIRECIONADO);

  ELSIF V_FUNCAO = 3 THEN
     DELETE CONVENIOS_TEXTOS 
            WHERE CONVENIO = V_CONVENIO AND EQUIPAMENTO = V_EQUIPAMENTO AND MNEMONICO = V_MNEMONICO 
              AND NUMERO = V_NUMERO;
                                                                                               
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_CONVENIOS_TEXTOS;
/
