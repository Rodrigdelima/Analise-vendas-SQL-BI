---------------------------------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 02_faturamento.sql
---------------------------------------------------------------------------
Objetivo:
Calcular o faturamento total e o faturamento ao longo do tempo
para análise de performance comercial.
---------------------------------------------------------------------------

-- Faturamento total
SELECT
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial;

-- Faturamento por categoria
SELECT
    nome_categoria,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY nome_categoria
ORDER BY faturamento_total DESC;



-- Faturamento por mês (ano-mês)
SELECT
    DATE_TRUNC('month', data_venda) AS mes,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY mes
ORDER BY mes;

