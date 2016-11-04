CREATE OR REPLACE FUNCTION GET_NOME_GRUPO_VARIAVEIS(V_MNEMONICO IN VARCHAR2,
                                                    V_GRUPO IN NUMBER,
                                                    V_NUMERO    IN NUMBER) RETURN VARCHAR2 IS vNOME_GRUPO VARCHAR2(30);

vSQL           VARCHAR2(256);    --string que recebe o comando SQL dinâmico

BEGIN
     vSQL := 'SELECT DISTINCT V.NOME FROM VARIAVEIS V, VARIAVEIS_TEXTOS VT ' ||
             ' WHERE VT.MNEMONICO = ''' || V_MNEMONICO || '''' ||
             '   AND VT.NUMERO = ' || V_NUMERO ||
             '   AND V.VARIAVEL = VT.VARIAVEL ' ||
             '   AND V.TIPO_VARIAVEL = ''G''' ||
             '   AND V.GRUPO = ' || V_GRUPO;

     EXECUTE IMMEDIATE vSQL INTO vNOME_GRUPO;

     RETURN(vNOME_GRUPO);

END GET_NOME_GRUPO_VARIAVEIS;
