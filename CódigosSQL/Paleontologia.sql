/* Lógico_2: */

CREATE TABLE Dinossauro (
    Nome VARCHAR(50) UNIQUE NOT NULL,
    Toneladas INT,
    ID INT PRIMARY KEY auto_increment,
    fk_Era_ID INT,
    fk_Grupo_ID INT,
    fk_Pais_ID INT
);


CREATE TABLE Grupo (
    ID INT PRIMARY KEY auto_increment,
    Nome VARCHAR(50) UNIQUE NOT NULL
);



/*Inserindo os nomes a tabela GRUPO*/
INSERT INTO Grupo (Nome) 
VALUES  ('Anquilossauros'),
		('Ceratopsídeos'),
        ('Estegossauros'),
        ('Terápodes');
  
/*Verificando os Nomes presentes na tabela GRUPO*/
SELECT Nome from Grupo;

/*Inserindo os nomes a tabela ERA*/
INSERT INTO Era (Nome, Inicio, Fim)
VALUES 	('Cretáceo', 145, 66),
		('Jurássico', 201, 145);
        
/*Inserindo os nomes a tabela PAIS*/
INSERT INTO Pais (Nome)
VALUES 	('Mongólia'),
		('Canadá'),
        ('Tanzânia'),
        ('China'),
        ('América do Norte'),
        ('USA');
        
/*Inserindo os nomes a tabela DESCOBRIDOR*/
INSERT INTO Descobridor (Nome)
VALUES 	('Maryanska'),
		('John Bell Hatcher'),
        ('Cientistas Alemães'),
        ('Museu Americano de História Natural'),
        ('Othniel Charles Marsh'),
        ('Bamum Brown');
        


CREATE TABLE Era (
    ID INT PRIMARY KEY auto_increment,
    Nome VARCHAR(50) UNIQUE NOT NULL,
    Inicio INT,
    Fim INT
);

CREATE TABLE Pais (
    ID INT PRIMARY KEY auto_increment,
    Nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Descobridor (
    Nome VARCHAR(50) not null,
    ID INT PRIMARY KEY auto_increment
);

CREATE TABLE Dinossauro_Descobridor(
    Ano_Descoberta YEAR,
    fk_Dinossauro_ID INT, 
    fk_Descobridor_ID INT,
    primary key	(fk_Dinossauro_ID, fk_Descobridor_ID)
);
 
ALTER TABLE Dinossauro ADD CONSTRAINT FK_Dinossauro_2
    FOREIGN KEY (fk_Era_ID)
    REFERENCES Era (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Dinossauro ADD CONSTRAINT FK_Dinossauro_3
    FOREIGN KEY (fk_Grupo_ID)
    REFERENCES Grupo (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Dinossauro ADD CONSTRAINT FK_Dinossauro_4
    FOREIGN KEY (fk_Pais_ID)
    REFERENCES Pais (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Dinossauro_Descobridor ADD CONSTRAINT FK_Dinossauro_Descobridor_DESCOBERTO_1
    FOREIGN KEY (fk_Dinossauro_ID)
    REFERENCES Dinossauro (ID);
 
ALTER TABLE Dinossauro_Descobridor ADD CONSTRAINT FK_Dinossauro_Descobridor_DESCOBERTO_2
    FOREIGN KEY (fk_Descobridor_ID)
    REFERENCES Descobridor (ID);
