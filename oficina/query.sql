-- Recuperações simples com SELECT Statement
SELECT * FROM oficina.Responsavel;
SELECT * FROM oficina.Cliente;
SELECT * FROM oficina.Pedido;
SELECT * FROM oficina.Ordem_de_Servico;
SELECT * FROM oficina.Responsavel_has_Pedido;

SELECT c.* FROM oficina.Cliente c
JOIN oficina.Pedido p ON c.idCliente = p.Cliente_idCliente;

SELECT p.*, c.Nome AS NomeCliente FROM oficina.Pedido p
JOIN oficina.Cliente c ON p.Cliente_idCliente = c.idCliente;

SELECT * FROM oficina.Pedido WHERE Liberado = 1;

-- Filtros com WHERE Statement
SELECT * FROM oficina.Responsavel WHERE idResponsavel = 1;
SELECT * FROM oficina.Cliente WHERE Nome = 'Carlos Silva';
SELECT * FROM oficina.Pedido WHERE Liberado = 1;
SELECT * FROM oficina.Pedido WHERE Cliente_idCliente = 1;
SELECT * FROM oficina.Ordem_de_Servico WHERE Status_da_OS = 'Em andamento';
SELECT * FROM oficina.Pedido WHERE Data_da_solicitacao > '2024-04-01';
SELECT * FROM oficina.Responsavel WHERE Nivelhelpdesk > 2;
SELECT * FROM oficina.Cliente WHERE Nome LIKE 'A%';

-- Crie expressões para gerar atributos derivados

SELECT c.Nome, COUNT(p.idPedido) AS TotalPedidos FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente;

SELECT c.Nome, SUM(p.ValorTotal) AS ValorTotalPedidos 
FROM Cliente c 
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente 
GROUP BY c.idCliente;

-- Defina ordenações dos dados com ORDER BY

SELECT * FROM oficina.Cliente ORDER BY Nome;
SELECT * FROM oficina.Pedido ORDER BY Data_da_solicitacao;
SELECT * FROM oficina.Ordem_de_Servico ORDER BY Status_da_OS DESC;
SELECT * FROM oficina.Responsavel ORDER BY Nivelhelpdesk ASC, Nome ASC;
SELECT * FROM oficina.Cliente ORDER BY Nome ASC LIMIT 10;

-- Condições de filtros aos grupos – HAVING Statement

SELECT Cliente_idCliente, COUNT(idPedido) AS TotalPedidos 
FROM Pedido 
GROUP BY Cliente_idCliente 
HAVING COUNT(idPedido) > 1;

SELECT Responsavel_idResponsavel, COUNT(Pedido_idPedido) AS TotalPedidos 
FROM Responsavel_has_Pedido 
GROUP BY Responsavel_idResponsavel 
HAVING COUNT(Pedido_idPedido) >= 1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

SELECT c.Nome AS NomeCliente, p.idPedido, p.Servico 
FROM Cliente c 
INNER JOIN Pedido p ON c.idCliente = p.Cliente_idCliente;

SELECT p.idPedido, c.Nome AS NomeCliente, os.Status_da_OS 
FROM Pedido p 
INNER JOIN Cliente c ON p.Cliente_idCliente = c.idCliente 
LEFT JOIN Ordem_de_Servico os ON p.idPedido = os.Pedido_idPedido;

SELECT c.Nome AS NomeCliente, p.idPedido, r.Nome AS NomeResponsavel 
FROM Cliente c 
INNER JOIN Pedido p ON c.idCliente = p.Cliente_idCliente 
LEFT JOIN Responsavel_has_Pedido rp ON p.idPedido = rp.Pedido_idPedido 
LEFT JOIN Responsavel r ON rp.Responsavel_idResponsavel = r.idResponsavel;

SELECT c.Nome AS NomeCliente, p.idPedido, r.Nome AS NomeResponsavel, os.Status_da_OS 
FROM Cliente c 
INNER JOIN Pedido p ON c.idCliente = p.Cliente_idCliente 
LEFT JOIN Responsavel_has_Pedido rp ON p.idPedido = rp.Pedido_idPedido 
LEFT JOIN Responsavel r ON rp.Responsavel_idResponsavel = r.idResponsavel 
LEFT JOIN Ordem_de_Servico os ON p.idPedido = os.Pedido_idPedido;








select * from ordem_de_servico;



























