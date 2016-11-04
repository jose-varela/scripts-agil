CREATE OR REPLACE FUNCTION GET_ULTIMO_CENTRO_RASTREIO(V_POSTO       IN NUMBER,
                                                      V_ATENDIMENTO IN NUMBER,
                                                      V_CORREL      IN NUMBER,
                                                      V_AMOSTRA     IN NUMBER) RETURN NUMBER IS RESULT NUMBER;
BEGIN
     SELECT RA.CENTRO_RASTREIO INTO RESULT FROM RASTROS_AMOSTRAS RA
      WHERE RA.POSTO = V_POSTO
        AND RA.ATENDIMENTO = V_ATENDIMENTO
        AND RA.CORREL = V_CORREL
        AND RA.AMOSTRA = V_AMOSTRA
        AND RA.DATA_RASTRO = (SELECT MAX(MRA.DATA_RASTRO) FROM RASTROS_AMOSTRAS MRA
                               WHERE MRA.POSTO = RA.POSTO
                                 AND MRA.ATENDIMENTO = RA.ATENDIMENTO
                                 AND MRA.CORREL = RA.CORREL
                                 AND MRA.AMOSTRA = RA.AMOSTRA);
    RETURN(RESULT);
END GET_ULTIMO_CENTRO_RASTREIO;
/
