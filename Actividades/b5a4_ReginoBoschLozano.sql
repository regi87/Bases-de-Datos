-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para b5a4
CREATE DATABASE IF NOT EXISTS `b5a4` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `b5a4`;

-- Volcando estructura para tabla b5a4.arbitro
CREATE TABLE IF NOT EXISTS `arbitro` (
  `dni` int(11) NOT NULL,
  `nombre` char(30) COLLATE latin1_spanish_ci NOT NULL,
  `email` char(30) COLLATE latin1_spanish_ci NOT NULL,
  `habi_hotel` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_ARBITRO_pais` (`id_pais`),
  CONSTRAINT `FK_ARBITRO_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a4.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL,
  `nombre` char(30) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a4.participantes
CREATE TABLE IF NOT EXISTS `participantes` (
  `dni` int(11) NOT NULL,
  `nombre` char(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `habi_hotel` int(11) DEFAULT NULL,
  `email` char(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK__pais` (`id_pais`),
  CONSTRAINT `FK__pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a4.participantes_juegan_partidas
CREATE TABLE IF NOT EXISTS `participantes_juegan_partidas` (
  `dni` int(11) NOT NULL,
  `id_partida` int(11) NOT NULL,
  PRIMARY KEY (`dni`,`id_partida`),
  KEY `FK__partidas` (`id_partida`),
  CONSTRAINT `FK__participantes` FOREIGN KEY (`dni`) REFERENCES `participantes` (`dni`),
  CONSTRAINT `FK__partidas` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a4.partidas
CREATE TABLE IF NOT EXISTS `partidas` (
  `id_partida` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `sala_hotel` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  PRIMARY KEY (`id_partida`),
  KEY `FK_PARTIDAS_arbitro` (`dni`),
  CONSTRAINT `FK_PARTIDAS_arbitro` FOREIGN KEY (`dni`) REFERENCES `arbitro` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
