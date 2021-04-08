CREATE OR REPLACE VIEW VEX_USUARIOS
(
  USER_ID,                                                                                                                                                                                 
  ATIVO,                                                                                                                                                                                           
  USER_NOME,                                                                                                                                                                               
  SENHA
)
AS
SELECT USER_ID, ATIVO, USER_NOME,  SENHA
  FROM USUARIOS
ORDER BY USER_ID;

GRANT SELECT
 ON VEX_USUARIOS
TO EXPERIENCE;

