CREATE TABLE TIPO_USUARIOS(
	ID INT IDENTITY PRIMARY KEY
	,TIPO_USUARIO VARCHAR(8) NOT NULL UNIQUE
);

CREATE TABLE ESPECIALIDADES(
	ID INT IDENTITY PRIMARY KEY
	,ESPECIALIDADE VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE CLINICA(
	ID INT IDENTITY PRIMARY KEY
	,CNPJ CHAR(14) NOT NULL UNIQUE
	,RAZAO_SOCIAL VARCHAR(100) NOT NULL UNIQUE
	,ENDERECO VARCHAR(100) NOT NULL
);

CREATE TABLE USUARIOS(
	ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(100) NOT NULL
	,ID_TIPO_USUARIO INT FOREIGN KEY REFERENCES TIPO_USUARIOS(ID) NOT NULL
	,EMAIL VARCHAR(100) NOT NULL UNIQUE
	,SENHA VARCHAR(50) NOT NULL
);

CREATE TABLE MEDICOS(
	ID INT IDENTITY PRIMARY KEY
	,CRM VARCHAR(10) NOT NULL UNIQUE
	,NOME VARCHAR(100) NOT NULL
	,ID_USUARIO INT FOREIGN KEY REFERENCES USUARIOS(ID) NOT NULL UNIQUE
	,ID_ESPECIALIDADE INT FOREIGN KEY REFERENCES ESPECIALIDADES(ID) NOT NULL
	,ID_CLINICA INT FOREIGN KEY REFERENCES CLINICA(ID) NOT NULL 
);

CREATE TABLE TIPO_SITUACOES(
	ID INT IDENTITY PRIMARY KEY
	,SITUACAO VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PRONTUARIO_PACIENTE(
	ID INT IDENTITY PRIMARY KEY
	,ID_USUARIO INT FOREIGN KEY REFERENCES USUARIOS(ID) NOT NULL UNIQUE
	,DATA_NASCIMENTO DATETIME NOT NULL
	,TELEFONE VARCHAR(13) NOT NULL
	,RG CHAR(9) NOT NULL UNIQUE
	,CPF CHAR(11) NOT NULL UNIQUE
	,ENDERECO VARCHAR(100) NOT NULL
);

CREATE TABLE CONSULTAS(
	ID INT IDENTITY PRIMARY KEY
	,ID_PRONTUARIO INT FOREIGN KEY REFERENCES PRONTUARIO_PACIENTE(ID) NOT NULL
	,ID_MEDICO INT FOREIGN KEY REFERENCES MEDICOS(ID) NOT NULL
	,DATA_CONSULTA DATE NOT NULL
	,DESCRICAO VARCHAR(255)
	,ID_TIPO_SITUACAO INT FOREIGN KEY REFERENCES TIPO_SITUACOES(ID) NOT NULL
);

ALTER TABLE MEDICOS ADD ID_USUARIO INT FOREIGN KEY REFERENCES USUARIOS(ID)
ALTER TABLE MEDICOS ADD ID_CLINICA INT FOREIGN KEY REFERENCES CLINICA(ID)