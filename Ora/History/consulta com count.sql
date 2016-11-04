
SELECT posto, atendimento, correl, count(*) FROM EXAMES_AUTORIZACOES
group by posto, atendimento, correl having count(*) > 1;
/
