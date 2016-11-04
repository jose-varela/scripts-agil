CREATE OR REPLACE FUNCTION PRC_MODELOS_GRAFICOS(V_ID_GRAFICO          IN OUT MODELOS_GRAFICOS.ID_GRAFICO%TYPE,
                                                 V_NOME                IN     MODELOS_GRAFICOS.NOME%TYPE,
                                                 V_TIPO_GRAFICO        IN     MODELOS_GRAFICOS.TIPO_GRAFICO%TYPE,
                                                 V_STATUS              IN     MODELOS_GRAFICOS.STATUS%TYPE,
                                                 V_GRAFICO             IN     MODELOS_GRAFICOS.GRAFICO%TYPE,
                                                 V_FUNCAO              IN     INT) RETURNS VOID AS $$
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     SELECT SQ_GRAFICO.NEXTVAL INTO V_ID_GRAFICO FROM DUAL;
     INSERT INTO MODELOS_GRAFICOS VALUES(V_ID_GRAFICO, V_NOME, V_TIPO_GRAFICO, V_STATUS, V_GRAFICO);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE MODELOS_GRAFICOS SET NOME = V_NOME, TIPO_GRAFICO = V_TIPO_GRAFICO, STATUS = V_STATUS, GRAFICO = V_GRAFICO
             WHERE ID_GRAFICO = V_ID_GRAFICO;	

  ELSIF V_FUNCAO = 3 THEN
            DELETE MODELOS_GRAFICOS WHERE ID_GRAFICO = V_ID_GRAFICO;	

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_MODELOS_GRAFICOS;
/
