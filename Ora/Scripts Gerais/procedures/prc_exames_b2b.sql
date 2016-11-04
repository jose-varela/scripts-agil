CREATE OR REPLACE PROCEDURE PRC_EXAMES_B2B(V_ID_EXAME_B2B           IN OUT EXAMES_B2B.ID_EXAME_B2B%TYPE,
                                           V_POSTO                  IN EXAMES_B2B.POSTO%TYPE,
                                           V_ATENDIMENTO            IN EXAMES_B2B.ATENDIMENTO%TYPE,
                                           V_CORREL                 IN EXAMES_B2B.CORREL%TYPE,
                                           V_AMOSTRA                IN EXAMES_B2B.AMOSTRA%TYPE,
                                           V_POSTO_B2B              IN EXAMES_B2B.POSTO_B2B%TYPE,
                                           V_ID_SERVICO_B2B         IN EXAMES_B2B.ID_SERVICO_B2B%TYPE,
                                           V_CORREL_B2B             IN EXAMES_B2B.CORREL_B2B%TYPE,
                                           V_SITUACAO_B2B           IN EXAMES_B2B.SITUACAO_B2B%TYPE,
                                           V_DATA_B2B               IN EXAMES_B2B.DATA_B2B%TYPE,
                                           V_USUARIO_B2B            IN EXAMES_B2B.USUARIO_B2B%TYPE,
                                           V_ESTACAO_B2B            IN EXAMES_B2B.ESTACAO_B2B%TYPE,
                                           V_LOTE_B2B               IN EXAMES_B2B.LOTE_B2B%TYPE,
				                    	   V_CODIGO_EXTERNO         IN EXAMES_B2B.CODIGO_EXTERNO%TYPE,
					                       V_ETIQUETA_EXTERNO       IN EXAMES_B2B.ETIQUETA_EXTERNO%TYPE,
                                           V_FUNCAO                 IN NUMBER) IS
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     SELECT SQ_EXAME_B2B.NEXTVAL INTO V_ID_EXAME_B2B FROM DUAL;
     INSERT INTO EXAMES_B2B VALUES(V_ID_EXAME_B2B, V_POSTO, V_ATENDIMENTO, V_CORREL, V_AMOSTRA, V_POSTO_B2B, 
                                   V_ID_SERVICO_B2B, V_CORREL_B2B, V_SITUACAO_B2B, V_DATA_B2B, 
                                   V_USUARIO_B2B, V_ESTACAO_B2B, V_LOTE_B2B, V_CODIGO_EXTERNO,V_ETIQUETA_EXTERNO);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE EXAMES_B2B SET POSTO                 = V_POSTO,
                                  ATENDIMENTO           = V_ATENDIMENTO,
                                  CORREL                = V_CORREL,
                                  AMOSTRA               = V_AMOSTRA,
                                  POSTO_B2B             = V_POSTO_B2B,
                                  ID_SERVICO_B2B        = V_ID_SERVICO_B2B,
                                  CORREL_B2B            = V_CORREL_B2B,
                                  SITUACAO_B2B          = V_SITUACAO_B2B,
                                  DATA_B2B              = V_DATA_B2B,
                                  USUARIO_B2B           = V_USUARIO_B2B,
                                  ESTACAO_B2B           = V_ESTACAO_B2B,
								  CODIGO_EXTERNO        = V_CODIGO_EXTERNO,
								  ETIQUETA_EXTERNO      = V_ETIQUETA_EXTERNO
                          WHERE ID_EXAME_B2B = V_ID_EXAME_B2B;

  ELSIF V_FUNCAO = 3 THEN
            DELETE EXAMES_B2B WHERE ID_EXAME_B2B = V_ID_EXAME_B2B;

  ELSIF V_FUNCAO = 4 THEN
            DELETE EXAMES_B2B WHERE POSTO = V_ID_EXAME_B2B;
			
  ELSIF V_FUNCAO = 5 THEN
            UPDATE EXAMES_B2B SET SITUACAO_B2B          = V_SITUACAO_B2B,
                                  DATA_B2B              = V_DATA_B2B,
                                  USUARIO_B2B           = V_USUARIO_B2B,
                                  ESTACAO_B2B           = V_ESTACAO_B2B
                          WHERE ID_EXAME_B2B = V_ID_EXAME_B2B;

  END IF;

  COMMIT WORK;
END PRC_EXAMES_B2B;
/
