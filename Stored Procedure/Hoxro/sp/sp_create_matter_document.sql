ALTER PROC [mtr].[sp_create_matter_document]
(
	@matterId INT,
	@userId INT,
	@companyId INT,
	@extension NVARCHAR(20)='',
	@unit INT = 0,
	@charge DECIMAL(18,2) = 0,
	@timespent NVARCHAR(50) = '00:00:00',
	@timelog BIGINT = 0,
	@parentId INT = 0,
	@actionTypeId INT = 0,
	@name NVARCHAR(1000) = '',
	@filename NVARCHAR(1000) = '',
	@detail NVARCHAR(1000) = '',
	@blob NVARCHAR(1000) = '',
	@extensionId INT = 0,
	@categoryId INT = 0
)
AS
BEGIN
	--PRINT 'connected'
	DECLARE @matterDocumentId INT
	BEGIN TRY
		BEGIN TRAN
		DECLARE @versionNo INT = 0,
				@clientFirstName NVARCHAR(100),
				@clientLastName NVARCHAR(100),
				@serialNumber NVARCHAR(100),
				@tableName NVARCHAR(30)= '[mtr].[MatterDocument]'
				
		IF(@parentId > 0)
			BEGIN
				--PRINT 'Parent Start'
				--IF EXISTS(SELECT 1  FROM [mtr].[MatterDocument] WHERE ParentId = @parentId)
				--BEGIN
					SELECT TOP 1 @versionNo = VersionNo, @actionTypeId = ActionTypeId, @extensionId = ExtensionId, @name = [Name], @filename = [FileName], @categoryId = CategoryId, @detail = Details FROM [mtr].[MatterDocument] WHERE MatterId = @matterId AND ParentId = @ParentId ORDER BY VersionNo DESC
					UPDATE [mtr].[MatterDocument] SET IsCurrent = 0 WHERE MatterId = @matterId AND ParentId = @ParentId
				--END
				--PRINT 'Parent Done'
			END
		ELSE
			BEGIN
				SET @parentId = NULL
			END
		IF(@extensionId = 0)
			BEGIN
				--PRINT 'Extension Start'
				SELECT @extensionId = ExtensionId FROM [gbl].[Extension] WHERE [Name] = @extension
				--PRINT 'Extension done'
			END
		IF(@blob = '')
			BEGIN
				--PRINT 'Blon Start'
				SELECT @clientFirstName = c.ClientFirstName, @clientLastName = c.ClientLastName, @serialNumber = CAST(m.SerialNumber AS NVARCHAR(50)) FROM [mtr].[Matter] m
				INNER JOIN [mtr].[Client] c ON m.ClientId = c.ClientId
				WHERE m.MatterId = @matterId
				--PRINT 'Blon Start'
			END

		IF(@categoryId = 0)
			BEGIN
			--PRINT 'Category Start'
				SELECT @categoryId = CategoryId FROM [scr].[Category] WHERE CompanyId = @companyId AND IsClient = 1 AND [Name] = 'client'
			--PRINT 'Category done'
			END

		--PRINT 'Insert Start'
		INSERT INTO [mtr].[MatterDocument]
		(
			[MatterId]
			, [DisplayDate]
			, [Unit]
			, [Charge]
			, [TimeSpent]
			, [Handler]
			, [Blob]
			, [CreatedDate]
			, [ModifiedDate]
			, [CategoryId]
			, [IsDeleted]
			, [Details]
			, [ActionTypeId]
			, [IsDraft]
			, [IsLocked]
			, [Name]
			, [FileName]
			, [ExtensionId]
			, [ParentId]
			, [VersionNo]
			, [IsCurrent]
			, [CompanyId]
			, [IsBillable]
			, [TimeLog]
		)
		VALUES
		(
			@matterId
			, GETUTCDATE()
			, @unit
			, @charge
			, @timespent
			, @userId
			, ISNULL(NULLIF(@blob, ''), 'matter/'+ @serialNumber + '_'+ @clientFirstName + '_' + @clientLastName + '/' + CAST(IDENT_CURRENT(@tableName) AS NVARCHAR(50))+'.'+@extension)
			, GETUTCDATE()
			, GETUTCDATE()
			, @categoryId
			, 0
			, @detail
			, @actionTypeId
			, 0
			, 0
			, @name
			, @filename
			, @extensionId
			, ISNULL(NULLIF(@parentId, 0), IDENT_CURRENT(@tableName))
			, @versionNo + 1
			, 1
			, @companyId
			, 1
			, @timelog
		)
		--PRINT 'Insert done'
		SET @matterDocumentId = IDENT_CURRENT(@tableName)
		COMMIT
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK
			PRINT ERROR_MESSAGE()
		END
	END CATCH
	SELECT * FROM [mtr].[MatterDocument] WHERE MatterDocumentId = @matterDocumentId
END

--EXEC [mtr].[sp_create_matter_document] 2, 2, 2, 'docx', 0, 0, '00:00:00', 0, 0,1

--SELECT IDENT_CURRENT('[mtr].[MatterDocument]')

--SELECT * FROM [mtr].[MatterDocument] WHERE MatterDocumentId = 938749

--SELECT TOP 10 * FROM [mtr].[MatterDocument] ORDER BY MatterDocumentId DESC

--EXEC [mtr].[sp_create_matter_document] 3425, 2, 2, 'html', 0, 0, '00:00:00',0, 331010


--SELECT * FROM [mtr].[MatterDocument] WHERE ParentId = 331010
--
--SELECT * FROM [gbl].[ActionType] WHERE ActionTypeId = 4
--
--SELECT TOP 1 VersionNo, ActionTypeId, ExtensionId, [Name], [FileName],  CategoryId, Details FROM [mtr].[MatterDocument] WHERE MatterId = 3425 AND ParentId = 331010 ORDER BY VersionNo DESC