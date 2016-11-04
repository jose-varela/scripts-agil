CREATE OR REPLACE PROCEDURE PRC_EXAMES(V_POSTO         IN EXAMES.POSTO%TYPE,
                                       V_ATENDIMENTO   IN EXAMES.ATENDIMENTO%TYPE,
                                       V_CORREL        IN EXAMES.CORREL%TYPE,
                                       V_LIB_FAT       IN EXAMES.LIB_FAT%TYPE,
                                       V_FUNCAO        IN NUMBER) IS
BEGIN                                                       
IF V_FUNCAO = 2 THEN
       UPDATE EXAMES SET LIB_FAT = V_LIB_FAT
                          WHERE POSTO = V_POSTO AND ATENDIMENTO = V_ATENDIMENTO AND CORREL   = V_CORREL;

  COMMIT WORK;
END IF;
END PRC_EXAMES;
/
