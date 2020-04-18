-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5931
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pris
DROP DATABASE IF EXISTS `pris`;
CREATE DATABASE IF NOT EXISTS `pris` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pris`;

-- Dumping structure for table pris.film
DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `filmID` int NOT NULL AUTO_INCREMENT,
  `naslov` varchar(255) NOT NULL,
  `uloge` varchar(255) NOT NULL,
  `zanr` varchar(50) NOT NULL,
  `reditelj` varchar(100) NOT NULL,
  `godina` int NOT NULL,
  `trajanje` varchar(20) NOT NULL,
  `opis` varchar(500) NOT NULL,
  `plakat` varchar(255) NOT NULL,
  `trailer` varchar(255) NOT NULL,
  PRIMARY KEY (`filmID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.film: ~2 rows (approximately)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`filmID`, `naslov`, `uloge`, `zanr`, `reditelj`, `godina`, `trajanje`, `opis`, `plakat`, `trailer`) VALUES
	(1, 'I Am Legend', 'Will Smith, Alice Braga, Charlie Tahan', 'Avantura, Drama, Naucna fantastika', 'Francis Lawrence', 2007, '1h 41min', 'Neobjašnjivo imun na virus, Nevil je poslednji preživeli čovek u razrušenom Njujorku, a možda i u celom svetu. Već tri godine Nevil svakodnevno šalje radio poruke, očajnički pokušavajući da pronađe ostale preživele. Ali nije sam. Nevila, možda još jedinu i najveću nadu za spas čovečanstva, pokreće samo jedna poslednja misija: da pronađe način da poništi virus pomoću sopstvene imune krvi.', 'https://16707student.files.wordpress.com/2014/11/i_am_legend_ver_0484c083912_original.jpg', 'https://www.youtube.com/watch?v=dtKMEAXyPkg'),
	(2, 'Tenet', 'John David Washington, Robert Pattinson, Elizabeth Debicki, Himesh Patel', 'Akcija, Triler', 'Christopher Nolan', 2020, '2h', 'Reč je o vrlo očekivanom i vrlo tajnovitom novom akcijskom filmu pisca i redatelja Christophera Nolana (Inception, Interstellar, Dunkirk, Batman Trilogija).', 'https://i.imgur.com/xopnR48.jpg', 'https://www.youtube.com/watch?v=LdOM0x0XDMo');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dumping structure for table pris.karta
DROP TABLE IF EXISTS `karta`;
CREATE TABLE IF NOT EXISTS `karta` (
  `kartaID` int NOT NULL AUTO_INCREMENT,
  `datum` varchar(50) NOT NULL,
  `projekcijaID` int NOT NULL,
  `radnikID` int NOT NULL,
  PRIMARY KEY (`kartaID`),
  KEY `Karta_fk0` (`projekcijaID`),
  KEY `Karta_fk1` (`radnikID`),
  CONSTRAINT `Karta_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `projekcija` (`projekcijaID`),
  CONSTRAINT `Karta_fk1` FOREIGN KEY (`radnikID`) REFERENCES `radnik` (`radnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.karta: ~0 rows (approximately)
/*!40000 ALTER TABLE `karta` DISABLE KEYS */;
/*!40000 ALTER TABLE `karta` ENABLE KEYS */;

-- Dumping structure for table pris.komentar
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE IF NOT EXISTS `komentar` (
  `komentarID` int NOT NULL AUTO_INCREMENT,
  `filmID` int NOT NULL,
  `korisnikID` int NOT NULL,
  `komentar` varchar(500) NOT NULL,
  `ocena` int NOT NULL,
  PRIMARY KEY (`komentarID`),
  KEY `Komentar_fk0` (`filmID`),
  KEY `Komentar_fk1` (`korisnikID`),
  CONSTRAINT `Komentar_fk0` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  CONSTRAINT `Komentar_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.komentar: ~0 rows (approximately)
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;

-- Dumping structure for table pris.korisnik
DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `korisnikID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`korisnikID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.korisnik: ~0 rows (approximately)
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;

-- Dumping structure for table pris.mesta
DROP TABLE IF EXISTS `mesta`;
CREATE TABLE IF NOT EXISTS `mesta` (
  `mestoID` int NOT NULL AUTO_INCREMENT,
  `redMesta` int NOT NULL,
  `brojMesta` int NOT NULL,
  PRIMARY KEY (`mestoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.mesta: ~0 rows (approximately)
/*!40000 ALTER TABLE `mesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesta` ENABLE KEYS */;

-- Dumping structure for table pris.projekcija
DROP TABLE IF EXISTS `projekcija`;
CREATE TABLE IF NOT EXISTS `projekcija` (
  `projekcijaID` int NOT NULL AUTO_INCREMENT,
  `vreme` varchar(20) NOT NULL,
  `datum` date NOT NULL,
  `slobodnaMesta` int NOT NULL,
  `salaID` int NOT NULL,
  `filmID` int NOT NULL,
  `sifarnikID` int NOT NULL,
  PRIMARY KEY (`projekcijaID`),
  KEY `Projekcija_fk0` (`salaID`),
  KEY `Projekcija_fk1` (`filmID`),
  KEY `Projekcija_fk2` (`sifarnikID`),
  CONSTRAINT `Projekcija_fk0` FOREIGN KEY (`salaID`) REFERENCES `sala` (`salaID`),
  CONSTRAINT `Projekcija_fk1` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  CONSTRAINT `Projekcija_fk2` FOREIGN KEY (`sifarnikID`) REFERENCES `sifarnik` (`sifarnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.projekcija: ~3 rows (approximately)
/*!40000 ALTER TABLE `projekcija` DISABLE KEYS */;
INSERT INTO `projekcija` (`projekcijaID`, `vreme`, `datum`, `slobodnaMesta`, `salaID`, `filmID`, `sifarnikID`) VALUES
	(1, '20:00', '2020-07-16', 440, 1, 2, 1),
	(2, '21:00', '2020-07-16', 163, 3, 1, 3),
	(3, '20:00', '2020-07-17', 440, 1, 2, 2);
/*!40000 ALTER TABLE `projekcija` ENABLE KEYS */;

-- Dumping structure for table pris.radnik
DROP TABLE IF EXISTS `radnik`;
CREATE TABLE IF NOT EXISTS `radnik` (
  `radnikID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`radnikID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.radnik: ~0 rows (approximately)
/*!40000 ALTER TABLE `radnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `radnik` ENABLE KEYS */;

-- Dumping structure for table pris.rezervacija
DROP TABLE IF EXISTS `rezervacija`;
CREATE TABLE IF NOT EXISTS `rezervacija` (
  `rezervacijaID` int NOT NULL AUTO_INCREMENT,
  `projekcijaID` int NOT NULL,
  `korisnikID` int NOT NULL,
  `mestoID` int NOT NULL,
  `brUlaznica` int NOT NULL,
  PRIMARY KEY (`rezervacijaID`),
  KEY `Rezervacija_fk0` (`projekcijaID`),
  KEY `Rezervacija_fk1` (`korisnikID`),
  KEY `Rezervacija_fk2` (`mestoID`),
  CONSTRAINT `Rezervacija_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `projekcija` (`projekcijaID`),
  CONSTRAINT `Rezervacija_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`),
  CONSTRAINT `Rezervacija_fk2` FOREIGN KEY (`mestoID`) REFERENCES `mesta` (`mestoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.rezervacija: ~0 rows (approximately)
/*!40000 ALTER TABLE `rezervacija` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezervacija` ENABLE KEYS */;

-- Dumping structure for table pris.sala
DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `salaID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `brMesta` int NOT NULL,
  PRIMARY KEY (`salaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.sala: ~6 rows (approximately)
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` (`salaID`, `ime`, `brMesta`) VALUES
	(1, 'Don Vito Korleone', 440),
	(2, 'Jack Torrence', 71),
	(3, 'John McClane', 163),
	(4, 'Joker', 71),
	(5, 'Amélie', 163),
	(6, 'Mulan', 71);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;

-- Dumping structure for table pris.sifarnik
DROP TABLE IF EXISTS `sifarnik`;
CREATE TABLE IF NOT EXISTS `sifarnik` (
  `sifarnikID` int NOT NULL AUTO_INCREMENT,
  `tip` varchar(30) NOT NULL,
  `cena` decimal(30,0) NOT NULL,
  PRIMARY KEY (`sifarnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.sifarnik: ~3 rows (approximately)
/*!40000 ALTER TABLE `sifarnik` DISABLE KEYS */;
INSERT INTO `sifarnik` (`sifarnikID`, `tip`, `cena`) VALUES
	(1, 'pretpremijera', 550),
	(2, 'premijera', 470),
	(3, 'standardna', 350);
/*!40000 ALTER TABLE `sifarnik` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
