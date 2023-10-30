create database animais_2;
use  animais_2;
-- Cria a tabela dos animais 
CREATE TABLE Animais (
  id int primary key ,
  nome varchar(50),
  nasc date,
  peso decimal(10,2),
  cor varchar(50)
  );

INSERT INTO Animais
VALUES (01, 'Ágata', '2015-04-09', 13.9, 'branco');
INSERT INTO Animais 
VALUES (02, 'Félix', '2016-06-06', 14.3, 'preto');
INSERT INTO Animais 
VALUES (03, 'Tom', '2013-02-08', 11.2, 'azul');
INSERT INTO Animais 
VALUES (04, 'Garfield', '2015-07-06', 17.1, 'laranja');
INSERT INTO Animais 
VALUES (05, 'Frajola', '2013-08-01', 13.7, 'preto');
INSERT INTO Animais 
VALUES (06, 'Manda chuva', '2012-02-03', 12.3, 'amarelo');
INSERT INTO Animais 
VALUES (07, 'Snowball', '2014-04-06', 13.2, 'preto');
INSERT INTO Animais 
VALUES (10, 'Agata', '2015-08-03', 11.9, 'azul');
INSERT INTO Animais 
VALUES (11, 'Gato de Botas', '2012-12-10', 11.6, 'amarelo');
INSERT INTO Animais
VALUES (12, 'Kitty', '2020-04-06', 11.6, 'amarelo');
INSERT INTO Animais 
VALUES (13, 'Milu', '2013-02-04', 17.9, 'branco');
INSERT INTO Animais 
VALUES (14, 'Pluto', '2012-01-03', 12.3, 'amarelo');
INSERT INTO Animais 
VALUES (15, 'Pateta', '2015-05-01', 17.7, 'preto');
INSERT INTO Animais
VALUES (16, 'Snoopy', '2013-07-02', 18.2, 'branco');
INSERT INTO Animais 
VALUES (17, 'Rex', '2019-12-29', 19.7, 'bege');
INSERT INTO Animais 
VALUES (20, 'Bidu', '2012-09-08', 12.4, 'azul');
INSERT INTO Animais 
VALUES (21, 'Dum Dum', '2015-04-06', 11.2, 'vermelho');
INSERT INTO Animais 
VALUES (22, 'Muttley', '2011-02-03', 14.3, 'laranja');
INSERT INTO Animais 
VALUES (23, 'Scooby', '2012-12-22', 19.9, 'marrom');
INSERT INTO Animais
VALUES (24, 'Rufus', '2014-04-05', 19.7, 'branco');
INSERT INTO Animais
VALUES (25, 'Free willy', '2020-02-12', 3000, 'preto e branco');
INSERT INTO Animais
VALUES (26, 'Dumbo', '2005-01-10', 6000, 'cinza');
INSERT INTO Animais
VALUES (28, 'Coragem', '2000-04-09', 12.8, 'rosa');
INSERT INTO Animais
VALUES (29, 'Cacao', '2012-08-10', 6000, 'vermelho');
INSERT INTO Animais
VALUES (30, 'Flu flu', '2011-10-12', 12.8, 'branco');
-- Mostra todos os animais inseridos na tabela
SELECT * FROM Animais;

-- desabilita o safe update para poder atualizar os dados na tabela
SET SQL_SAFE_UPDATES=0;
-- Seleciona todos os animais com peso <= 13.1

select * from animais where peso <= 13.1;

-- Seleciona todos os animais nascidos entre 2015-02-01 e 2015-12-31

select * from animais where nasc between '2015-02-01' AND '2015-12-31';

-- Seleciona todos os animais brancos com peso < 15

select * from animais where cor = 'branco' and peso < 15;

-- Seleciona nome, cor e peso de todos os animais cujo nome começa com "B"

select nome, cor, peso from animais where nome like 'B%';

-- Seleciona nome, cor e peso de todos os animais com cor vermelha, amarela, marrom ou laranja

select nome, cor, peso from animais where cor in ('vermelho','amarelo','marrom','laranja');

-- Seleciona nome, data de nascimento, cor e peso de todos os animais, ordenados pela data de nascimento decrescente

select nome as Nome, nasc as Data_de_nascimento,cor as Cor, peso as Peso from animais order by nasc desc;

-- Seleciona todos os animais cujo nome começa com "C" e cor não é branco

select * from animais where  nome like 'C%' and not cor = 'branco';

-- Seleciona todos os animais cujo nome contém a string "ba"

select * from animais where nome like '%ba%';

-- Seleciona todos os animais com peso entre 13 e 15
select * from animais where peso between 13 and 15;

-- Seleciona todos os animais com peso menor que 30, cor amarela ou roxa, e nascidos no ano de 2012
SELECT * FROM animais WHERE peso < 30 AND cor IN ('amarelo', 'roxo') AND YEAR(nasc) = 2012;

-- Seleciona todos os animais nascidos em dezembro no dia 22 ou depois, ou nascidos em janeiro no dia 19 ou antes - Capricornianos
select * from animais where month(nasc) = 12 and day (nasc) >= 22 or month(nasc) = 1 and day(nasc) <= 19;

-- Seleciona todos os animais com nome formado duas palavras
select * from animais where length(nome)  - length(replace(nome,' ', '')) >=1;


