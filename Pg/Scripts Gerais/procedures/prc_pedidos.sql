CREATE OR REPLACE FUNCTION PRC_PEDIDOS(V_PEDIDO           IN OUT PEDIDOS.PEDIDO%TYPE,
                                        V_DEPTO_ORIGEM     IN     PEDIDOS.DEPTO_ORIGEM%TYPE,
                                        V_DEPTO_DESTINO    IN     PEDIDOS.DEPTO_DESTINO%TYPE,
                                        V_DATA_PEDIDO      IN     PEDIDOS.DATA_PEDIDO%TYPE,
                                        V_HORA_PEDIDO      IN     PEDIDOS.HORA_PEDIDO%TYPE,
                                        V_STATUS           IN     PEDIDOS.STATUS%TYPE,
                                        V_OBSERVACAO       IN     PEDIDOS.OBSERVACAO%TYPE,
                                        V_USUARIO          IN     PEDIDOS.USUARIO%TYPE,
                                        V_DATA_CAD         IN     PEDIDOS.DATA_CAD%TYPE,
                                        V_USUARIO_RECEPTOR IN     PEDIDOS.USUARIO_RECEPTOR%TYPE,
                                        V_HORA_RECEBIMENTO IN     PEDIDOS.HORA_RECEBIMENTO%TYPE,
                                        V_DATA_RECEBIMENTO IN     PEDIDOS.DATA_RECEBIMENTO%TYPE,
                                        V_FUNCAO           IN  INT) RETURNS VOID AS $$
BEGIN
  IF V_FUNCAO = 1 THEN
     SELECT SQ_PEDIDOS.NEXTVAL INTO V_PEDIDO FROM DUAL;
     INSERT INTO PEDIDOS VALUES (V_PEDIDO,      V_DEPTO_ORIGEM,     V_DEPTO_DESTINO,    V_DATA_PEDIDO,
                                        V_HORA_PEDIDO, V_STATUS,           V_OBSERVACAO,       V_USUARIO,
              				    V_DATA_CAD,    V_USUARIO_RECEPTOR, V_HORA_RECEBIMENTO, V_DATA_RECEBIMENTO);

  ELSIF V_FUNCAO = 2 THEN
     UPDATE PEDIDOS SET STATUS           = V_STATUS,   OBSERVACAO = V_OBSERVACAO, 
                        DATA_CAD         = V_DATA_CAD, 
                        USUARIO_RECEPTOR = V_USUARIO_RECEPTOR, 
                        HORA_RECEBIMENTO = V_HORA_RECEBIMENTO, 
                        DATA_RECEBIMENTO = V_DATA_RECEBIMENTO
            WHERE PEDIDO = V_PEDIDO;   

  ELSIF V_FUNCAO = 3 THEN
     DELETE PEDIDOS WHERE PEDIDO = V_PEDIDO;

  ELSIF V_FUNCAO = 4 THEN
     UPDATE PEDIDOS SET STATUS = V_STATUS WHERE PEDIDO = V_PEDIDO;
  END IF;

  /* COMMIT WORK; */

END;
$$ LANGUAGE plpgsql; PRC_PEDIDOS;
/
