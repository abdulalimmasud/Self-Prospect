ALTER PROCEDURE [mtr].[sp_matter_create]
(
	@CompanyId INT, 
	@MatterRef NVARCHAR(50), 
	@SerialNumber INT, 
	@ClientId INT = 0, 
	@ClientFirstName NVARCHAR(50), 
	@ClientLastName NVARCHAR(50), 
	@WorkTypeId INT, 
	@MatterTypeId INT, 
	@LinkMatterId INT = 0, 
	@BillerId INT, 
	@BillingTypeId INT, 
	@Amount DECIMAL(18,2) = 0.0,
	@IsPinned BIT = 0, 
	@EntityTypeId INT,
	@CreatedBy INT
)
AS
BEGIN
	--SET NOCOUNT ON
	DECLARE @Message NVARCHAR(200),
			@StatusCode INT,
			@MatterId INT,
			@ScreenId INT,
			@CategoryId INT,
			@TransactionName VARCHAR(50) = 'matter_create'
	BEGIN TRY
		BEGIN TRANSACTION @TransactionName

			--CLIENT CHECK AND INSERT
			IF(@ClientId IS NULL OR @ClientId = 0)
				BEGIN
					INSERT INTO mtr.Client
						([ClientFirstName], [ClientLastName], [CompanyName], [ClientFullName], [EntityTypeId], [CompanyId], [IsDeleted], [GenderId], [CreatedDate], [ModifiedDate])
					VALUES
						(@ClientFirstName, @ClientLastName, '', @ClientFirstName+' '+@ClientLastName, @EntityTypeId, @CompanyId, 0,  NULL, GETDATE(), GETDATE())
					SET @ClientId = SCOPE_IDENTITY()
				END
			--MATTER INSERT
			INSERT INTO mtr.Matter
				([CompanyId], [ClientId], [MatterRef], [MatterStatusId], [StateId], [Biller], [CreatedDate], [ModifiedDate], [SerialNumber], [WorkTypeId], [IsDeleted], [LinkMatterId], [IsPinned], [LastAccessedDate])
			VALUES
				(@CompanyId, @ClientId, @MatterRef, 1, 1, @BillerId, GETDATE(), GETDATE(), @SerialNumber, @WorkTypeId, 0, @LinkMatterId, @IsPinned, GETDATE())
			SET @MatterId = SCOPE_IDENTITY()

			--MATTER ORDERRING
			DECLARE @ObjectTypeId INT
			SELECT @ObjectTypeId = ObjectTypeId FROM [gbl].[ObjectType] WHERE [ObejctTypeName] = 'Matter'			
			
			IF(@IsPinned = 1)
				BEGIN
					IF(@CreatedBy <> @BillerId)
						BEGIN
							INSERT INTO [trn].[ObjectOrdering]
								([ObjectTypeId], [ObjectTypeName], [ObjectId], [OrderIndex], [IsPinned], [UserId], [CompanyId], [Biller])
							VALUES
								(@ObjectTypeId, 'Matter', @MatterId, 0, @IsPinned, @CreatedBy, @CompanyId, @BillerId),
								(@ObjectTypeId, 'Matter', @MatterId, 0, 0, @BillerId, @CompanyId, @BillerId)
						END
					ELSE
						BEGIN
							INSERT INTO [trn].[ObjectOrdering]
							([ObjectTypeId], [ObjectTypeName], [ObjectId], [OrderIndex], [IsPinned], [UserId], [CompanyId], [Biller])
						VALUES
							(@ObjectTypeId, 'Matter', @MatterId, 0, @IsPinned, @BillerId, @CompanyId, @BillerId)
						END
				END
			ELSE
				BEGIN
					INSERT INTO [trn].[ObjectOrdering]
							([ObjectTypeId], [ObjectTypeName], [ObjectId], [OrderIndex], [IsPinned], [UserId], [CompanyId], [Biller])
						VALUES
							(@ObjectTypeId, 'Matter', @MatterId, 0, @IsPinned, @BillerId, @CompanyId, @BillerId)
				END

			--GLOBALDATA INSERT
			DECLARE @MatterRefFieldId INT, 
					@MatterRefFieldType INT,
			        @ClientLibraryContentFieldId INT, 
					@ClientLibraryContentFieldType INT,
					@ClientFirstNameFieldId INT, 
					@ClientFirstNameFieldType INT, 
					@ClientLastNameFieldId INT, 
					@ClientLastNameFieldType INT, 
					@MatterTypeFieldId INT, 
					@MatterTypeFieldType INT, 
					@WorkTypeFieldId INT, 
					@WorkTypeFieldType INT, 
					@BillerFieldId INT , 
					@BillerFieldType INT ,
					@LinkMatterFieldId INT, 
					@LinkMatterFieldType INT,
					@SerialNumberFieldId INT, 
					@SerialNumberFieldType INT,
					@MatterTypeName NVARCHAR(200), 
					@WorkTypeName NVARCHAR(200),
					@UserFullName NVARCHAR(100)
					 		    
			SELECT @MatterRefFieldId = FieldId, @MatterRefFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='MatterRef'
			SELECT @ClientLibraryContentFieldId = FieldId, @ClientLibraryContentFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='ClientLibraryContentId'
			SELECT @ClientFirstNameFieldId = FieldId, @ClientFirstNameFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='ClientFirstName'
			SELECT @ClientLastNameFieldId = FieldId, @ClientLastNameFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='ClientLastName'
			SELECT @MatterTypeFieldId = FieldId, @MatterTypeFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='MatterType'
			SELECT @WorkTypeFieldId = FieldId, @WorkTypeFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='WorkType'
			SELECT @BillerFieldId = FieldId, @BillerFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='Biller'
			SELECT @LinkMatterFieldId = FieldId, @LinkMatterFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='LinkMatterId'
			SELECT @SerialNumberFieldId = FieldId, @SerialNumberFieldType = [Type] FROM std.Field WHERE CompanyId = @CompanyId and [Name]='SerialNumber'

			SELECT @MatterTypeName = [Name] FROM mtr.MatterType WHERE  MatterTypeId = @MatterTypeId  
			SELECT @WorkTypeName = [Name] FROM mtr.WorkType WHERE WorkTypeId=@WorkTypeId
			SELECT @UserFullName = ([FirstName]+ ' '+[LastName])  FROM [trn].[User] WHERE [UserId] = @BillerId
			
			--SELECT 
			--	@ClientFirstName 'ClientFirstName',
			--	@ClientLastName 'ClientLastName',
			--	@MatterTypeName 'MatterTypeName',
			--	@WorkTypeName 'WorkTypeName',
			--	@UserFullName 'UserFullName',
			--	CAST(ISNULL(@LinkMatterId,'')AS NVARCHAR(MAX)) 'LinkMatterId',
			--	CAST(@SerialNumber AS NVARCHAR(50)) 'SerialNumber',
			--	CAST(@MatterRef AS NVARCHAR(50)) 'MatterRef'
		--	SELECT @ClientFirstNameFieldType

			INSERT INTO [gbd].[GlobalData]
				([Name], [Initialvalue], [CompanyId], [MatterId], [ModifiedDate], [CreatedDate], [FieldId], [IsDeleted],[CreatedBy], [Type])
			VALUES
				
				('ClientFirstName', @ClientFirstName, @CompanyId, @MatterId, GETDATE(), GETDATE(), @ClientFirstNameFieldId, 0, @CreatedBy, @ClientFirstNameFieldType)
				,('ClientLastName', @ClientLastName, @CompanyId, @MatterId, GETDATE(), GETDATE(), @ClientLastNameFieldId, 0, @CreatedBy, @ClientLastNameFieldType)
				,('MatterType', @MatterTypeName, @CompanyId, @MatterId, GETDATE(), GETDATE(), @MatterTypeFieldId, 0, @CreatedBy, @MatterTypeFieldType)
				,('WorkType', @WorkTypeName, @CompanyId, @MatterId, GETDATE(), GETDATE(), @WorkTypeFieldId, 0, @CreatedBy, @WorkTypeFieldType)
				,('Biller', @UserFullName, @CompanyId, @MatterId, GETDATE(), GETDATE(), @BillerFieldId, 0, @CreatedBy, @BillerFieldType)
				,('LinkMatterId', CAST(ISNULL(@LinkMatterId,'') AS NVARCHAR(MAX)), @CompanyId, @MatterId, GETDATE(), GETDATE(), @LinkMatterFieldId, 0, @CreatedBy,@LinkMatterFieldType)
				,('SerialNumber', CAST(@SerialNumber AS NVARCHAR(50)), @CompanyId, @MatterId, GETDATE(), GETDATE(), @SerialNumberFieldId, 0, @CreatedBy,@SerialNumberFieldType)
				,('MatterRef', CAST(@MatterRef AS NVARCHAR(50)), @CompanyId, @MatterId, GETDATE(), GETDATE(), @MatterRefFieldId, 0, @CreatedBy,@MatterRefFieldType)
			
			--MatterCategoryScreen Map
			SELECT @ScreenId = [ScreenId] FROM [scr].[Screen] WHERE [CompanyId] = @CompanyId AND [IsClientDeatils] = 1
			SELECT @CategoryId = [CategoryId] FROM [scr].[Category] WHERE [CompanyId] = @CompanyId AND [IsClient] = 1

			INSERT INTO [mtr].[MatterCategoryScreenMap]
				([MatterId], [CompanyId], [IsDeleted], [CategoryId], [ScreenId], [CreatedDate], [ModifiedDate])
			VALUES
				(@MatterId, @CompanyId, 0, @CategoryId, @ScreenId, GETDATE(), GETDATE())


			--BILLING INSERT
			INSERT INTO [bil].[Billing]
				([CompanyId], [MatterId], [Amount], [Name], [CreatedDate], [ModifiedDate], [Biller], [TotalExpence],[BillingTypeId], [BillingStatusId],[IsDeleted])
			VALUES
				(@CompanyId, @MatterId, @Amount, '', GETDATE(), GETDATE(), @BillerId, @Amount, @BillingTypeId, 1,0)

			SET @StatusCode = 200
			SET @Message = 'Matter Successfully Created'
		COMMIT TRANSACTION @TransactionName
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION @TransactionName
			END
		SET @StatusCode = 406
		SET @Message = ERROR_MESSAGE()
		PRINT ERROR_MESSAGE()
	END CATCH

	--SET NOCOUNT OFF
	SELECT @StatusCode 'StatusCode', @Message 'Message', @MatterId 'MatterId'
	
END



--EXEC [mtr].[sp_matter_create] @CompanyId = 2, @MatterRef = '10001', @SerialNumber = 10001, @ClientId = 0, @ClientFirstName = 'spTest', @ClientLastName = 'CreateMatter',@WorkTypeId = 3,@MatterTypeId = 3,@LinkMatterId =0,@BillerId= 1,@BillingTypeId=1,@Amount = 28.0,@IsPinned=1,@EntityTypeId=1,@CreatedBy =1
--select * from std.Field where 

--select top 2* from STD.Field WHERE InitialValue=

--select * from [mtr].[WorkType]