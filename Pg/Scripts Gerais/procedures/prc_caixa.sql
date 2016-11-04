create or replace FUNCTION PRC_CAIXA(V_CONTA_HOSP     IN CAIXA.CONTA_HOSP%TYPE,
                                      V_REGISTRO       IN CAIXA.REGISTRO%TYPE,
                                      V_CONTA          IN CAIXA.CONTA%TYPE,
                                      V_DATA_PAG       IN CAIXA.DATA_PAG%TYPE,
                                      V_VALOR          IN CAIXA.VALOR%TYPE,
                                      V_DESCONTO       IN CAIXA.DESCONTO%TYPE,
                                      V_TIPO_DTO       IN CAIXA.TIPO_DTO%TYPE,
                                      V_USUARIO        IN CAIXA.USUARIO%TYPE,
                                      V_DATA_CAD       IN CAIXA.DATA_CAD%TYPE,
                                      V_CORREL         IN OUT CAIXA.CORREL%TYPE,
                                      V_TIPO_PAG       IN CAIXA.TIPO_PAG%TYPE,
                                      V_CATALOGO       IN CAIXA.CATALOGO%TYPE,
                                      V_USUARIO_DTO    IN CAIXA.USUARIO_DTO%TYPE,
                                      V_USUARIO_ALT    IN CAIXA.USUARIO_ALT%TYPE,
                                      V_DATA_ALT       IN CAIXA.DATA_ALT%TYPE,
                                      V_FUNCAO         IN INT) returns void AS $$
BEGIN
  IF (V_FUNCAO = 1) OR (V_FUNCAO = 6) THEN
     IF (V_FUNCAO = 1) THEN
        SELECT COALESCE(MAX(C.CORREL)+1,1) INTO V_CORREL FROM CAIXA C 
        WHERE C.CONTA_HOSP = V_CONTA_HOSP;
     END IF;

     INSERT INTO CAIXA VALUES (V_CONTA_HOSP,  V_REGISTRO,    V_CONTA,     V_DATA_PAG,
                               V_VALOR,       V_DESCONTO,    V_TIPO_DTO,  V_USUARIO,
                               V_DATA_CAD,    V_CORREL,      V_TIPO_PAG,  V_CATALOGO, 
   			       V_USUARIO_DTO, V_USUARIO_ALT, V_DATA_ALT);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE CAIXA SET VALOR = V_VALOR
                      WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 3 THEN
     DELETE CAIXA WHERE CONTA_HOSP = V_CONTA_HOSP;

  ELSIF V_FUNCAO = 4 THEN
     DELETE CAIXA WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 5 THEN
     UPDATE CAIXA SET VALOR = V_VALOR, 
	                  DATA_PAG = V_DATA_PAG, 
					  DESCONTO = V_DESCONTO, 
					  TIPO_DTO = V_TIPO_DTO, 
					  TIPO_PAG = V_TIPO_PAG,
					  USUARIO_ALT = V_USUARIO_ALT,
					  DATA_ALT = V_DATA_ALT			  
                WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;

  END IF;

  /* COMMIT WORK; */
END;
$$ language plpgsql; PRC_CAIXA;