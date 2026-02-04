----------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 04_view_power_bi.sql
----------------------------------------------------

Objetivo:
Criar uma VIEW consolidada com os dados de vendas,
produtos, categorias e localização, servindo como
fonte única para análises e dashboards no Power BI.
----------------------------------------------------

CREATE OR REPLACE VIEW vw_vendas_comercial AS
SELECT
    -- Identificadores
    p.id_pedido,
    p.data_venda,

    -- Produto
    pr.id_produto,
    pr.nome_produto,
    c.nome AS nome_categoria,

    -- Loja e Localização
    l.id_loja,
    l.loja AS nome_loja,
    lc.cidade,
    lc.estado,
    lc.regiao,

    -- Métricas base
    p.qtd_vendida,
    p.preco_unit,
    p.custo_unit,

    -- Métricas calculadas
    (p.qtd_vendida * p.preco_unit) AS faturamento,
    (p.qtd_vendida * (p.preco_unit - p.custo_unit)) AS lucro

FROM pedidos p
JOIN produtos pr
    ON p.id_produto = pr.id_produto
JOIN categorias c
    ON pr.id_categoria = c.id
JOIN lojas l
    ON p.id_loja = l.id_loja
JOIN locais lc
    ON l.id_local = lc.id_local;
