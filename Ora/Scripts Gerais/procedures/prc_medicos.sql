CREATE OR REPLACE PROCEDURE PRC_MEDICOS(V_CRM             IN OUT MEDICOS.CRM%TYPE,
                                        V_NOME            IN     MEDICOS.NOME%TYPE,
                                        V_CPF             IN     MEDICOS.CPF%TYPE,
                                        V_TIPO            IN     MEDICOS.TIPO%TYPE,
                                        V_STATUS          IN     MEDICOS.STATUS%TYPE,
                                        V_UF_CONSELHO     IN     MEDICOS.UF_CONSELHO%TYPE,
                                        V_TIPO_CR         IN     MEDICOS.TIPO_CR%TYPE,
                                        V_TELEFONE        IN     MEDICOS.TELEFONE%TYPE,
                                        V_TELEFONE2       IN     MEDICOS.TELEFONE2%TYPE,
                                        V_EMAIL           IN     MEDICOS.EMAIL%TYPE,
                                        V_PASS            IN     MEDICOS.PASS%TYPE,
                                        V_ID_MEDICO       IN OUT MEDICOS.ID_MEDICO%TYPE,
                                        V_DATA_NAS        IN     MEDICOS.DATA_NAS%TYPE,
                                        V_PREFIXO_NOME    IN     MEDICOS.PREFIXO_NOME%TYPE,
                                        V_CODIGO_UNIMED   IN     MEDICOS.CODIGO_UNIMED%TYPE,
                                        V_ID_CBO          IN     MEDICOS.ID_CBO%TYPE,
                                        V_ESPECIALIZACAO  IN     MEDICOS.ESPECIALIZACAO%TYPE,
                                        V_CNS             IN     MEDICOS.CNS%TYPE,
                                        V_FUNCAO          IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_MEDICOS.NEXTVAL INTO V_ID_MEDICO FROM DUAL;

     INSERT INTO MEDICOS VALUES (V_CRM, V_NOME, V_CPF, V_TIPO, V_STATUS, V_UF_CONSELHO, V_TIPO_CR, V_TELEFONE, V_TELEFONE2, V_EMAIL, V_PASS, V_ID_MEDICO, V_DATA_NAS, V_PREFIXO_NOME, V_CODIGO_UNIMED, V_ID_CBO, V_ESPECIALIZACAO, V_CNS);
  
  ELSIF V_FUNCAO = 2 THEN
     UPDATE MEDICOS SET NOME = V_NOME, CPF = V_CPF, TIPO = V_TIPO, STATUS = V_STATUS,
                              UF_CONSELHO = V_UF_CONSELHO, TIPO_CR = V_TIPO_CR,
                              TELEFONE = V_TELEFONE, TELEFONE2 = V_TELEFONE2, EMAIL = V_EMAIL, 
                              PASS = V_PASS, DATA_NAS = V_DATA_NAS, PREFIXO_NOME = V_PREFIXO_NOME, 
                              CODIGO_UNIMED = V_CODIGO_UNIMED, ID_CBO = V_ID_CBO, ESPECIALIZACAO = V_ESPECIALIZACAO,
                              CNS= V_CNS 
      WHERE CRM = V_CRM;

  ELSIF V_FUNCAO = 3 THEN
     DELETE MEDICOS WHERE CRM = V_CRM;
  END IF;

  COMMIT WORK;

END PRC_MEDICOS;
/
