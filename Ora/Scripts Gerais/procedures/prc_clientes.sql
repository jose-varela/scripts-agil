CREATE OR REPLACE PROCEDURE PRC_CLIENTES(V_REGISTRO       IN OUT CLIENTES.REGISTRO%TYPE,
                                         V_NOME           IN     CLIENTES.NOME%TYPE,
                                         V_DATA_NAS       IN     CLIENTES.DATA_NAS%TYPE,
                                         V_SEXO           IN     CLIENTES.SEXO%TYPE,
                                         V_TELEFONE       IN     CLIENTES.TELEFONE%TYPE,
                                         V_ENDERECO       IN     CLIENTES.ENDERECO%TYPE,
                                         V_CIDADE         IN     CLIENTES.CIDADE%TYPE,
                                         V_BAIRRO         IN     CLIENTES.BAIRRO%TYPE,
                                         V_ESTADO         IN     CLIENTES.ESTADO%TYPE,
                                         V_CEP            IN     CLIENTES.CEP%TYPE,
                                         V_DATA_CAD       IN     CLIENTES.DATA_CAD%TYPE,
                                         V_USUARIO        IN     CLIENTES.USUARIO%TYPE,
                                         V_IDENTIDADE     IN     CLIENTES.IDENTIDADE%TYPE,
                                         V_CPF            IN     CLIENTES.CPF%TYPE,
                                         V_CODIGO_EXTERNO IN     CLIENTES.CODIGO_EXTERNO%TYPE,
                                         V_TELEFONE2      IN     CLIENTES.TELEFONE2%TYPE,
                                         V_E_MAIL         IN     CLIENTES.E_MAIL%TYPE,
                                         V_INFORMA_EMAIL  IN     CLIENTES.INFORMA_EMAIL%TYPE,
                                         V_FUNCAO         IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 OR V_FUNCAO = 4 THEN
     IF V_FUNCAO = 1 THEN
        SELECT SQ_REGISTRO.NEXTVAL INTO V_REGISTRO FROM DUAL;
     END IF;

     INSERT INTO CLIENTES VALUES (V_REGISTRO, V_NOME,    V_DATA_NAS, V_SEXO,   V_TELEFONE,
                                      V_ENDERECO, V_CIDADE,  V_BAIRRO,   V_ESTADO, V_CEP,
                                      V_DATA_CAD, V_USUARIO, V_IDENTIDADE, V_CPF, V_CODIGO_EXTERNO, V_TELEFONE2, V_E_MAIL, V_INFORMA_EMAIL);

  ELSIF V_FUNCAO = 2 THEN
        UPDATE CLIENTES SET NOME     = V_NOME,     DATA_NAS   = V_DATA_NAS, SEXO   = V_SEXO,
                                TELEFONE = V_TELEFONE, ENDERECO  = V_ENDERECO, CIDADE = V_CIDADE,
                                BAIRRO   = V_BAIRRO,   CEP       = V_CEP,      ESTADO = V_ESTADO,
                                DATA_CAD = V_DATA_CAD, USUARIO   = V_USUARIO,  IDENTIDADE  = V_IDENTIDADE,
                                CPF      = V_CPF, CODIGO_EXTERNO = V_CODIGO_EXTERNO, TELEFONE2 = V_TELEFONE2,
                                E_MAIL   = V_E_MAIL, INFORMA_EMAIL = V_INFORMA_EMAIL
                          WHERE REGISTRO = V_REGISTRO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE CLIENTES WHERE REGISTRO = V_REGISTRO;
                            
  ELSIF V_FUNCAO = 5 THEN
     UPDATE CLIENTES SET ENDERECO  = V_ENDERECO
                          WHERE REGISTRO = V_REGISTRO;
  END IF;

  COMMIT WORK;
END PRC_CLIENTES;
/
