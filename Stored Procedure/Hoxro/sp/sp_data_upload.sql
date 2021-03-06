ALTER PROCEDURE [dbo].[sp_adding_new_company_datas]
(
	@CompanyId INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			DECLARE @CreatedBy INT
			DECLARE @DefaultFields TABLE
			(
				[Name] nvarchar(30) NOT NULL,
				[Type] INT
			)

			DECLARE @cnt INT = 1;
			DECLARE @total_cnt INT = 0;
			DECLARE @query NVARCHAR(MAX);
			DECLARE @FieldId INT;
			DECLARE @FieldType INT;
			DECLARE @Name NVARCHAR(MAX);
			DECLARE @CreatedDatetime DATETIME = GETDATE();
			DECLARE @ModifiedDatetime DATETIME = GETDATE();
			DECLARE @SerialStartFrom INT = 10000;
			DECLARE @ClientScreenId INT;
			DECLARE @ClientCategoryId INT;
			Declare @msg VarChar(50);
			Declare @Calculation INT;
			DECLARE @ObjectTypeId INT;
			DECLARE @MatterObj NVARCHAR(20) = 'Matter';
			DECLARE @LastSerialNumber INT;
			DECLARE @UserRoleId INT;

			DECLARE @Fields TABLE
			(
				FieldId int,
				[Name] nvarchar(MAX) NOT NULL,
				RowNo int,
				[Type] int
			)
			-- Adding system fields
			INSERT INTO @DefaultFields
				([Name], [Type])
			VALUES
				('MatterRef',3)
				,('ClientFirstName',3)
				,('ClientLastName',3)
				,('ClientMiddleName',3)
				,('MatterType',3)
				,('WorkType',3)
				,('Biller',3)
				,('LinkMatterId',3)
				,('OpponentFirstName', 3)
				,('OpponentLastName', 3)
				,('SerialNumber',3)
				,('EntityType', 3)
				,('Notes', 3)
				,('ClientLibraryId', 3)
				,('ClientPhone', 3)
				,('ClientDateOfBirth', 3)
				,('ClientAddress', 3)
				,('ClientBankAccount1', 3)
				,('ClientBankAccount2', 3)
				,('ClientBankAccount3', 3)
				,('ClientSalarySlip', 3)
				,('ClientPassport', 3)
				,('ClientDrivingLicense', 3)
				,('ClientNationalInsuranceNumber', 3)
				,('ClientGender', 3)
				

			TRUNCATE TABLE [dev].[Category]
			TRUNCATE TABLE [dev].[Client]
			TRUNCATE TABLE [dev].[EntityType]
			TRUNCATE TABLE [dev].[MatterType]
			TRUNCATE TABLE [dev].[User]
			TRUNCATE TABLE [dev].[WorkType]

				SELECT TOP 1 @CreatedBy = UserId FROM [trn].[User] WHERE CompanyId = @CompanyId
				--SET @CreatedBy = 2
				SELECT @UserRoleId = RoleId FROM [sec].[Role] WHERE @CompanyId = CompanyId AND [Name] = 'User'
				INSERT INTO trn.[User]
					(FirstName, LastName, FullName, Email, UserName, Is2FA, IsActive, CompanyId, IsPasswordDefault, IsExpired, IsDeleted, CreatedDate, ModifiedDate, RoleId)
				SELECT DISTINCT 
					FirstName = REPLACE(Handler,' ',''), LastName = REPLACE(Handler,' ',''),FullName = REPLACE(Handler,' ',''), Email = REPLACE(Handler,' ','')+'5@default.com', UserName = REPLACE(Handler,' ',''), Is2FA=0, IsActive=0, CompanyId=@CompanyId, IsPasswordDefault=1, IsExpired=1, IsDeleted=0, @CreatedDatetime, @ModifiedDatetime, @UserRoleId FROM dbo.Documents WHERE Handler IS NOT NULL

				INSERT INTO [trn].[UserCompany]
					([UserId], [UserName], [IsActive], [IsApproved], [RoleId], [CompanyId], [CreatedDate], [ModifiedDate], [IsDeleted])
				SELECT [UserId], [UserName], 0, 0, @UserRoleId, @CompanyId, @CreatedDatetime, @ModifiedDatetime, 0 FROM trn.[User] u
				WHERE CompanyId = @CompanyId AND NOT EXISTS (SELECT 1 FROM [trn].[UserCompany] WHERE CompanyId = @CompanyId AND UserId = u.UserId)

				INSERT INTO [dev].[User]
					(UserId, UserName, CompanyId)
				SELECT UserId, UserName, @CompanyId FROM [trn].[User] WHERE CompanyId = @CompanyId

				
				INSERT INTO [std].[EntityType]
					([Name], CompanyId, IsDeleted, CreatedDate, CreatedBy, ModifiedDate)
				SELECT DISTINCT 
					EntityType , @CompanyId, 0, @CreatedDatetime, @CreatedBy, @ModifiedDatetime FROM dbo.[Data]

				INSERT INTO [dev].[EntityType]
					(EntityTypeId, CompanyId, [Name])
				SELECT EntityTypeId, @CompanyId, [Name] FROM [std].[EntityType] WHERE CompanyId = @CompanyId
				
				Set @msg = Convert(VarChar(10), 2);
				RaisError(@msg, 1, 1) With NoWait

				INSERT INTO mtr.Client
					(ClientFirstName, ClientLastName, ClientMiddleName, ClientFullName, CompanyId, CompanyName, CreatedDate, EntityTypeId, GenderId, IsDeleted, ModifiedDate)
				SELECT distinct
					ISNULL(ClientFirstName,''), ISNULL(ClientLastName, ''), ISNULL(ClientMiddleName, ''), ClientFullName, @CompanyId,'', @CreatedDatetime, EntityTypeId = std.ufnGetEntityIdByName(@CompanyId,EntityType), GenderId = gbl.ufnGetGenderIdByName('Male'), 0, @ModifiedDatetime FROM dbo.[Data] 
				

				INSERT INTO [dev].[Client]
					([ClientId], [ClientFullName], [CompanyId])
				SELECT [ClientId], [ClientFullName], @CompanyId FROM mtr.Client WHERE CompanyId = @CompanyId

				INSERT INTO mtr.MatterType
					([Name], CompanyId, CreatedDate, [Description], IsDeleted, ModifiedDate)
				SELECT DISTINCT 
					MatterType, @CompanyId, @CreatedDatetime, MatterType, 0, @ModifiedDatetime FROM dbo.[Data]

				INSERT INTO [dev].[MatterType]
					(MatterTypeId, [Name])
				SELECT MatterTypeId, [Name] FROM [mtr].[MatterType] WHERE CompanyId = @CompanyId
				
				Set @msg = Convert(VarChar(10), 10);
				RaisError(@msg, 1, 1) With NoWait


				--INSERT INTO mtr.MatterType([Name],CompanyId,CreatedDate,[Description],IsDeleted,ModifiedDate)
				--SELECT distinct MatterType,@CompanyId,@CreatedDatetime,MatterType,0,@ModifiedDatetime FROM dbo.[Data]

				INSERT INTO mtr.WorkType
					([Name], CompanyId, CreatedDate, MatterTypeId, IsDeleted, ModifiedDate, [IsConflictCheck], [IsAMLCheck], [IsIDCheck])
				SELECT DISTINCT 
					WorkType, @CompanyId, @CreatedDatetime, mtr.ufnGetMatterTypeIdByName(MatterType), 0, @ModifiedDatetime, 0, 0, 0 FROM dbo.[Data]

				INSERT INTO [dev].[WorkType]
					([WorkTypeId], [Name], [CompanyId])
				SELECT [WorkTypeId], [Name], @CompanyId FROM mtr.WorkType WHERE CompanyId = @CompanyId

				INSERT INTO mtr.Matter
					(CompanyId, ClientId, CreatedDate, IsDeleted, IsPinned, LinkMatterId, MatterRef, MatterStatusId, StateId, Biller, ModifiedDate, SerialNumber, WorkTypeId,LastAccessedDate)
				SELECT 
					@CompanyId, mtr.ufnClientIdByName(@CompanyId,ClientFullName), @CreatedDatetime, 0, 1, '',[MatterRef], 1, 1, [trn].[ufnUserIdByUserName](FeeEarner, @CompanyId), @ModifiedDatetime, @SerialStartFrom+ROW_NUMBER() OVER(ORDER BY MatterRef), mtr.ufnWorkTypeIdByName(@CompanyId,WorkType),@CreatedDatetime FROM dbo.[Data]
				
				Set @msg = Convert(VarChar(10), 12);
				RaisError(@msg, 1, 1) With NoWait

				INSERT INTO bil.Billing
					(Amount, Biller, BillingStatusId, CompanyId, CreatedDate, IsDeleted, MatterId, ModifiedDate, [Name], SelectedDraftId, TotalExpence,BillingTypeId)
				SELECT 
					0, @CreatedBy, 1, @CompanyId, @CreatedDatetime, 0, mtr.MatterId, @ModifiedDatetime, 'billing', NULL, 0,2 FROM mtr.Matter mtr WHERE mtr.CompanyId = @CompanyId
				
				Set @msg = Convert(VarChar(10), 13);
				RaisError(@msg, 1, 1) With NoWait

				SELECT @ObjectTypeId = ObjectTypeId FROM [gbl].[ObjectType] WHERE [ObejctTypeName]= @MatterObj

				
				INSERT INTO [trn].[ObjectOrdering]
				(
					[ObjectTypeId]
					, [ObjectTypeName]
					, [ObjectId]
					, [OrderIndex]
					, [IsPinned]
					, [UserId]
					, [CompanyId]
					, [Biller]
				)
				SELECT @ObjectTypeId, @MatterObj, MatterId, 0, 0, Biller, @CompanyId, Biller FROM [mtr].[Matter] WHERE CompanyId = @CompanyId

				Set @msg = Convert(VarChar(10), 15);
				RaisError(@msg, 1, 1) With NoWait
				
				INSERT INTO std.Field
					([Name], CompanyId, CreatedBy, CreatedDate, DataType, InitialValue, IsDeleted, IsRequired, LabelName, ModifiedDate, PermissionId, Placeholder, [Type], [IsGroupField])
				SELECT 
					[Name], @CompanyId, @CreatedBy, @CreatedDatetime, 'Text', '', 0,  0, [Name], @ModifiedDatetime, Null, [Name], [Type], 0 FROM @DefaultFields WHERE [Name] not in (SELECT [Name] FROM [std].[Field] WHERE CompanyId = @CompanyId)
				
				INSERT INTO std.Field
					([Name], CompanyId, CreatedBy, CreatedDate, DataType, InitialValue, IsDeleted, IsRequired, LabelName, ModifiedDate, PermissionId, Placeholder, [Type], [IsGroupField])
				SELECT 
					[COLUMN_NAME], @CompanyId, @CreatedBy, @CreatedDatetime, 'Text', '', 0, 0, [COLUMN_NAME], @ModifiedDatetime, Null, [COLUMN_NAME], 1, 0 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'Data' AND [COLUMN_NAME] not in (SELECT [Name] FROM @DefaultFields)

				INSERT INTO @Fields
					(FieldId, [Name], RowNo, [Type])
				SELECT 
					FieldId, [Name], RowNo =  ROW_NUMBER() OVER(ORDER BY FieldId), [Type] FROM std.Field WHERE 
					CompanyId=@CompanyId 
					AND [Name] NOT IN(SELECT [Name] FROM @DefaultFields WHERE [Name] IN ('ClientLibraryId','Notes','Biller', 'LinkMatterId', 'SerialNumber', 'OpponentLastName','ClientPhone', 'ClientDateOfBirth', 'ClientAddress','ClientBankAccount1','ClientBankAccount2','ClientBankAccount3','ClientSalarySlip','ClientPassport','ClientDrivingLicense','ClientNationalInsuranceNumber','ClientGender'))

				--SELECT COUNT(FieldId) FROM @Fields

				--SELECT * FROM @SystemField
				SELECT @total_cnt = COUNT(*) FROM @Fields
				
				--SELECT @total_cnt

				Set @msg = Convert(VarChar(10), 20);
				RaisError(@msg, 1, 1) With NoWait


				WHILE @cnt < @total_cnt
				BEGIN
				   SELECT @FieldId = FieldId, @Name = [Name], @FieldType = [Type] FROM @Fields WHERE RowNo = @cnt
				   --SET @query = 'INSERT INTO gbd.GlobalData(CompanyId,CreatedBy,CreatedDate,FieldId,Initialvalue,IsDeleted,MatterId,ModifiedDate,[Name]) SELECT '+CONVERT(nvarchar(50), @CompanyId)+','+CONVERT(nvarchar(50), @CreatedBy)+','+@CreatedDatetime+','+ CONVERT(nvarchar(50), @FieldId) +', dt.'+@Name+',0,mtr.MatterId,'+@ModifiedDatetime+','''+@Name+''' FROM dbo.[Data] dt INNER JOIN mtr.Matter mtr on mtr.MatterRef = dt.MatterRef where dt.'+@Name+' is not null'
				   SET @query = 'INSERT INTO gbd.GlobalData(CompanyId,CreatedBy,CreatedDate,FieldId,[Type],Initialvalue,IsDeleted,MatterId,ModifiedDate,[Name]) SELECT '+CONVERT(nvarchar(50), @CompanyId)+','+CONVERT(nvarchar(50), @CreatedBy)+',GETDATE(),'+ CONVERT(nvarchar(50), @FieldId)+ ','+ CONVERT(nvarchar(20), @FieldType)+',CAST(dt.['+@Name+'] AS NVARCHAR(1000)),0,m.MatterId,GETDATE(),'''+@Name+''' FROM dbo.[Data] dt INNER JOIN [mtr].[Matter] m on m.MatterRef = dt.MatterRef where CAST(dt.['+@Name+'] AS NVARCHAR(1000)) NOT IN (''0'', '''') AND CAST(dt.['+@Name+'] AS NVARCHAR(1000)) IS NOT NULL AND m.CompanyId='+CONVERT(nvarchar(50), @CompanyId)
				   --print @query
				   EXECUTE(@query)
				   SET @cnt = @cnt + 1;
				   SET @Calculation =20 + (@cnt*30/@total_cnt);
				   SET @msg = Convert(VarChar(10), @Calculation) ;
				   RAISERROR(@msg, 1, 1) With NoWait

				END;
				IF NOT EXISTS(SELECT 1 FROM scr.Category WHERE CompanyId = @CompanyId AND [Name] = 'Client')
					BEGIN
						INSERT INTO scr.Category
							(CategoryTypeId, CompanyId, CreatedDate, [Description], IsClient, IsDeleted, ModifiedDate, [Name], WorkTypeId)
						VALUES
							(1, @CompanyId, @CreatedDatetime, 'Client', 1, 0, @ModifiedDatetime, 'Client', null)
					END
				INSERT INTO scr.Category
					(CategoryTypeId, CompanyId, CreatedDate, [Description], IsClient, IsDeleted, ModifiedDate, [Name], WorkTypeId)
				SELECT DISTINCT 
					1, @CompanyId, @CreatedDatetime, Party, 0, 0, @ModifiedDatetime, Party, null FROM dbo.Documents WHERE Party NOT IN ('','client','Client') 
			    
				INSERT INTO [dev].[Category]
					([CategoryId], [Name], [CompanyId])
				SELECT [CategoryId], [Name], @CompanyId FROM scr.Category WHERE CompanyId = @CompanyId


				SELECT  @ClientCategoryId = CategoryId FROM scr.Category WHERE CompanyId = @CompanyId AND [Name] = 'Client'
				SELECT  @ClientScreenId = ScreenId FROM scr.Screen WHERE CompanyId = @CompanyId AND [Name] = 'Client Details'

				INSERT INTO mtr.MatterCategoryScreenMap(CompanyId,CategoryId,CreatedDate,IsDeleted,MatterId,ModifiedDate,ScreenId)
				SELECT @CompanyId,@ClientCategoryId,@CreatedDatetime,0,MatterId,@ModifiedDatetime,@ClientScreenId FROM mtr.Matter WHERE CompanyId = @CompanyId

				Set @msg = Convert(VarChar(10), 60) ;
				RaisError(@msg, 1, 1) With NoWait

				INSERT INTO mtr.MatterDocument
					(ActionTypeId, Blob, CategoryId, Charge, CreatedDate, Details, DisplayDate, ExtensionId, [FileName], Handler, IsCurrent, IsDeleted, IsDraft, IsLocked, MatterId, ModifiedDate, [Name], ParentId, PrintedDate, TimeSpent, Typist, Unit, VersionNo, CompanyId, IsBillable)

				SELECT gbl.ufnGetActionTypeIdByName
					(doc.[Action type]), 'matter/'+doc.blob+'/'+doc.[File Name], scr.ufnGetCategoryIdByName(doc.Party,@CompanyId), doc.Charge, [History date], doc.Details, [History date], gbl.ufnExtensionIdByName(doc.Extension), doc.[File Name], trn.ufnUserIdByUserName(doc.Handler,@CompanyId), 1, 0, 0, 0, mtr.MatterId, @ModifiedDatetime, doc.[File Name], 0, null, doc.[Time Spent], trn.ufnUserIdByUserName(doc.Typist,@CompanyId), doc.[No of units], 1, @CompanyId, 0 FROM dbo.Documents doc INNER JOIN mtr.Matter mtr on mtr.MatterRef = CONVERT(nvarchar, doc.[MatterRef]) WHERE mtr.CompanyId = @CompanyId AND doc.Extension NOT IN ('NULL','docx.html','PDF.html','txt','xls','')

				Set @msg = Convert(VarChar(10), 100) ;
				RaisError(@msg, 1, 1) With NoWait
				
				--SELECT COUNT(GlobalDataId) FROM [gbd].[GlobalData] WHERE CompanyId = @CompanyId

				--SELECT DISTINCT MatterId FROM [gbd].[GlobalData] WHERE CompanyId = @CompanyId
		
		SELECT MatterRef from mtr.Matter where CompanyId = @CompanyId and ClientId = 91420

		SELECT TOP 1 @LastSerialNumber = SerialNumber FROM [mtr].[Matter] WHERE CompanyId = @CompanyId ORDER BY MatterId DESC

				UPDATE [std].[ApplicationConfigurationValue] SET [Value] = CAST(@LastSerialNumber AS NVARCHAR(50)) WHERE CompanyId = @CompanyId AND AppConfigurationTypeId = 2 AND [Name] = 'SerialNumber'


		COMMIT TRAN
		--ROLLBACK TRAN
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRAN
				PRINT ERROR_MESSAGE()
			END
	END CATCH
END




--EXEC [dbo].[sp_adding_new_company_datas] 59



