

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema produto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema produto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `produto` DEFAULT CHARACTER SET utf8 ;
USE `produto` ;

-- -----------------------------------------------------
-- Table `produto`.`Marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produto`.`Marcas` (
  `idMarcas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `site` VARCHAR(100) NULL,
  PRIMARY KEY (`idMarcas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produto`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produto`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `preco_custo` DECIMAL(6,2) NOT NULL,
  `preco_venda` DECIMAL(6,2) NULL,
  `data_validade` DATE NOT NULL,
  `Marcas_idMarcas` INT NOT NULL,
  PRIMARY KEY (`idProdutos`, `Marcas_idMarcas`),
  INDEX `fk_Produtos_Marcas_idx` (`Marcas_idMarcas` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_Marcas`
    FOREIGN KEY (`Marcas_idMarcas`)
    REFERENCES `produto`.`Marcas` (`idMarcas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produto`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `produto`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(45) NULL,
  `Marcas_idMarcas` INT NOT NULL,
  PRIMARY KEY (`idTelefone`, `Marcas_idMarcas`),
  INDEX `fk_Telefone_Marcas1_idx` (`Marcas_idMarcas` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Marcas1`
    FOREIGN KEY (`Marcas_idMarcas`)
    REFERENCES `produto`.`Marcas` (`idMarcas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into marcas (nome,site) values('Coca-cola', 'www.coca-cola.com.br' );
insert into marcas (nome,site) values('Elma-Chips', 'www.ElmaChips.com.br' );
insert into marcas (nome,site) values('Ana Maria', 'www.AnaMaria.com.br' );


insert into telefone (telefone,Marcas_idMarcas) values ('(11)95070-3137', 1);
insert into telefone (telefone,Marcas_idMarcas) values ('(11)93045-2825', 2);
insert into telefone (telefone,Marcas_idMarcas) values ('(11)99805-1987', 3);
insert into telefone (telefone,Marcas_idMarcas) values ('(11)4712-8989', 1);

insert into produtos values(null, 'refrigerante de cola 350ml', 1.00, 2.50, '2023-09-21', 1);
insert into produtos values(null, 'refrigerante de cola zero 350ml', 1.50, 3.25,'2023-07-10', 1);
insert into produtos values(null, 'bolo de chocolate', 3.25, 6.50, '2023-11-13', 3);
insert into produtos values(null, 'bolo de cenoura', 3.50, 6.90, '2023-11-21', 3);
insert into produtos values(null, 'bolo de baunilha', 2.50, 4.00, '2023-10-30', 3);
insert into produtos values(null, 'Cheetos parmesão', 3.00, 9.00, '2023-12-23', 2);
insert into produtos values(null, 'Fandangos Presunto', 2.50, 7.00, '2023-12-30', 2);
insert into produtos values(null, 'Doritos', 4.00, 9.50, '2023-11-21', 2);

SELECT produtos.nome, produtos.preco_custo, produtos.preco_venda, produtos.data_validade, marcas.nome AS nome_marca, marcas.site AS site_marca, GROUP_CONCAT(telefone.telefone) AS telefones_marca
FROM produtos
INNER JOIN marcas ON produtos.Marcas_idMarcas = marcas.idMarcas
INNER JOIN telefone ON marcas.idMarcas = telefone.Marcas_idMarcas
GROUP BY produtos.nome, produtos.preco_custo, produtos.preco_venda, produtos.data_validade, marcas.nome, marcas.site;