CREATE OR REPLACE FUNCTION GET_TEMPO_ENTREGA(V_MNEMONICO     IN VARCHAR2,
                                             V_ID_ACOMODACAO IN NUMBER) RETURN VARCHAR2 IS vTEMPO VARCHAR2(5);

vSQL           VARCHAR2(256);    --string que recebe o comando SQL dinâmico
vNOME_TABELA   VARCHAR2(30); --PLS_INTEGER;      --Nome tabela do Catalogo

BEGIN

     --PASSO 1: monta e executa SQL dinâmico para pegar o nro do catalogo de acordo com a acomodacao
     vSQL := 'SELECT  NVL(ATE.ID_TEMPO_ENTREGA,1) ' ||
             '  FROM ACOMODACOES AC, ACOMODACOES_TEMPOS_ENTREGA ATE ' ||
             ' WHERE AC.ID_ACOMODACAO = ' || V_ID_ACOMODACAO ||
             '   AND ATE.ID_ACOMODACAO(+) = AC.ID_ACOMODACAO';

     EXECUTE IMMEDIATE vSQL INTO vNOME_TABELA;

     --PASSO 2: monta o nome da tabela TEMPOS_ENTREGAx
     vNOME_TABELA := 'TEMPOS_ENTREGA' || vNOME_TABELA;


     --PASSO 3: monta e executa SQL dinâmico para buscar o TEMPO referente a tabela TEMPOS_ENTREGAx
     vSQL := 'SELECT TEMPO FROM ' || vNOME_TABELA ||
             ' WHERE MNEMONICO = ''' || V_MNEMONICO || '''';

     EXECUTE IMMEDIATE vSQL INTO vTEMPO;


    RETURN(vTEMPO);

END GET_TEMPO_ENTREGA;
/


