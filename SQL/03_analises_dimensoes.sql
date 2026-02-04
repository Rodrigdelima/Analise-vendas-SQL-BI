------------------------------------------------------------
-- MÉTRICAS AVANÇADAS DE NEGÓCIO
-- Fonte: vw_vendas_comercial
------------------------------------------------------------

-- Lucro total
SELECT
    SUM(lucro) AS lucro_total
FROM vw_vendas_comercial;

-- Ticket médio
SELECT
    SUM(faturamento) / COUNT(DISTINCT pedido_id) AS ticket_medio
FROM vw_vendas_comercial;

-- Top 5 produtos por faturamento
SELECT
    produto,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY nome_produto
ORDER BY faturamento_total DESC
LIMIT 5;

-- Produtos mais vendidos (quantidade)
SELECT
    nome_produto,
    SUM(qtd_vendida) AS unidades_vendidas
FROM vw_vendas_comercial
GROUP BY nome_produto
ORDER BY unidades_vendidas DESC;

-- Concentração / risco de faturamento por produto
SELECT
    produto,
    SUM(faturamento) AS faturamento_total,
    ROUND(
        SUM(faturamento) /
        (SELECT SUM(faturamento) FROM vw_vendas_comercial) * 100
    , 2) AS percentual_faturamento
FROM vw_vendas_comercial
GROUP BY nome_produto
ORDER BY percentual_faturamento DESC;

-- Faturamento por loja
SELECT
    loja,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY loja
ORDER BY faturamento_total DESC;

-- Produtos mais vendidos por loja
SELECT
    loja,
    nome_produto,
    SUM(qtd_vendida) AS unidades_vendidas,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY loja, nome_produto
ORDER BY loja, faturamento_total DESC;

-- Faturamento por categoria
SELECT
    categoria,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY categoria
ORDER BY faturamento_total DESC;

-- Lucro por categoria
SELECT
    nome_categoria,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY nome_categoria
ORDER BY faturamento_total DESC;

-- Faturamento por mês
SELECT
    DATE_TRUNC('month', data_pedido) AS mes,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY mes
ORDER BY mes;

-- Quantidade de vendas por mês
SELECT
    DATE_TRUNC('month', data_venda) AS mes,
    COUNT(DISTINCT pedido_id) AS total_vendas
FROM vw_vendas_comercial
GROUP BY mes
ORDER BY mes;

-- Faturamento por região
SELECT
    regiao,
    SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial
GROUP BY regiao
ORDER BY faturamento_total DESC;

