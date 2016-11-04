CREATE OR REPLACE FUNCTION PRC_TABELAS_RECEBIDAS(V_POSTO            IN TABELAS_RECEBIDAS.POSTO%TYPE,
                                                  V_NOME_TABELA      IN TABELAS_RECEBIDAS.NOME_TABELA%TYPE,
                                                  V_DATA_RECEBIMENTO IN TABELAS_RECEBIDAS.DATA_RECEBIMENTO%TYPE,
                                                  V_HORA_RECEBIMENTO IN TABELAS_RECEBIDAS.HORA_RECEBIMENTO%TYPE,
                                                  V_STATUS_TABELA    IN TABELAS_RECEBIDAS.STATUS_TABELA%TYPE,
                                                  V_CONTEUDO0        IN VARCHAR(4000),
                                                  V_CONTEUDO1        IN VARCHAR(4000),
                                                  V_CONTEUDO2        IN VARCHAR(4000),
                                                  V_CONTEUDO3        IN VARCHAR(4000),
                                                  V_CONTEUDO4        IN VARCHAR(4000),
                                                  V_CONTEUDO5        IN VARCHAR(4000),
                                                  V_CONTEUDO6        IN VARCHAR(4000),
                                                  V_CONTEUDO7        IN VARCHAR(4000),
                                                  V_CONTEUDO8        IN VARCHAR(4000),
                                                  V_CONTEUDO9        IN VARCHAR(4000),
                                                  V_CONTEUDO10       IN VARCHAR(4000),
                                                  V_CONTEUDO11       IN VARCHAR(4000),
                                                  V_CONTEUDO12       IN VARCHAR(4000),
                                                  V_CONTEUDO13       IN VARCHAR(4000),
                                                  V_CONTEUDO14       IN VARCHAR(4000),
                                                  V_CONTEUDO15       IN VARCHAR(4000),
                                                  V_CONTEUDO16       IN VARCHAR(4000),
                                                  V_CONTEUDO17       IN VARCHAR(4000),
                                                  V_CONTEUDO18       IN VARCHAR(4000),
                                                  V_CONTEUDO19       IN VARCHAR(4000),
                                                  V_CONTEUDO20       IN VARCHAR(4000),
                                                  V_CONTEUDO21       IN VARCHAR(4000),
                                                  V_CONTEUDO22       IN VARCHAR(4000),
                                                  V_CONTEUDO23       IN VARCHAR(4000),
                                                  V_CONTEUDO24       IN VARCHAR(4000),
                                                  V_CONTEUDO25       IN VARCHAR(4000),
                                                  V_CONTEUDO26       IN VARCHAR(4000),
                                                  V_CONTEUDO27       IN VARCHAR(4000),
                                                  V_CONTEUDO28       IN VARCHAR(4000),
                                                  V_CONTEUDO29       IN VARCHAR(4000),
                                                  V_FUNCAO           IN INT) RETURNS VOID AS $$

   DECLARE
          F_CONTEUDO0  VARCHAR(2000);
          F_CONTEUDO1  VARCHAR(2000);
          F_CONTEUDO2  VARCHAR(2000);
          F_CONTEUDO3  VARCHAR(2000);
          F_CONTEUDO4  VARCHAR(2000);
          F_CONTEUDO5  VARCHAR(2000);
          F_CONTEUDO6  VARCHAR(2000);
          F_CONTEUDO7  VARCHAR(2000);
          F_CONTEUDO8  VARCHAR(2000);
          F_CONTEUDO9  VARCHAR(2000);
          F_CONTEUDO10 VARCHAR(2000);
          F_CONTEUDO11 VARCHAR(2000);
          F_CONTEUDO12 VARCHAR(2000);
          F_CONTEUDO13 VARCHAR(2000);
          F_CONTEUDO14 VARCHAR(2000);
          F_CONTEUDO15 VARCHAR(2000);
          F_CONTEUDO16 VARCHAR(2000);
          F_CONTEUDO17 VARCHAR(2000);
          F_CONTEUDO18 VARCHAR(2000);
          F_CONTEUDO19 VARCHAR(2000);
          F_CONTEUDO20 VARCHAR(2000);
          F_CONTEUDO21 VARCHAR(2000);
          F_CONTEUDO22 VARCHAR(2000);
          F_CONTEUDO23 VARCHAR(2000);
          F_CONTEUDO24 VARCHAR(2000);
          F_CONTEUDO25 VARCHAR(2000);
          F_CONTEUDO26 VARCHAR(2000);
          F_CONTEUDO27 VARCHAR(2000);
          F_CONTEUDO28 VARCHAR(2000);
          F_CONTEUDO29 VARCHAR(2000);
                       
  BEGIN
BEGIN        
       IF V_FUNCAO = 1 THEN
          F_CONTEUDO0  := V_CONTEUDO0;
          F_CONTEUDO1  := V_CONTEUDO1; 
          F_CONTEUDO2  := V_CONTEUDO2; 
          F_CONTEUDO3  := V_CONTEUDO3; 
          F_CONTEUDO4  := V_CONTEUDO4; 
          F_CONTEUDO5  := V_CONTEUDO5; 
          F_CONTEUDO6  := V_CONTEUDO6; 
          F_CONTEUDO7  := V_CONTEUDO7; 
          F_CONTEUDO8  := V_CONTEUDO8; 
          F_CONTEUDO9  := V_CONTEUDO9; 
          F_CONTEUDO10 := V_CONTEUDO10; 
          F_CONTEUDO11 := V_CONTEUDO11; 
          F_CONTEUDO12 := V_CONTEUDO12; 
          F_CONTEUDO13 := V_CONTEUDO13; 
          F_CONTEUDO14 := V_CONTEUDO14; 
          F_CONTEUDO15 := V_CONTEUDO15; 
          F_CONTEUDO16 := V_CONTEUDO16; 
          F_CONTEUDO17 := V_CONTEUDO17; 
          F_CONTEUDO18 := V_CONTEUDO18; 
          F_CONTEUDO19 := V_CONTEUDO19; 
          F_CONTEUDO20 := V_CONTEUDO20; 
          F_CONTEUDO21 := V_CONTEUDO21; 
          F_CONTEUDO22 := V_CONTEUDO22; 
          F_CONTEUDO23 := V_CONTEUDO23; 
          F_CONTEUDO24 := V_CONTEUDO24; 
          F_CONTEUDO25 := V_CONTEUDO25; 
          F_CONTEUDO26 := V_CONTEUDO26; 
          F_CONTEUDO27 := V_CONTEUDO27; 
          F_CONTEUDO28 := V_CONTEUDO28; 
          F_CONTEUDO29 := V_CONTEUDO29; 
                                    
       
          INSERT INTO TABELAS_RECEBIDAS VALUES (V_POSTO,  V_NOME_TABELA, V_DATA_RECEBIMENTO,
                                                      V_HORA_RECEBIMENTO, V_STATUS_TABELA,
                                                      F_CONTEUDO0  || F_CONTEUDO1  || F_CONTEUDO2  || 
                                                      F_CONTEUDO3  || F_CONTEUDO4  || F_CONTEUDO5  || 
                                                      F_CONTEUDO6  || F_CONTEUDO7  || F_CONTEUDO8  || 
                                                      F_CONTEUDO9  || F_CONTEUDO10 || F_CONTEUDO11 || 
                                                      F_CONTEUDO12 || F_CONTEUDO13 || F_CONTEUDO14 || 
                                                      F_CONTEUDO15 || F_CONTEUDO16 || F_CONTEUDO17 || 
                                                      F_CONTEUDO18 || F_CONTEUDO19 || F_CONTEUDO20 || 
                                                      F_CONTEUDO21 || F_CONTEUDO22 || F_CONTEUDO23 || 
                                                      F_CONTEUDO24 || F_CONTEUDO25 || F_CONTEUDO26 || 
                                                      F_CONTEUDO27 || F_CONTEUDO28 || F_CONTEUDO29 );
       
       ELSIF V_FUNCAO = 3 THEN
          DELETE TABELAS_RECEBIDAS WHERE POSTO = V_POSTO AND NOME_TABELA = V_NOME_TABELA
                                           AND DATA_RECEBIMENTO = V_DATA_RECEBIMENTO 
                                           AND HORA_RECEBIMENTO = V_HORA_RECEBIMENTO;
       
       END IF;
       
       /* COMMIT WORK; */
  END;
END;
$$ LANGUAGE plpgsql; PRC_TABELAS_RECEBIDAS;
/
