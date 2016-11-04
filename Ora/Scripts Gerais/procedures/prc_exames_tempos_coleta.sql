CREATE OR REPLACE PROCEDURE PRC_EXAMES_TEMPOS_COLETA(V_POSTO              IN EXAMES_TEMPOS_COLETA.POSTO%TYPE,
                                                     V_ATENDIMENTO        IN EXAMES_TEMPOS_COLETA.ATENDIMENTO%TYPE,
                                                     V_CORREL             IN EXAMES_TEMPOS_COLETA.CORREL%TYPE,
                                                     V_AMOSTRA            IN EXAMES_TEMPOS_COLETA.AMOSTRA%TYPE,
                                                     V_ID_TEMPO_COLETA    IN EXAMES_TEMPOS_COLETA.ID_TEMPO_COLETA%TYPE,
                                                     V_CONTROLE           IN EXAMES_TEMPOS_COLETA.CONTROLE%TYPE,
                                                     V_PENDENCIA          IN EXAMES_TEMPOS_COLETA.PENDENCIA%TYPE,
                                                     V_IMPR_MAPA          IN EXAMES_TEMPOS_COLETA.IMPR_MAPA%TYPE,
                                                     V_DATA_CAD           IN EXAMES_TEMPOS_COLETA.DATA_CAD%TYPE,
                                                     V_DATA_COLE          IN EXAMES_TEMPOS_COLETA.DATA_COLE%TYPE,
                                                     V_USUARIO            IN EXAMES_TEMPOS_COLETA.USUARIO%TYPE,
                                                     V_USUARIO_COLE       IN EXAMES_TEMPOS_COLETA.USUARIO_COLE%TYPE,
                                                     V_ETIQUETA           IN EXAMES_TEMPOS_COLETA.ETIQUETA%TYPE,
                                                     V_SITUACAO_INTERFACE IN EXAMES_TEMPOS_COLETA.SITUACAO_INTERFACE%TYPE,
                                                     V_FUNCAO             IN NUMBER) IS
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     INSERT INTO EXAMES_TEMPOS_COLETA VALUES(V_POSTO, V_ATENDIMENTO, V_CORREL, V_AMOSTRA, V_ID_TEMPO_COLETA, 
                                             V_CONTROLE, V_PENDENCIA, V_IMPR_MAPA, V_DATA_CAD, V_DATA_COLE, 
                                             V_USUARIO, V_USUARIO_COLE, V_ETIQUETA, V_SITUACAO_INTERFACE);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET CONTROLE           = V_CONTROLE,
                                            PENDENCIA          = V_PENDENCIA,
                                            IMPR_MAPA          = V_IMPR_MAPA,
                                            DATA_CAD           = V_DATA_CAD,
                                            DATA_COLE          = V_DATA_COLE,
                                            USUARIO            = V_USUARIO,
                                            USUARIO_COLE       = V_USUARIO_COLE,
                                            ETIQUETA           = V_ETIQUETA,
                                            SITUACAO_INTERFACE = V_SITUACAO_INTERFACE
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 3 THEN
            DELETE EXAMES_TEMPOS_COLETA WHERE POSTO            = V_POSTO
                                          AND ATENDIMENTO      = V_ATENDIMENTO
                                          AND CORREL           = V_CORREL
                                          AND AMOSTRA          = V_AMOSTRA
                                          AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 4 THEN
            DELETE EXAMES_TEMPOS_COLETA WHERE POSTO            = V_POSTO
                                          AND ATENDIMENTO      = V_ATENDIMENTO
                                          AND CORREL           = V_CORREL
                                          AND AMOSTRA          = V_AMOSTRA;

  ELSIF V_FUNCAO = 8 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET PENDENCIA          = V_PENDENCIA,
                                            DATA_COLE          = V_DATA_COLE,
                                            USUARIO_COLE       = V_USUARIO_COLE,
                                            IMPR_MAPA          = V_IMPR_MAPA,
                                            ETIQUETA           = V_ETIQUETA,
                                            CONTROLE           = V_CONTROLE,
                                            SITUACAO_INTERFACE = V_SITUACAO_INTERFACE
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 9 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET IMPR_MAPA = V_IMPR_MAPA
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 11 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET ETIQUETA = V_ETIQUETA
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 18 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET SITUACAO_INTERFACE = V_SITUACAO_INTERFACE
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  ELSIF V_FUNCAO = 21 THEN
            UPDATE EXAMES_TEMPOS_COLETA SET DATA_COLE          = V_DATA_COLE,
                                            USUARIO_COLE       = V_USUARIO_COLE
                                      WHERE POSTO            = V_POSTO
                                        AND ATENDIMENTO      = V_ATENDIMENTO
                                        AND CORREL           = V_CORREL
                                        AND AMOSTRA          = V_AMOSTRA
                                        AND ID_TEMPO_COLETA  = V_ID_TEMPO_COLETA;

  END IF;

  COMMIT WORK;
END PRC_EXAMES_TEMPOS_COLETA;
/
