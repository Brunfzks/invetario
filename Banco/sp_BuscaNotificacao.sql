DROP PROCEDURE IF EXISTS sp_BuscaNotificacoes 
GO

CREATE PROCEDURE sp_BuscaNotificacoes(@Id_Usuario Int) AS 
BEGIN
    SELECT Id_notificacao,
        Dt_notificacao,
        Tb_notificacao.Id_bem,
        Tb_Patrimonio.Ds_patrimonio,
		Tb_Patrimonio.Id_local,
        Nm_usuario AS Us_econtrou,
        Tb_Local.Ds_local AS Lc_encontrado,    
        (SELECT Ds_local
        FROM Tb_Local
        WHERE Id_local = Tb_Patrimonio.Id_local) AS Lc_origem
    FROM Tb_notificacao
    INNER JOIN Tb_Local ON Tb_notificacao.Id_local = Tb_Local.Id_local
    INNER JOIN Tb_usuario ON Tb_usuario.Id_Usuario = Tb_notificacao.Id_Usuario
    INNER JOIN Tb_patrimonio ON Tb_patrimonio.Id_bem = Tb_notificacao.Id_bem
    WHERE @Id_Usuario in
        (SELECT Id_usuario
        FROM Tb_Local
        WHERE Id_local = Tb_Patrimonio.Id_local)
END;