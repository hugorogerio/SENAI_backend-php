
-- 1. Crie um banco chamado ClinicaVidaPlena
DROP DATABASE IF EXISTS ClinicaVidaPlena;
CREATE DATABASE ClinicaVidaPlena;
USE ClinicaVidaPlena;


-- 2. Criar a tabela de Pacientes 
CREATE TABLE `clinicavidaplena`.`pacientes` (
  `id_pacientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `cpf` VARCHAR(11) NULL,
  `data_nascimento` DATE NULL,
  `telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`id_pacientes`));
  
  
-- 3. Criar a tabela de Medicos
CREATE TABLE `clinicavidaplena`.`medicos` (
  `id_medicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `especialidade` ENUM('Clínico Geral', 'Pediatria', 'Cardiologia') NULL,
  `crm` VARCHAR(20) NULL,
  PRIMARY KEY (`id_medicos`));
  
-- 4. Criar a tabela de Consultas
CREATE TABLE `clinicavidaplena`.`consultas` (
  `id_consultas` INT NOT NULL AUTO_INCREMENT,
  `id_pacientes` INT NULL,
  `id_medicos` INT NULL,
  `data_consulta` DATETIME NULL,
  `valor` DECIMAL(8,2) NULL,
  PRIMARY KEY (`id_consultas`));

-- 4.1. Criar FK na tabela Consultas
ALTER TABLE `clinicavidaplena`.`consultas` 
ADD CONSTRAINT `FK_pacientes`
  FOREIGN KEY (`id_pacientes`)
  REFERENCES `clinicavidaplena`.`pacientes` (`id_pacientes`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_medicos`
  FOREIGN KEY (`id_medicos`)
  REFERENCES `clinicavidaplena`.`medicos` (`id_medicos`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `clinicavidaplena`.`consultas` 
DROP FOREIGN KEY `FK_medicos`,
DROP FOREIGN KEY `FK_pacientes`;
ALTER TABLE `clinicavidaplena`.`consultas` 
ADD CONSTRAINT `FK_medicos`
  FOREIGN KEY (`id_medicos`)
  REFERENCES `clinicavidaplena`.`medicos` (`id_medicos`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_pacientes`
  FOREIGN KEY (`id_pacientes`)
  REFERENCES `clinicavidaplena`.`pacientes` (`id_pacientes`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;



-- Desafios Extras
-- 1. Inserir dados iniciais

USE ClinicaVidaPlena;
INSERT INTO pacientes (nome, cpf, data_nascimento, telefone) VALUES 
	('Ana Martins', '00100300523', '1985-10-30', '6199856989'),
	('Bruno Martins', '30100300535', '1995-02-13', '6199799999'),
	('Carla Mendes', '40400300567', '1988-08-15', '6199888197'),
	('Diego Oliveira', '55500300581', '1997-04-07', '6198569797'),
	('Gabriel Lima', '20100201575', '2003-11-05', '6198641234');

INSERT INTO medicos (nome, especialidade, crm) VALUES 
	('Matheus Lopes', 'Clínico Geral', 'CRM/DF 103354'),
	('Gabriela Nunes', 'Pediatria', 'CRM/GO 156798'),
	('Paulo Silva', 'Cardiologia', 'CRM/MG 89357');

INSERT INTO consultas (id_pacientes, id_medicos, data_consulta, valor) VALUES 
	(2, 1, '2025-08-30 14:00', 200.00),
    (5, 2, '2025-08-30 13:00', 225.00),
    (3, 1, '2025-08-27 17:00', 200.00),
    (3, 3, '2025-09-11 11:00', 180.00),
    (1, 3, '2025-09-11 10:00', 180.00),
    (4, 1, '2025-09-09 09:00', 200.00),
    (4, 2, '2025-09-09 13:00', 225.00);


-- 2. Consultas simples (SELECT)

SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM consultas;

SELECT 
	c.id_consultas AS 'id_c',
    c.id_pacientes AS 'id_p', 
    p.nome AS 'PACIENTE',
    p.telefone,
    c.id_medicos AS 'id_m', 
    m.nome AS 'MEDICO',
    m.crm,
    m.especialidade,
    c.data_consulta,
    c.valor
FROM consultas c
	LEFT JOIN pacientes p on c.id_pacientes = p.id_pacientes
    LEFT JOIN medicos m on c.id_medicos = m.id_medicos
ORDER BY c.data_consulta;


-- 3. Alteração de dados (UPDATE)

-- a) Atualize o telefone de um paciente.
-- valor original (feito pelo INSERT)
UPDATE clinicavidaplena.pacientes SET telefone = '6198569797' WHERE id_pacientes = 4;
-- novo valor
UPDATE clinicavidaplena.pacientes SET telefone = '6199998888' WHERE id_pacientes = 4;

-- b) Altere o nome de um médico
-- valor original (feito pelo INSERT)
UPDATE clinicavidaplena.medicos SET nome = 'Paulo Silva' WHERE id_medicos = 3;
-- novo valor
UPDATE clinicavidaplena.medicos SET nome = 'João Paulo da Silva' WHERE id_medicos = 3;

-- c) Corrija a data de uma consulta.
-- valor original (feito pelo INSERT)
UPDATE clinicavidaplena.consultas SET data_consulta = '2025-09-09 13:00:00' WHERE id_consultas = 7;
-- novo valor
UPDATE clinicavidaplena.consultas SET data_consulta = '2025-09-12 15:00:00' WHERE id_consultas = 7;


-- 4. Exclusão de dados (DELETE)
-- a) Exclua um paciente pelo id_paciente.
DELETE FROM clinicavidaplena.pacientes WHERE id_pacientes = 4;

-- b) Exclua um médico pelo id_medico.
DELETE FROM clinicavidaplena.medicos WHERE id_medicos = 3;

-- c) Exclua uma consulta pelo id_consulta.
DELETE FROM clinicavidaplena.consultas WHERE id_consultas = 7;







