CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- 1. Tabela Cliente (PF/PJ)
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(255),
    TipoCliente ENUM('PF', 'PJ') NOT NULL,
    CPF CHAR(11),
    CNPJ CHAR(14),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

-- 2. Tabela Produto
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL
);

-- 3. Tabela Pedido 
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedidoCliente INT,
    StatusPedido ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    Descricao VARCHAR(255),
    Frete FLOAT DEFAULT 10,
    CodigoRastreio VARCHAR(45),
    StatusEntrega ENUM('Postado', 'Em trânsito', 'Entregue') DEFAULT 'Postado',
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idPedidoCliente) REFERENCES Cliente(idCliente)
);

-- 4. Fornecedor e Estoque
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ VARCHAR(45) NOT NULL,
    CONSTRAINT unique_fornecedor UNIQUE (CNPJ)
);

CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(45)
);

-- 5. Vendedor
CREATE TABLE Vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    Local VARCHAR(45)
);

-- TABELAS DE RELACIONAMENTO 

CREATE TABLE Disponibilizando_Produto (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    CONSTRAINT fk_disp_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_disp_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Produto_has_Estoque (
    idProduto INT,
    idEstoque INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (idProduto, idEstoque),
    CONSTRAINT fk_est_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_est_estoque FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE Relacao_Produto_Pedido (
    idProduto INT,
    idPedido INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (idProduto, idPedido),
    CONSTRAINT fk_rel_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_rel_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE Produtos_por_Vendedor (
    idVendedor INT,
    idProduto INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (idVendedor, idProduto),
    CONSTRAINT fk_vend_vendedor FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor),
    CONSTRAINT fk_vend_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
