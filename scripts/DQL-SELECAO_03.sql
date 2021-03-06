CREATE PROCEDURE QuantUsuarios
AS
BEGIN
	SELECT COUNT(ID) FROM USUARIOS
END

EXEC QuantUsuarios

SELECT convert(varchar(10), DATA_NASCIMENTO, 110) as DATA_NASCIMENTO from PRONTUARIO_PACIENTE

CREATE PROCEDURE Idade_Usuarios
AS
BEGIN
	SELECT FLOOR(DATEDIFF(DAY, DATA_NASCIMENTO , GETDATE() ) / 365.25) AS IDADE FROM PRONTUARIO_PACIENTE
END

EXEC Idade_Usuarios

CREATE PROCEDURE Medico_Especialidade
	@NOME VARCHAR(100)
AS
BEGIN
	SELECT COUNT(*) FROM MEDICOS INNER JOIN ESPECIALIDADES
	ON MEDICOS.ID_ESPECIALIDADE = ESPECIALIDADES.ID AND ESPECIALIDADES.NOME = @NOME
END

EXEC Medico_Especialidade ''