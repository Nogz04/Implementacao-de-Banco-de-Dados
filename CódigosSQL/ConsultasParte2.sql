-- CONSULTAS FEITAS NO BANCO DE DADOS EMPRESA.MD

SELECT *
FROM TRABALHA_EM
WHERE Fcpf = '33344555587'


--SEM JOIN

SELECT F.*
FROM FUNCIONARIO AS F, TRABALHA_EM AS TE
WHERE TE.Fcpf = F.Cpf
AND TE.Pnr IN (	SELECT Pnr
				FROM TRABALHA_EM
				WHERE Fcpf = @Cpf_Funcionario )

AND TE.Horas IN (SELECT Horas
				FROM TRABALHA_EM
				WHERE Fcpf = @Cpf_Funcionario )

AND F.Cpf <> '33344555587'
	


	
-- COM JOIN

DECLARE @Cpf_Funcionario VARCHAR(11)
SET @Cpf_Funcionario = (SELECT F.Cpf
						FROM FUNCIONARIO AS F
						WHERE Pnome = 'Fernando');

SELECT F.*
FROM FUNCIONARIO AS F
JOIN TRABALHA_EM AS TE ON TE.Fcpf = F.Cpf

WHERE TE.Pnr IN (SELECT Pnr
				FROM TRABALHA_EM
				WHERE Fcpf = @Cpf_Funcionario )

AND TE.Horas IN (SELECT Horas
				FROM TRABALHA_EM
				WHERE Fcpf = @Cpf_Funcionario )

AND F.Cpf <> '33344555587'


-- Utiliziando os Aliases (apelidos) --> AS

-- CONSULTA 1
SELECT F.Pnome AS 'Nome', F.Unome AS 'Sobrenome'
FROM FUNCIONARIO AS F;

-- CONSULTA 2

--SEM JOIN
SELECT *
FROM FUNCIONARIO AS F, DEPARTAMENTO AS D
WHERE F.Dnr = D.Dnumero
AND D.Dnome = 'Pesquisa';

--COM JOIN
SELECT *
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';


-- CONSULTA 3

--SEM JOIN
SELECT F.Pnome AS 'Funcionario', S.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F, FUNCIONARIO AS S
WHERE F.Cpf_supervisor = S.Cpf
ORDER BY S.Pnome;

--COM JOIN
SELECT F.Pnome AS 'Funcionario', S.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F
JOIN FUNCIONARIO AS S
ON S.Cpf = F.Cpf_supervisor
ORDER BY S.Pnome;


-- CONSULTA 4

SELECT F.Pnome AS 'Funcionario', P.Projnome AS 'Nome Projeto'
FROM FUNCIONARIO AS F
JOIN TRABALHA_EM AS TE
ON F.Cpf = TE.Fcpf
JOIN PROJETO AS P
ON P.Projnumero = TE.Pnr
WHERE P.Projnome = 'ProdutoX'


-- CONSULTA 5

SELECT p.Projnome, D.Dnumero, 
CONCAT(F.Minicial, ' ', F.Unome) AS 'Sobrenome', 
Projlocal
FROM PROJETO AS P
JOIN DEPARTAMENTO AS D
ON P.Dnum = D.Dnumero
JOIN FUNCIONARIO AS F
ON D.Cpf_gerente = F.Cpf
WHERE P.Projlocal = 'Mauá'


-- CONSULTA 6
SELECT *
FROM FUNCIONARIO AS F
FULL JOIN DEPENDENTE AS D
ON F.Cpf = D.Fcpf

-- CONSULTA 7

SELECT COUNT(F.Cpf) AS 'Contagem', F.Salario
FROM FUNCIONARIO AS F
GROUP BY F.Salario

-- CONSULTA 8

SELECT COUNT(F.Cpf) AS 'Funcionarios'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
GROUP BY D.Dnumero
HAVING COUNT(F.Cpf) > 1
