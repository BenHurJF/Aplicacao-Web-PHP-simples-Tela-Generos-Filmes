# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     mydb
# Server version:               5.1.51-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2010-11-03 18:11:26
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for mydb
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cinema`;


# Dumping structure for table cinema.cinemas
CREATE TABLE IF NOT EXISTS `cinemas` (
  `idcinemas` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(80) NOT NULL,
  PRIMARY KEY (`idcinemas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

# Dumping data for table cinema.cinemas: 5 rows
DELETE FROM `cinemas`;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` (`idcinemas`, `CNPJ`, `Nome`) VALUES (1, '12121212121212', 'Cinema de Unaí'), (2, '34343434343434', 'Cinema de Belo Horizonte'), (3, '56565656565656', 'Cinema de Brasília'), (4, '78787878787878', 'Cinema de Divinópolis'), (5, '90909090909090', 'Cinema de São Paulo');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;


# Dumping structure for table cinema.classificacoes
CREATE TABLE IF NOT EXISTS `classificacoes` (
  `idclassificacoes` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idclassificacoes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.classificacoes: 5 rows
DELETE FROM `classificacoes`;
/*!40000 ALTER TABLE `classificacoes` DISABLE KEYS */;
INSERT INTO `classificacoes` (`idclassificacoes`, `Nome`) VALUES (1, 'Indicação Livre'), (2, 'Maiores de 12 anos.'), (3, 'Maiores de 14 anos.'), (4, 'Maiores de 16 anos.'), (5, 'Maiores de 18 anos.');
/*!40000 ALTER TABLE `classificacoes` ENABLE KEYS */;


# Dumping structure for table cinema.exibicoes
CREATE TABLE IF NOT EXISTS `exibicoes` (
  `idexibicoes` int(11) NOT NULL AUTO_INCREMENT,
  `id_filmes` int(11) NOT NULL,
  `id_funcionarios` int(11) NOT NULL,
  `id_horarios` int(11) NOT NULL,
  `id_funcoes` int(11) NOT NULL,
  `id_salas` int(11) NOT NULL,
  PRIMARY KEY (`idexibicoes`),
  KEY `exibicoes_filmes` (`id_filmes`),
  KEY `exibicoes_funcionarios` (`id_funcionarios`),
  KEY `exibicoes_horarios` (`id_horarios`),
  KEY `exibicoes_funcoes` (`id_funcoes`),
  KEY `exibicoes_salas` (`id_salas`),
  CONSTRAINT `exibicoes_filmes` FOREIGN KEY (`id_filmes`) REFERENCES `filmes` (`idfilmes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exibicoes_funcionarios` FOREIGN KEY (`id_funcionarios`) REFERENCES `funcionarios` (`idfuncionarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exibicoes_funcoes` FOREIGN KEY (`id_funcoes`) REFERENCES `funcoes` (`idfuncoes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exibicoes_horarios` FOREIGN KEY (`id_horarios`) REFERENCES `horarios` (`idhorarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exibicoes_salas` FOREIGN KEY (`id_salas`) REFERENCES `salas` (`idsalas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.exibicoes: 13 rows
DELETE FROM `exibicoes`;
/*!40000 ALTER TABLE `exibicoes` DISABLE KEYS */;
INSERT INTO `exibicoes` (`idexibicoes`, `id_filmes`, `id_funcionarios`, `id_horarios`, `id_funcoes`, `id_salas`) VALUES (1, 1, 1, 1, 1, 7), (2, 1, 7, 1, 2, 7), (3, 1, 6, 1, 3, 7), (4, 1, 6, 3, 1, 7), (5, 1, 7, 3, 4, 7), (6, 4, 2, 4, 2, 4), (7, 4, 3, 4, 1, 4), (8, 4, 8, 1, 3, 11), (9, 4, 4, 1, 1, 11), (10, 4, 2, 1, 2, 11), (11, 3, 1, 2, 2, 7), (12, 3, 7, 2, 1, 7), (13, 3, 6, 2, 3, 7);
/*!40000 ALTER TABLE `exibicoes` ENABLE KEYS */;


# Dumping structure for table cinema.filmes
CREATE TABLE IF NOT EXISTS `filmes` (
  `idfilmes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_lancamento` date DEFAULT NULL,
  `duracao` int(11) NOT NULL COMMENT 'A duracao do filmes está em minutos.',
  `idgeneros` int(11) NOT NULL,
  `idclassificacao` int(11) NOT NULL COMMENT 'A classificacao está em anos!',
  `idpremiacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfilmes`),
  KEY `filmes_premiacoes` (`idpremiacao`),
  KEY `filmes_genero` (`idgeneros`),
  KEY `filmes_classificacoes` (`idclassificacao`),
  CONSTRAINT `filmes_classificacoes` FOREIGN KEY (`idclassificacao`) REFERENCES `classificacoes` (`idclassificacoes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `filmes_genero` FOREIGN KEY (`idgeneros`) REFERENCES `generos` (`idgeneros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `filmes_premiacoes` FOREIGN KEY (`idpremiacao`) REFERENCES `premiacoes` (`idpremiacoes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.filmes: 11 rows
DELETE FROM `filmes`;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` (`idfilmes`, `nome`, `data_lancamento`, `duracao`, `idgeneros`, `idclassificacao`, `idpremiacao`) VALUES (1, '127 Horas', '2011-03-18', 120, 2, 3, NULL), (2, '22 Balas', '2010-11-03', 135, 2, 2, NULL), (3, '400 Contra 1 - Uma História do Crime Organizado', '2010-05-09', 140, 1, 2, NULL), (4, 'A Batalha do Império - Confucius', '2010-02-10', 90, 2, 1, NULL), (5, 'A Mentira', '2010-06-07', 90, 5, 2, NULL), (6, 'A Guerra dos Vizinhos', '2009-01-03', 89, 4, 1, NULL), (7, 'Mr. Nobody', '2009-08-01', 103, 4, 1, NULL), (8, 'O Alvo', '2009-11-04', 90, 1, 2, NULL), (9, 'Os Mensageiros 2', '2009-09-09', 84, 3, 4, NULL), (10, 'Perseguição Implacável', '2009-11-03', 99, 3, 3, NULL), (11, 'Quarto do Medo', '2009-01-04', 86, 2, 2, NULL);
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;


# Dumping structure for table cinema.funcionarios
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idfuncionarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(65) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `logradouro` varchar(45) DEFAULT NULL,
  `sexo` binary(1) NOT NULL COMMENT 'Considera-se que o valor 0 é do sexo feminino e o valor 1 é do sexo masculino.',
  `telefone_contato` varchar(10) NOT NULL,
  PRIMARY KEY (`idfuncionarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.funcionarios: 8 rows
DELETE FROM `funcionarios`;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` (`idfuncionarios`, `nome`, `data_nascimento`, `cpf`, `bairro`, `logradouro`, `sexo`, `telefone_contato`) VALUES (1, 'Lucas Da Silva Sauro', '1983-10-10', '12312312312', 'Asa Sul', 'SQS 222', '', '6112121212'), (2, 'Maria Dos Santos', '1974-11-01', '12312312334', 'Asa Norte', 'SQN 332', '', '6123456867'), (3, 'Ronaaldo Pereira', '1988-03-16', '09876543212', 'Taguatinga', 'QNL 3', '', '6187650987'), (4, 'Ronara Anjo Souza', '1980-07-09', '87654312398', 'Centro', 'Casa 17 Rua sete de setembro', '', '3834433212'), (5, 'Carlos Augusto Moreira', '1977-12-12', '52562672788', 'Belvedere', 'Rua Monteiro Lobato', '', '3122333322'), (6, 'João Antônio', '1960-11-02', '09876543211', 'Zona Sul', 'Rua Antônio da Silva', '', '1111111111'), (7, 'Joana Aguiar', '1978-11-03', '76512365412', 'Zona Norte', 'Rua Joana Darc', '', '1122223456'), (8, 'Pedro Fortes', '1988-02-21', '12312345656', 'Guará', 'QI 13 casa 9876', '', '6145454543');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;


# Dumping structure for table cinema.funcoes
CREATE TABLE IF NOT EXISTS `funcoes` (
  `idfuncoes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idfuncoes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.funcoes: 4 rows
DELETE FROM `funcoes`;
/*!40000 ALTER TABLE `funcoes` DISABLE KEYS */;
INSERT INTO `funcoes` (`idfuncoes`, `nome`) VALUES (1, 'Caixa'), (2, 'Bilheteiro'), (3, 'Lanchonete'), (4, 'Limpeza');
/*!40000 ALTER TABLE `funcoes` ENABLE KEYS */;


# Dumping structure for table cinema.generos
CREATE TABLE IF NOT EXISTS `generos` (
  `idgeneros` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idgeneros`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.generos: 5 rows
DELETE FROM `generos`;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` (`idgeneros`, `nome`) VALUES (1, 'Ação'), (2, 'Drama'), (3, 'Terror'), (4, 'Comédia'), (5, 'Romance');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;


# Dumping structure for table cinema.horarios
CREATE TABLE IF NOT EXISTS `horarios` (
  `idhorarios` int(11) NOT NULL AUTO_INCREMENT,
  `horario` time NOT NULL,
  PRIMARY KEY (`idhorarios`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.horarios: 6 rows
DELETE FROM `horarios`;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` (`idhorarios`, `horario`) VALUES (1, '14:00:00'), (2, '16:30:00'), (3, '18:00:00'), (4, '20:00:00'), (5, '22:30:15'), (6, '00:45:00');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;


# Dumping structure for table cinema.indicacoes
CREATE TABLE IF NOT EXISTS `indicacoes` (
  `idindicacoes` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idindicacoes`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.indicacoes: 8 rows
DELETE FROM `indicacoes`;
/*!40000 ALTER TABLE `indicacoes` DISABLE KEYS */;
INSERT INTO `indicacoes` (`idindicacoes`, `Nome`) VALUES (1, 'Oscar de Melhor Filme'), (2, 'Oscar de Melhor Ator'), (3, 'Oscar de Melhor Filme Estrangeiro'), (4, 'Oscar de Melhor Fotografia'), (5, 'Grammy'), (6, 'Independent Spirit Awards'), (7, 'MTV Movie Awards'), (8, 'Teen Choice Awards');
/*!40000 ALTER TABLE `indicacoes` ENABLE KEYS */;


# Dumping structure for table cinema.indicacoes_filmes
CREATE TABLE IF NOT EXISTS `indicacoes_filmes` (
  `id_filmes` int(11) NOT NULL,
  `id_indicacoes` int(11) NOT NULL,
  PRIMARY KEY (`id_filmes`,`id_indicacoes`),
  KEY `indicacoes_filmes_filmes` (`id_filmes`),
  KEY `indicacoes_filmes_indicacoes` (`id_indicacoes`),
  CONSTRAINT `indicacoes_filmes_filmes` FOREIGN KEY (`id_filmes`) REFERENCES `filmes` (`idfilmes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `indicacoes_filmes_indicacoes` FOREIGN KEY (`id_indicacoes`) REFERENCES `indicacoes` (`idindicacoes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table cinema.indicacoes_filmes: 17 rows
DELETE FROM `indicacoes_filmes`;
/*!40000 ALTER TABLE `indicacoes_filmes` DISABLE KEYS */;
INSERT INTO `indicacoes_filmes` (`id_filmes`, `id_indicacoes`) VALUES (1, 5), (1, 7), (2, 1), (2, 7), (4, 1), (4, 3), (4, 5), (4, 6), (5, 8), (6, 1), (6, 2), (6, 3), (6, 4), (8, 1), (8, 6), (11, 7), (11, 8);
/*!40000 ALTER TABLE `indicacoes_filmes` ENABLE KEYS */;


# Dumping structure for table cinema.premiacoes
CREATE TABLE IF NOT EXISTS `premiacoes` (
  `idpremiacoes` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idpremiacoes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.premiacoes: 4 rows
DELETE FROM `premiacoes`;
/*!40000 ALTER TABLE `premiacoes` DISABLE KEYS */;
INSERT INTO `premiacoes` (`idpremiacoes`, `nome`) VALUES (1, 'Oscar de Melhor ator'), (2, 'Oscar de Melhor Filme'), (3, 'Oscar de Melhor Fotografia'), (4, 'Grammy de Ouro');
/*!40000 ALTER TABLE `premiacoes` ENABLE KEYS */;


# Dumping structure for table cinema.salas
CREATE TABLE IF NOT EXISTS `salas` (
  `idsalas` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `idcinemas` int(11) NOT NULL,
  PRIMARY KEY (`idsalas`),
  KEY `salas_cinemas` (`idcinemas`),
  CONSTRAINT `salas_cinemas` FOREIGN KEY (`idcinemas`) REFERENCES `cinemas` (`idcinemas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

# Dumping data for table cinema.salas: 14 rows
DELETE FROM `salas`;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` (`idsalas`, `Nome`, `idcinemas`) VALUES (1, 'Sala das Hortências', 1), (2, 'Sala Vicente de Paula', 1), (3, 'Sala Cap. Carlos Gonzaga', 1), (4, 'Sala Tancredo Neves', 1), (5, 'Sala Belvedere', 2), (6, 'Sala Venda Nova', 2), (7, 'Sala Savassi', 2), (8, 'Cine Brasília', 3), (9, 'Cinemark Pier 21', 3), (10, 'Parkplex Parkshopping', 3), (11, 'Cine Alhambra', 4), (12, 'Cine São Paulo', 5), (13, 'Cine Paulista', 5), (14, 'Cine Augusta', 5);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
