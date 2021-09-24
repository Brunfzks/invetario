USE Inventario

DROP PROCEDURE IF EXISTS sp_InsertLevantamento
GO

CREATE PROCEDURE sp_InsertLevantamento(@Id_Local Int, @Nm_Patrimonio Int, @Id_Levantamento Int, @Id_usuario Int) AS 
BEGIN

	DECLARE  @validado bit = 0;
	
	-- VERIFICA SE O N° PATRIMONIO INFORMADO EXISTE NO BD
	IF ((Select count(Nm_Patrimonio) from Tb_Patrimonio where Nm_patrimonio = STR(@Nm_Patrimonio)) = '1')
		BEGIN

		-- VALIDAÇÃO SE ESTA NO LOCAL INFORMADO
		IF ((Select count(Id_Local) from Tb_Patrimonio where Nm_patrimonio =  STR(@Nm_Patrimonio)and  Id_local =  STR(@Id_Local)) = '1') 
			SET @validado = 1;
		ELSE
			SET @validado = 0;

		-- SE ESTIVER VALIDADO, INSERE NA TABELA DE LEVANTAMENTOS, DO CONTRARIO NA DE NOTIFICAÇÕES
		IF (@validado = 1)
			BEGIN
				Insert into Tb_levantamentos (Id_Bem, Dt_verificado, Id_levantamento) values (@Nm_Patrimonio, GETDATE(), @Id_Levantamento);
				SELECT 'INSERIDO COM SUCESSO!' AS RESULT
			END
		ELSE
			BEGIN
				Insert into Tb_notificacao (Dt_notificacao, Id_Local, Id_bem, Id_usuario) values (GETDATE(), @Id_Local, @Nm_Patrimonio, @Id_usuario);
				SELECT 'NOTIFICACAO CRIADA!' AS RESULT
			END	
	END
	ELSE
		SELECT 'PATRIMONIO NAO CADASTRADO' AS RESULT
END;