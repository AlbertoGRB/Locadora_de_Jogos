USE locadora;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Estrutura da tabela `clientes`
CREATE TABLE `clientes` (
  `ID_clientes` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  `Documento` varchar(40) NOT NULL,
  `Data_de_Nascimento` varchar(30) DEFAULT NULL,
  `Endereco` varchar(40) NOT NULL,
  `Bairro` varchar(40) NOT NULL,
  `Cidade` varchar(40) NOT NULL,
  `Estado` varchar(40) NOT NULL,
  `Cep` varchar(20) NOT NULL,
  `Celular` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Observacoes` varchar(120) NOT NULL,
  PRIMARY KEY (`ID_clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estrutura da tabela `emprestimos`
CREATE TABLE `emprestimos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Clientes` int(80) NOT NULL,
  `Data_de_Locacao` varchar(50) NOT NULL,
  `Valor_Total_Locacao` decimal(10,0) NOT NULL,
  `Juros` decimal(10,0) NOT NULL,
  `Data_de_Devolucao` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `emprestimos_clientes` (`ID_Clientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estrutura da tabela `generos`
CREATE TABLE `generos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(80) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estrutura da tabela `itens_emprestimo`
CREATE TABLE `itens_emprestimo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Emprestimo` int(11) NOT NULL,
  `ID_jogo` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Empréstimo` (`ID_Emprestimo`),
  KEY `ID_jogo` (`ID_jogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estrutura da tabela `jogos`
CREATE TABLE `jogos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  `Desenvolvedor` varchar(50) NOT NULL,
  `Genero` int(40) NOT NULL,
  `Data_de_Lançamento` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserção de dados na tabela `clientes`
INSERT INTO `clientes` (`ID_clientes`, `Nome`, `Documento`, `Data_de_Nascimento`, `Endereco`, `Bairro`, `Cidade`, `Estado`, `Cep`, `Celular`, `Email`, `Observacoes`) VALUES
(28, 'Alberto Gabriel Rodrigues Bispo', 'MG-19.454.565', '07/11/2000', 'Avenida goias 399', 'Progresso', 'Frutal', 'Mg', '38202156', '(34)21465-5415', 'Alberto@gmail.com', 'Aluga jogos por mais de 30 dias'),
(36, 'Arthur Bernardes Henrique Macedo', 'MG-19.484.568', '19/11/1996', 'Casemiro de Abreu 158', 'Nossa Senhora do Carmo', 'Uberlandia', 'MG', '38249858', '(34)95545-5415', 'Arthur@gmail.com', 'Alugar jogos por somente 2 dias'),
(53, 'Gabriela Vitoria Rodrigues Bispo', 'SP-19.459.565', '27/11/2002', 'Av. Campos Sales', 'Centro ', 'São Paulo ', 'SP', '54258569', '(17)66745-5415', 'Gabriela@gmail.com', 'Aluga somente jogos do gênero RPG');

-- Inserção de dados na tabela `emprestimos`
INSERT INTO `emprestimos` (`ID`, `ID_Clientes`, `Data_de_Locacao`, `Valor_Total_Locacao`, `Juros`, `Data_de_Devolucao`) VALUES
(177, 28, '05/02/2023', '40', '0', '07/02/2023'),
(178, 53, '18/02/2023', '22', '2', '21/02/2023'),
(179, 28, '07/02/2023', '20', '0', '07/02/2023'),
(180, 28, '06/02/2023', '20', '0', '07/02/2023'),
(181, 53, '18/02/2023', '52', '12', '23/02/2023'),
(182, 28, '18/11/2023', '22', '2', '21/11/2023'),
(184, 28, '18/11/2023', '24', '4', '22/11/2023'),
(185, 28, '18/11/2023', '24', '4', '22/11/2023');

-- Inserção de dados na tabela `generos`
INSERT INTO `generos` (`ID`, `Descricao`) VALUES
(9, 'RPG'),
(11, 'Estratégia'),
(14, 'Simulação'),
(15, 'Battle royale');

-- Inserção de dados na tabela `itens_emprestimo`
INSERT INTO `itens_emprestimo` (`ID`, `ID_Emprestimo`, `ID_jogo`) VALUES
(203, 177, 1),
(204, 177, 16),
(205, 178, 17),
(206, 179, 16),
(207, 180, 17),
(208, 181, 1),
(209, 181, 19),
(210, 182, 21),
(211, 183, 16),
(212, 184, 1),
(213, 185, 1);

-- Inserção de dados na tabela `jogos`
INSERT INTO `jogos` (`ID`, `Nome`, `Desenvolvedor`, `Genero`, `Data_de_Lançamento`) VALUES
(1, 'Final Fantasy', 'Square', 9, '12/02/2015'),
(16, 'Fortnite', 'Epic Games', 15, '21/07/2017'),
(17, 'The Sims', 'Maxis', 14, '02/09/2014'),
(19, 'Forge of Empires', 'InnoGames GmbH', 11, '17/04/2012'),
(21, 'Call of Duty: Warzone', 'Raven Software, Infinity Ward', 15, '10/03/2020');

COMMIT;
