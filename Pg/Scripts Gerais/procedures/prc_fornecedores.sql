CREATE OR REPLACE FUNCTION PRC_FORNECEDORES(V_FORNECEDOR   IN OUT FORNECEDORES.FORNECEDOR%TYPE,
                                             V_FANTASIA     IN     FORNECEDORES.FANTASIA%TYPE,
                                             V_RAZAO        IN     FORNECEDORES.RAZAO%TYPE,
                                             V_CGC_CPF      IN     FORNECEDORES.CGC_CPF%TYPE,
                                             V_INSC_RG      IN     FORNECEDORES.INSC_RG%TYPE,
                                             V_ENDERECO     IN     FORNECEDORES.ENDERECO%TYPE,
                                             V_BAIRRO       IN     FORNECEDORES.BAIRRO%TYPE,
                                             V_CIDADE       IN     FORNECEDORES.CIDADE%TYPE,
                                             V_UF           IN     FORNECEDORES.UF%TYPE,
                                             V_CEP          IN     FORNECEDORES.CEP%TYPE,
                                             V_DDD_FONE     IN     FORNECEDORES.DDD_FONE%TYPE,
                                             V_TELEFONE     IN     FORNECEDORES.TELEFONE%TYPE,
                                             V_DDD_FAX      IN     FORNECEDORES.DDD_FAX%TYPE,
                                             V_FAX          IN     FORNECEDORES.FAX%TYPE,
                                             V_E_MAIL       IN     FORNECEDORES.E_MAIL%TYPE,
                                             V_CONTATO      IN     FORNECEDORES.CONTATO%TYPE,
                                             V_PESSOA       IN     FORNECEDORES.PESSOA%TYPE,
                                             V_OBS          IN     FORNECEDORES.OBS%TYPE,
                                             V_TABELA       IN     FORNECEDORES.TABELA%TYPE,
                                             V_DATA_CAD     IN     FORNECEDORES.DATA_CAD%TYPE,
                                             V_USER_ID      IN     FORNECEDORES.USER_ID%TYPE,
                                             V_FUNCAO       IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_FORNECEDOR.NEXTVAL INTO V_FORNECEDOR FROM DUAL;
     INSERT INTO FORNECEDORES VALUES (V_FORNECEDOR, V_FANTASIA, V_RAZAO,  V_CGC_CPF, V_INSC_RG,  V_ENDERECO,
                                            V_BAIRRO,     V_CIDADE,   V_UF,     V_CEP,     V_DDD_FONE, V_TELEFONE, 
                                            V_DDD_FAX,    V_FAX,      V_E_MAIL, V_CONTATO, V_PESSOA,   V_OBS,     
                                            V_TABELA,     V_DATA_CAD, V_USER_ID);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE FORNECEDORES SET FANTASIA = V_FANTASIA, RAZAO    = V_RAZAO,    CGC_CPF  = V_CGC_CPF,  INSC_RG  = V_INSC_RG,
                             ENDERECO = V_ENDERECO, BAIRRO   = V_BAIRRO,   CIDADE   = V_CIDADE,   UF       = V_UF,
                             CEP      = V_CEP,      DDD_FONE = V_DDD_FONE, TELEFONE = V_TELEFONE, DDD_FAX  = V_DDD_FAX,  
                             FAX      = V_FAX,      E_MAIL   = V_E_MAIL,   CONTATO  = V_CONTATO,  PESSOA   = V_PESSOA,
                             OBS      = V_OBS,      TABELA   = V_TABELA,   DATA_CAD = V_DATA_CAD, USER_ID  = V_USER_ID 
            WHERE FORNECEDOR = V_FORNECEDOR;

  ELSIF V_FUNCAO = 3 THEN
     DELETE FORNECEDORES WHERE FORNECEDOR = V_FORNECEDOR;

  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_FORNECEDORES;
/
