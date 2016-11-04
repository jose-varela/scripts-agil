CREATE OR REPLACE FUNCTION GET_RES_WORKLIST_RESULTADO(V_POSTO          IN INT,
                                                      V_ATENDIMENTO    IN INT,
                                                      V_CORREL         IN INT,
                                                      V_EQUIPAMENTO    IN INT,
                                                      V_DATA_RESULTADO IN TIMESTAMP(0)) RETURN VARCHAR(4000) IS
 DECLARE RESULT VARCHAR(500);
BEGIN

     SELECT WR.RESULTADO INTO RESULT FROM WORKLIST_RESULTADOS WR
      WHERE WR.POSTO = V_POSTO
        AND WR.ATENDIMENTO = V_ATENDIMENTO
        AND WR.CORREL = V_CORREL
        AND WR.EQUIPAMENTO = V_EQUIPAMENTO
        AND WR.DATA_RESULTADO = V_DATA_RESULTADO;
    RETURN(RESULT);
END GET_RES_WORKLIST_RESULTADO;
$$ LANGUAGE plpgsql;
/
