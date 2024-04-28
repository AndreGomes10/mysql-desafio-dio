-- Inserir dados na tabela Responsavel
INSERT INTO `oficina`.`Responsavel` (`idResponsavel`, `Nivelhelpdesk`, `Nome`, `Departamento`) VALUES
(1, 1, 'João', 'Atendimento ao Cliente'),
(2, 2, 'Maria', 'Suporte Técnico'),
(3, 3, 'Pedro', 'Desenvolvimento');

-- Inserir dados na tabela Cliente
INSERT INTO `oficina`.`Cliente` (`idCliente`, `Nome`, `cpf`, `Contato`) VALUES
(1, 'Carlos Silva', '123.456.789-00', 'carlos@example.com'),
(2, 'Ana Souza', '987.654.321-00', 'ana@example.com'),
(3, 'Paulo Oliveira', '456.789.123-00', 'paulo@example.com');

-- Inserir dados na tabela Pedido
INSERT INTO `oficina`.`Pedido` (`idPedido`, `Servico`, `Descricao`, `Data_da_solicitacao`, `Cliente_idCliente`, `Liberado`) VALUES
(1, 'Manutenção de Computador', 'Troca de HD', '2024-04-28', 1, 1),
(2, 'Instalação de Software', 'Instalação do Microsoft Office', '2024-04-28', 2, 0),
(3, 'Desenvolvimento de Website', 'Criação de um site institucional', '2024-04-27', 3, 1);

-- Inserir dados na tabela Ordem_de_Servico
INSERT INTO `oficina`.`Ordem_de_Servico` (`id_Ordem_de_Servico`, `Status_da_OS`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`) VALUES
(1, 'Em andamento', 1, 1),
(2, 'Pendente', 2, 2),
(3, 'Concluída', 3, 3);

-- Inserir dados na tabela Responsavel_has_Pedido
INSERT INTO `oficina`.`Responsavel_has_Pedido` (`Responsavel_idResponsavel`, `Pedido_idPedido`) VALUES
(1, 1),
(2, 2),
(3, 3);