----------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 04_view_power_bi.sql
----------------------------------------------------

Objetivo:
Criar uma VIEW consolidada com dados de vendas,
produtos, categorias e lojas, pronta para consumo
no Power BI e análise de KPIs.
----------------------------------------------------

-- criação da view --



CREATE OR REPLACE VIEW vw_vendas_comercial AS
SELECT
    p.id_pedido,
    p.data_venda,

    l.loja,
    l.id_local,

    lc.cidade,
    lc.estado,
    lc.regiao,

    pr.nome_produto,
    c.nome AS nome_categoria,

    p.qtd_vendida,
    p.preco_unit,
    p.custo_unit,

    (p.qtd_vendida * p.preco_unit) AS faturamento,
    (p.qtd_vendida * (p.preco_unit - p.custo_unit)) AS lucro
FROM pedidos p
JOIN produtos pr   ON p.id_produto = pr.id_produto
JOIN categorias c  ON pr.id_categoria = c.id
JOIN lojas l       ON p.id_loja = l.id_loja
JOIN locais lc     ON l.id_local = lc.id_local;

