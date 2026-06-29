
CREATE DATABASE IF NOT EXISTS LojaAutopecas;
USE LojaAutopecas;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE ItemVenda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Categoria(nome) VALUES
('Freios'),('Suspensão'),('Motor'),('Elétrica'),('Lubrificantes');

INSERT INTO Fornecedor(nome,telefone) VALUES
('Bosch','61999990001'),
('Cofap','61999990002'),
('NGK','61999990003'),
('Moura','61999990004'),
('Valeo','61999990005'),
('Monroe','61999990006'),
('Tecfil','61999990007'),
('Shell','61999990008'),
('Mobil','61999990009'),
('TRW','61999990010');

INSERT INTO Funcionario(nome,cargo,salario) VALUES
('Carlos Silva','Vendedor',2500),
('Ana Souza','Gerente',5000),
('Pedro Lima','Vendedor',2600),
('Lucas Rocha','Caixa',2200),
('Marina Alves','Vendedor',2700);

INSERT INTO Cliente(nome,telefone,email) VALUES
('Cliente 1','61911110001','cliente1@email.com'),
('Cliente 2','61911110002','cliente2@email.com'),
('Cliente 3','61911110003','cliente3@email.com'),
('Cliente 4','61911110004','cliente4@email.com'),
('Cliente 5','61911110005','cliente5@email.com'),
('Cliente 6','61911110006','cliente6@email.com'),
('Cliente 7','61911110007','cliente7@email.com'),
('Cliente 8','61911110008','cliente8@email.com'),
('Cliente 9','61911110009','cliente9@email.com'),
('Cliente 10','61911110010','cliente10@email.com'),
('Cliente 11','61911110011','cliente11@email.com'),
('Cliente 12','61911110012','cliente12@email.com'),
('Cliente 13','61911110013','cliente13@email.com'),
('Cliente 14','61911110014','cliente14@email.com'),
('Cliente 15','61911110015','cliente15@email.com'),
('Cliente 16','61911110016','cliente16@email.com'),
('Cliente 17','61911110017','cliente17@email.com'),
('Cliente 18','61911110018','cliente18@email.com'),
('Cliente 19','61911110019','cliente19@email.com'),
('Cliente 20','61911110020','cliente20@email.com');

INSERT INTO Produto(nome,preco,estoque,id_categoria,id_fornecedor) VALUES
('Pastilha de Freio',120,50,1,10),
('Disco de Freio',250,30,1,10),
('Amortecedor Dianteiro',350,20,2,2),
('Amortecedor Traseiro',340,20,2,2),
('Vela de Ignição',45,100,3,3),
('Filtro de Óleo',25,150,3,7),
('Bateria 60Ah',450,25,4,4),
('Alternador',780,15,4,1),
('Óleo 5W30',55,200,5,8),
('Óleo 10W40',48,180,5,9),
('Produto 11',100,40,1,1),
('Produto 12',110,40,2,2),
('Produto 13',120,40,3,3),
('Produto 14',130,40,4,4),
('Produto 15',140,40,5,5),
('Produto 16',150,40,1,6),
('Produto 17',160,40,2,7),
('Produto 18',170,40,3,8),
('Produto 19',180,40,4,9),
('Produto 20',190,40,5,10),
('Produto 21',200,40,1,1),
('Produto 22',210,40,2,2),
('Produto 23',220,40,3,3),
('Produto 24',230,40,4,4),
('Produto 25',240,40,5,5),
('Produto 26',250,40,1,6),
('Produto 27',260,40,2,7),
('Produto 28',270,40,3,8),
('Produto 29',280,40,4,9),
('Produto 30',290,40,5,10);

INSERT INTO Venda(id_cliente,id_funcionario) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,1),(7,2),(8,3),(9,4),(10,5),
(11,1),(12,2),(13,3),(14,4),(15,5),
(16,1),(17,2),(18,3),(19,4),(20,5);

INSERT INTO ItemVenda(id_venda,id_produto,quantidade,preco_unitario) VALUES
(1,1,2,120),(1,5,4,45),
(2,2,1,250),(2,7,1,450),
(3,3,2,350),(3,9,5,55),
(4,4,2,340),(4,10,3,48),
(5,6,4,25),(5,8,1,780),
(6,11,2,100),(6,12,1,110),
(7,13,2,120),(7,14,1,130),
(8,15,2,140),(8,16,1,150),
(9,17,2,160),(9,18,1,170),
(10,19,2,180),(10,20,1,190),
(11,21,2,200),(11,22,1,210),
(12,23,2,220),(12,24,1,230),
(13,25,2,240),(13,26,1,250),
(14,27,2,260),(14,28,1,270),
(15,29,2,280),(15,30,1,290),
(16,1,3,120),(16,2,1,250),
(17,3,1,350),(17,4,2,340),
(18,5,4,45),(18,6,5,25),
(19,7,1,450),(19,8,1,780),
(20,9,4,55),(20,10,4,48);

SELECT AVG(preco) AS media_preco, MAX(preco) AS maior_preco, MIN(preco) AS menor_preco FROM Produto;
SELECT COUNT(*) AS total_produtos FROM Produto;
SELECT SUM(quantidade * preco_unitario) AS faturamento_total FROM ItemVenda;
