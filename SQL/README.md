# Projeto – Análise de Vendas (SQL + Power BI)

## = Objetivo
Analisar o desempenho de vendas de uma empresa a partir de um banco de dados relacional, utilizando SQL para exploração, modelagem e criação de uma VIEW consolidada, com foco em indicadores de faturamento, lucro, ticket médio e análises dimensionais.

## = Base de Dados
Banco de dados relacional contendo informações de:
- Pedidos
- Produtos
- Categorias
- Lojas
- Localização
- Clientes

## = Metodologia
O projeto foi desenvolvido seguindo as etapas:
1. Exploração e entendimento do schema
2. Análise de faturamento e comportamento temporal
3. Análises dimensionais por produto, categoria, loja e região
4. Criação de uma VIEW consolidada para consumo em BI

## = SQL
As análises foram desenvolvidas em SQL, com uso de:
- JOIN entre múltiplas tabelas
- Funções de agregação
- Cálculos de métricas de negócio
- Criação de VIEW para organização e performance

## = Visualização
A VIEW `vw_vendas_comercial` foi projetada para ser conectada diretamente ao Power BI, servindo como fonte única para dashboards e análises visuais.

## = Ferramentas
- PostgreSQL
- SQL
- GitHub
- Power BI
