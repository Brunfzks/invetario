USE Inventario

DROP PROCEDURE IF EXISTS sp_InsertLevantamento
GO

CREATE PROCEDURE sp_InsertLevantamento(@Id_Local Int, @Nm_Patrimonio Int, @Id_Levantamento Int, @Id_usuario Int, @notificacao bit) AS 
BEGIN

	DECLARE @validado bit = 0;
	DECLARE @Id_bem Varchar(10);

	SET @Id_bem = (Select Id_bem from Tb_Patrimonio where Nm_patrimonio = STR(@Nm_Patrimonio));

	IF(@notificacao = 1)
		BEGIN
			Delete Tb_notificacao where Id_bem =  @Id_bem
		END
	
	-- VERIFICA SE O N° PATRIMONIO INFORMADO EXISTE NO BD
	IF(@Id_bem <> 'NULL')
		BEGIN

		-- VALIDAÇÃO SE ESTA NO LOCAL INFORMADO
		IF ((Select count(Id_Local) from Tb_Patrimonio where Nm_patrimonio =  STR(@Nm_Patrimonio)and  Id_local =  STR(@Id_Local)) = '1') 
			SET @validado = 1;
		ELSE
			SET @validado = 0;

		-- SE ESTIVER VALIDADO, INSERE NA TABELA DE LEVANTAMENTOS, DO CONTRARIO NA DE NOTIFICAÇÕES
		IF (@validado = 1)
			BEGIN
				Insert into Tb_levantamentos (Id_Bem, Dt_verificado, Id_levantamento) values (@Id_bem, GETDATE(), @Id_Levantamento);
				SELECT 'INSERIDO COM SUCESSO!' AS RESULT
			END
		ELSE
			BEGIN
				Insert into Tb_notificacao (Dt_notificacao, Id_Local, Id_bem, Id_usuario) values (GETDATE(), @Id_Local, @Id_bem, @Id_usuario);
				SELECT 'NOTIFICACAO CRIADA!' AS RESULT
			END	
	END
	ELSE
		BEGIN
			Insert into Tb_encontrados(Dt_encontrado, Nm_patrimonio, Id_usuario) values(GETDATE(), @Nm_Patrimonio,  @Id_usuario)
			SELECT 'PATRIMONIO NAO CADASTRADO' AS RESULT
		END
END;