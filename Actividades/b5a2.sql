-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para b5a2
CREATE DATABASE IF NOT EXISTS `b5a2` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `b5a2`;

-- Volcando estructura para tabla b5a2.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `id` int(11) NOT NULL,
  `nombre` char(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a2.actor_pelicula
CREATE TABLE IF NOT EXISTS `actor_pelicula` (
  `id_actor` int(11) NOT NULL,
  `peli` char(30) COLLATE latin1_spanish_ci NOT NULL,
  `sueldo` char(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_actor`,`peli`),
  KEY `FK_actor_pelicula_pelicula` (`peli`),
  CONSTRAINT `FK_actor_pelicula_actor` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`),
  CONSTRAINT `FK_actor_pelicula_pelicula` FOREIGN KEY (`peli`) REFERENCES `pelicula` (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a2.estudio
CREATE TABLE IF NOT EXISTS `estudio` (
  `nombre` char(50) COLLATE latin1_spanish_ci NOT NULL,
  `direccion` char(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a2.pelicula
CREATE TABLE IF NOT EXISTS `pelicula` (
  `titulo` char(30) COLLATE latin1_spanish_ci NOT NULL,
  `año` date NOT NULL,
  `estudio` char(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`titulo`),
  KEY `FK_Pelicula_estudio` (`estudio`),
  CONSTRAINT `FK_Pelicula_estudio` FOREIGN KEY (`estudio`) REFERENCES `estudio` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla b5a2.telefono_actor
CREATE TABLE IF NOT EXISTS `telefono_actor` (
  `id_actor` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`id_actor`,`telefono`),
  CONSTRAINT `FK__actor` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
