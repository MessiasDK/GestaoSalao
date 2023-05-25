-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Maio-2023 às 11:34
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kand`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `alimentar_cubo_pedido` ()   BEGIN
INSERT intO cubo_pedidos(nome_cliente, idade_cliente,sexo_cliente,data, produto,preco_atual,total,id_produto,id_pedido,id_cliente) 
Select cl.nome, cl.idade, cl.sexo, pd.data, prod.nome, prod.preco, (prod.preco* php.qtde), php.id_produto, php.id_pedido, cl.id FROM pedidos_has_produtos php INNER JOIN pedidos pd ON php.id_pedido=pd.id INNER JOIN clientes cl ON pd.id_cliente=cl.id INNER JOIN produtos prod ON php.id_produto = prod.id;
End$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(95) DEFAULT NULL,
  `sexo` char(2) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `sexo`, `idade`) VALUES
(2, 'Pedro', 'M', 33),
(3, 'Carlos', 'M', 44),
(4, 'José', 'M', 18),
(5, 'Fernanda', 'F', 31),
(6, 'Marcos', 'M', 19),
(7, 'Gabriela', 'F', 55),
(8, 'Ana', 'F', 48),
(9, 'Adriana', 'F', 52),
(10, 'Ivo', 'M', 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cubo_pedidos`
--

CREATE TABLE `cubo_pedidos` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nome_cliente` varchar(95) DEFAULT NULL,
  `sexo_cliente` char(2) DEFAULT NULL,
  `idade_cliente` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `produto` varchar(95) DEFAULT NULL,
  `preco_atual` float DEFAULT NULL,
  `qtde_comprada` int(11) DEFAULT NULL,
  `valor_pago_unidade` float DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cubo_pedidos`
--

INSERT INTO `cubo_pedidos` (`id`, `id_pedido`, `data`, `id_cliente`, `nome_cliente`, `sexo_cliente`, `idade_cliente`, `id_produto`, `produto`, `preco_atual`, `qtde_comprada`, `valor_pago_unidade`, `total`) VALUES
(368, 1, '2018-01-10 10:20:00', 1, 'Maria', 'F', 22, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 250),
(369, 3, '2018-01-10 18:20:00', 1, 'Maria', 'F', 22, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 590),
(370, 6, '2018-01-13 17:20:00', 1, 'Maria', 'F', 22, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 70),
(371, 9, '2018-01-19 20:20:00', 1, 'Maria', 'F', 22, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 2500),
(372, 15, '2018-02-05 01:16:00', 1, 'Maria', 'F', 22, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 180),
(373, 26, '2018-02-20 17:45:00', 1, 'Maria', 'F', 22, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 1140),
(374, 31, '2018-03-02 08:55:00', 1, 'Maria', 'F', 22, 7, 'Google Chromecast', 250, NULL, NULL, 1500),
(375, 31, '2018-03-02 08:55:00', 1, 'Maria', 'F', 22, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(376, 2, '2018-01-10 11:20:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 640),
(377, 2, '2018-01-10 11:20:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 500),
(378, 10, '2018-01-20 13:45:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 960),
(379, 10, '2018-01-20 13:45:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 750),
(380, 19, '2018-02-10 09:50:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 960),
(381, 19, '2018-02-10 09:50:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 750),
(382, 27, '2018-02-20 15:45:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 1600),
(383, 27, '2018-02-20 15:45:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 1250),
(384, 37, '2018-03-10 11:05:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 640),
(385, 37, '2018-03-10 11:05:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 500),
(386, 44, '2018-03-20 22:25:00', 2, 'Pedro', 'M', 33, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 640),
(387, 44, '2018-03-20 22:25:00', 2, 'Pedro', 'M', 33, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 500),
(388, 44, '2018-03-20 22:25:00', 2, 'Pedro', 'M', 33, 7, 'Google Chromecast', 250, NULL, NULL, 750),
(389, 4, '2018-01-11 08:20:00', 3, 'Carlos', 'M', 44, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 5000),
(390, 4, '2018-01-11 08:20:00', 3, 'Carlos', 'M', 44, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 3300),
(391, 4, '2018-01-11 08:20:00', 3, 'Carlos', 'M', 44, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 60),
(392, 20, '2018-02-11 08:10:00', 3, 'Carlos', 'M', 44, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(393, 20, '2018-02-11 08:10:00', 3, 'Carlos', 'M', 44, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 120),
(394, 43, '2018-03-20 08:15:00', 3, 'Carlos', 'M', 44, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 2950),
(395, 43, '2018-03-20 08:15:00', 3, 'Carlos', 'M', 44, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 590),
(396, 43, '2018-03-20 08:15:00', 3, 'Carlos', 'M', 44, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 120),
(397, 43, '2018-03-20 08:15:00', 3, 'Carlos', 'M', 44, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(398, 43, '2018-03-20 08:15:00', 3, 'Carlos', 'M', 44, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 900),
(399, 5, '2018-01-13 16:10:00', 4, 'José', 'M', 18, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(400, 5, '2018-01-13 16:10:00', 4, 'José', 'M', 18, 7, 'Google Chromecast', 250, NULL, NULL, 250),
(401, 12, '2018-01-28 13:10:00', 4, 'José', 'M', 18, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 150),
(402, 21, '2018-02-15 15:20:00', 4, 'José', 'M', 18, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 2500),
(403, 25, '2018-02-20 10:45:00', 4, 'José', 'M', 18, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 90),
(404, 25, '2018-02-20 10:45:00', 4, 'José', 'M', 18, 7, 'Google Chromecast', 250, NULL, NULL, 500),
(405, 25, '2018-02-20 10:45:00', 4, 'José', 'M', 18, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 280),
(406, 36, '2018-03-10 12:05:00', 4, 'José', 'M', 18, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 1000),
(407, 36, '2018-03-10 12:05:00', 4, 'José', 'M', 18, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 1280),
(408, 36, '2018-03-10 12:05:00', 4, 'José', 'M', 18, 7, 'Google Chromecast', 250, NULL, NULL, 1250),
(409, 42, '2018-03-19 15:05:00', 4, 'José', 'M', 18, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 900),
(410, 42, '2018-03-19 15:05:00', 4, 'José', 'M', 18, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 380),
(411, 42, '2018-03-19 15:05:00', 4, 'José', 'M', 18, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 150),
(412, 42, '2018-03-19 15:05:00', 4, 'José', 'M', 18, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 140),
(413, 46, '2018-03-21 11:20:00', 4, 'José', 'M', 18, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 285),
(414, 46, '2018-03-21 11:20:00', 4, 'José', 'M', 18, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 2500),
(415, 7, '2018-01-14 19:08:00', 5, 'Fernanda', 'F', 31, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 1180),
(416, 7, '2018-01-14 19:08:00', 5, 'Fernanda', 'F', 31, 11, 'Celular XS 64GB AKA', 680, NULL, NULL, 680),
(417, 22, '2018-02-18 15:20:00', 5, 'Fernanda', 'F', 31, 11, 'Celular XS 64GB AKA', 680, NULL, NULL, 2720),
(418, 28, '2018-02-25 20:45:00', 5, 'Fernanda', 'F', 31, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 1770),
(419, 39, '2018-03-18 18:05:00', 5, 'Fernanda', 'F', 31, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 2950),
(420, 8, '2018-01-19 00:40:00', 6, 'Marcos', 'M', 19, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(421, 8, '2018-01-19 00:40:00', 6, 'Marcos', 'M', 19, 9, 'Roteador XRS Atom', 400, NULL, NULL, 400),
(422, 23, '2018-02-19 00:20:00', 6, 'Marcos', 'M', 19, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 3300),
(423, 23, '2018-02-19 00:20:00', 6, 'Marcos', 'M', 19, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 95),
(424, 30, '2018-03-01 01:55:00', 6, 'Marcos', 'M', 19, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 2500),
(425, 30, '2018-03-01 01:55:00', 6, 'Marcos', 'M', 19, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 150),
(426, 30, '2018-03-01 01:55:00', 6, 'Marcos', 'M', 19, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 720),
(427, 30, '2018-03-01 01:55:00', 6, 'Marcos', 'M', 19, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 380),
(428, 30, '2018-03-01 01:55:00', 6, 'Marcos', 'M', 19, 7, 'Google Chromecast', 250, NULL, NULL, 1250),
(429, 38, '2018-03-12 00:55:00', 6, 'Marcos', 'M', 19, 7, 'Google Chromecast', 250, NULL, NULL, 2500),
(430, 11, '2018-01-27 08:40:00', 7, 'Gabriela', 'F', 55, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 60),
(431, 11, '2018-01-27 08:40:00', 7, 'Gabriela', 'F', 55, 7, 'Google Chromecast', 250, NULL, NULL, 500),
(432, 11, '2018-01-27 08:40:00', 7, 'Gabriela', 'F', 55, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 6600),
(433, 11, '2018-01-27 08:40:00', 7, 'Gabriela', 'F', 55, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 140),
(434, 24, '2018-02-19 08:30:00', 7, 'Gabriela', 'F', 55, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 90),
(435, 24, '2018-02-19 08:30:00', 7, 'Gabriela', 'F', 55, 7, 'Google Chromecast', 250, NULL, NULL, 750),
(436, 24, '2018-02-19 08:30:00', 7, 'Gabriela', 'F', 55, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 9900),
(437, 24, '2018-02-19 08:30:00', 7, 'Gabriela', 'F', 55, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 210),
(438, 35, '2018-03-09 08:25:00', 7, 'Gabriela', 'F', 55, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 90),
(439, 35, '2018-03-09 08:25:00', 7, 'Gabriela', 'F', 55, 7, 'Google Chromecast', 250, NULL, NULL, 750),
(440, 35, '2018-03-09 08:25:00', 7, 'Gabriela', 'F', 55, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 9900),
(441, 35, '2018-03-09 08:25:00', 7, 'Gabriela', 'F', 55, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 210),
(442, 35, '2018-03-09 08:25:00', 7, 'Gabriela', 'F', 55, 7, 'Google Chromecast', 250, NULL, NULL, 1250),
(443, 41, '2018-03-19 08:45:00', 7, 'Gabriela', 'F', 55, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 90),
(444, 41, '2018-03-19 08:45:00', 7, 'Gabriela', 'F', 55, 7, 'Google Chromecast', 250, NULL, NULL, 750),
(445, 41, '2018-03-19 08:45:00', 7, 'Gabriela', 'F', 55, 3, 'TV 55 Ktec 4K', 3300, NULL, NULL, 9900),
(446, 13, '2018-01-31 08:15:00', 8, 'Ana', 'F', 48, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 190),
(447, 13, '2018-01-31 08:15:00', 8, 'Ana', 'F', 48, 11, 'Celular XS 64GB AKA', 680, NULL, NULL, 680),
(448, 29, '2018-02-28 08:55:00', 8, 'Ana', 'F', 48, 7, 'Google Chromecast', 250, NULL, NULL, 1500),
(449, 29, '2018-02-28 08:55:00', 8, 'Ana', 'F', 48, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 420),
(450, 29, '2018-02-28 08:55:00', 8, 'Ana', 'F', 48, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 540),
(451, 14, '2018-02-01 08:05:00', 9, 'Adriana', 'F', 52, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 750),
(452, 14, '2018-02-01 08:05:00', 9, 'Adriana', 'F', 52, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 960),
(453, 40, '2018-03-19 08:40:00', 9, 'Adriana', 'F', 52, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 1500),
(454, 40, '2018-03-19 08:40:00', 9, 'Adriana', 'F', 52, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 1920),
(455, 40, '2018-03-19 08:40:00', 9, 'Adriana', 'F', 52, 12, 'Fone de Ouvido Gamer XR9', 180, NULL, NULL, 720),
(456, 16, '2018-02-06 08:16:00', 10, 'Ivo', 'M', 29, 6, 'Pendrive 16GB Aqtec', 30, NULL, NULL, 300),
(457, 16, '2018-02-06 08:16:00', 10, 'Ivo', 'M', 29, 7, 'Google Chromecast', 250, NULL, NULL, 500),
(458, 17, '2018-02-07 08:30:00', 10, 'Ivo', 'M', 29, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 280),
(459, 17, '2018-02-07 08:30:00', 10, 'Ivo', 'M', 29, 10, 'Mouse Gamer ATX G3', 250, NULL, NULL, 1250),
(460, 18, '2018-02-08 08:50:00', 10, 'Ivo', 'M', 29, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 475),
(461, 18, '2018-02-08 08:50:00', 10, 'Ivo', 'M', 29, 9, 'Roteador XRS Atom', 400, NULL, NULL, 800),
(462, 32, '2018-03-06 08:35:00', 10, 'Ivo', 'M', 29, 1, 'Fone de Ouvido GHR', 95, NULL, NULL, 285),
(463, 32, '2018-03-06 08:35:00', 10, 'Ivo', 'M', 29, 2, 'Notebook Oprum 25b', 2500, NULL, NULL, 2500),
(464, 33, '2018-03-07 08:15:00', 10, 'Ivo', 'M', 29, 4, 'Gabinete Gamer X5', 320, NULL, NULL, 1280),
(465, 33, '2018-03-07 08:15:00', 10, 'Ivo', 'M', 29, 5, 'Celular KF 32GB QWQ', 590, NULL, NULL, 590),
(466, 34, '2018-03-08 08:05:00', 10, 'Ivo', 'M', 29, 7, 'Google Chromecast', 250, NULL, NULL, 2500),
(467, 34, '2018-03-08 08:05:00', 10, 'Ivo', 'M', 29, 8, 'Cabo HDMI 2m', 70, NULL, NULL, 70),
(468, 34, '2018-03-08 08:05:00', 10, 'Ivo', 'M', 29, 9, 'Roteador XRS Atom', 400, NULL, NULL, 800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'aberto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `data`, `id_cliente`, `status`) VALUES
(1, '2018-01-10 10:20:00', 1, 'fechado'),
(2, '2018-01-10 11:20:00', 2, 'fechado'),
(3, '2018-01-10 18:20:00', 1, 'fechado'),
(4, '2018-01-11 08:20:00', 3, 'fechado'),
(5, '2018-01-13 16:10:00', 4, 'fechado'),
(6, '2018-01-13 17:20:00', 1, 'fechado'),
(7, '2018-01-14 19:08:00', 5, 'fechado'),
(8, '2018-01-19 00:40:00', 6, 'fechado'),
(9, '2018-01-19 20:20:00', 1, 'fechado'),
(10, '2018-01-20 13:45:00', 2, 'fechado'),
(11, '2018-01-27 08:40:00', 7, 'fechado'),
(12, '2018-01-28 13:10:00', 4, 'fechado'),
(13, '2018-01-31 08:15:00', 8, 'fechado'),
(14, '2018-02-01 08:05:00', 9, 'fechado'),
(15, '2018-02-05 01:16:00', 1, 'fechado'),
(16, '2018-02-06 08:16:00', 10, 'fechado'),
(17, '2018-02-07 08:30:00', 10, 'fechado'),
(18, '2018-02-08 08:50:00', 10, 'fechado'),
(19, '2018-02-10 09:50:00', 2, 'fechado'),
(20, '2018-02-11 08:10:00', 3, 'fechado'),
(21, '2018-02-15 15:20:00', 4, 'fechado'),
(22, '2018-02-18 15:20:00', 5, 'fechado'),
(23, '2018-02-19 00:20:00', 6, 'fechado'),
(24, '2018-02-19 08:30:00', 7, 'fechado'),
(25, '2018-02-20 10:45:00', 4, 'fechado'),
(26, '2018-02-20 17:45:00', 1, 'fechado'),
(27, '2018-02-20 15:45:00', 2, 'fechado'),
(28, '2018-02-25 20:45:00', 5, 'fechado'),
(29, '2018-02-28 08:55:00', 8, 'fechado'),
(30, '2018-03-01 01:55:00', 6, 'fechado'),
(31, '2018-03-02 08:55:00', 1, 'fechado'),
(32, '2018-03-06 08:35:00', 10, 'fechado'),
(33, '2018-03-07 08:15:00', 10, 'fechado'),
(34, '2018-03-08 08:05:00', 10, 'fechado'),
(35, '2018-03-09 08:25:00', 7, 'fechado'),
(36, '2018-03-10 12:05:00', 4, 'fechado'),
(37, '2018-03-10 11:05:00', 2, 'fechado'),
(38, '2018-03-12 00:55:00', 6, 'fechado'),
(39, '2018-03-18 18:05:00', 5, 'fechado'),
(40, '2018-03-19 08:40:00', 9, 'fechado'),
(41, '2018-03-19 08:45:00', 7, 'fechado'),
(42, '2018-03-19 15:05:00', 4, 'fechado'),
(43, '2018-03-20 08:15:00', 3, 'fechado'),
(44, '2018-03-20 22:25:00', 2, 'fechado'),
(45, '2018-03-21 10:00:00', 4, 'cancelado'),
(46, '2018-03-21 11:20:00', 4, 'fechado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_has_produtos`
--

CREATE TABLE `pedidos_has_produtos` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedidos_has_produtos`
--

INSERT INTO `pedidos_has_produtos` (`id`, `id_pedido`, `id_produto`, `qtde`, `valor`) VALUES
(1, 1, 10, 1, 250),
(2, 2, 4, 2, 600),
(3, 2, 10, 2, 500),
(4, 3, 5, 1, 590),
(5, 4, 2, 2, 5000),
(6, 4, 3, 1, 3300),
(7, 4, 6, 2, 60),
(8, 5, 1, 2, 180),
(9, 5, 7, 1, 270),
(10, 6, 8, 1, 70),
(11, 7, 5, 2, 1180),
(12, 7, 11, 1, 680),
(13, 8, 1, 2, 180),
(14, 8, 9, 1, 400),
(15, 9, 2, 1, 2500),
(16, 10, 4, 3, 900),
(17, 10, 10, 3, 750),
(18, 11, 6, 2, 60),
(19, 11, 7, 2, 540),
(20, 11, 3, 2, 6600),
(21, 11, 8, 2, 140),
(22, 12, 6, 5, 150),
(23, 13, 1, 2, 180),
(24, 13, 11, 1, 680),
(25, 14, 10, 3, 750),
(26, 14, 4, 3, 900),
(27, 15, 12, 1, 180),
(28, 16, 6, 10, 300),
(29, 16, 7, 2, 540),
(30, 17, 8, 4, 280),
(31, 17, 10, 5, 1250),
(32, 18, 1, 5, 450),
(33, 18, 9, 2, 800),
(37, 19, 4, 3, 900),
(38, 19, 10, 3, 750),
(39, 20, 1, 2, 180),
(40, 20, 6, 4, 120),
(41, 21, 2, 1, 2500),
(42, 22, 11, 4, 2720),
(43, 23, 3, 1, 3300),
(44, 23, 1, 1, 90),
(45, 24, 6, 3, 90),
(46, 24, 7, 3, 810),
(47, 24, 3, 3, 9900),
(48, 24, 8, 3, 210),
(49, 25, 6, 3, 90),
(50, 25, 7, 2, 540),
(51, 25, 8, 4, 280),
(52, 26, 1, 12, 1080),
(53, 27, 4, 5, 1500),
(54, 27, 10, 5, 1250),
(55, 28, 5, 3, 1770),
(56, 29, 7, 6, 1890),
(57, 29, 8, 6, 420),
(58, 29, 12, 3, 540),
(59, 30, 2, 1, 2500),
(60, 30, 6, 5, 150),
(61, 30, 12, 4, 720),
(62, 30, 1, 4, 380),
(63, 30, 7, 5, 550),
(64, 31, 7, 6, 660),
(65, 31, 1, 2, 190),
(66, 32, 1, 3, 285),
(67, 32, 2, 1, 2500),
(68, 33, 4, 4, 1280),
(69, 33, 5, 1, 590),
(70, 34, 7, 10, 1100),
(71, 34, 8, 1, 70),
(72, 34, 9, 2, 800),
(80, 35, 6, 3, 90),
(81, 35, 7, 3, 330),
(82, 35, 3, 3, 9900),
(83, 35, 8, 3, 210),
(84, 35, 7, 5, 550),
(85, 36, 10, 4, 1000),
(86, 36, 4, 4, 1280),
(87, 36, 7, 5, 550),
(90, 37, 4, 2, 640),
(91, 37, 10, 2, 500),
(92, 38, 7, 10, 1100),
(93, 39, 5, 5, 2950),
(94, 40, 10, 6, 1500),
(95, 40, 4, 6, 1920),
(96, 40, 12, 4, 720),
(97, 41, 6, 3, 90),
(98, 41, 7, 3, 750),
(99, 41, 3, 3, 9900),
(100, 42, 12, 5, 900),
(101, 42, 1, 4, 380),
(102, 42, 6, 5, 150),
(103, 42, 8, 2, 140),
(104, 43, 5, 5, 2950),
(105, 43, 5, 1, 590),
(106, 43, 6, 4, 120),
(107, 43, 1, 2, 190),
(108, 43, 12, 5, 900),
(109, 44, 4, 2, 640),
(110, 44, 10, 2, 500),
(111, 44, 7, 3, 750),
(112, 46, 1, 3, 285),
(113, 46, 2, 1, 2500);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `preco` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`) VALUES
(1, 'Fone de Ouvido GHR', 95),
(2, 'Notebook Oprum 25b', 2500),
(3, 'TV 55 Ktec 4K', 3300),
(4, 'Gabinete Gamer X5', 320),
(5, 'Celular KF 32GB QWQ', 590),
(6, 'Pendrive 16GB Aqtec', 30),
(7, 'Google Chromecast', 250),
(8, 'Cabo HDMI 2m', 70),
(9, 'Roteador XRS Atom', 400),
(10, 'Mouse Gamer ATX G3', 250),
(11, 'Celular XS 64GB AKA', 680),
(12, 'Fone de Ouvido Gamer XR9', 180);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cubo_pedidos`
--
ALTER TABLE `cubo_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `nome_cliente` (`nome_cliente`),
  ADD KEY `produto` (`produto`),
  ADD KEY `data` (`data`),
  ADD KEY `sexo_cliente` (`sexo_cliente`),
  ADD KEY `idade_cliente` (`idade_cliente`),
  ADD KEY `preco_atual` (`preco_atual`),
  ADD KEY `qtde_comprada` (`qtde_comprada`),
  ADD KEY `valor_pago_unidade` (`valor_pago_unidade`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `pedidos_has_produtos`
--
ALTER TABLE `pedidos_has_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_idx` (`id_pedido`),
  ADD KEY `produto_idx` (`id_produto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `cubo_pedidos`
--
ALTER TABLE `cubo_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=469;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `pedidos_has_produtos`
--
ALTER TABLE `pedidos_has_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos_has_produtos`
--
ALTER TABLE `pedidos_has_produtos`
  ADD CONSTRAINT `pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
