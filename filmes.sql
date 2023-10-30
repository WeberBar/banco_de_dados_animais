
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Filmes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Filmes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Filmes` DEFAULT CHARACTER SET utf8 ;
USE `Filmes` ;

-- -----------------------------------------------------
-- Table `Filmes`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Filmes`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `publico_alvo` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Filmes`.`Filmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Filmes`.`Filmes` (
  `idFilmes` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(80) NULL,
  `Sinopse` VARCHAR(400) NULL,
  `Estudio` VARCHAR(45) NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idFilmes`, `Categoria_idCategoria`),
  INDEX `fk_Filmes_Categoria_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Filmes_Categoria`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `Filmes`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into categoria(nome, publico_alvo) values ('Terror', 'Adolescente/Adulto');
insert into categoria(nome, publico_alvo) values ('Comedia', 'Infantil/Adolescente/Adulto');
insert into categoria(nome, publico_alvo) values ('Romance', 'Adolescente/Adulto');

select * from filmes;

insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('IT - a coisa', 'Em It - A Coisa, um grupo de sete adolescentes de Derry, uma cidade no Maine, formam o auto-intitulado "Losers Club" - o clube dos perdedores. A pacata rotina da cidade é abalada quando crianças começam a desaparecer e tudo o que pode ser encontrado delas são partes de seus corpos.','NewLine Cinema', 1);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('Sexta-feira 13', 'Clay (Jared Padalecki) vai à misteriosa floresta de Crystal Lake, em busca de sua irmã desaparecida. Lá ele encontra restos de velhas cabanas, aparentemente abandonadas. Apesar de ser avisado pelos oficiais e habitantes locais, ele resolve explorar o local juntamente com uma jovem, que está em um grupo que se formou para passar um final de semana de aventuras. ','Warner Bros', 1);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('A freira', 'Fazendo parte da franquia Invocação do Mal, em A Freira, após uma irmã cometer suicídio em um convento na Romênia, o Vaticano envia um padre atormentado e uma noviça para investigar o ocorrido.','NewLine cinema', 1);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('Se beber não case', 'Doug Billings (Justin Bartha) está prestes a se casar. Stu Price (Ed Helms), um dentista que planeja pedir a namorada em casamento, Phil Wenneck (Bradley Cooper), um professor colegial entediado com o matrimônio, e Alan Garner (Zach Galifianakis), seu futuro cunhado, são seus melhores amigos. ','Warner Bros', 2);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('As branquelas', 'Em As Branquelas, os irmãos Marcus (Marlon Wayans) e Kevin Copeland (Shawn Wayans) são detetives do FBI que estão com problemas no trabalho. A última investigação da dupla foi um grande fracasso e eles estão sob a ameaça de serem demitidos.','Columbia Pictures', 2);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('Jackass Para Sempre','Celebrando a alegria de estar de volta junto a seus melhores amigos e a um tiro certeiro nas partes baixas, o elenco original de "Jackass" retorna para mais uma rodada de comédia selvagem, absurda e muitas vezes perigosa, e com novos participantes.', 'Paramount Pictures', 2);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('Ghost - Do Outro Lado da Vida', 'Em Ghost - Do Outro Lado da Vida, Sam Wheat (Patrick Swayze) e Molly Jensen (Demi Moore) formam um casal muito apaixonado que tem suas vidas destruídas, pois ao voltarem de uma apresentação de "Hamlet" são atacados e Sam é morto.','Paramount Pictures', 3);
insert into filmes(Titulo, Sinopse, Estudio, Categoria_idCategoria) values('Titanic', 'Jack Dawson (Leonardo DiCaprio) é um jovem aventureiro que, na mesa de jogo, ganha uma passagem para a primeira viagem do transatlântico Titanic. Trata-se de um luxuoso e imponente navio, anunciado na época como inafundável, que parte para os Estados Unidos. ','Paramount Pictures', 3);

select filmes.Titulo as Titulo, filmes.Sinopse as Sinopse, filmes.estudio as Estudio, categoria.nome as Categoria, categoria.publico_alvo as Publico_alvo from filmes inner join categoria on filmes.Categoria_idCategoria = categoria.idCategoria group by  filmes.Titulo, filmes.Sinopse , filmes.estudio, categoria.nome , categoria.publico_alvo;


