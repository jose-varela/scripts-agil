CREATE OR REPLACE PROCEDURE PRC_EQUIPAMENTOS(V_EQUIPAMENTO              IN OUT  EQUIPAMENTOS.EQUIPAMENTO%TYPE,
                                             V_NOME                     IN      EQUIPAMENTOS.NOME%TYPE,
                                             V_MODELO_EQUIPAMENTO       IN      EQUIPAMENTOS.MODELO_EQUIPAMENTO%TYPE,
                                             V_STATUS                   IN      EQUIPAMENTOS.STATUS%TYPE,
                                             V_HOST                     IN      EQUIPAMENTOS.HOST%TYPE,
                                             V_PORTA                    IN      EQUIPAMENTOS.PORTA%TYPE,
                                             V_BITS_SEGUNDO             IN      EQUIPAMENTOS.BITS_SEGUNDO%TYPE,
                                             V_BITS_DADOS               IN      EQUIPAMENTOS.BITS_DADOS%TYPE,
                                             V_PARIDADE                 IN      EQUIPAMENTOS.PARIDADE%TYPE,
                                             V_BITS_PARADA              IN      EQUIPAMENTOS.BITS_PARADA%TYPE,
                                             V_CONTROLE_FLUXO           IN      EQUIPAMENTOS.CONTROLE_FLUXO%TYPE,
                                             V_MODO_OPERACAO            IN      EQUIPAMENTOS.MODO_OPERACAO%TYPE,
                                             V_TIPO_COMUNICACAO         IN      EQUIPAMENTOS.TIPO_COMUNICACAO%TYPE,
                                             V_LOCAL_IN                 IN      EQUIPAMENTOS.LOCAL_IN%TYPE,
                                             V_LOCAL_OUT                IN      EQUIPAMENTOS.LOCAL_OUT%TYPE,
                                             V_ENDERECO_IP              IN      EQUIPAMENTOS.ENDERECO_IP%TYPE,
                                             V_ALIAS                    IN      EQUIPAMENTOS.ALIAS%TYPE,
                                             V_FORMATO_INTERFACE        IN      EQUIPAMENTOS.FORMATO_INTERFACE%TYPE,
                                             V_HEADER_ASTM              IN      EQUIPAMENTOS.HEADER_ASTM%TYPE,
                                             V_SEPARA_EXAMES_ASTM       IN      EQUIPAMENTOS.SEPARA_EXAMES_ASTM%TYPE,
                                             V_DIFERENCIA_PRIMEIRO_ASTM IN      EQUIPAMENTOS.DIFERENCIA_PRIMEIRO_ASTM%TYPE,
                                             V_FINAL_LINEA_ASTM         IN      EQUIPAMENTOS.FINAL_LINEA_ASTM%TYPE,
                                             V_SEPARA_LOGS              IN      EQUIPAMENTOS.SEPARA_LOGS%TYPE,
                                             V_TERMINATION_CODE_ASTM    IN      EQUIPAMENTOS.TERMINATION_CODE_ASTM%TYPE,
                                             V_LAYOUT_INTERFACE         IN      EQUIPAMENTOS.LAYOUT_INTERFACE%TYPE,
                                             V_ACTION_CODE_ASTM         IN      EQUIPAMENTOS.ACTION_CODE_ASTM%TYPE,
                                             V_REPORT_TYPE_ASTM         IN      EQUIPAMENTOS.REPORT_TYPE_ASTM%TYPE,
                                             V_SEPARA_BLOCOS_ENVIO      IN      EQUIPAMENTOS.SEPARA_BLOCOS_ENVIO%TYPE,
                                             V_FUNCAO                   IN      NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_EQUIPAMENTO.NEXTVAL INTO V_EQUIPAMENTO FROM DUAL;
     INSERT INTO EQUIPAMENTOS VALUES (V_EQUIPAMENTO, V_NOME, V_MODELO_EQUIPAMENTO, V_STATUS, V_HOST, V_PORTA, 
                                      V_BITS_SEGUNDO, V_BITS_DADOS, V_PARIDADE, V_BITS_PARADA, V_CONTROLE_FLUXO, 
                                      V_MODO_OPERACAO, V_TIPO_COMUNICACAO, V_LOCAL_IN, V_LOCAL_OUT, V_ENDERECO_IP, V_ALIAS, V_FORMATO_INTERFACE,
                                      V_HEADER_ASTM, V_SEPARA_EXAMES_ASTM, V_DIFERENCIA_PRIMEIRO_ASTM, V_FINAL_LINEA_ASTM, V_SEPARA_LOGS, 
                                      V_TERMINATION_CODE_ASTM, V_LAYOUT_INTERFACE, V_ACTION_CODE_ASTM, V_REPORT_TYPE_ASTM, V_SEPARA_BLOCOS_ENVIO);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE EQUIPAMENTOS SET NOME = V_NOME, MODELO_EQUIPAMENTO = V_MODELO_EQUIPAMENTO,
                             STATUS = V_STATUS, HOST = V_HOST, PORTA = V_PORTA, 
                             BITS_SEGUNDO = V_BITS_SEGUNDO, BITS_DADOS = V_BITS_DADOS, 
                             PARIDADE = V_PARIDADE, BITS_PARADA = V_BITS_PARADA, 
                             CONTROLE_FLUXO = V_CONTROLE_FLUXO, MODO_OPERACAO = V_MODO_OPERACAO,
                             TIPO_COMUNICACAO = V_TIPO_COMUNICACAO, LOCAL_IN = V_LOCAL_IN,
                             LOCAL_OUT = V_LOCAL_OUT, ENDERECO_IP = V_ENDERECO_IP, ALIAS = V_ALIAS,
                             FORMATO_INTERFACE = V_FORMATO_INTERFACE, HEADER_ASTM = V_HEADER_ASTM, SEPARA_EXAMES_ASTM = V_SEPARA_EXAMES_ASTM,
                             DIFERENCIA_PRIMEIRO_ASTM = V_DIFERENCIA_PRIMEIRO_ASTM, FINAL_LINEA_ASTM = V_FINAL_LINEA_ASTM, SEPARA_LOGS = V_SEPARA_LOGS,
			                 TERMINATION_CODE_ASTM = V_TERMINATION_CODE_ASTM, LAYOUT_INTERFACE = V_LAYOUT_INTERFACE,
                             ACTION_CODE_ASTM = V_ACTION_CODE_ASTM, REPORT_TYPE_ASTM = V_REPORT_TYPE_ASTM,
                             SEPARA_BLOCOS_ENVIO = V_SEPARA_BLOCOS_ENVIO
                        WHERE EQUIPAMENTO = V_EQUIPAMENTO;
  
  ELSIF V_FUNCAO = 3 THEN
     DELETE EQUIPAMENTOS WHERE EQUIPAMENTO = V_EQUIPAMENTO;
  END IF;

  COMMIT WORK;

END PRC_EQUIPAMENTOS;
/
