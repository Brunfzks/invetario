DROP PROCEDURE IF EXISTS sp_BuscaPatrimonio 
GO

CREATE PROCEDURE sp_BuscaPatrimonio(@Id_Local Int) AS 
BEGIN
    SELECT *, (SELECT 1 FROM Tb_levantamentos L
						JOIN Tb_Patrimonio P
						ON L.Id_Bem = P.Id_Bem
						JOIN Tb_cab_levantamentos C
						ON C.Id_levantamento = L.Id_levantamento
						WHERE P.Id_local = 1 and C.Encerrado = 0 and L.Id_Bem = Tb_Patrimonio.Id_Bem ) as Encontrado FROM Tb_Patrimonio
	WHERE Id_local = 1
END;