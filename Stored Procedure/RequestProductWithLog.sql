
CREATE TABLE [Log].[UserActionHistory]
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	PreviousValue NVARCHAR(MAX) NULL,
	CurrentValue NVARCHAR(MAX) NULL,
	UserId INT NOT NULL,
	UserType TINYINT NOT NULL,	-- { Admin:1,Merchant:2,Customer:3 }
	ActionTable VARCHAR(30) NOT NULL,
	ActionColumnId INT NOT NULL,
	ActionField VARCHAR(30) NOT NULL,
	ActionPanel VARCHAR(50) NOT NULL,
	ActionTime SMALLDATETIME DEFAULT GETDATE(),
	ActionType TINYINT NOT NULL -- { Insert:1,Update:2,Delete:3 }
)
GO
CREATE TYPE [Log].[UserActionTableType] AS TABLE
(
	PreviousValue NVARCHAR(MAX) NULL,
	CurrentValue NVARCHAR(MAX) NULL,
	UserId INT NOT NULL,
	UserType TINYINT NOT NULL,	-- { Admin:1,Merchant:2,Customer:3 }
	ActionTable VARCHAR(30) NOT NULL,
	ActionColumnId INT NOT NULL,
	ActionField VARCHAR(30) NOT NULL,
	ActionPanel VARCHAR(50) NOT NULL,
	ActionType TINYINT NOT NULL -- { Insert:1,Update:2,Delete:3 }
)
GO

CREATE PROC [Log].[USP_InsertUserActionHistory]
(
	@userAction [Log].[UserActionTableType] READONLY
)
AS
BEGIN
	INSERT [Log].UserActionHistory
	(
		PreviousValue,
		CurrentValue,
		UserId,
		UserType,
		ActionTable,
		ActionColumnId,
		ActionField,
		ActionPanel,
		ActionType
	)
	SELECT
		PreviousValue,
		CurrentValue,
		UserId,
		UserType,
		ActionTable,
		ActionColumnId,
		ActionField,
		ActionPanel,
		ActionType
	FROM @userAction
END
GO

CREATE PROC Deal.USP_UpdateRequestProductInfo
(
	@id INT,
	@name NVARCHAR(100),
	@description NVARCHAR(500),
	@price FLOAT = 0.0,
	@exDate SMALLDATETIME = '',
	@custId INT = 0,
	@custName NVARCHAR(50) = '',
	@custEmail VARCHAR(50) = '',
	@confirm TINYINT = 0,
	@untrkId INT = 0,
	@userId INT,
	@panel VARCHAR(50) = ''
)
AS
BEGIN
BEGIN TRANSACTION
	BEGIN TRY	
		DECLARE @actionTVP AS [Log].[UserActionTableType]

		IF(@custId = 0 AND @untrkId <> 0)
			BEGIN
				DECLARE @custExName NVARCHAR(50)='',
						@custExEmail NVARCHAR(50)=''
				SELECT @custExName = [Name], @custExEmail = [Email] FROM dbo.UntrackedUser WHERE Id = @untrkId

				UPDATE dbo.UntrackedUser 
				SET [Name] = @custName
				, [Email] = @custEmail 
				WHERE Id = @untrkId

				IF(@custName <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@custExName, @custName,@userId,1,'dbo.UntrackedUser',@untrkId,'Name',@panel,2)
					END
				IF(@custEmail <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@custExEmail, @custEmail,@userId,1,'dbo.UntrackedUser',@untrkId,'Email',@panel,2)
					END
			END
		IF(@id <> 0)
			BEGIN
				DECLARE @pExName NVARCHAR(100)='',
						@pExDesc NVARCHAR(500)='',
						@pExPrice MONEY = 0,
						@pExDate SMALLDATETIME = '',
						@exConfirm TINYINT = 0
				SELECT 
					@pExName = [ProductName],
					@pExDesc = [Description], 
					@pExPrice = [Price], 
					@pExDate=[ExpectedDate],
					@exConfirm=IsCustomerConfirm 
				FROM Deal.RequestedProduct WHERE Id = @id

				UPDATE Deal.RequestedProduct 
				SET [ProductName] = @name
				, [Description] = @description
				, [Price]=@price
				,[ExpectedDate]=@exDate
				, IsCustomerConfirm=@confirm
				WHERE Id = @id

				IF(@name <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@pExName, @name,@userId,1,'Deal.RequestedProduct',@id,'ProductName',@panel,2)
					END
				IF(@description <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@pExDesc, @description,@userId,1,'Deal.RequestedProduct',@id,'Description',@panel,2)
					END
				IF(@price <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@price, @price,@userId,1,'Deal.RequestedProduct',@id,'Price',@panel,2)
					END
				IF(@exDate <> '')
					BEGIN
						INSERT INTO @actionTVP VALUES (@pExDate, @exDate,@userId,1,'Deal.RequestedProduct',@id,'ExpectedDate',@panel,2)
					END
				IF(@confirm <> 0)
					BEGIN
						INSERT INTO @actionTVP VALUES (@exConfirm, @confirm,@userId,1,'Deal.RequestedProduct',@id,'IsCustomerConfirm',@panel,2)
					END

				EXEC [Log].[USP_InsertUserActionHistory] @actionTVP
			END
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION
			END
	END CATCH
	IF(@@TRANCOUNT > 0)
		BEGIN
			COMMIT TRANSACTION
		END
END

GO
CREATE PROC Deal.USP_UpdateRequestProduct
@requestId INT,
@status TINYINT,
@userId INT,
@panel VARCHAR(50) = ''
AS
BEGIN
	BEGIN TRANSACTION
		BEGIN TRY
			DECLARE @actionTVP AS [Log].[UserActionTableType],
					@exStatus TINYINT
			SELECT @exStatus = IsCustomerConfirm FROM Deal.RequestedProduct WHERE Id=@requestId

			UPDATE Deal.RequestedProduct SET IsCustomerConfirm = @status WHERE Id = @requestId

			IF(@status <> 0)
				BEGIN
					INSERT INTO @actionTVP VALUES (@exStatus, @status,@userId,1,'Deal.RequestedProduct',@requestId,'IsCustomerConfirm',@panel,2)
				END
			EXEC [Log].[USP_InsertUserActionHistory] @actionTVP
		END TRY
		BEGIN CATCH
			IF(@@TRANCOUNT > 0)
				BEGIN
					ROLLBACK TRANSACTION
				END
		END CATCH
	IF(@@TRANCOUNT > 0)
		BEGIN
			COMMIT TRANSACTION
		END
END