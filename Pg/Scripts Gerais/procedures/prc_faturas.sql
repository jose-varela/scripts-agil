CREATE OR REPLACE FUNCTION PRC_FATURAS(V_CONVENIO     IN FATURAS.CONVENIO%TYPE,
                                        V_DATA_DESDE   IN FATURAS.DATA_DESDE%TYPE,
                                        V_DATA_ATE     IN FATURAS.DATA_ATE%TYPE,
                                        V_FECHADA      IN FATURAS.FECHADA%TYPE,
                                        V_DISKETE      IN FATURAS.DISKETE%TYPE,
                                        V_STATUS       IN FATURAS.STATUS%TYPE,
                                        V_USUARIO      IN FATURAS.USUARIO%TYPE,
                                        V_DATA_CAD     IN FATURAS.DATA_CAD%TYPE,
                                        V_VALOR_FAT    IN FATURAS.VALOR_FAT%TYPE,
                                        V_VALOR_PAG    IN FATURAS.VALOR_PAG%TYPE,
                                        V_VALOR_GLO    IN FATURAS.VALOR_GLO%TYPE,
                                        V_ID_FATURA    IN OUT FATURAS.ID_FATURA%TYPE,
                                        V_CODIGO_PLANO IN FATURAS.CODIGO_PLANO%TYPE,
                                        V_FUNCAO       IN INT) RETURNS VOID AS $$
BEGIN

  IF (V_ID_FATURA = 0) THEN
     SELECT SQ_FATURA.NEXTVAL INTO V_ID_FATURA FROM DUAL;
  END IF;

  IF V_FUNCAO = 1 THEN
     INSERT INTO FATURAS VALUES (V_CONVENIO,  V_DATA_DESDE, V_DATA_ATE, V_FECHADA,
                                 V_DISKETE,   V_STATUS,     V_USUARIO,  V_DATA_CAD,
                                 V_VALOR_FAT, V_VALOR_PAG,  V_VALOR_GLO, V_ID_FATURA, V_CODIGO_PLANO);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE FATURAS SET VALOR_FAT = V_VALOR_FAT, VALOR_PAG = V_VALOR_PAG, VALOR_GLO = V_VALOR_GLO,
                              USUARIO   = V_USUARIO,   DATA_CAD  = V_DATA_CAD
                      WHERE CONVENIO = V_CONVENIO AND ID_FATURA = V_ID_FATURA;

  ELSIF V_FUNCAO = 3 THEN
     DELETE FATURAS WHERE ID_FATURA = V_ID_FATURA;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE FATURAS SET DATA_ATE = V_DATA_ATE, USUARIO = V_USUARIO, DATA_CAD = V_DATA_CAD
                      WHERE CONVENIO = V_CONVENIO AND ID_FATURA = V_ID_FATURA;

  ELSIF V_FUNCAO = 5 THEN
     UPDATE FATURAS SET FECHADA = V_FECHADA, STATUS = V_STATUS,
                              USUARIO = V_USUARIO, DATA_CAD  = V_DATA_CAD
                      WHERE CONVENIO = V_CONVENIO AND ID_FATURA = V_ID_FATURA;

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_FATURAS;
/

