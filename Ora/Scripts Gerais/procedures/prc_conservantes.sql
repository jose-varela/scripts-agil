CREATE OR REPLACE PROCEDURE PRC_CONSERVANTES(V_ID_CONSERVANTE    IN OUT CONSERVANTES.ID_CONSERVANTE%TYPE,
                                              V_NOME               IN CONSERVANTES.NOME%TYPE,
                                              V_STATUS             IN CONSERVANTES.STATUS%TYPE,
                                              V_FUNCAO             IN NUMBER) IS
BEGIN                                                           
  IF V_FUNCAO = 1 THEN                                          
     SELECT SQ_CONSERVANTE.NEXTVAL INTO V_ID_CONSERVANTE FROM DUAL;
     INSERT INTO CONSERVANTES VALUES(V_ID_CONSERVANTE, V_NOME, V_STATUS);

  ELSIF V_FUNCAO = 2 THEN
            UPDATE CONSERVANTES SET NOME       = V_NOME,
                                     STATUS     = V_STATUS
                          WHERE ID_CONSERVANTE = V_ID_CONSERVANTE;

  ELSIF V_FUNCAO = 3 THEN
            DELETE CONSERVANTES WHERE ID_CONSERVANTE = V_ID_CONSERVANTE;	

  END IF;

  COMMIT WORK;
END PRC_CONSERVANTES;
/

