CREATE TABLE `Film` (
	`filmID` INT NOT NULL AUTO_INCREMENT,
	`naslov` varchar(255) NOT NULL,
	`uloge` varchar(255) NOT NULL,
	`zanr` varchar(50) NOT NULL,
	`reditelj` varchar(100) NOT NULL,
	`godina` INT(255) NOT NULL,
	`trajanje` varchar(20) NOT NULL,
	`opis` varchar(500) NOT NULL,
	`plakat` varchar(255) NOT NULL,
	`trailer` varchar(255) NOT NULL,
	PRIMARY KEY (`filmID`)
);

CREATE TABLE `Korisnik` (
	`korisnikID` INT NOT NULL AUTO_INCREMENT,
	`ime` varchar(50) NOT NULL,
	`prezime` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`username` varchar(20) NOT NULL UNIQUE,
	`password` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`korisnikID`)
);

CREATE TABLE `Projekcija` (
	`projekcijaID` INT NOT NULL AUTO_INCREMENT,
	`vreme` varchar(20) NOT NULL,
	`tip` varchar(30) NOT NULL,
	`datum` varchar(50) NOT NULL,
	`cena` DECIMAL(30) NOT NULL,
	`slobodnaMesta` INT(255) NOT NULL,
	`salaID` INT NOT NULL,
	`filmID` INT NOT NULL,
	PRIMARY KEY (`projekcijaID`)
);

CREATE TABLE `Sala` (
	`salaID` INT NOT NULL AUTO_INCREMENT,
	`ime` varchar(255) NOT NULL,
	`brMesta` INT(255) NOT NULL,
	PRIMARY KEY (`salaID`)
);

CREATE TABLE `Karta` (
	`kartaID` INT NOT NULL AUTO_INCREMENT,
	`datum` varchar(50) NOT NULL,
	`projekcijaID` INT NOT NULL,
	`radnikID` INT NOT NULL,
	PRIMARY KEY (`kartaID`)
);

CREATE TABLE `Radnik` (
	`radnikID` INT NOT NULL AUTO_INCREMENT,
	`ime` varchar(50) NOT NULL,
	`prezime` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL UNIQUE,
	`username` varchar(20) NOT NULL UNIQUE,
	`password` varchar(20) NOT NULL UNIQUE,
	`admin` BOOLEAN NOT NULL,
	PRIMARY KEY (`radnikID`)
);

CREATE TABLE `Rezervacija` (
	`projekcijaID` INT NOT NULL,
	`korisnikID` INT NOT NULL,
	`redMesta` INT NOT NULL,
	`brojMesta` INT NOT NULL
);

CREATE TABLE `Komentar` (
	`filmID` INT NOT NULL,
	`korisnikID` INT NOT NULL,
	`komentar` varchar(500) NOT NULL
);

ALTER TABLE `Projekcija` ADD CONSTRAINT `Projekcija_fk0` FOREIGN KEY (`salaID`) REFERENCES `Sala`(`salaID`);

ALTER TABLE `Projekcija` ADD CONSTRAINT `Projekcija_fk1` FOREIGN KEY (`filmID`) REFERENCES `Film`(`filmID`);

ALTER TABLE `Karta` ADD CONSTRAINT `Karta_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `Projekcija`(`projekcijaID`);

ALTER TABLE `Karta` ADD CONSTRAINT `Karta_fk1` FOREIGN KEY (`radnikID`) REFERENCES `Radnik`(`radnikID`);

ALTER TABLE `Rezervacija` ADD CONSTRAINT `Rezervacija_fk0` FOREIGN KEY (`projekcijaID`) REFERENCES `Projekcija`(`projekcijaID`);

ALTER TABLE `Rezervacija` ADD CONSTRAINT `Rezervacija_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `Korisnik`(`korisnikID`);

ALTER TABLE `Komentar` ADD CONSTRAINT `Komentar_fk0` FOREIGN KEY (`filmID`) REFERENCES `Film`(`filmID`);

ALTER TABLE `Komentar` ADD CONSTRAINT `Komentar_fk1` FOREIGN KEY (`korisnikID`) REFERENCES `Korisnik`(`korisnikID`);

