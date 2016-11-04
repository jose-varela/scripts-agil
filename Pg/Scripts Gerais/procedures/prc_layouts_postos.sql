CREATE OR REPLACE FUNCTION PRC_LAYOUTS_POSTOS(V_ID_LAYOUT          IN LAYOUTS_POSTOS.ID_LAYOUT%TYPE,
                                               V_POSTO              IN LAYOUTS_POSTOS.POSTO%TYPE,
                                               V_FUNCAO             IN INT) RETURNS VOID AS $$
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     INSERT INTO LAYOUTS_POSTOS VALUES(V_ID_LAYOUT, V_POSTO);

  ELSIF V_FUNCAO = 3 THEN
            DELETE LAYOUTS_POSTOS WHERE ID_LAYOUT=V_ID_LAYOUT AND POSTO=V_POSTO;	

  END IF;

  /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_LAYOUTS_POSTOS;
/
