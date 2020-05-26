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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.film: ~8 rows (approximately)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`filmID`, `naslov`, `uloge`, `zanr`, `reditelj`, `godina`, `trajanje`, `opis`, `plakat`, `trailer`) VALUES
	(1, 'I Am Legend', 'Will Smith, Alice Braga, Charlie Tahan', 'Avantura, Drama, Naucna fantastika', 'Francis Lawrence', 2007, '1h 41min', 'Neobjasnjivo imun na virus, Nevil je poslednji preziveli covek u razrusenom Njujorku, a mozda i u celom svetu. Vec tri godine Nevil svakodnevno salje radio poruke, ocajnicki pokusavajuci da pronadje ostale prezivele. Ali nije sam. Nevila, mozda jos jedinu i najvecu nadu za spas covecanstva, pokrece samo jedna poslednja misija: da pronadje nacin da ponisti virus pomocu sopstvene imune krvi.', 'https://16707student.files.wordpress.com/2014/11/i_am_legend_ver_0484c083912_original.jpg', 'https://www.youtube.com/embed/dtKMEAXyPkg'),
	(2, 'Tenet', 'John David Washington, Robert Pattinson, Elizabeth Debicki, Himesh Patel', 'Akcija, Triler', 'Christopher Nolan', 2020, '2h', 'Rec je o vrlo ocekivanom i vrlo tajnovitom novom akcijskom filmu pisca i redatelja Christophera Nolana (Inception, Interstellar, Dunkirk, Batman Trilogija).', 'https://i.imgur.com/xopnR48.jpg', 'https://www.youtube.com/embed/LdOM0x0XDMo'),
	(3, '12 Angry Men', 'Henry Fonda, Lee J. Cobb, Martin Balsam', 'Drama', 'Sidney Lumet', 1957, '1h 36min', '12 gnevnih ljudi (eng. 12 Angry Men) je film Sidneyja Lumeta iz 1957. temeljen na istoimenoj drami o članu porote koji mora uveriti ostalih 11 članova kako moraju osloboditi osumnjičenog na temelju opravdane sumnje. Film je poznat jer je za snimanje korištena samo jedna prostorija (soba za porotnike), izuzev kratkog prikaza sudnice i toaleta.', 'https://upload.wikimedia.org/wikipedia/commons/b/b5/12_Angry_Men_%281957_film_poster%29.jpg', 'https://www.youtube.com/embed/_13J_9B5jEk'),
	(4, 'The Godfather', 'Marlon Brando, Al Pacino, James Caan', 'Krimi, Drama', 'Francis Ford Coppola', 1972, '2h 55min', 'Kriminalisticka drama Francis-a Ford-a Coppol-e utemeljena na istoimenom romanu Maria Puza. Radnja filma proteze se na deset godina od kraja 1945. do 1955. i predstavlja hronologiju mafijaske familije Corleone.', 'https://i.imgur.com/f4FPQLO.jpg', 'https://www.youtube.com/embed/sY1S34973zA'),
	(5, 'Shrek', 'Mike Myers, Eddie Murphy, Cameron Diaz', 'Animirani, Avantura, Komedija', 'Andrew Adamson, Vicky Jenson', 2001, '1h 30m', 'Dobar film.', 'https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY1200_CR88,0,630,1200_AL_.jpg', 'https://www.youtube.com/embed/CwXOrWvPBPk'),
	(6, 'Shrek 2', 'Mike Myers, Eddie Murphy, Cameron Diaz', 'Animirani, Avantura, Komedija', 'Andrew Adamson, Kelly Asbury', 2004, '1h 33min', 'Nastavak filma Srek iz 2001. godine.', 'https://upload.wikimedia.org/wikipedia/sr/b/b9/Shrek_2_poster.jpg', 'https://www.youtube.com/embed/V6X5ti4YlG8'),
	(7, 'Once Upon a Time in Hollywood', ' Leonardo DiCaprio, Brad Pitt, Margot Robbie', 'Komedija, Drama', 'Quentin Tarantino', 2019, '2h 40min', 'Radnja je smestena u Los Andjeles 1969. godine, u sam bum hipi Holivuda. Glavni junaci su Rik Dalton (Leonardo DiCaprio), bivsa zvezda popularnog televizijskog vesterna, bez samopouzdanja i sa alkoholicarskim navikama, kome karijera ide silaznom putanjom i Klif But (Brad Pitt), njegov dugogodisnji kaskader i asistent.', 'https://m.media-amazon.com/images/M/MV5BOTg4ZTNkZmUtMzNlZi00YmFjLTk1MmUtNWQwNTM0YjcyNTNkXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_UY1200_CR90,0,630,1200_AL_.jpg', 'https://www.youtube.com/embed/ELeMaP8EPAA'),
	(8, 'The Shawshank Redemption', 'Tim Robbins, Morgan Freeman, Bob Gunton ', 'Drama', 'Frank Darabont', 1994, '2h 22min', 'Bekstvo iz Sosenka prati zivot mladog bankara Endija Dufresnija (Tim Robbins) koji je osudjen na dozivotnu robiju zbog ubistva svoje zene i njenog ljubavnika, uprkos tome sto on tvrdi da nije upleten u zlocin.', 'https://images-na.ssl-images-amazon.com/images/I/416WKnrpx5L._AC_.jpg', 'https://www.youtube.com/embed/4uu-eWVhj3M');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Dumping structure for table pris.karta
DROP TABLE IF EXISTS `karta`;
CREATE TABLE IF NOT EXISTS `karta` (
  `kartaID` int NOT NULL AUTO_INCREMENT,
  `datum` varchar(50) NOT NULL,
  `projekcijaID` int NOT NULL,
  `korisnikID` int NOT NULL,
  `cena` double DEFAULT NULL,
  PRIMARY KEY (`kartaID`),
  KEY `Karta_fk0` (`projekcijaID`),
  KEY `Karta_fk1` (`korisnikID`),
  CONSTRAINT `Karta_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `projekcija` (`projekcijaID`),
  CONSTRAINT `Karta_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.karta: ~5 rows (approximately)
/*!40000 ALTER TABLE `karta` DISABLE KEYS */;
INSERT INTO `karta` (`kartaID`, `datum`, `projekcijaID`, `korisnikID`, `cena`) VALUES
	(38, '2020-05-26', 36, 7, 550),
	(39, '2020-05-26', 36, 7, 550),
	(40, '2020-05-26', 38, 7, 350),
	(41, '2020-05-26', 38, 7, 350),
	(42, '2020-05-26', 38, 7, 350),
	(43, '2020-05-26', 41, 8, 350),
	(44, '2020-05-26', 41, 8, 350),
	(45, '2020-05-26', 45, 8, 350),
	(46, '2020-05-26', 45, 8, 350),
	(47, '2020-05-26', 45, 8, 350);
/*!40000 ALTER TABLE `karta` ENABLE KEYS */;

-- Dumping structure for table pris.komentar
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE IF NOT EXISTS `komentar` (
  `komentarID` int NOT NULL AUTO_INCREMENT,
  `filmID` int NOT NULL,
  `korisnikID` int NOT NULL,
  `komentar` varchar(500) DEFAULT NULL,
  `datumKom` varchar(255) DEFAULT NULL,
  `ocena` int DEFAULT NULL,
  `datumOc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`komentarID`),
  KEY `Komentar_fk0` (`filmID`),
  KEY `Komentar_fk1` (`korisnikID`),
  CONSTRAINT `Komentar_fk0` FOREIGN KEY (`filmID`) REFERENCES `film` (`filmID`),
  CONSTRAINT `Komentar_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.komentar: ~10 rows (approximately)
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` (`komentarID`, `filmID`, `korisnikID`, `komentar`, `datumKom`, `ocena`, `datumOc`) VALUES
	(11, 1, 1, 'Sjajan!', '2020-05-26', 5, '2020-05-26'),
	(12, 5, 1, 'OK', '2020-05-26', 5, '2020-05-26'),
	(13, 5, 1, NULL, NULL, 5, '2020-05-26'),
	(14, 6, 1, 'Livin\' la vida loca!', '2020-05-26', 4, '2020-05-26'),
	(15, 2, 1, 'Jedva cekam!', '2020-05-26', 0, NULL),
	(16, 3, 6, NULL, NULL, 5, '2020-05-26'),
	(17, 7, 6, 'Neocekivani preokret!', '2020-05-26', 5, '2020-05-26'),
	(18, 6, 6, NULL, NULL, 3, '2020-05-26'),
	(19, 8, 6, '"Brooks was here"', '2020-05-26', 5, '2020-05-26'),
	(20, 1, 6, NULL, NULL, 3, '2020-05-26'),
	(21, 5, 10, NULL, NULL, 4, '2020-05-26'),
	(22, 4, 10, NULL, NULL, 2, '2020-05-26'),
	(23, 3, 10, NULL, NULL, 4, '2020-05-26'),
	(24, 7, 9, 'Ocekivao sam vise...', '2020-05-26', 3, '2020-05-26'),
	(25, 5, 9, 'NAJBOLJI IKAD!', '2020-05-26', 5, '2020-05-26'),
	(26, 8, 9, NULL, NULL, 3, '2020-05-26'),
	(27, 8, 10, NULL, NULL, 5, '2020-05-26'),
	(28, 8, 1, '"So was Red"', '2020-05-26', 5, '2020-05-26');
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;

-- Dumping structure for table pris.korisnik
DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `korisnikID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ulogaIdD` int NOT NULL,
  PRIMARY KEY (`korisnikID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `Korisnik_fk0` (`ulogaIdD`),
  CONSTRAINT `Korisnik_fk0` FOREIGN KEY (`ulogaIdD`) REFERENCES `uloga` (`ulogaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.korisnik: ~5 rows (approximately)
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` (`korisnikID`, `ime`, `prezime`, `email`, `username`, `password`, `ulogaIdD`) VALUES
	(1, 'Ivana', 'Stojanovic', 'is@gmail.com', 'ivana', '$2a$10$/EE2b2GWNjE.6GBy5Oq53evIgf3Lt4CuJTSSGAR3uR1O3gvGFGNVm', 3),
	(2, 'Admin', 'Adminovic', 'admin@gmail.com', 'admin', '$2a$10$TsFLeqYzZJf2nbQhL190jO8qVzOh9kwrIa5elnI9Yx25dIs7F6oL2', 1),
	(6, 'Aleksandra', 'Romanic', 'aleksandra@gmail.com', 'aleksandra', '$2a$10$VAFyDbZUSScFhFS6MQWWnuM3RPcd5tGv9lrhI6hE8ejcYs10fcVKC', 3),
	(7, 'Marko', 'Djordjevic', 'marko@gmail.com', 'MarkoDjordjevic', '$2a$10$XWZMLaSpZybsfJdHPPxEdeirQKMig32TP.j7bg8xsfqeal6lFcBti', 2),
	(8, 'Zivka', 'Rasel', 'dzekrasel@gmail.com', 'ZivkaRasel', '$2a$10$aKN1/GBmuC7TR2E5/2WpL.n1BCfp4qgt.iusJhmMOEWL.XiZKDZVm', 2),
	(9, 'Petar', 'Milinkov', 'pera@gmail.com', 'pera', '$2a$10$FWi/jAUOAYcK4RNcPRj7nun8Zb5mxZzjBAOiLAtQ7BaBYZl9WntUK', 3),
	(10, 'Vanja', 'Vulinovic', 'vanja@gmail.com', 'vanja', '$2a$10$uw/yh..YBtN4vw46dquq5uh.3bDyGEFMZMjndDVqkJUpwmkjDlN92', 3);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;

-- Dumping structure for table pris.mesta
DROP TABLE IF EXISTS `mesta`;
CREATE TABLE IF NOT EXISTS `mesta` (
  `mestoID` int NOT NULL AUTO_INCREMENT,
  `redMesta` int NOT NULL,
  `brojMesta` int NOT NULL,
  `rezervacijaID` int NOT NULL,
  PRIMARY KEY (`mestoID`),
  KEY `Mesta_fk0` (`rezervacijaID`),
  CONSTRAINT `Mesta_fk0` FOREIGN KEY (`rezervacijaID`) REFERENCES `rezervacija` (`rezervacijaID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.mesta: ~7 rows (approximately)
/*!40000 ALTER TABLE `mesta` DISABLE KEYS */;
INSERT INTO `mesta` (`mestoID`, `redMesta`, `brojMesta`, `rezervacijaID`) VALUES
	(42, 12, 10, 21),
	(43, 12, 11, 21),
	(44, 10, 7, 22),
	(45, 10, 8, 22),
	(46, 10, 9, 22),
	(47, 7, 7, 23),
	(48, 7, 8, 23),
	(49, 9, 2, 24),
	(50, 9, 3, 24),
	(51, 1, 3, 25),
	(52, 1, 4, 25),
	(53, 6, 4, 26),
	(54, 6, 5, 26),
	(55, 6, 6, 26),
	(56, 4, 5, 27),
	(57, 4, 6, 27),
	(58, 6, 5, 28),
	(59, 6, 6, 28),
	(60, 14, 12, 29),
	(61, 14, 13, 29),
	(62, 14, 14, 29);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.projekcija: ~33 rows (approximately)
/*!40000 ALTER TABLE `projekcija` DISABLE KEYS */;
INSERT INTO `projekcija` (`projekcijaID`, `vreme`, `datum`, `slobodnaMesta`, `salaID`, `filmID`, `sifarnikID`) VALUES
	(34, '20:00', '2020-05-27', 67, 2, 1, 3),
	(35, '20:00', '2020-05-28', 70, 2, 1, 3),
	(36, '20:00', '2020-05-30', 438, 1, 2, 1),
	(37, '20:00', '2020-05-31', 440, 1, 2, 2),
	(38, '20:00', '2020-06-01', 437, 1, 2, 3),
	(39, '19:00', '2020-05-29', 68, 4, 3, 3),
	(40, '20:30', '2020-06-02', 440, 1, 4, 3),
	(41, '16:00', '2020-05-28', 68, 6, 5, 3),
	(42, '18:00', '2020-05-28', 70, 6, 6, 3),
	(43, '16:00', '2020-05-29', 70, 6, 5, 3),
	(44, '18:00', '2020-05-29', 66, 6, 6, 3),
	(45, '20:30', '2020-06-01', 155, 5, 7, 3),
	(46, '18:00', '2020-05-29', 160, 5, 7, 3),
	(47, '20:00', '2020-05-31', 70, 4, 8, 3);
/*!40000 ALTER TABLE `projekcija` ENABLE KEYS */;

-- Dumping structure for table pris.rezervacija
DROP TABLE IF EXISTS `rezervacija`;
CREATE TABLE IF NOT EXISTS `rezervacija` (
  `rezervacijaID` int NOT NULL AUTO_INCREMENT,
  `projekcijaID` int NOT NULL,
  `korisnikID` int NOT NULL,
  `brUlaznica` int NOT NULL,
  PRIMARY KEY (`rezervacijaID`),
  KEY `Rezervacija_fk0` (`projekcijaID`),
  KEY `Rezervacija_fk1` (`korisnikID`),
  CONSTRAINT `Rezervacija_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `projekcija` (`projekcijaID`),
  CONSTRAINT `Rezervacija_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `korisnik` (`korisnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.rezervacija: ~3 rows (approximately)
/*!40000 ALTER TABLE `rezervacija` DISABLE KEYS */;
INSERT INTO `rezervacija` (`rezervacijaID`, `projekcijaID`, `korisnikID`, `brUlaznica`) VALUES
	(21, 36, 1, 2),
	(22, 45, 1, 3),
	(23, 39, 6, 2),
	(24, 45, 6, 2),
	(25, 44, 10, 2),
	(26, 34, 10, 3),
	(27, 41, 9, 2),
	(28, 44, 9, 2),
	(29, 38, 7, 3);
/*!40000 ALTER TABLE `rezervacija` ENABLE KEYS */;

-- Dumping structure for table pris.sala
DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `salaID` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `brMesta` int NOT NULL,
  PRIMARY KEY (`salaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.sala: ~0 rows (approximately)
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` (`salaID`, `ime`, `brMesta`) VALUES
	(1, 'Don Vito Korleone', 440),
	(2, 'Jack Torrence', 70),
	(3, 'John McClane', 160),
	(4, 'Joker', 70),
	(5, 'Amélie', 160),
	(6, 'Mulan', 70);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;

-- Dumping structure for table pris.sifarnik
DROP TABLE IF EXISTS `sifarnik`;
CREATE TABLE IF NOT EXISTS `sifarnik` (
  `sifarnikID` int NOT NULL AUTO_INCREMENT,
  `tip` varchar(30) NOT NULL,
  `cena` decimal(30,0) NOT NULL,
  PRIMARY KEY (`sifarnikID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pris.sifarnik: ~0 rows (approximately)
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

-- Dumping data for table pris.uloga: ~0 rows (approximately)
/*!40000 ALTER TABLE `uloga` DISABLE KEYS */;
INSERT INTO `uloga` (`ulogaID`, `imeUloge`) VALUES
	(1, 'ADMIN'),
	(3, 'KORISNIK'),
	(2, 'RADNIK');
/*!40000 ALTER TABLE `uloga` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
