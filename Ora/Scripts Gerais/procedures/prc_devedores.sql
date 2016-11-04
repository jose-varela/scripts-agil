CREATE OR REPLACE PROCEDURE PRC_DEVEDORES(V_CONTA_HOSP     IN DEVEDORES.CONTA_HOSP%TYPE,
                                          V_REGISTRO       IN DEVEDORES.REGISTRO%TYPE,
                                          V_VALOR_FAT      IN DEVEDORES.VALOR_FAT%TYPE,
                                          V_VALOR          IN DEVEDORES.VALOR%TYPE,
                                          V_VALOR_PAG      IN DEVEDORES.VALOR_PAG%TYPE,
                                          V_VALOR_DTO      IN DEVEDORES.VALOR_DTO%TYPE,
                                          V_DATA_CAD       IN DEVEDORES.DATA_CAD%TYPE,
                                          V_CATALOGO       IN DEVEDORES.CATALOGO%TYPE,
                                          V_STATUS         IN DEVEDORES.STATUS%TYPE,
                                          V_USUARIO_STATUS IN DEVEDORES.USUARIO_STATUS%TYPE,
                                          V_DATA_STATUS    IN DEVEDORES.DATA_STATUS%TYPE,
                                          V_FUNCAO         IN NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO DEVEDORES VALUES (V_CONTA_HOSP, V_REGISTRO,  V_VALOR_FAT, V_VALOR, 
                                          V_VALOR_PAG,  V_VALOR_DTO, V_DATA_CAD, V_CATALOGO,
                                          V_STATUS, V_USUARIO_STATUS, V_DATA_STATUS);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE DEVEDORES SET VALOR_FAT = V_VALOR_FAT, VALOR = V_VALOR, VALOR_PAG = V_VALOR_PAG, 
                          VALOR_DTO = V_VALOR_DTO, DATA_CAD  = V_DATA_CAD, STATUS = V_STATUS,
                          USUARIO_STATUS = V_USUARIO_STATUS, DATA_STATUS = V_DATA_STATUS
                    WHERE CONTA_HOSP = V_CONTA_HOSP;

  ELSIF V_FUNCAO = 3 THEN
     DELETE DEVEDORES WHERE CONTA_HOSP = V_CONTA_HOSP;

  END IF;

  COMMIT WORK;
END PRC_DEVEDORES;
/
