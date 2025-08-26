
-- 1. Crie um banco chamado EscolaIdiomas
DROP DATABASE IF EXISTS EscolaIdiomas;
CREATE DATABASE EscolaIdiomas;
USE EscolaIdiomas;

-- 2. Tabela Alunos
CREATE TABLE `escolaidiomas`.`alunos` (
  `id_alunos` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(100) NULL,
  `idade_aluno` INT NULL,
  `email` VARCHAR(100) NULL,
  `id_cursos` INT NULL,
  PRIMARY KEY (`id_alunos`));
  
  
-- 3. Tabela Cursos
CREATE TABLE `escolaidiomas`.`cursos` (
  `id_cursos` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(100) NULL,
  `carga_horaria` VARCHAR(45) NULL,
  `id_professores` INT NULL,
  PRIMARY KEY (`id_cursos`));

-- 4. Tabela Professores
CREATE TABLE `escolaidiomas`.`professores` (
  `id_professores` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(100) NULL,
  `especialidade_professor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_professores`));

-- 5. Criação FOREIGN KEY
ALTER TABLE `escolaidiomas`.`alunos` 
ADD CONSTRAINT `FK_cursos`
  FOREIGN KEY (`id_cursos`) 
  REFERENCES `escolaidiomas`.`cursos` (`id_cursos`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

ALTER TABLE `escolaidiomas`.`cursos` 
ADD CONSTRAINT `FK_professores`
  FOREIGN KEY (`id_professores`)
  REFERENCES `escolaidiomas`.`professores` (`id_professores`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

-- 6. INSERT - Inserção de dados
INSERT INTO escolaidiomas.professores (nome_professor, especialidade_professor) VALUES
	('João Martins', 'Ingles'),
    ('Paula Torres', 'Ingles'),
    ('Flávio Silva', 'Frances'),
    ('Ana Alves', 'Espanhol'),
    ('Daniel Santos', 'Japones'),
    ('Lucas Sousa', 'Alemão'),
    ('Juliana Andrade', 'Ingles');

INSERT INTO escolaidiomas.cursos (nome_curso, carga_horaria, id_professores) VALUES
	('Ingles NIVEL 1', '240h', 1),
    ('Ingles NIVEL 2', '240h', 2),
    ('Ingles NIVEL 4', '240h', 7),
    ('Frances NIVEL 2', '240h', 3),
    ('Frances NIVEL 3', '240h', 3),
    ('Ingles NIVEL 5', '240h', 7),
    ('Alemão NIVEL 1', '240h', 6),
    ('Alemão NIVEL 2', '240h', 6),
    ('Japones NIVEL 1', '240h', 5),
    ('Japones NIVEL 3', '240h', 5),
    ('Espanhol NIVEL 1', '240h', 4)
    ;
    
    
INSERT INTO escolaidiomas.alunos (nome_aluno, idade_aluno, email, id_cursos) VALUES
	('Paulo Silva', 15, 'paulos@gmail', 2),
    ('Ana Beatriz Sousa', 21, 'anabia@gmail', 5),
    ('Roberto Martins', 25, 'robertmart@gmail', 1),
    ('Ana Clara Bastos', 17, 'claraanab@gmail', 1),
    ('Patricia Alves', 33, 'patalv@gmail', 6),
    ('Renato Borges', 41, 'renatob@gmail', 7),
    ('Isabel Morais', 35, 'isamo@gmail', 4),
    ('Julio Oliveira', 16, 'juliool@gmail', 3);
    
    
-- 7. Consultas simples (SELECT)
SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM professores;

-- consulta (DESAFIO OPCIONAL) --
SELECT 
	a.nome_aluno as 'aluno',
    c.id_cursos,
    c.nome_curso as 'curso'
FROM alunos as a
	LEFT JOIN cursos as c on (a.id_cursos = c.id_cursos)
    LEFT JOIN professores as p on (c.id_professores = p.id_professores)
    ;
-- ----------------------------------------------------------------------

SELECT *
FROM alunos as a
	LEFT JOIN cursos as c on (a.id_cursos = c.id_cursos)
    LEFT JOIN professores as p on (c.id_professores = p.id_professores)
    ;
-- ----------------------------------------------------------------------
    


-- 8. Alteração de dados (UPDATE)
UPDATE escolaidiomas.alunos SET id_cursos= 2 WHERE id_alunos = 4;

-- 9. Exclusão de dados (DELETE)
DELETE FROM escolaidiomas.alunos WHERE id_alunos = 4;

-- 10. DROP TABLE - PROFESSORES
ALTER TABLE `escolaidiomas`.`cursos` DROP FOREIGN KEY `FK_professores`;
ALTER TABLE `escolaidiomas`.`cursos` DROP INDEX `FK_professores` ;
DROP TABLE `escolaidiomas`.`professores`;

-- 11. USUARIOS E PERMISSOES 

CREATE USER 'user_escola_001'@'localhost' IDENTIFIED BY '123';
CREATE USER 'user_escola_002'@'localhost' IDENTIFIED BY '123';

GRANT INSERT ON escolaidiomas.alunos TO 'user_escola_001'@'localhost';
GRANT INSERT ON escolaidiomas.alunos TO 'user_escola_002'@'localhost';

REVOKE INSERT ON escolaidiomas.alunos FROM 'user_escola_002'@'localhost';

