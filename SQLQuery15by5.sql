CREATE DATABASE ClinicaMedica
GO

USE ClinicaMedica
GO

CREATE TABLE Pacientes(
	idPaciente INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	CPF NUMERIC NOT NULL UNIQUE,
	DataNascimento DATE NOT NULL,
	idEndereco INT
);

-- ALTERAR O CAMPO DE IDPACIENTE PARA UNIQUE 
-- E O DECIMAL PARA (8,2)
CREATE TABLE PacientesParticulares(
	id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	idPaciente INT NOT NULL UNIQUE,
	ValorConsulta DECIMAL(8,2) NOT NULL,

);

CREATE TABLE PacienteConveniados(
	id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	idConvenio INT NOT NULL,
	idPaciente INT NOT NULL,
	NumCarteirinha NUMERIC NOT NULL UNIQUE,
	ValidadeConvenio DATE NOT NULL,
	idTipoPlano INT NOT NULL
);

CREATE TABLE Convenios(
	idConvenio INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NomeConvenio VARCHAR(20) NOT NULL,
	Siteconvenio VARCHAR(20),
	CNPJ NUMERIC NOT NULL UNIQUE,

);

CREATE TABLE Medicos(
	idMedico INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CRM VARCHAR(9) NOT NULL UNIQUE,
	Nome VARCHAR(50) NOT NULL,
	Sobrenome VARCHAR(50) NOT NULL,
	DataContratacao DATE NOT NULL,
);

CREATE TABLE TelefonesConvenios(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	idConvenio INT NOT NULL
);

CREATE TABLE TiposPlanos (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TipoPlano VARCHAR(20) NOT NULL UNIQUE,

);

CREATE TABLE Endereco(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Logradouro NVARCHAR(20) NOT NULL,
	Numero NUMERIC,
	Complemento VARCHAR(10),
	Bairro VARCHAR(10) NOT NULL,
	Cidade VARCHAR(20) NOT NULL,
	CEP NUMERIC NOT NULL
);

CREATE TABLE TelefoneMedicos(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	idMedico INT NOT NULL
);

CREATE TABLE Consultas(
	idConsulta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Datahora DATETIME NOT NULL,
	TipoConsulta INT NOT NULL,
	StatusConsulta INT NOT NULL,
	Observacoes VARCHAR(255),
	Disgnostico VARCHAR(255) NOT NULL,
	idPaciente INT NOT NULL,
	idMedico INT NOT NULL
);

CREATE TABLE Tiposconsultas(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TipoConsulta VARCHAR(30) NOT NULL UNIQUE,
	ValorConsulta DECIMAL NOT NULL
);

CREATE TABLE StatusConsultas(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	StatusConsulta VARCHAR(10) NOT NULL UNIQUE,
);


CREATE TABLE TelefonesPacientes(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CodPais NUMERIC NOT NULL,
	CodArea NUMERIC NOT NULL,
	Numero NUMERIC NOT NULL,
	idPaciente INT NOT NULL
);

CREATE TABLE Emails(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Email VARCHAR(20) NOT NULL UNIQUE,
	idPaciente INT NOT NULL
);

CREATE TABLE EspecialidadesMedicas(
	idEspecialidade INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NomeEspecialidade VARCHAR(20) NOT NULL UNIQUE,
	Descricao VARCHAR(255)
);

CREATE TABLE MedicosEspecialidades(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idMedico INT NOT NULL,
	idEspecialidade INT NOT NULL
);


--ALTER TABLE <NOMEDATABELA>
--ADD CONSTRAINT constraint_idtabela_unique UNIQUE 
--(NMEDOCAMPOQUEDEVESERNUIQUE);

USE master;
DROP DATABASE ClinicaMedica;

ALTER TABLE PacientesParticulares
ADD FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente)

ALTER TABLE PacienteConveniados
ADD FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente)

ALTER TABLE Pacientes
ADD FOREIGN KEY (idEndereco) REFERENCES Endereco(id)

ALTER TABLE Emails
ADD FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente)

ALTER TABLE TelefonesPacientes
ADD FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente)

ALTER TABLE Consultas
ADD FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
FOREIGN KEY (StatusConsulta) REFERENCES StatusConsultas(id),
FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
FOREIGN KEY (TipoConsulta) REFERENCES Tiposconsultas(id)

ALTER TABLE PacienteConveniados
ADD FOREIGN KEY (idConvenio) REFERENCES Convenios(idConvenio),
FOREIGN KEY (idTipoPlano) REFERENCES TiposPlanos(id)

ALTER TABLE TelefonesConvenios
ADD FOREIGN KEY (idConvenio) REFERENCES Convenios(idConvenio)

ALTER TABLE TelefoneMedicos
ADD FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)


ALTER TABLE MedicosEspecialidades
ADD FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
FOREIGN KEY (idEspecialidade) REFERENCES EspecialidadesMedicas
(idEspecialidade)

