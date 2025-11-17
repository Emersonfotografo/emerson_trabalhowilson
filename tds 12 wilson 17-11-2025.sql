drop database if exists loja;
create database loja;
use loja;
show databases;
create table produtos(
id int primary key auto_increment,
nome varchar(100) not null,
preco decimal(10, 2) not null,
estoque int not null
);
desc produtos;
create table vendas (
id int auto_increment primary key,
produto_id int,
produto varchar(100) not null,
quantidade int not null,
valor_total decimal(10, 2) not null,
data_venda date not null,
foreign key(produto_id) references produtos(id)
);
desc vendas;

insert into vendas (nome, preco, estoque) values
('Laptop Gamer X', 5500.00, 15),
('Smartphone Ultra', 2899.99, 45),
('Monitor Curvo 27"', 1450.50, 30),
('Teclado Mecânico RGB', 350.00, 75),
('Mouse Sem Fio Ergo', 120.90, 110),
('Webcam HD Pro', 220.00, 55),
('Headset Cancelamento', 480.00, 40),
('SSD 1TB NVMe', 680.75, 25),
('Memória RAM 16GB', 390.00, 60),
('Roteador Mesh WiFi 6', 750.00, 20),
('Câmera Segurança 4K', 920.00, 18),
('Smartwatch Série 5', 1100.00, 35),
('Console Portátil P', 1999.00, 12),
('Impressora Laser Mono', 850.00, 22),
('Cartucho Tinta Color', 85.50, 150),
('Power Bank 20000mAh', 180.00, 90),
('Cabo HDMI 2.1', 45.00, 200),
('Caixa de Som Portátil', 250.00, 80),
('Placa de Vídeo RTX', 4200.00, 8),
('Tablet Pro 10"', 1650.00, 28);
select * from produtos;
insert into vendas (produtos_id, produto, quantidade, valor_total, data_venda) values
(1, 'Laptop Gamer X', 1, 5500.00, '2025-11-15', date_sub(curdate(), interval 1 day)),
(2, 'Smartphone Ultra', 2, 5799.98, '2025-11-15', date_sub(curdate(), interval 1 day)),
(3, 'Monitor Curvo 27"', 1, 1450.50, '2025-11-16', date_sub(curdate(), interval 1 day)),
(4, 'Teclado Mecânico RGB', 5, 1750.00, '2025-11-16', date_sub(curdate(), interval 1 day)),
(5, 'Mouse Sem Fio Ergo', 3, 362.70, '2025-11-17', date_sub(curdate(), interval 1 day)),
(6, 'Webcam HD Pro', 1, 220.00, '2025-11-17', date_sub(curdate(), interval 1 day)),
(7, 'Headset Cancelamento', 2, 960.00, '2025-11-17', date_sub(curdate(), interval 1 day)),
(8, 'SSD 1TB NVMe', 1, 680.75, '2025-11-18', date_sub(curdate(), interval 1 day)),
(9, 'Memória RAM 16GB', 4, 1560.00, '2025-11-18', date_sub(curdate(), interval 1 day)),
(10, 'Roteador Mesh WiFi 6', 1, 750.00, '2025-11-18', date_sub(curdate(), interval 1 day)),
(11, 'Câmera Segurança 4K', 1, 920.00, '2025-11-19', date_sub(curdate(), interval 1 day)),
(12, 'Smartwatch Série 5', 2, 2200.00, '2025-11-19', date_sub(curdate(), interval 1 day)),
(13, 'Console Portátil P', 1, 1999.00, '2025-11-20', date_sub(curdate(), interval 1 day)),
(14, 'Impressora Laser Mono', 1, 850.00, '2025-11-20', date_sub(curdate(), interval 1 day)),
(15, 'Cartucho Tinta Color', 10, 855.00, '2025-11-20', date_sub(curdate(), interval 1 day)),
(16, 'Power Bank 20000mAh', 5, 900.00, '2025-11-21', date_sub(curdate(), interval 1 day)),
(17, 'Cabo HDMI 2.1', 8, 360.00, '2025-11-21', date_sub(curdate(), interval 1 day)),
(18, 'Caixa de Som Portátil', 2, 500.00, '2025-11-22', date_sub(curdate(), interval 1 day)),
(19, 'Placa de Vídeo RTX', 1, 4200.00, '2025-11-22', date_sub(curdate(), interval 1 day)),
(20, 'Tablet Pro 10"', 1, 1650.00, '2025-11-22', date_sub(curdate(), interval 1 day));
select * from vendas;
select produto, data_venda from vendas;
select * from vendas where quantidade >= 3;
select * from vendas where data_venda >= curdate() - interval 4 day;
-- Delimitador temporário para criar o bloco de código
delimiter //
create procedure AplicadordeDescontoGeral(in porcentagem decimal(5, 2))
begin
-- Atualizar a tabela de produtos aplicando o desconto
update produtos
set preco = preco * (1 - (porcentagem / 100));
-- Informar quantas linhas foram afetadas
select concat('Desconto de ', porcentagem, '% aplicado em ', row_count(), 'produtos') as Resultado;
end //
delimiter ;
select * from produtos;
set sql_safe_updates = 0;
call AplicadordeDescontoGeral(15.0);
select * from produtos;
