CREATE OR REPLACE PROCEDURE PRC_SERVICOS_B2B(V_ID_SERVICO_B2B               IN OUT SERVICOS_B2B.ID_SERVICO_B2B%TYPE,
                                             V_NOME                         IN     SERVICOS_B2B.NOME%TYPE,
                                             V_PASTA_DESTINO                IN     SERVICOS_B2B.PASTA_DESTINO%TYPE,
                                             V_PASTA_ORIGEM                 IN     SERVICOS_B2B.PASTA_ORIGEM%TYPE,
                                             V_TIPO_SERVICO_B2B             IN     SERVICOS_B2B.TIPO_SERVICO_B2B%TYPE,
                                             V_EXPORTA_RESULTADOS           IN     SERVICOS_B2B.EXPORTA_RESULTADOS%TYPE,
                                             V_EXTENSAO_DESTINO             IN     SERVICOS_B2B.EXTENSAO_DESTINO%TYPE,
                                             V_EXTENSAO_ORIGEM              IN     SERVICOS_B2B.EXTENSAO_ORIGEM%TYPE,
                                             V_INTERVALO_MONITOR            IN     SERVICOS_B2B.INTERVALO_MONITOR%TYPE,
                                             V_UTILIZA_NUMERACAO_INTEGRACAO IN     SERVICOS_B2B.UTILIZA_NUMERACAO_INTEGRACAO%TYPE,
                                             V_TIPO_COMUNICACAO             IN     SERVICOS_B2B.TIPO_COMUNICACAO%TYPE,
                                             V_URL                          IN     SERVICOS_B2B.URL%TYPE,
                                             V_EQUIPAMENTO                  IN     SERVICOS_B2B.EQUIPAMENTO%TYPE,
                                             V_STATUS                       IN     SERVICOS_B2B.STATUS%TYPE, 
					                         V_MODELO_SERVICO_B2B           IN     SERVICOS_B2B.MODELO_SERVICO_B2B%TYPE,
											 V_TIPO_DB                	    IN     SERVICOS_B2B.TIPO_DB%TYPE,
                                             V_USER_DB                	    IN     SERVICOS_B2B.USER_DB%TYPE,
											 V_PASSWORD_DB                  IN     SERVICOS_B2B.PASSWORD_DB%TYPE,
											 V_HOST_DB                      IN     SERVICOS_B2B.HOST_DB%TYPE,
											 V_NOME_DB                      IN     SERVICOS_B2B.NOME_DB%TYPE,
											 V_PORTA_DB                     IN     SERVICOS_B2B.PORTA_DB%TYPE,
                                             V_FUNCAO                       IN     NUMBER) IS                         
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_SERVICO_B2B.NEXTVAL INTO V_ID_SERVICO_B2B FROM DUAL;

     INSERT INTO SERVICOS_B2B VALUES (V_ID_SERVICO_B2B, V_NOME, V_PASTA_DESTINO, V_PASTA_ORIGEM, 
                                      V_TIPO_SERVICO_B2B, V_EXPORTA_RESULTADOS, V_EXTENSAO_DESTINO, 
									  V_EXTENSAO_ORIGEM, V_INTERVALO_MONITOR, V_UTILIZA_NUMERACAO_INTEGRACAO,
									  V_TIPO_COMUNICACAO, V_URL, V_EQUIPAMENTO, V_STATUS, V_MODELO_SERVICO_B2B, 
									  V_TIPO_DB, V_USER_DB, V_PASSWORD_DB, V_HOST_DB, V_NOME_DB, V_PORTA_DB);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE SERVICOS_B2B SET NOME = V_NOME, PASTA_DESTINO = V_PASTA_DESTINO, PASTA_ORIGEM = V_PASTA_ORIGEM, TIPO_SERVICO_B2B = V_TIPO_SERVICO_B2B, 
                         EXPORTA_RESULTADOS = V_EXPORTA_RESULTADOS, EXTENSAO_DESTINO = V_EXTENSAO_DESTINO, EXTENSAO_ORIGEM = V_EXTENSAO_ORIGEM, 
						 INTERVALO_MONITOR = V_INTERVALO_MONITOR, UTILIZA_NUMERACAO_INTEGRACAO = V_UTILIZA_NUMERACAO_INTEGRACAO,
						 TIPO_COMUNICACAO = V_TIPO_COMUNICACAO, URL = V_URL, EQUIPAMENTO = V_EQUIPAMENTO, STATUS = V_STATUS, MODELO_SERVICO_B2B = V_MODELO_SERVICO_B2B, TIPO_DB = V_TIPO_DB, USER_DB = V_USER_DB, 
						 PASSWORD_DB = V_PASSWORD_DB, HOST_DB = V_HOST_DB, NOME_DB = V_NOME_DB, PORTA_DB = V_PORTA_DB 
      WHERE ID_SERVICO_B2B = V_ID_SERVICO_B2B;

  ELSIF V_FUNCAO = 3 THEN
     DELETE SERVICOS_B2B WHERE ID_SERVICO_B2B = V_ID_SERVICO_B2B;
     
  END IF;             

  COMMIT WORK;

END PRC_SERVICOS_B2B;