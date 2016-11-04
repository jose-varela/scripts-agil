CREATE OR REPLACE FUNCTION GET_HORA_RASTREIO(V_POSTO           IN INT,
                                             V_ATENDIMENTO     IN INT,
                                             V_CORREL          IN INT,
                                             V_AMOSTRA         IN INT,
                                             V_CENTRO_RASTREIO IN INT) RETURN TIMESTAMP(0) IS
 DECLARE RESULT TIMESTAMP(0);
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
$$ LANGUAGE plpgsql;
/
