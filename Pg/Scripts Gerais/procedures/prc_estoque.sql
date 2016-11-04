CREATE OR REPLACE FUNCTION PRC_ESTOQUE(V_DEPARTAMENTO IN     INT,
                                        V_PRODUTO      IN OUT ESTOQUE.PRODUTO%TYPE,
                                        V_QTD          IN     ESTOQUE.QTD%TYPE,
                                        V_QTD_MINIMA   IN     ESTOQUE.QTD_MINIMA%TYPE,
                                        V_QTD_MAXIMA   IN     ESTOQUE.QTD_MAXIMA%TYPE,
                                        V_FUNCAO       IN     INT) RETURNS VOID AS $$
BEGIN
   IF V_FUNCAO = 1 THEN
	INSERT INTO ESTOQUE SELECT PRODUTO, V_DEPARTAMENTO, 0, 0, 0 FROM PRODUTOS;

   ELSIF V_FUNCAO = 2 THEN
      UPDATE ESTOQUE SET QTD = V_QTD, QTD_MINIMA = V_QTD_MINIMA, QTD_MAXIMA = V_QTD_MAXIMA 
             WHERE DEPARTAMENTO = V_DEPARTAMENTO AND PRODUTO = V_PRODUTO;
 
   END IF;
   /* COMMIT WORK; */
END;
$$ LANGUAGE plpgsql; PRC_ESTOQUE;
/
