-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
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
	(1, 'I Am Legend', 'Will Smith, Alice Braga, Charlie Tahan', 'Avantura, Drama, Naucna fantastika', 'Francis Lawrence', 2007, '1h 41min', 'Neobjašnjivo imun na virus, Nevil je poslednji preživeli čovek u razrušenom Njujorku, a možda i u celom svetu. Već tri godine Nevil svakodnevno šalje radio poruke, očajnički pokušavajući da pronađe ostale preživele. Ali nije sam. Nevila, možda još jedinu i najveću nadu za spas čovečanstva, pokreće samo jedna poslednja misija: da pronađe način da poništi virus pomoću sopstvene imune krvi.', 'https://16707student.files.wordpress.com/2014/11/i_am_legend_ver_0484c083912_original.jpg', 'https://www.youtube.com/embed/dtKMEAXyPkg'),
	(2, 'Tenet', 'John David Washington, Robert Pattinson, Elizabeth Debicki, Himesh Patel', 'Akcija, Triler', 'Christopher Nolan', 2020, '2h', 'Reč je o vrlo očekivanom i vrlo tajnovitom novom akcijskom filmu pisca i redatelja Christophera Nolana (Inception, Interstellar, Dunkirk, Batman Trilogija).', 'https://i.imgur.com/xopnR48.jpg', 'https://www.youtube.com/embed/LdOM0x0XDMo');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dumping structure for table pris.karta
DROP TABLE IF EXISTS `karta`;
CREATE TABLE IF NOT EXISTS `karta` (
  `kartaID` int NOT NULL AUTO_INCREMENT,
  `datum` varchar(50) NOT NULL,
  `projekcijaID` int NOT NULL,
  `korisnikID` int NOT NULL,
  PRIMARY KEY (`kartaID`),
  KEY `Karta_fk0` (`projekcijaID`),
  KEY `Karta_fk1` (`korisnikID`),
  CONSTRAINT `Karta_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `projekcija` (`projekcijaID`),
  CONSTRAINT `Karta_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`)
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
  `komentar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `datumKom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `datumOc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ocena` int DEFAULT NULL,
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
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ulogaID` int NOT NULL,
  PRIMARY KEY (`korisnikID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `Korisnik_fk0` (`ulogaID`),
  CONSTRAINT `Korisnik_fk0` FOREIGN KEY (`ulogaID`) REFERENCES `uloga` (`ulogaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.korisnik: ~1 rows (approximately)
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` (`korisnikID`, `ime`, `prezime`, `email`, `username`, `password`, `ulogaID`) VALUES
	(1, 'Admin', 'Adminovic', 'admin@gmail.com', 'admin', '12345678', 1),
	(2, 'Vanja', 'Vulinovic', 'vanja@gmail.com', 'vanja', '12345678', 3),
	(3, 'Aleksandra', 'Romanic', 'aleksandra@gmail.com', 'aleksandra', '12345678', 3),
	(4, 'Petar', 'Milinkov', 'pera@gmail.com', 'pera', '12345678', 3),
	(5, 'Ivana', 'Stojanovic', 'ivana@gmail.com', 'ivana', '12345678', 3),
	(6, 'Radnik', 'Radovic', 'radnik@gmail.com', 'radnik', '12345678', 2);
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
  `datum` varchar(50) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.projekcija: ~3 rows (approximately)
/*!40000 ALTER TABLE `projekcija` DISABLE KEYS */;
INSERT INTO `projekcija` (`projekcijaID`, `vreme`, `datum`, `slobodnaMesta`, `salaID`, `filmID`, `sifarnikID`) VALUES
	(1, '20:00', '2020-07-16', 440, 1, 2, 1),
	(2, '21:00', '2020-07-16', 163, 3, 1, 3),
	(3, '20:00', '2020-07-17', 440, 1, 2, 2),
	(4, '20:00', '2020-05-07', 440, 1, 2, 1),
	(5, '20:00', '2020-05-04', 440, 1, 2, 1),
	(6, '21:00', '2020-05-04', 440, 1, 1, 2),
	(7, '19:00', '2020-05-05', 163, 3, 1, 2),
	(8, '20:00', '2020-05-05', 440, 1, 2, 2),
	(9, '22:00', '2020-05-07', 163, 3, 1, 2),
	(10, '20:00', '2020-05-08', 440, 1, 2, 3);
/*!40000 ALTER TABLE `projekcija` ENABLE KEYS */;

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

-- Dumping structure for table pris.uloga
DROP TABLE IF EXISTS `uloga`;
CREATE TABLE IF NOT EXISTS `uloga` (
  `ulogaID` int NOT NULL AUTO_INCREMENT,
  `imeUloge` varchar(50) NOT NULL,
  PRIMARY KEY (`ulogaID`),
  UNIQUE KEY `imeUloge` (`imeUloge`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.uloga: ~3 rows (approximately)
/*!40000 ALTER TABLE `uloga` DISABLE KEYS */;
INSERT INTO `uloga` (`ulogaID`, `imeUloge`) VALUES
	(1, 'ADMIN'),
	(3, 'KORISNIK'),
	(2, 'RADNIK');
/*!40000 ALTER TABLE `uloga` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
