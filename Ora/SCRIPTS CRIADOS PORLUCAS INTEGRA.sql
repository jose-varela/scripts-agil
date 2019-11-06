-- procedimentos
create or replace PROCEDURE INTEGRA_INSERT_PROCEDIMENTO IS
    vSetor NUMBER;
    vMaterial NUMBER;
    vMetodo NUMBER;
    vPosto NUMBER;
BEGIN   
    SELECT MIN(SETOR) INTO vSetor FROM SETORES; 
    SELECT MIN(MATERIAL) INTO vMaterial FROM MATERIAIS;
    SELECT MIN(METODO) INTO vMetodo FROM METODOS;
    SELECT MIN(POSTO) INTO vPosto FROM POSTOS;

    INSERT INTO PROCEDIMENTOS (
        PROCEDIMENTO,
        NOME, 
        MNEMONICO, 
        SETOR, 
        MATERIAL, 
        METODO, 
        POSTO, 
        ENTREGA, 
        TROCA_MATERIAL,
        IMPRESSAO_EXCLUSIVA,
        QT_MAX_ATENDIMENTO,
        STATUS,
        IMPRIME_MAPA,
        TIPO_LIBERACAO,
        LAYOUT_INTERFACE, 
        ORIENTACAO_LAYOUT,
        HISTORICO_LAYOUT,
        TROCA_POSTO,
        DUM,
        TIPO_ENTREGA,
        TIPO_COLETA,
        SEPARA_VARIAVEIS_FICHA,
        SEM_VALOR,
        TEM_EVOLUCAO,
        QUEBRA_PAGINA,
        TIPO_PROCEDIMENTO,
        QT_HISTORICO_IMP,
        METODOLOGIA_UNICA_HISTORICO,
        VISUALIZA_LIBERACAO)
    VALUES (
        99998888,     
        'INTEGRACAO-GENERICA', 
        'INTEGRA', 
        vSetor, 
        vMaterial, 
        vMetodo, 
        vPosto, 
        0, 
        'N', 
        'N', 
        0, 
        'A',
        'N',
        'D',
        'R',
        'H',
        'R',
        'N', 
        'N', 
        '*', 
        'CR', 
        'N', 
        'N', 
        'N', 
        'N', 
        'N', 
        0, 
        'N', 
        'N');
END INTEGRA_INSERT_PROCEDIMENTO;



create or replace FUNCTION INSERT_VARIAVEIS_TEXTOS(
                                                    V_CONTADOR_INICIO IN NUMBER,
                                                    V_CONTADOR_FINAL IN NUMBER) RETURN BOOLEAN IS

vCounter NUMBER;
vNumero number;
BEGIN   
  SELECT MAX(NUMERO) INTO vNumero FROM TEXTOS WHERE MNEMONICO = 'INTEGRA';
  FOR vCounter IN V_CONTADOR_INICIO..V_CONTADOR_FINAL
  LOOP
    INSERT INTO VARIAVEIS_TEXTOS (MNEMONICO, NUMERO, VARIAVEL, COMPARTILHADO) VALUES ('INTEGRA', vNumero, vCounter, 'N');
  END LOOP;
END INSERT_VARIAVEIS_TEXTOS;


create or replace PROCEDURE INTEGRA_EQUIPAMENTOS_VARIAVEIS(V_EQUIPAMENTO IN NUMBER) IS
    CURSOR CURSOR_EQUIPAMENTOS_VARIAVEIS IS
        SELECT ET.EQUIPAMENTO, ET.MNEMONICO, ET.NUMERO, VT.VARIAVEL, V.NOME, ET.POSTO_REA, ET.MAP_EQUIPAMENTO
        FROM VARIAVEIS_TEXTOS VT
           INNER JOIN EQUIPAMENTOS_TEXTOS ET
           ON VT.MNEMONICO = ET.MNEMONICO AND VT.NUMERO = (SELECT MAX(NUMERO) FROM TEXTOS WHERE MNEMONICO = VT.MNEMONICO)
           INNER JOIN VARIAVEIS V
           ON VT.VARIAVEL = V.VARIAVEL
        WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO 
            AND ET.NUMERO = (SELECT MAX(NUMERO) FROM TEXTOS WHERE MNEMONICO = VT.MNEMONICO)
            AND ET.STATUS = 'A'
        ORDER BY VT.MNEMONICO, VT.NUMERO, VT.VARIAVEL;

    vEquipamento NUMBER;
    vMnemonico VARCHAR2(7);
    vNumero NUMBER;
    vVariavel NUMBER;
    vNome VARCHAR2(100);
    vPostoRea NUMBER;
    vMapEquipamento VARCHAR2(100);
    vCounter NUMBER;
    vMaxLoop NUMBER;
BEGIN
    SELECT COUNT(*) INTO vMaxLoop
    FROM VARIAVEIS_TEXTOS VT
        INNER JOIN EQUIPAMENTOS_TEXTOS ET
        ON VT.MNEMONICO = ET.MNEMONICO AND VT.NUMERO = (SELECT MAX(NUMERO) FROM TEXTOS WHERE MNEMONICO = VT.MNEMONICO)
        INNER JOIN VARIAVEIS V
        ON VT.VARIAVEL = V.VARIAVEL
    WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO 
        AND ET.NUMERO = (SELECT MAX(NUMERO) FROM TEXTOS WHERE MNEMONICO = VT.MNEMONICO)
        AND ET.STATUS = 'A'
    ORDER BY VT.MNEMONICO, VT.NUMERO, VT.VARIAVEL;

    OPEN CURSOR_EQUIPAMENTOS_VARIAVEIS;
    FOR vCounter IN 1..vMaxLoop LOOP
        FETCH CURSOR_EQUIPAMENTOS_VARIAVEIS INTO vEquipamento, vMnemonico, vNumero, vVariavel, vNome, vPostoRea, vMapEquipamento;
        EXIT WHEN CURSOR_EQUIPAMENTOS_VARIAVEIS%NOTFOUND;
        
        IF vNome = '#VALOR_QUANTITATIVO' THEN
            vNome := CONCAT(vMapEquipamento, '^1^1^1^1');
        END IF;

        INSERT INTO EQUIPAMENTOS_VARIAVEIS (EQUIPAMENTO, MNEMONICO, NUMERO, VARIAVEL, VARIAVEL_EQUIPAMENTO, POSTO_REA, ID_EQUIPAMENTO_VARIAVEL)
            VALUES (vEquipamento, vMnemonico, vNumero, vVariavel, vNome, vPostoRea, SQ_EQUIPAMENTOS_VARIAVEIS.NEXTVAL);  

    END LOOP;

    CLOSE CURSOR_EQUIPAMENTOS_VARIAVEIS;
    COMMIT WORK;
END INTEGRA_EQUIPAMENTOS_VARIAVEIS;

create or replace PROCEDURE INTEGRA_INSERT_VARIAVEIS_TEXTO(
                                                    V_CONTADOR_INICIO IN NUMBER,
                                                    V_CONTADOR_FINAL IN NUMBER) IS

vCounter NUMBER;
vNumero NUMBER;
BEGIN   
  SELECT MAX(NUMERO) INTO vNumero FROM TEXTOS WHERE MNEMONICO = 'INTEGRA';
  FOR vCounter IN V_CONTADOR_INICIO..V_CONTADOR_FINAL
  LOOP
    INSERT INTO VARIAVEIS_TEXTOS (MNEMONICO, NUMERO, VARIAVEL, COMPARTILHADO) VALUES ('INTEGRA', vNumero, vCounter, 'N');
  END LOOP;
END INTEGRA_INSERT_VARIAVEIS_TEXTO;

create or replace PROCEDURE INTEGRA_TEXTO_PROCEDIMENTOS(V_EQUIPAMENTO IN NUMBER) IS
    vCounter NUMBER;
    vMnemonico VARCHAR2(7);
    vMaxNumero NUMBER;
    vTexto LONG;
    vMaxLoop NUMBER;

    CURSOR CURSOR_TEXTOS IS
        SELECT DISTINCT T.MNEMONICO FROM TEXTOS T
        INNER JOIN EQUIPAMENTOS_TEXTOS ET
        ON T.MNEMONICO = ET.MNEMONICO
        WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO
        ORDER BY T.MNEMONICO;
BEGIN
--    vTexto := '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fnil\fcharset0 Tahoma;}{\f1\fnil\fcharset0 Consolas;}{\f2\fnil\fcharset0 Courier New;}{\f3\fnil\fcharset0 Square721 BT;}}
--               {\colortbl ;\red0\green0\blue0;\red255\green0\blue0;}
--               \viewkind4\uc1\pard\cf1\lang1046\f0\fs18\''abINTEGRA-1
--               \par \cf2\b\f1\fs24 [9800                                              ]:\f2\fs20 [9807      ] [9808      ]\fs22  \fs16  \cf0\f1\fs24 
--               \par \pard\tx7280\cf1\b0\f2\fs16 Material:\cf2  [9801                          ]\cf0\f1\fs14                           M\''e9todo: \cf2\f2 [9802                     ]\fs22  \cf0\f1\fs14  
--              \par \pard 
--               \par \cf2 [9803]\cf0  
--               \par \f3\fs20 
--               \par \f1\fs16 Obs.:\cf2\f2 [9804]\cf1\f0\fs18 
--               \par \''bb\cf0\f1\fs16 
--               \par }';

    SELECT COUNT(DISTINCT T.MNEMONICO) INTO vMaxLoop FROM TEXTOS T
        INNER JOIN EQUIPAMENTOS_TEXTOS ET
        ON T.MNEMONICO = ET.MNEMONICO
    WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO
    ORDER BY T.MNEMONICO;

    OPEN CURSOR_TEXTOS;
    FOR vCounter IN 1..vMaxLoop LOOP
        FETCH CURSOR_TEXTOS INTO vMnemonico;
        EXIT WHEN CURSOR_TEXTOS%NOTFOUND;

        SELECT MAX(NUMERO) INTO vMaxNumero FROM TEXTOS WHERE MNEMONICO = vMnemonico;
        vMaxNumero := vMaxNumero + 1;

        INSERT INTO TEXTOS (
            MNEMONICO,
            NUMERO,
            DESCRICAO,
            TEXTO,
            TIPO,
            STATUS,
            DIRECIONADO
        )
        VALUES (
            vMnemonico,
            vMaxNumero,
            CONCAT(vMnemonico, '-GENERICO'),
            vTexto,
            'C',
            'A',
            'N'
        );
    END LOOP;

    CLOSE CURSOR_TEXTOS;
    COMMIT WORK;
END INTEGRA_TEXTO_PROCEDIMENTOS;

create or replace PROCEDURE INTEGRA_VARIAVEIS_TEXTOS_COMP(V_EQUIPAMENTO IN NUMBER) IS
    CURSOR CURSOR_TEXTOS IS
        SELECT DISTINCT T.MNEMONICO FROM TEXTOS T
        INNER JOIN EQUIPAMENTOS_TEXTOS ET
        ON T.MNEMONICO = ET.MNEMONICO
        WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO
        ORDER BY T.MNEMONICO;

    vCounter NUMBER;
    vMnemonico VARCHAR2(7);
    vNumero NUMBER;
    vMaxLoop NUMBER;
BEGIN
    SELECT COUNT(DISTINCT T.MNEMONICO) INTO vMaxLoop FROM TEXTOS T
        INNER JOIN EQUIPAMENTOS_TEXTOS ET
        ON T.MNEMONICO = ET.MNEMONICO
    WHERE ET.EQUIPAMENTO = V_EQUIPAMENTO
    ORDER BY T.MNEMONICO;

    OPEN CURSOR_TEXTOS;
    FOR vCounter IN 1..vMaxLoop LOOP
        FETCH CURSOR_TEXTOS INTO vMnemonico;
        EXIT WHEN CURSOR_TEXTOS%NOTFOUND;
        
        SELECT MAX(NUMERO) INTO vNumero FROM TEXTOS WHERE MNEMONICO = vMnemonico;
        
        
        FOR vVariavel IN 9800..9808 LOOP
            INSERT INTO VARIAVEIS_TEXTOS (MNEMONICO, NUMERO, VARIAVEL, COMPARTILHADO)
                VALUES (vMnemonico, vNumero, vVariavel, 'S');  
        END LOOP;
    END LOOP;

    CLOSE CURSOR_TEXTOS;
    
    COMMIT WORK;
END INTEGRA_VARIAVEIS_TEXTOS_COMP;

