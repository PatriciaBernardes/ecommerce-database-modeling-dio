-- 1. Inserindo Clientes 
INSERT INTO Cliente (Nome, Endereco, TipoCliente, CPF, CNPJ) VALUES 
('João Silva', 'Rua das Flores, 123 - Ituiutaba', 'PF', '12345678901', NULL),
('Maria Oliveira', 'Av. Central, 456 - Ituiutaba', 'PF', '98765432100', NULL),
('Tech Solutions LTDA', 'Distrito Industrial, 789', 'PJ', NULL, '12345678000199'),
('Agro Comercial Peixoto', 'Zona Rural, S/N', 'PJ', NULL, '88776655000122');

-- 2. Inserindo Produtos
INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônico', 'Fone de Ouvido Bluetooth', 150.00),
('Eletrônico', 'Monitor 24 Polegadas', 890.00),
('Móveis', 'Cadeira Gamer', 1200.00),
('Brinquedos', 'Carrinho de Controle Remoto', 250.00);

-- 3. Inserindo Pedidos (Com códigos de rastreio e status)
INSERT INTO Pedido (idPedidoCliente, StatusPedido, Descricao, Frete, CodigoRastreio, StatusEntrega) VALUES
(1, 'Confirmado', 'Compra via Web', 15.00, 'BR123456789', 'Em trânsito'),
(1, 'Confirmado', 'Segunda compra', 10.00, 'BR987654321', 'Postado'),
(3, 'Confirmado', 'Equipamento de Escritório', 0.00, 'BR456789123', 'Entregue');

-- 4. Inserindo Fornecedores e Vendedores (Criando um caso de coincidência)
INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES 
('Tech Solutions LTDA', '12345678000199'),
('Importadora Global', '55443322000111');

INSERT INTO Vendedor (RazaoSocial, Local) VALUES 
('Tech Solutions LTDA', 'Ituiutaba'),
('Vendas Online Express', 'São Paulo');

-- 5. Inserindo Estoque
INSERT INTO Estoque (Local) VALUES ('Depósito Principal'), ('Loja Física');

-- 6. Alimentando Tabelas de Relacionamento
-- Relação Produto/Pedido
INSERT INTO Relacao_Produto_Pedido (idProduto, idPedido, Quantidade) VALUES 
(1, 1, 2), -- 2 Fones para o pedido 1
(2, 2, 1), -- 1 Monitor para o pedido 2
(3, 3, 4); -- 4 Cadeiras para a empresa

-- Produto no Estoque
INSERT INTO Produto_has_Estoque (idProduto, idEstoque, Quantidade) VALUES 
(1, 1, 50),
(2, 1, 10),
(3, 2, 5);

-- Disponibilizando Produto (Fornecedores)
INSERT INTO Disponibilizando_Produto (idFornecedor, idProduto) VALUES 
(1, 1), 
(1, 2),
(2, 3);
