

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Animais_especies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Animais_especies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Animais_especies` DEFAULT CHARACTER SET utf8 ;
USE `Animais_especies` ;

-- -----------------------------------------------------
-- Table `Animais_especies`.`Especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Animais_especies`.`Especie` (
  `idEspecie` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(70) NOT NULL,
  `Descricao` VARCHAR(150) NULL,
  PRIMARY KEY (`idEspecie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Animais_especies`.`Animais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Animais_especies`.`Animais` (
  `idAnimais` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(75) NOT NULL,
  `Data_nasc` DATE NULL DEFAULT (CURRENT_DATE),
  `Peso` DECIMAL(6,2) NOT NULL,
  `Especie_idEspecie` INT NOT NULL,
  PRIMARY KEY (`idAnimais`, `Especie_idEspecie`),
  INDEX `fk_Animais_Especie_idx` (`Especie_idEspecie` ASC) VISIBLE,
  CONSTRAINT `fk_Animais_Especie`
    FOREIGN KEY (`Especie_idEspecie`)
    REFERENCES `Animais_especies`.`Especie` (`idEspecie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into especie (Nome, Descricao) values('Anfíbios', 'Na fase larval, os anfíbios têm respiração branquial e, portanto, são dependentes da água.');
insert into especie (Nome, Descricao) values('Aves','Únicos animais viventes a terem o corpo coberto por penas, as aves também possuem asas, ainda que nem todas possam voar.');
insert into especie (Nome, Descricao) values('Mamíferos','Caracterizados pelo fato de que as fêmeas da espécie alimentam os filhotes por meio de suas glândulas mamárias. ');
select * from especie;

insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Cachorro','2020-12-09', 15, 3);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Gato','2021-02-19', 10, 3);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Calopsita','2022-07-22', 0.4, 2);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Cacatua','2020-01-03', 0.9, 2);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Sapo','2021-12-29', 1.5, 1);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Rã','2023-04-15', 0.9, 1);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Cavalo','2019-12-01', 700, 3);
insert into animais (Nome, Data_nasc, Peso, Especie_idEspecie) value ('Papagaio','2019-12-25', 0.5, 2);
select * from animais;

SELECT animais.*, especie.nome as Especie, especie.Descricao AS Descricao
FROM animais
INNER JOIN especie ON animais.Especie_idEspecie = especie.idEspecie;