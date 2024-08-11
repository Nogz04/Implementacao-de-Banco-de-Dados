CREATE DATABASE dinossauros;
USE dinossauros;

/*CRIAÇÃO DE TABELAS*/
CREATE TABLE Grupo (
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Descobridor (
    id_descobridor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Era (
    id_era INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    inicio INT NOT NULL,
    fim INT NOT NULL
);

CREATE TABLE Dinossauro (
    id_dinossauro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    toneladas INT NOT NULL,
    id_grupo INT,
    id_era INT,
    id_pais INT,
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo),
    FOREIGN KEY (id_era) REFERENCES Era(id_era),
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);

CREATE TABLE Dinossauro_Descobridor (
    id_dinossauro INT,
    id_descobridor INT,
    ano_descoberta INT NOT NULL,
    PRIMARY KEY (id_dinossauro, id_descobridor),
    FOREIGN KEY (id_dinossauro) REFERENCES Dinossauro(id_dinossauro),
    FOREIGN KEY (id_descobridor) REFERENCES Descobridor(id_descobridor)
);

/*INSERINDO OS DADOS*/

INSERT INTO Grupo (nome) VALUES
('Anquilossauros'),
('Ceratopsídeos'),
('Estegossauros'),
('Terápodes');

INSERT INTO Descobridor (nome) VALUES
('Maryanska'),
('John Bell Hatcher'),
('Cientistas Alemães'),
('Museu Americano de História Natural'),
('Othniel Charles Marsh'),
('Barnum Brown');

INSERT INTO Pais (nome) VALUES
('Mongólia'),
('Canadá'),
('Tanzânia'),
('China'),
('América do Norte'),
('USA');

INSERT INTO Era (nome, inicio, fim) VALUES
('Cretáceo', 145, 66),
('Jurássico', 201, 145);

INSERT INTO Dinossauro (nome, toneladas, id_grupo, id_era, id_pais) VALUES
('Seichania', 4, 1, 1, 1),
('Triceratops', 6, 2, 1, 2),
('Kentrossauro', 2, 3, 2, 3),
('Pinacossauro', 6, 1, 1, 4),
('Alossauro', 3, 4, 2, 5),
('Torossauro', 8, 2, 1, 6),
('Anquilossauro', 8, 1, 1, 5);

INSERT INTO Dinossauro_Descobridor (id_dinossauro, id_descobridor, ano_descoberta) VALUES
(1, 1, 1977),  -- Seichania, Maryanska
(2, 2, 1887),  -- Triceratops, John Bell Hatcher
(3, 3, 1909),  -- Kentrossauro, Cientistas Alemães
(4, 4, 1999),  -- Pinacossauro, Museu Americano de História Natural
(5, 5, 1877),  -- Alossauro, Othniel Charles Marsh
(6, 2, 1891),  -- Torossauro, John Bell Hatcher
(7, 6, 1906);  -- Anquilossauro, Barnum Brown

/* FAZENDO AS CONSULTAS */

-- Consulta 1: Dados completos dos dinossauros com nome em ordem alfabética
SELECT 
    d.nome AS Dinossauro,
    g.nome AS Grupo,
    d.toneladas AS Toneladas,
    dd.ano_descoberta,
    dc.nome AS Descobridor,
    e.nome AS Era,
    e.inicio,
    e.fim,
    p.nome AS Pais
FROM 
    Dinossauro d
LEFT JOIN 
    Grupo g ON d.id_grupo = g.id_grupo
LEFT JOIN 
    Era e ON d.id_era = e.id_era
LEFT JOIN 
    Pais p ON d.id_pais = p.id_pais
LEFT JOIN 
    Dinossauro_Descobridor dd ON d.id_dinossauro = dd.id_dinossauro
LEFT JOIN 
    Descobridor dc ON dd.id_descobridor = dc.id_descobridor
ORDER BY 
    d.nome;

-- Consulta 2: Dados dos dinossauros ordenados alfabeticamente por descobridor
SELECT 
    d.nome AS Dinossauro,
    g.nome AS Grupo,
    d.toneladas AS Toneladas,
    dd.ano_descoberta,
    dc.nome AS Descobridor,
    e.nome AS Era,
    e.inicio,
    e.fim,
    p.nome AS Pais
FROM 
    Dinossauro d
LEFT JOIN 
    Grupo g ON d.id_grupo = g.id_grupo
LEFT JOIN 
    Era e ON d.id_era = e.id_era
LEFT JOIN 
    Pais p ON d.id_pais = p.id_pais
LEFT JOIN 
    Dinossauro_Descobridor dd ON d.id_dinossauro = dd.id_dinossauro
LEFT JOIN 
    Descobridor dc ON dd.id_descobridor = dc.id_descobridor
ORDER BY 
    dc.nome;

-- Consulta 3: Dados dos dinossauros do grupo dos Anquilossauros em ordem de ano de descoberta
SELECT 
    d.nome AS Dinossauro,
    g.nome AS Grupo,
    d.toneladas AS Toneladas,
    dd.ano_descoberta,
    dc.nome AS Descobridor,
    e.nome AS Era,
    e.inicio,
    e.fim,
    p.nome AS Pais
FROM 
    Dinossauro d
LEFT JOIN 
    Grupo g ON d.id_grupo = g.id_grupo
LEFT JOIN 
    Era e ON d.id_era = e.id_era
LEFT JOIN 
    Pais p ON d.id_pais = p.id_pais
LEFT JOIN 
    Dinossauro_Descobridor dd ON d.id_dinossauro = dd.id_dinossauro
LEFT JOIN 
    Descobridor dc ON dd.id_descobridor = dc.id_descobridor
WHERE 
    g.nome = 'Anquilossauros'
ORDER BY 
    dd.ano_descoberta;

-- Consulta 4: Dados dos dinossauros do grupo dos Ceratopsídeos ou Anquilossauros descobertos entre 1900 e 1999
SELECT 
    d.nome AS Dinossauro,
    g.nome AS Grupo,
    d.toneladas AS Toneladas,
    dd.ano_descoberta,
    dc.nome AS Descobridor,
    e.nome AS Era,
    e.inicio,
    e.fim,
    p.nome AS Pais
FROM 
    Dinossauro d
LEFT JOIN 
    Grupo g ON d.id_grupo = g.id_grupo
LEFT JOIN 
    Era e ON d.id_era = e.id_era
LEFT JOIN 
    Pais p ON d.id_pais = p.id_pais
LEFT JOIN 
    Dinossauro_Descobridor dd ON d.id_dinossauro = dd.id_dinossauro
LEFT JOIN 
    Descobridor dc ON dd.id_descobridor = dc.id_descobridor
WHERE 
    dd.ano_descoberta BETWEEN 1900 AND 1999
    AND (g.nome = 'Anquilossauros' OR g.nome = 'Ceratopsídeos')
ORDER BY 
    d.nome;

-- NOME: MATHEUS NOGUEIRA ALBUQUERQUE
