CREATE OR REPLACE FUNCTION PRC_CALCULOS_AUX(V_MNEMONICO       IN CALCULOS_AUX.MNEMONICO%TYPE,
                                             V_NUMERO          IN CALCULOS_AUX.NUMERO%TYPE,
                                             V_VARIAVEL        IN CALCULOS_AUX.VARIAVEL%TYPE,
                                             V_VARIAVEL_ORIGEM IN CALCULOS_AUX.VARIAVEL%TYPE,
                                             V_VALIDACAO       IN CALCULOS_AUX.VALIDACAO%TYPE,
                                             V_CORREL          IN CALCULOS_AUX.CORREL%TYPE,
                                             V_FUNCAO          IN INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO CALCULOS_AUX VALUES (V_MNEMONICO, V_NUMERO, V_VARIAVEL, V_VARIAVEL_ORIGEM, V_VALIDACAO, V_CORREL);

  ELSIF V_FUNCAO = 3 THEN
     DELETE CALCULOS_AUX WHERE MNEMONICO = V_MNEMONICO AND NUMERO = V_NUMERO AND VARIAVEL_ORIGEM = V_VARIAVEL_ORIGEM 
                                     AND CORREL = V_CORREL;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_CALCULOS_AUX;
/
