CREATE OR REPLACE FUNCTION GET_NOME_GRUPO_VARIAVEIS(V_MNEMONICO IN VARCHAR(4000),
                                                    V_GRUPO IN INT,
                                                    V_NUMERO    IN INT) RETURN VARCHAR(4000) IS
 DECLARE vNOME_GRUPO VARCHAR(30);

vSQL           VARCHAR(256);    BEGIN
--string que recebe o comando SQL dinâmico

     vSQL := 'SELECT DISTINCT V.NOME FROM VARIAVEIS V, VARIAVEIS_TEXTOS VT ' ||
             ' WHERE VT.MNEMONICO = ''' || V_MNEMONICO || '''' ||
             '   AND VT.NUMERO = ' || V_NUMERO ||
             '   AND V.VARIAVEL = VT.VARIAVEL ' ||
             '   AND V.TIPO_VARIAVEL = ''G''' ||
             '   AND V.GRUPO = ' || V_GRUPO;

     EXECUTE IMMEDIATE vSQL INTO vNOME_GRUPO;

     RETURN(vNOME_GRUPO);

END GET_NOME_GRUPO_VARIAVEIS;
$$ LANGUAGE plpgsql;
