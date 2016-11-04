CREATE OR REPLACE FUNCTION PRC_USUARIOS(V_USER_CODIGO    IN OUT USUARIOS.USER_CODIGO%TYPE,
                                         V_USER_TIPO      IN     USUARIOS.USER_TIPO%TYPE,
                                         V_USER_NOME      IN     USUARIOS.USER_NOME%TYPE,
                                         V_USER_ID        IN     USUARIOS.USER_ID%TYPE,
                                         V_SENHA          IN     USUARIOS.SENHA%TYPE,
                                         V_GRUPO          IN     USUARIOS.GRUPO%TYPE,
                                         V_DATA_CAD       IN     USUARIOS.DATA_CAD%TYPE,
                                         V_DATA_VALIDADE  IN     USUARIOS.DATA_VALIDADE%TYPE,
                                         V_VALIDADE       IN     USUARIOS.VALIDADE%TYPE,
                                         V_ATIVO          IN     USUARIOS.ATIVO%TYPE,
                                         V_FECHA_APP      IN     USUARIOS.FECHA_APP%TYPE,
                                         V_ID_MEDICO      IN     USUARIOS.ID_MEDICO%TYPE,
                                         V_FUNCAO         IN     INT) RETURNS VOID AS $$

BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_USUARIOS.NEXTVAL INTO V_USER_CODIGO FROM DUAL;
     INSERT INTO USUARIOS VALUES (V_USER_CODIGO, V_USER_TIPO, V_USER_NOME, V_USER_ID,
                                        V_SENHA,       V_GRUPO,     V_DATA_CAD,  V_DATA_VALIDADE,
                                        V_VALIDADE,    V_ATIVO,     V_FECHA_APP, EMPTY_BLOB(),
                                        V_ID_MEDICO); 

   ELSIF V_FUNCAO = 2 THEN
     UPDATE USUARIOS SET USER_NOME  = V_USER_NOME, SENHA = V_SENHA, GRUPO = V_GRUPO, 
                               DATA_CAD   = V_DATA_CAD,  DATA_VALIDADE = V_DATA_VALIDADE,
                               VALIDADE   = V_VALIDADE,  ATIVO = V_ATIVO, FECHA_APP = V_FECHA_APP,
                               ID_MEDICO  = V_ID_MEDICO
                            WHERE USER_CODIGO = V_USER_CODIGO;
                         
  ELSIF V_FUNCAO = 3 THEN
     DELETE USUARIOS WHERE USER_CODIGO = V_USER_CODIGO;

   ELSIF V_FUNCAO = 4 THEN
     UPDATE USUARIOS SET SENHA = V_SENHA
                            WHERE USER_CODIGO = V_USER_CODIGO;

  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_USUARIOS;
/
