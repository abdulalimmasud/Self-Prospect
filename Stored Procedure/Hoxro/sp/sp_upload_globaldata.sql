ALTER PROCEDURE [dbo].[sp_adding_new_company_GlobalData]
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

				INSERT INTO [dev].[User]
					(UserId, UserName, CompanyId)
				SELECT UserId, UserName, @CompanyId FROM [trn].[User] WHERE CompanyId = @CompanyId

				
				

				INSERT INTO [dev].[EntityType]
					(EntityTypeId, CompanyId, [Name])
				SELECT EntityTypeId, @CompanyId, [Name] FROM [std].[EntityType] WHERE CompanyId = @CompanyId
				
				
				INSERT INTO [dev].[Client]
					([ClientId], [ClientFullName], [CompanyId])
				SELECT [ClientId], [ClientFullName], @CompanyId FROM mtr.Client WHERE CompanyId = @CompanyId

				INSERT INTO [dev].[MatterType]
					(MatterTypeId, [Name])
				SELECT MatterTypeId, [Name] FROM [mtr].[MatterType] WHERE CompanyId = @CompanyId
				
				
				INSERT INTO [dev].[WorkType]
					([WorkTypeId], [Name], [CompanyId])
				SELECT [WorkTypeId], [Name], @CompanyId FROM mtr.WorkType WHERE CompanyId = @CompanyId

				
				
				
				INSERT INTO @Fields
					(FieldId, [Name], RowNo, [Type])
				SELECT 
					FieldId, [Name], RowNo =  ROW_NUMBER() OVER(ORDER BY FieldId), [Type] FROM std.Field WHERE 
					CompanyId=@CompanyId 
					AND [Name] NOT IN(SELECT [Name] FROM @DefaultFields WHERE [Name] IN ('ClientLibraryId','Notes','Biller', 'LinkMatterId', 'SerialNumber', 'OpponentLastName','ClientPhone', 'ClientDateOfBirth', 'ClientAddress','ClientBankAccount1','ClientBankAccount2','ClientBankAccount3','ClientSalarySlip','ClientPassport','ClientDrivingLicense','ClientNationalInsuranceNumber','ClientGender'))

				Set @msg = Convert(VarChar(10), 20);
				RaisError(@msg, 1, 1) With NoWait

				--PRINT 'Test '+ CONVERT(NVARCHAR(50), @cnt)
				WHILE @cnt < @total_cnt
				BEGIN
				   SELECT @FieldId = FieldId, @Name = [Name], @FieldType = [Type] FROM @Fields WHERE RowNo = @cnt

				   --PRINT 'Loop = '+CONVERT(NVARCHAR(50), @cnt)
				   --PRINT 'FieldId = '+CONVERT(NVARCHAR(50), @FieldId)
				   --SET @query = 'INSERT INTO gbd.GlobalData(CompanyId,CreatedBy,CreatedDate,FieldId,Initialvalue,IsDeleted,MatterId,ModifiedDate,[Name]) SELECT '+CONVERT(nvarchar(50), @CompanyId)+','+CONVERT(nvarchar(50), @CreatedBy)+','+@CreatedDatetime+','+ CONVERT(nvarchar(50), @FieldId) +', dt.'+@Name+',0,mtr.MatterId,'+@ModifiedDatetime+','''+@Name+''' FROM dbo.[Data] dt INNER JOIN mtr.Matter mtr on mtr.MatterRef = dt.MatterRef where dt.'+@Name+' is not null'
				   SET @query = 'INSERT INTO gbd.GlobalData(CompanyId,CreatedBy,CreatedDate,FieldId,[Type],Initialvalue,IsDeleted,MatterId,ModifiedDate,[Name]) SELECT '+CONVERT(nvarchar(50), @CompanyId)+','+CONVERT(nvarchar(50), @CreatedBy)+',GETDATE(),'+ CONVERT(nvarchar(50), @FieldId)+ ','+ CONVERT(nvarchar(20), @FieldType)+',CAST(dt.['+@Name+'] AS NVARCHAR(1000)),0,m.MatterId,GETDATE(),'''+@Name+''' FROM dbo.[Data] dt INNER JOIN [mtr].[Matter] m on m.MatterRef = dt.MatterRef where CAST(dt.['+@Name+'] AS NVARCHAR(1000)) NOT IN (''0'', '''') AND CAST(dt.['+@Name+'] AS NVARCHAR(1000)) IS NOT NULL AND m.CompanyId='+CONVERT(nvarchar(50), @CompanyId)+''
				   print @query
				   EXECUTE(@query)
				   SET @cnt = @cnt + 1;
				   SET @Calculation =20 + (@cnt*30/@total_cnt);
				   SET @msg = Convert(VarChar(10), @Calculation) ;
				   RAISERROR(@msg, 1, 1) With NoWait

				END;
				--SELECT * FROM [gbd].[GlobalData] WHERE CompanyId = @CompanyId
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




--EXEC [dbo].[sp_adding_new_company_GlobalData] 59


--BEGIN TRAN
--INSERT INTO gbd.GlobalData(CompanyId,CreatedBy,CreatedDate,FieldId,[Type],Initialvalue,IsDeleted,MatterId,ModifiedDate,[Name]) SELECT 59,247,GETDATE(),13519,1, CAST(dt.[DateInstructionsReceived] AS nvarchar) ,0,m.MatterId,GETDATE(),'DateInstructionsReceived' FROM dbo.[Data] dt INNER JOIN [mtr].[Matter] m on m.MatterRef = dt.MatterRef where CAST(dt.[DateInstructionsReceived] AS nvarchar) NOT IN ('0', '') AND CAST(dt.[DateInstructionsReceived] AS nvarchar) IS NOT NULL AND m.CompanyId=59

--ROLLBACK