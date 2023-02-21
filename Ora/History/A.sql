
--
-- CAIXA
--
delete DEVEDORES d 
 where d.conta_hosp not in (select ca.conta_hosp
                              from contas_atendimentos ca);
--
-- CAIXA
--
delete caixa c 
 where c.conta_hosp not in (select ca.conta_hosp
                              from contas_atendimentos ca);

ALTER TABLE CAIXA ADD ("POSTO" NUMBER(3));

UPDATE CAIXA C SET C.POSTO = (SELECT MIN(CA.POSTO)
                                FROM CONTAS_ATENDIMENTOS CA
							   WHERE CA.CONTA_HOSP = C.CONTA_HOSP);
 
ALTER TABLE CAIXA MODIFY ("POSTO" NOT NULL);

ALTER TABLE CAIXA ADD CONSTRAINT CAIXA_POSTOS_FK 
 FOREIGN KEY ("POSTO") REFERENCES POSTOS ("POSTO") ENABLE;


create or replace PROCEDURE PRC_CAIXA(V_CONTA_HOSP     IN CAIXA.CONTA_HOSP%TYPE,
                                       V_REGISTRO       IN CAIXA.REGISTRO%TYPE,
                                       V_CONTA          IN CAIXA.CONTA%TYPE,
                                       V_DATA_PAG       IN CAIXA.DATA_PAG%TYPE,
                                       V_VALOR          IN CAIXA.VALOR%TYPE,
                                       V_DESCONTO       IN CAIXA.DESCONTO%TYPE,
                                       V_TIPO_DTO       IN CAIXA.TIPO_DTO%TYPE,
                                       V_USUARIO        IN CAIXA.USUARIO%TYPE,
                                       V_DATA_CAD       IN CAIXA.DATA_CAD%TYPE,
                                       V_CORREL         IN OUT CAIXA.CORREL%TYPE,
                                       V_ID_FORMA_PAGAMENTO       IN CAIXA.ID_FORMA_PAGAMENTO%TYPE,
                                       V_CATALOGO       IN CAIXA.CATALOGO%TYPE,
                                       V_USUARIO_DTO    IN CAIXA.USUARIO_DTO%TYPE,
                                       V_USUARIO_ALT    IN CAIXA.USUARIO_ALT%TYPE,
                                       V_DATA_ALT       IN CAIXA.DATA_ALT%TYPE,
                                       V_ID_BANDEIRA    IN CAIXA.ID_BANDEIRA%TYPE,
                                       V_ID_OPERADORA   IN CAIXA.ID_OPERADORA%TYPE,
                                       V_COD_PAGAMENTO  IN CAIXA.COD_PAGAMENTO%TYPE,
                                       V_PARCELAS       IN CAIXA.PARCELAS%TYPE,
                                       V_ID_CAIXA       IN OUT CAIXA.ID_CAIXA%TYPE,
                                       V_ID_RESPONSAVEL_FINANCEIRO IN CAIXA.ID_RESPONSAVEL_FINANCEIRO%TYPE,
                                       V_STATUS         IN CAIXA.STATUS%TYPE,
                                       V_POSTO          IN CAIXA.POSTO%TYPE,
                                       V_FUNCAO         IN NUMBER) IS
 BEGIN
   IF (V_FUNCAO = 1) OR (V_FUNCAO = 6) THEN
      IF (V_FUNCAO = 1) THEN
         SELECT NVL(MAX(C.CORREL)+1,1) INTO V_CORREL FROM CAIXA C 
         WHERE C.CONTA_HOSP = V_CONTA_HOSP;
      END IF;
      SELECT SQ_CAIXA.NEXTVAL INTO V_ID_CAIXA FROM DUAL;
      INSERT INTO CAIXA VALUES (V_CONTA_HOSP,  V_REGISTRO,    V_CONTA,     V_DATA_PAG,
                                V_VALOR,       V_DESCONTO,    V_TIPO_DTO,  V_USUARIO,
                                V_DATA_CAD,    V_CORREL,      V_ID_FORMA_PAGAMENTO,  V_CATALOGO, 
    			                       V_USUARIO_DTO, V_USUARIO_ALT, V_DATA_ALT, V_ID_BANDEIRA,
                                V_ID_OPERADORA, V_COD_PAGAMENTO, V_PARCELAS, V_ID_CAIXA,
                                V_ID_RESPONSAVEL_FINANCEIRO, V_STATUS, V_POSTO);
   ELSIF V_FUNCAO = 2 THEN
      UPDATE CAIXA SET VALOR = V_VALOR
                       WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;
   ELSIF V_FUNCAO = 3 THEN
     UPDATE CAIXA SET STATUS = 'C' WHERE CONTA_HOSP = V_CONTA_HOSP;
   ELSIF V_FUNCAO = 4 THEN
     UPDATE CAIXA SET STATUS = 'C', USUARIO_ALT = V_USUARIO_ALT, DATA_ALT = V_DATA_ALT WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;
   ELSIF V_FUNCAO = 5 THEN
      UPDATE CAIXA SET VALOR = V_VALOR, 
   	                  DATA_PAG = V_DATA_PAG, 
                       DESCONTO = V_DESCONTO, 
                       TIPO_DTO = V_TIPO_DTO, 
                       ID_FORMA_PAGAMENTO = V_ID_FORMA_PAGAMENTO,
                       USUARIO_ALT = V_USUARIO_ALT,
 					   DATA_ALT = V_DATA_ALT,
                       ID_BANDEIRA = V_ID_BANDEIRA,
                       ID_OPERADORA = V_ID_OPERADORA,
                       COD_PAGAMENTO = V_COD_PAGAMENTO,
                       PARCELAS = V_PARCELAS,
                       ID_RESPONSAVEL_FINANCEIRO = V_ID_RESPONSAVEL_FINANCEIRO
                  WHERE CONTA_HOSP = V_CONTA_HOSP AND REGISTRO = V_REGISTRO AND CORREL = V_CORREL;
   END IF;
   COMMIT WORK;
 END PRC_CAIXA;