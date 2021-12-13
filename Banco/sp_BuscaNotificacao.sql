DROP PROCEDURE IF EXISTS sp_encerraLevantamento 
GO

CREATE PROCEDURE sp_encerraLevantamento(@Id_usuario Int) AS 
BEGIN
	UPDATE Tb_cab_levantamentos SET Encerrado = 0, Id_Usuario = @Id_usuario;
END;