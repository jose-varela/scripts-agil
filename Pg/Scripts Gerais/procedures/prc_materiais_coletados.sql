CREATE OR REPLACE FUNCTION PRC_MATERIAIS_COLETADOS(V_MATERIAL     IN OUT MATERIAIS_COLETADOS.MATERIAL%TYPE,
                                                    V_NOME         IN     MATERIAIS_COLETADOS.NOME%TYPE,
                                                    V_QT           IN     MATERIAIS_COLETADOS.QT%TYPE,
                                                    V_TIPO         IN     MATERIAIS_COLETADOS.TIPO%TYPE,
                                                    V_STATUS       IN     MATERIAIS_COLETADOS.STATUS%TYPE,
                                                    V_VALIDADE     IN     MATERIAIS_COLETADOS.VALIDADE%TYPE,
                                                    V_UNIDADE      IN     MATERIAIS_COLETADOS.UNIDADE%TYPE,
                                                    V_FUNCAO       IN     INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     INSERT INTO MATERIAIS_COLETADOS VALUES (V_MATERIAL, V_NOME, V_QT, V_TIPO, V_STATUS, V_VALIDADE, V_UNIDADE);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE MATERIAIS_COLETADOS SET NOME = V_NOME, QT = V_QT, TIPO = V_TIPO, STATUS = V_STATUS, VALIDADE = V_VALIDADE, UNIDADE = V_UNIDADE
                          WHERE MATERIAL = V_MATERIAL;

  ELSIF V_FUNCAO = 3 THEN
     DELETE MATERIAIS_COLETADOS WHERE MATERIAL = V_MATERIAL;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_MATERIAIS;
/
