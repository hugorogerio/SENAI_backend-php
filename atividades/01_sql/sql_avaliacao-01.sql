-- ============================================
-- 1. Criando o Banco de Dados e Tabelas
-- ============================================
DROP DATABASE IF EXISTS empresaDB;
CREATE DATABASE empresaDB;
USE empresaDB;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);


-- ============================================
-- 2. Inserindo Funcionários de Diferentes Cargos
-- ============================================
INSERT INTO funcionarios (nome, cargo, salario) VALUES
('Ana Silva', 'Gerente', 8500.00),
('Bruno Souza', 'Analista', 4500.00),
('Carla Mendes', 'Analista', 4700.00),
('Diego Alves', 'Desenvolvedor', 3500.00),
('Fernanda Costa', 'Desenvolvedor', 3600.00),
('Gabriel Lima', 'Estagiário', 1500.00);


CREATE USER 'user_gerente'@'localhost' IDENTIFIED BY '123';
CREATE USER 'user_analista'@'localhost' IDENTIFIED BY '123';
CREATE USER 'user_desenvolvedor'@'localhost' IDENTIFIED BY '123';
CREATE USER 'user_dev'@'localhost' IDENTIFIED BY '123';
CREATE USER 'user_estagiario'@'localhost' IDENTIFIED BY '123';

GRANT ALL PRIVILEGES ON empresadb.* TO 'user_gerente'@'localhost';
GRANT SELECT, UPDATE ON empresadb.funcionarios TO 'user_analista'@'localhost';
GRANT SELECT ON empresadb.funcionarios TO 'user_dev'@'localhost';
GRANT SELECT ON empresadb.funcionarios TO 'user_desenvolvedor'@'localhost';
GRANT SELECT ON empresadb.funcionarios TO 'user_estagiario'@'localhost';




