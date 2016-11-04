CREATE OR REPLACE PROCEDURE PRC_EXAMES(V_POSTO              IN EXAMES.POSTO%TYPE,
                                       V_ATENDIMENTO        IN EXAMES.ATENDIMENTO%TYPE,
                                       V_CORREL             IN EXAMES.CORREL%TYPE,
                                       V_CONTROLE           IN EXAMES.CONTROLE%TYPE,
                                       V_MED_REA1           IN EXAMES.MED_REA1%TYPE,
                                       V_MED_REA2           IN EXAMES.MED_REA2%TYPE,
                                       V_MNEMONICO          IN EXAMES.MNEMONICO%TYPE,
                                       V_MATERIAL           IN EXAMES.MATERIAL%TYPE,
                                       V_PENDENCIA          IN EXAMES.PENDENCIA%TYPE,
                                       V_SITUACAO           IN EXAMES.SITUACAO%TYPE,
                                       V_IMPR_MAPA          IN EXAMES.IMPR_MAPA%TYPE,
                                       V_VALOR_HON          IN EXAMES.VALOR_HON%TYPE,
                                       V_VALOR_ESPECIAL     IN EXAMES.VALOR_ESPECIAL%TYPE,
                                       V_DATA_CAD           IN EXAMES.DATA_CAD%TYPE,
                                       V_DATA_COLE          IN EXAMES.DATA_COLE%TYPE,
                                       V_USUARIO            IN EXAMES.USUARIO%TYPE,
                                       V_USUARIO_COLE       IN EXAMES.USUARIO_COLE%TYPE,
                                       V_OBSERVACOES        IN EXAMES.OBSERVACOES%TYPE,
                                       V_ETIQUETA           IN EXAMES.ETIQUETA%TYPE,
                                       V_GUIA               IN EXAMES.GUIA%TYPE,
                                       V_SENHA              IN EXAMES.SENHA%TYPE,
                                       V_LIB_FAT            IN EXAMES.LIB_FAT%TYPE,
                                       V_POSTO_REA          IN EXAMES.POSTO_REA%TYPE,
                                       V_SITUACAO_INTERFACE IN EXAMES.SITUACAO_INTERFACE%TYPE,
                                       V_DATA_ENT           IN EXAMES.DATA_ENT%TYPE,
                                       V_TIPO_COLETA        IN EXAMES.TIPO_COLETA%TYPE,
                                       V_DATA_REA1          IN EXAMES.DATA_REA1%TYPE,
                                       V_DATA_REA2          IN EXAMES.DATA_REA2%TYPE,
                                       V_VALOR_PAGO         IN EXAMES.VALOR_PAGO%TYPE,
                                       V_AUTORIZACAO        IN EXAMES.AUTORIZACAO%TYPE,
                                       V_FUNCAO             IN NUMBER) IS
BEGIN                                                       
  IF V_FUNCAO = 1 THEN                                      
     INSERT INTO EXAMES
            VALUES (V_POSTO,     V_ATENDIMENTO,  V_CORREL,         V_CONTROLE,  V_MED_REA1,
                    V_MED_REA2,  V_MNEMONICO,    V_MATERIAL,       V_PENDENCIA, V_SITUACAO,
                    V_IMPR_MAPA, V_VALOR_HON,    V_VALOR_ESPECIAL, V_DATA_CAD,  V_DATA_COLE,
                    V_USUARIO,   V_USUARIO_COLE, V_OBSERVACOES,    V_ETIQUETA,  V_GUIA,
                    V_SENHA,     V_LIB_FAT,      V_POSTO_REA,      V_SITUACAO_INTERFACE,
                    V_DATA_ENT,  V_TIPO_COLETA,  V_DATA_REA1,      V_DATA_REA2, V_VALOR_PAGO, V_AUTORIZACAO);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE EXAMES SET CONTROLE       = V_CONTROLE,
                                    MED_REA1       = V_MED_REA1,
                                    MED_REA2       = V_MED_REA2,
                                    MNEMONICO      = V_MNEMONICO,
                                    GUIA           = V_GUIA,
                                    DATA_COLE      = V_DATA_COLE,
                                    MATERIAL       = V_MATERIAL,
                                    PENDENCIA      = V_PENDENCIA,
                                    SITUACAO       = V_SITUACAO,
                                    IMPR_MAPA      = V_IMPR_MAPA,
                                    DATA_CAD       = V_DATA_CAD,
                                    USUARIO        = V_USUARIO,
                                    OBSERVACOES    = V_OBSERVACOES,
                                    VALOR_HON      = V_VALOR_HON,
                                    USUARIO_COLE   = V_USUARIO_COLE,
                                    VALOR_ESPECIAL = V_VALOR_ESPECIAL,
                                    ETIQUETA       = V_ETIQUETA,
                                    POSTO_REA      = V_POSTO_REA,
                                    SENHA          = V_SENHA,
                                    TIPO_COLETA    = V_TIPO_COLETA,
                                    DATA_REA1      = V_DATA_REA1,
                                    DATA_REA2      = V_DATA_REA2,
                                    VALOR_PAGO     = V_VALOR_PAGO,
									AUTORIZACAO    = V_AUTORIZACAO
                          WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL   = V_CORREL;

  ELSIF V_FUNCAO = 3 THEN
            DELETE EXAMES WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 4 THEN
            DELETE EXAMES WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO;

  ELSIF V_FUNCAO = 5 THEN
            UPDATE EXAMES SET GUIA = V_GUIA, SENHA = V_SENHA, AUTORIZACAO = V_AUTORIZACAO                                    
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 6 THEN
            UPDATE EXAMES SET OBSERVACOES = V_OBSERVACOES
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 7 THEN
            UPDATE EXAMES SET SITUACAO = V_SITUACAO,
                                    DATA_CAD = V_DATA_CAD,
                                    USUARIO  = V_USUARIO
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 8 THEN
            UPDATE EXAMES SET PENDENCIA          = V_PENDENCIA,
                                    DATA_COLE          = V_DATA_COLE,
                                    USUARIO_COLE       = V_USUARIO_COLE,
                                    IMPR_MAPA          = V_IMPR_MAPA,
                                    ETIQUETA           = V_ETIQUETA,
                                    CONTROLE           = V_CONTROLE,
                                    SITUACAO_INTERFACE = V_SITUACAO_INTERFACE
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 9 THEN
            UPDATE EXAMES SET IMPR_MAPA = V_IMPR_MAPA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 10 THEN
            UPDATE EXAMES SET VALOR_HON = V_VALOR_HON,
                              VALOR_ESPECIAL = V_VALOR_ESPECIAL,
                              VALOR_PAGO = V_VALOR_PAGO
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 11 THEN
            UPDATE EXAMES SET ETIQUETA = V_ETIQUETA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 12 THEN
            UPDATE EXAMES SET MATERIAL = V_MATERIAL
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 13 THEN
            UPDATE EXAMES SET MNEMONICO = V_MNEMONICO,
                                    MATERIAL  = V_MATERIAL,
                                    TIPO_COLETA = V_TIPO_COLETA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 14 THEN
            UPDATE EXAMES SET AUTORIZACAO = V_AUTORIZACAO
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 15 THEN
            UPDATE EXAMES SET SITUACAO = V_SITUACAO,
                                    MED_REA1 = V_MED_REA1,
                                    DATA_REA1 = V_DATA_REA1
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 16 THEN
            UPDATE EXAMES SET LIB_FAT = V_LIB_FAT
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 17 THEN
            UPDATE EXAMES SET POSTO_REA = V_POSTO_REA,
                                    IMPR_MAPA = V_IMPR_MAPA,
                                    ETIQUETA  = V_ETIQUETA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 18 THEN
            UPDATE EXAMES SET SITUACAO_INTERFACE = V_SITUACAO_INTERFACE
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 19 THEN
            UPDATE EXAMES SET DATA_ENT = V_DATA_ENT
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 20 THEN
            UPDATE EXAMES SET SITUACAO = V_SITUACAO,
                                    MED_REA2 = V_MED_REA2,
                                    DATA_REA2 = V_DATA_REA2
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 21 THEN
            UPDATE EXAMES SET DATA_COLE          = V_DATA_COLE,
                                    USUARIO_COLE       = V_USUARIO_COLE
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 22 THEN
            UPDATE EXAMES SET TIPO_COLETA = V_TIPO_COLETA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 23 THEN
            UPDATE EXAMES SET VALOR_PAGO = V_VALOR_PAGO
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  ELSIF V_FUNCAO = 24 THEN
            UPDATE EXAMES SET VALOR_PAGO = 0
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO;

  ELSIF V_FUNCAO = 25 THEN
            UPDATE EXAMES E SET VALOR_PAGO = VALOR_HON
                         WHERE POSTO = POSTO AND ATENDIMENTO = ATENDIMENTO AND CORREL = CORREL;

  ELSIF V_FUNCAO = 26 THEN
            UPDATE EXAMES SET POSTO_REA = V_POSTO_REA
                         WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL = V_CORREL;

  END IF;

  COMMIT WORK;
END PRC_EXAMES;
/
