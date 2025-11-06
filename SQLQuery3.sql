SELECT * FROM TiposPlanos
SELECT * FROM Tiposconsultas

INSERT INTO TiposPlanos VALUES('BASICO')
INSERT INTO TiposPlanos VALUES('PREMIUM')
INSERT INTO TiposPlanos VALUES('MASTER'), ('PLUS ADVANCED')

INSERT INTO Tiposconsultas VALUES('Primeira Consulta', 200.50),
('Retorno', 720), ('Emergencia', 1200)

INSERT INTO StatusConsultas VALUES ('Agendada'), ('Cancelada'), 
('Realizada')

SELECT * FROM StatusConsultas 

UPDATE StatusConsultas
SET StatusConsulta = 'Concluida'
WHERE StatusConsulta = 'Realizada'

INSERT INTO EspecialidadesMedicas Values
('Pediatra','Cuidada das clianças'),
('Cardiologista','Cuida do corassaum'),
('Otorrinolaringologista','Esse fala por si só'),
('Dermatologista','pele'),
('Urologista','cuida dos homi')

SELECT * FROM EspecialidadesMedicas

ALTER TABLE EspecialidadesMedicas
ALTER COLUMN NomeEspecialidade VARCHAR(50) NOT NULL

INSERT INTO Medicos (CRM, Nome, Sobrenome, DataContratacao)
VALUES
('1234SP', 'João', 'Silva', GETDATE())

INSERT INTO Medicos (CRM, Nome, Sobrenome, DataContratacao)
VALUES
('1235SP', 'João', 'Silva', '11/13/2025')

INSERT INTO Medicos (CRM, Nome, Sobrenome, DataContratacao)
VALUES
('1245SP', 'Zé', 'Silva', '11/20/2025')

INSERT INTO Medicos (CRM, Nome, Sobrenome, DataContratacao)
VALUES
('7235SP', 'João', 'Arnaldo', '11/19/2025')

SELECT * FROM Medicos
SELECT * FROM EspecialidadesMedicas

INSERT INTO MedicosEspecialidades
VALUES (4,4),(4,1)

INSERT INTO TelefoneMedicos
VALUES(55,16,12345678,4), (55,16,9876543,4)

SELECT * FROM TelefoneMedicos

SELECT * FROM Endereco

SELECT * FROM Pacientes

INSERT INTO Endereco (Logradouro, Numero, Bairro, Cidade, CEP)
VALUES('Rua Principal', 123, 'Centro', 'Araraquara', 14810-200)

INSERT INTO Pacientes
VALUES('Felipe', 'Pestana', 12345, '1984-08-19', 1)

INSERT INTO Pacientes
VALUES('Wayne', 'Macioski', 98765, '2004-03-22', 2)
INSERT INTO Pacientes
VALUES('Krysthian', 'Galbiatti', 45632, '2005-12-20', 2)
--DBCC CHECKIDENT ('MinhaTabela', RESEED, 0);/Reseta o ID

SELECT * FROM StatusConsultas
SELECT * FROM Tiposconsultas

INSERT INTO Consultas(Datahora, TipoConsulta, StatusConsulta,
Disgnostico, idPaciente, idMedico)
VALUES(GETDATE(), 1, 1, '', 1, 4)

SELECT * FROM Consultas