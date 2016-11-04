CREATE OR REPLACE FUNCTION PRC_CBO(V_ID_CBO        IN OUT CBO.ID_CBO%TYPE,
                                    V_NOME_OCUPACAO IN CBO.NOME_OCUPACAO%TYPE,
                                    V_FUNCAO        IN INT) RETURNS VOID AS $$
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     INSERT INTO CBO VALUES(V_ID_CBO, V_NOME_OCUPACAO);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE CBO SET NOME_OCUPACAO = V_NOME_OCUPACAO
            WHERE ID_CBO = V_ID_CBO;

  ELSIF V_FUNCAO = 3 THEN
            DELETE CBO WHERE ID_CBO = V_ID_CBO;	

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_CBO;
/
