-- Pergunta 1: Qual o valor total de cada pedido e a lista de produtos incluídos?
-- (Recuperação com JOIN e Atributo Derivado)

SELECT 
    p.idPedido, 
    c.Nome AS Cliente, 
    pr.Descricao AS Produto, 
    (rpp.Quantidade * pr.Valor) AS Valor_Item
FROM Pedido p
JOIN Cliente c ON p.idPedidoCliente = c.idCliente
JOIN Relacao_Produto_Pedido rpp ON p.idPedido = rpp.idPedido
JOIN Produto pr ON rpp.idProduto = pr.idProduto;

-- Pergunta 2: Quais clientes realizaram mais de 1 pedido?
-- (Filtro em grupos com HAVING)

SELECT 
    c.Nome, 
    COUNT(p.idPedido) AS Total_Pedidos
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.idPedidoCliente
GROUP BY c.Nome
HAVING Total_Pedidos > 1;


-- Pergunta 3: Existe algum vendedor que também é fornecedor?
-- (Filtro com WHERE e comparação de nomes/documentos)

SELECT v.RazaoSocial 
FROM Vendedor v, Fornecedor f 
WHERE v.RazaoSocial = f.RazaoSocial;


-- Pergunta 4: Qual a disponibilidade de produtos em estoque por localidade, ordenado pela quantidade?
-- (Ordenação com ORDER BY)

SELECT 
    p.Descricao, 
    e.Local, 
    phe.Quantidade
FROM Produto p
JOIN Produto_has_Estoque phe ON p.idProduto = phe.idProduto
JOIN Estoque e ON phe.idEstoque = e.idEstoque
ORDER BY phe.Quantidade DESC;




