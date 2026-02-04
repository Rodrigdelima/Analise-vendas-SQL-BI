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

-- Faturamento por ano
SELECT
    EXTRACT(YEAR FROM data_pedido) AS ano,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY ano
ORDER BY ano;


-- Faturamento por mês (ano-mês)
SELECT
    DATE_TRUNC('month', data_pedido) AS mes,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY mes
ORDER BY mes;


