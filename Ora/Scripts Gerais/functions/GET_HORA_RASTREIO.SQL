CREATE OR REPLACE FUNCTION GET_HORA_RASTREIO(V_POSTO           IN NUMBER,
                                             V_ATENDIMENTO     IN NUMBER,
                                             V_CORREL          IN NUMBER,
                                             V_AMOSTRA         IN NUMBER,
                                             V_CENTRO_RASTREIO IN NUMBER) RETURN DATE IS RESULT DATE;
BEGIN
     SELECT MIN(RA.DATA_RASTRO) INTO RESULT 
       FROM RASTROS_AMOSTRAS RA
      WHERE RA.POSTO = V_POSTO
        AND RA.ATENDIMENTO = V_ATENDIMENTO
        AND RA.CORREL = V_CORREL
        AND RA.AMOSTRA = V_AMOSTRA
        AND RA.CENTRO_RASTREIO = V_CENTRO_RASTREIO;
    RETURN(RESULT);
END GET_HORA_RASTREIO;
/
