CREATE OR REPLACE PROCEDURE PRC_CONVENIOS(V_CONVENIO            IN OUT CONVENIOS.CONVENIO%TYPE,
                                          V_NOME                IN     CONVENIOS.NOME%TYPE,
                                          V_NOME_FICHA          IN     CONVENIOS.NOME_FICHA%TYPE,
                                          V_CATALOGO            IN     CONVENIOS.CATALOGO%TYPE,
                                          V_DESCONTO            IN     CONVENIOS.DESCONTO%TYPE,
                                          V_STATUS              IN     CONVENIOS.STATUS%TYPE,
                                          V_PAG_ATO             IN     CONVENIOS.PAG_ATO%TYPE,
                                          V_DATA_INI            IN     CONVENIOS.DATA_INI%TYPE,
                                          V_DATA_FIN            IN     CONVENIOS.DATA_FIN%TYPE,
                                          V_DESCONTO_MAX        IN     CONVENIOS.DESCONTO_MAX%TYPE,
                                          V_INTERNACAO          IN     CONVENIOS.INTERNACAO%TYPE,
                                          V_EMPRESA             IN     CONVENIOS.EMPRESA%TYPE,
                                          V_VALIDADE            IN     CONVENIOS.VALIDADE%TYPE,
                                          V_CID                 IN     CONVENIOS.CID%TYPE,
                                          V_SENHA               IN     CONVENIOS.SENHA%TYPE,
                                          V_MASK_MATRICULA      IN     CONVENIOS.MASK_MATRICULA%TYPE,
                                          V_CHK_MATRICULA       IN     CONVENIOS.CHK_MATRICULA%TYPE,
                                          V_CONTA               IN     CONVENIOS.CONTA%TYPE,
                                          V_DESCONTO_ESPECIAL   IN     CONVENIOS.DESCONTO_ESPECIAL%TYPE,
                                          V_HONORARIOS          IN     CONVENIOS.HONORARIOS%TYPE,
                                          V_FILME               IN     CONVENIOS.FILME%TYPE,
                                          V_GERA_DISK           IN     CONVENIOS.GERA_DISK%TYPE,
                                          V_REGISTRO_ANS        IN     CONVENIOS.REGISTRO_ANS%TYPE,
                                          V_ENDERECO_ENVIO      IN     CONVENIOS.ENDERECO_ENVIO%TYPE,
                                          V_PORTA_ENVIO         IN     CONVENIOS.PORTA_ENVIO%TYPE,
                                          V_NRO_LOTE            IN     CONVENIOS.NRO_LOTE%TYPE,
                                          V_AUTORIZADOR         IN     CONVENIOS.AUTORIZADOR%TYPE,
                                          V_CODIGO_NA_OPERADORA IN     CONVENIOS.CODIGO_NA_OPERADORA%TYPE,
                                          V_NRO_GUIA_ATUAL      IN     CONVENIOS.NRO_GUIA_ATUAL%TYPE,
                                          V_NRO_GUIA_MAX        IN     CONVENIOS.NRO_GUIA_MAX%TYPE,
                                          V_VERSAO_TISS         IN     CONVENIOS.VERSAO_TISS%TYPE,
                                          V_GUIAS_LOTE          IN     CONVENIOS.GUIAS_LOTE%TYPE,
                                          V_LOGIN_AUTORIZADOR   IN     CONVENIOS.LOGIN_AUTORIZADOR%TYPE,
                                          V_PASS_AUTORIZADOR    IN     CONVENIOS.PASS_AUTORIZADOR%TYPE,
                                          V_FATURA_POR_PLANO    IN     CONVENIOS.FATURA_POR_PLANO%TYPE,
                                          V_NRO_TRANSACAO       IN     CONVENIOS.NRO_TRANSACAO%TYPE,
                                          V_LOGO_GUIA           IN     CONVENIOS.LOGO_GUIA%TYPE,
                                          V_PROCEDIMENTOS_GUIA  IN     CONVENIOS.PROCEDIMENTOS_GUIA%TYPE,
                                          V_CONFIGURACAO        IN     CONVENIOS.CONFIGURACAO%TYPE,
                                          V_DESCONTO_HONORARIOS IN     CONVENIOS.DESCONTO_HONORARIOS%TYPE,
                                          V_DESCONTO_CUSTO_OPERACIONAL IN     CONVENIOS.DESCONTO_CUSTO_OPERACIONAL%TYPE,
                                          V_TIPO_DTO_HONORARIOS        IN     CONVENIOS.TIPO_DTO_HONORARIOS%TYPE,
                                          V_TIPO_DTO_CUSTO_OPERACIONAL IN     CONVENIOS.TIPO_DTO_CUSTO_OPERACIONAL%TYPE,
                                          V_FUNCAO              IN     NUMBER) IS
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_CONVENIOS.NEXTVAL INTO V_CONVENIO FROM DUAL;
     INSERT INTO CONVENIOS VALUES (V_CONVENIO, V_NOME, V_NOME_FICHA, 
                                   V_CATALOGO, V_DESCONTO, V_STATUS, V_PAG_ATO, 
                                   V_DATA_INI, V_DATA_FIN, V_DESCONTO_MAX, V_INTERNACAO,
                                   V_EMPRESA, V_VALIDADE, V_CID, V_SENHA, V_MASK_MATRICULA, 
                                   V_CHK_MATRICULA, V_CONTA, V_DESCONTO_ESPECIAL, V_HONORARIOS,
                                   V_FILME, V_GERA_DISK,V_REGISTRO_ANS,V_ENDERECO_ENVIO,V_PORTA_ENVIO,
                                   V_NRO_LOTE, V_AUTORIZADOR, V_CODIGO_NA_OPERADORA, V_NRO_GUIA_ATUAL, 
                                   V_NRO_GUIA_MAX, V_VERSAO_TISS, V_GUIAS_LOTE, V_LOGIN_AUTORIZADOR,
                                   V_PASS_AUTORIZADOR, V_FATURA_POR_PLANO, V_NRO_TRANSACAO, EMPTY_BLOB(), V_PROCEDIMENTOS_GUIA, EMPTY_BLOB(),
								   V_DESCONTO_HONORARIOS, V_DESCONTO_CUSTO_OPERACIONAL, V_TIPO_DTO_HONORARIOS, V_TIPO_DTO_CUSTO_OPERACIONAL);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE CONVENIOS SET  NOME           = V_NOME,           NOME_FICHA        = V_NOME_FICHA, 
                           CATALOGO       = V_CATALOGO,       DESCONTO          = V_DESCONTO, 
                           STATUS         = V_STATUS,         PAG_ATO           = V_PAG_ATO,
                           DATA_INI       = V_DATA_INI,       DATA_FIN          = V_DATA_FIN,
                           DESCONTO_MAX   = V_DESCONTO_MAX,   INTERNACAO        = V_INTERNACAO,
                           EMPRESA        = V_EMPRESA,        VALIDADE          = V_VALIDADE,
                           CID            = V_CID,            SENHA             = V_SENHA,
                           MASK_MATRICULA = V_MASK_MATRICULA, CHK_MATRICULA     = V_CHK_MATRICULA,
                           CONTA          = V_CONTA,          DESCONTO_ESPECIAL = V_DESCONTO_ESPECIAL,
                           HONORARIOS     = V_HONORARIOS,     FILME             = V_FILME,
                           GERA_DISK      = V_GERA_DISK,      REGISTRO_ANS      = V_REGISTRO_ANS,
                           ENDERECO_ENVIO = V_ENDERECO_ENVIO, PORTA_ENVIO       = V_PORTA_ENVIO,
                           NRO_LOTE       = V_NRO_LOTE,       AUTORIZADOR       = V_AUTORIZADOR,
                           CODIGO_NA_OPERADORA = V_CODIGO_NA_OPERADORA,
                           NRO_GUIA_ATUAL = V_NRO_GUIA_ATUAL, NRO_GUIA_MAX      = V_NRO_GUIA_MAX,
                           VERSAO_TISS    = V_VERSAO_TISS,    GUIAS_LOTE        = V_GUIAS_LOTE,
                           LOGIN_AUTORIZADOR = V_LOGIN_AUTORIZADOR, PASS_AUTORIZADOR = V_PASS_AUTORIZADOR,
                           FATURA_POR_PLANO  = V_FATURA_POR_PLANO, NRO_TRANSACAO = V_NRO_TRANSACAO,
						   PROCEDIMENTOS_GUIA = V_PROCEDIMENTOS_GUIA, DESCONTO_HONORARIOS  = V_DESCONTO_HONORARIOS,
						   DESCONTO_CUSTO_OPERACIONAL = V_DESCONTO_CUSTO_OPERACIONAL, TIPO_DTO_HONORARIOS = V_TIPO_DTO_HONORARIOS,
						   TIPO_DTO_CUSTO_OPERACIONAL = V_TIPO_DTO_CUSTO_OPERACIONAL
      WHERE CONVENIO = V_CONVENIO;

  ELSIF V_FUNCAO = 3 THEN
     DELETE CONVENIOS WHERE CONVENIO = V_CONVENIO;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE CONVENIOS SET  NRO_LOTE = V_NRO_LOTE
                           WHERE CONVENIO = V_CONVENIO;
						   
  ELSIF V_FUNCAO = 5 THEN
     UPDATE CONVENIOS SET  NRO_GUIA_ATUAL = V_NRO_GUIA_ATUAL, NRO_GUIA_MAX    = V_NRO_GUIA_MAX
                           WHERE CONVENIO = V_CONVENIO;
						   
  ELSIF V_FUNCAO = 6 THEN
     UPDATE CONVENIOS SET  NRO_TRANSACAO = NRO_TRANSACAO+1
                           WHERE CONVENIO = V_CONVENIO;

  END IF;

  COMMIT WORK;

END PRC_CONVENIOS;
/
