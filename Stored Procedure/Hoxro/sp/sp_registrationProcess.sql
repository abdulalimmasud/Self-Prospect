ALTER PROC [std].[sp_register_company]
(
	@TradeName NVARCHAR(50),
	@UserName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Password NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Message NVARCHAR(200) = '',
			@StorageName	NVARCHAR(64) = '',
			@StatusCode INT,
			@UserId INT,
			@CompanyId INT,
			@LibraryId INT
	BEGIN TRY
		BEGIN TRAN
			IF NOT EXISTS(SELECT 1 FROM [std].[Company] WHERE [Name] = @TradeName)
				BEGIN
					IF NOT EXISTS(SELECT 1 FROM [trn].[User] WHERE [UserName] = @UserName)
						BEGIN
							IF NOT EXISTS(SELECT 1 FROM [trn].[User] WHERE [Email] = @Email)
								BEGIN
									DECLARE @LicenseId INT,
											@OwnerRoleId INT,
											@AdminRoleId INT,
											@UserRoleId INT,
											@AppConfigIdConflictType INT,
											@AppConfigIdNumberFormat INT,
											@CategoryId INT,
											@ScreenId INT,
											@ClientPhoneFieldId INT,
											@ClientDOBFieldId INT,
											@ClientAddressFieldId INT,
											@PasswordHash VARBINARY(MAX),
											@Salt VARBINARY(4) = CRYPT_GEN_RANDOM(4)
									----Generate Password Hash
										SET @PasswordHash = 0x0200 + @Salt + HASHBYTES('SHA2_512', CAST(@Password AS VARBINARY(MAX)) + @Salt)

									----INSERT Company
										INSERT INTO [std].[Company]
											([Name],[DateFormat], [RegistrationStatus], [HasAgreedLicense], [IsDeleted],[IsChildExist], [CreatedDate], [ModifiedDate])
										VALUES
											(@TradeName,'MM/DD/YYYY', 0, 1, 0, 0, GETDATE(), GETDATE())
										SET @CompanyId = SCOPE_IDENTITY()										
										SET @StorageName = LOWER((SELECT REPLACE(@TradeName,' ', '')) + '-'+ CAST(@CompanyId AS NVARCHAR(10)))

									----Update Company With BucketName
										UPDATE [std].[Company]
											SET [StorageName] = @StorageName,
												[ParentCompanyId] = @CompanyId
										WHERE [CompanyId] = @CompanyId

									----Insert Life Time License
										INSERT INTO [pmt].[License] 
											([Code], [IsValid], [IsAlreadyAquired], [ExpireAt], [CompanyId], [IsDeleted], [Amount], [CreatedDate], [ModifiedDate])
										VALUES
											('HxFree', 1, 1,CAST('12/31/9999 23:59:59.997' AS DATETIME), @CompanyId, 0, 0.0, GETDATE(), GETDATE())
										SET @LicenseId = SCOPE_IDENTITY()

									----Insert User Information
										INSERT INTO [trn].[User] 
											([FirstName], [LastName], [FullName], [Email], [UserName], [PasswordHash], [Salt], [IsDeleted],[LicenseId], [IsActive], [CompanyId], [IsPasswordDefault], [LastLoginTime], [IsExpired], [CreatedDate], [ModifiedDate], [Is2FA])
										VALUES
											(@FirstName, @LastName, @FirstName + ' ' + @LastName, @Email, @UserName, @PasswordHash, @Salt, 0, @LicenseId, 0, @CompanyId, 0, GETDATE(), 0, GETDATE(), GETDATE(), 0)
										SET @UserId = SCOPE_IDENTITY()
										
									----INSERT ROLES
										INSERT INTO [sec].[Role]
											([Name],[Description], [CreatedDate], [ModifiedDate], [CompanyId], [IsDeleted], [CreatedBy])
										VALUES
											('OWNER', 'OWNER', GETDATE(), GETDATE(), @CompanyId, 0, @UserId)
										SET @OwnerRoleId = SCOPE_IDENTITY()

										INSERT INTO [sec].[Role]
											([Name],[Description], [CreatedDate], [ModifiedDate], [CompanyId], [IsDeleted], [CreatedBy])
										VALUES
											('Admin', 'Admin', GETDATE(), GETDATE(), @CompanyId, 0, @UserId)
										SET @AdminRoleId = SCOPE_IDENTITY()

										INSERT INTO [sec].[Role]
											([Name],[Description], [CreatedDate], [ModifiedDate], [CompanyId], [IsDeleted], [CreatedBy])
										VALUES
											('User', 'User', GETDATE(), GETDATE(), @CompanyId, 0, @UserId)
										SET @UserRoleId = SCOPE_IDENTITY()

									----Update User For Assign Role										
										UPDATE [trn].[User]
											SET [RoleId] = @OwnerRoleId
										WHERE [UserId] = @UserId

									----Insert Role Right Mappings
										--Owner Role Mappings
										INSERT INTO [sec].[RoleRightsMap]([RoleId], [RightId], [CreatedDate], [ModifiedDate] ,[CompanyId])
										SELECT @OwnerRoleId AS RoleId, [RightId], GETDATE() AS [CreatedDate], GETDATE() AS [ModifiedDate], @CompanyId FROM [sec].[Right] WHERE [CompanyId] IS NULL
										--Admin Role Mappings
										INSERT INTO [sec].[RoleRightsMap]([RoleId], [RightId], [CreatedDate], [ModifiedDate] ,[CompanyId])
										SELECT @AdminRoleId AS RoleId, [RightId], GETDATE() AS [CreatedDate], GETDATE() AS [ModifiedDate], @CompanyId FROM [sec].[Right] WHERE [CompanyId] IS NULL AND [RightId] <> 1
										--User Role Mappings
										INSERT INTO [sec].[RoleRightsMap]([RoleId], [RightId], [CreatedDate], [ModifiedDate] ,[CompanyId])
										SELECT @UserRoleId AS RoleId, [RightId], GETDATE() AS [CreatedDate], GETDATE() AS [ModifiedDate], @CompanyId FROM [sec].[Right] WHERE [CompanyId] IS NULL AND [RightId] NOT IN (1, 4, 7, 125, 134)

									----Insert ApplicationConfiguration
										--Conflict Type
										INSERT INTO [std].[ApplicationConfiguration]
											([CompanyId], [AppconfigurationTypeId], [IsDeleted], [CreatedDate], [ModifiedDate])
										VALUES
											(@CompanyId, 1, 0, GETDATE(), GETDATE())
										SET @AppConfigIdConflictType = SCOPE_IDENTITY()

										--Number Format
										INSERT INTO [std].[ApplicationConfiguration]
											([CompanyId], [AppconfigurationTypeId], [IsDeleted], [CreatedDate], [ModifiedDate])
										VALUES
											(@CompanyId, 2, 0, GETDATE(), GETDATE())
										SET @AppConfigIdNumberFormat = SCOPE_IDENTITY()

									----Insert ApplicationConfigurationValue
										INSERT INTO [std].[ApplicationConfigurationValue]
											([CompanyId], [AppConfigurationTypeId], [Name], [Placeholder], [Type],[Format], [Value], [OrderId])
										VALUES
											(@CompanyId, 1, 'OpponentFirstName','Opponent_First_Name', 'text', 'Text','', 0),
											(@CompanyId, 1, 'OpponentLastName','Opponent_Last_Name', 'text', 'Text','', 0),
											(@CompanyId, 2, 'SerialNumber','eg: 100001', 'format', '', '100001', 1)

									----Insert Entity Type
										--INSERT INTO [std].[Entitytype]
										--	([Name], [CompanyId], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate])
										--VALUES
										--	('Individual', @CompanyId, 0, GETDATE(), @UserId, GETDATE())

									----INSERT Library
										INSERT INTO [lib].[Library]
											([CompanyId], [Name], [IsDeleted], [ParentId], [CreatedDate], [ModifiedDate])
										VALUES
											(@CompanyId, 'Default', 0, 0, GETDATE(), GETDATE())
										SET @LibraryId = SCOPE_IDENTITY()
										UPDATE [lib].[Library] SET [ParentId] = @LibraryId WHERE LibraryId = @LibraryId

									----INSERT SYSTEM DEFINED FIELD
										INSERT INTO [std].[Field]
											([Name], [LabelName], [InitialValue], [CompanyId], [DataType], [CreatedDate],[IsRequired],[Placeholder], [Type],[CreatedBy], [ModifiedDate], [IsDeleted],[IsGroupField],[Format])
										VALUES
											('MatterRef', 'MatterRef','', @CompanyId, 'Text', GETDATE(), 0, 'MatterRef', 3, @UserId, GETDATE(), 0,0,''),
											('ClientLibraryId', 'ClientLibraryId','', @CompanyId, 'Text', GETDATE(), 0, 'ClientLibraryId', 3, @UserId, GETDATE(), 0,0,''),
											('ClientFirstName', 'ClientFirstName', '', @CompanyId, 'Text', GETDATE(), 0, 'ClientFirstName', 3, @UserId, GETDATE(), 0,0,''),
											('ClientLastName', 'ClientLastName', '', @CompanyId, 'Text', GETDATE(), 0, 'ClientLastName', 3, @UserId, GETDATE(), 0,0,''),
											('ClientMiddleName', 'ClientMiddleName', '', @CompanyId, 'Text', GETDATE(), 0, 'ClientMiddleName', 3, @UserId, GETDATE(), 0,0,''),
											('MatterType', 'MatterType', '', @CompanyId, 'Text', GETDATE(), 0, 'MatterType', 3, @UserId, GETDATE(), 0,0,''),
											('WorkType', 'WorkType', '', @CompanyId, 'Text', GETDATE(), 0, 'WorkType', 3, @UserId, GETDATE(), 0,0,''),
											('Biller', 'Biller', '', @CompanyId, 'Text', GETDATE(), 0, 'FeeEarner', 3, @UserId, GETDATE(), 0,0,''),
											('LinkMatterId', 'LinkMatterId', '', @CompanyId, 'Text', GETDATE(), 0, 'LinkMatterId', 3, @UserId, GETDATE(), 0,0,''),
											('SerialNumber', 'SerialNumber', '', @CompanyId, 'Text', GETDATE(), 0, 'SerialNumber', 3, @UserId, GETDATE(), 0,0,''),
											('Notes', 'Notes', '', @CompanyId, 'Text', GETDATE(), 0, 'Notes', 3, @UserId, GETDATE(), 0,0,''),
											('OpponentFirstName', 'OpponentFirstName', '', @CompanyId, 'Text', GETDATE(), 0, 'Opponent_First_Name', 3, @UserId, GETDATE(), 0,0,''),
											('OpponentLastName', 'OpponentLastName', '', @CompanyId, 'Text', GETDATE(), 0, 'Opponent_Last_Name', 3, @UserId, GETDATE(), 0,0,''),
											('EntityType', 'EntityType', '', @CompanyId, 'Text', GETDATE(), 0, 'EntityType', 3, @UserId, GETDATE(), 0,0,'')

										INSERT INTO [std].[Field]
											([Name], [LabelName], [InitialValue], [CompanyId], [DataType], [CreatedDate],[IsRequired],[Placeholder], [Type],[CreatedBy], [ModifiedDate], [IsDeleted],[IsGroupField],[Format])
										VALUES
											('ClientPhone', 'ClientPhone', '', @CompanyId, 'Text', GETDATE(), 0, 'Phone', 3, @UserId, GETDATE(),0,0,'')
										SET @ClientPhoneFieldId = SCOPE_IDENTITY()

										INSERT INTO [std].[Field]
											([Name], [LabelName], [InitialValue], [CompanyId], [DataType], [CreatedDate],[IsRequired],[Placeholder], [Type],[CreatedBy], [ModifiedDate], [IsDeleted],[IsGroupField],[Format])
										VALUES
											('ClientDateOfBirth', 'ClientDateOfBirth', '', @CompanyId, 'Text', GETDATE(), 0, 'Date Of Birth', 3, @UserId, GETDATE(),0,0,'')
										SET @ClientDOBFieldId = SCOPE_IDENTITY()

										INSERT INTO [std].[Field]
											([Name], [LabelName], [InitialValue], [CompanyId], [DataType], [CreatedDate],[IsRequired],[Placeholder], [Type],[CreatedBy], [ModifiedDate], [IsDeleted],[IsGroupField],[Format])
										VALUES
											('ClientAddress', 'ClientAddress', '', @CompanyId, 'Text', GETDATE(), 0, 'Address', 3, @UserId, GETDATE(),0,0,'')
										SET @ClientAddressFieldId = SCOPE_IDENTITY()


									----INSERT CATEGORY
										INSERT INTO [scr].[Category]
											([Name], [Description], [CompanyId], [IsDeleted], [IsClient], [CategoryTypeId], [CreatedDate], [ModifiedDate])
										VALUES
											('Client', 'System Defined Category', @CompanyId, 0, 1, 1, GETDATE(), GETDATE())
										SET @CategoryId = SCOPE_IDENTITY()

									----INSERT SCREEN
										INSERT INTO [scr].[Screen]
											([Name], [Description], [CompanyId], [Grid], [IsClientDeatils], [IsDeleted], [CreatedDate], [ModifiedDate])
										VALUES
											('Client Details', 'System Created', @CompanyId, N'{"width":850,"height":1100,"size":10,"minorLineColor":"#ddd","majorLineColor":"#aaa","backGroundColor":"#fff","pageName":"Letter","gridFlag":true}', 1, 0, GETDATE(), GETDATE())
										SET @ScreenId = SCOPE_IDENTITY()

									----INSERT CATEGORYSCREENMAP
										INSERT INTO [scr].[CategoryScreenMap]
											([CategoryId], [ScreenId], [Description], [CompanyId], [CreatedDate], [ModifiedDate])
										VALUES
											(@CategoryId, @ScreenId, 'Mapped By System', @CompanyId, GETDATE(), GETDATE())

									----INSERT COMPONENT
										DECLARE @ControlParentId1 NVARCHAR(50) = NEWID(),
												@ControlParentId2 NVARCHAR(50) = NEWID(),
												@ControlParentId3 NVARCHAR(50) = NEWID()
										INSERT INTO [scr].[Component]
											(
												[ComId]
												,[ComponentName]
												, [ScreenId]
												, [Data]
												, [State]
												, [Dependencies]
												, [ControlType]
												, [ControlParentId]
												, [FieldId]
												, [CompanyId]
												, [CreatedDate]
												, [ModifiedDate]
											)
										VALUES
											(
												@ControlParentId1
												,'DraggableComponent'
												, @ScreenId
												, ''
												, N'{"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"mouse":{"x":702,"y":385,"dx":-103.59375,"dy":15},"mouseState":{"down":false,"over":true},"width":250,"height":35,"offset":{"x":0,"y":0},"canvasState":{"selected":false,"controlMode":0},"tabindex":1,"repositionFlag":false,"parentLayer":1,"snapConfig":{"x":10,"y":10,"dx":50,"dy":50},"_location":{"x":460,"y":250},"rect":{"x":805.59375,"y":360,"width":250,"height":35,"top":360,"right":1055.59375,"bottom":395,"left":805.59375},"parentRect":{"x":345.59375,"y":110,"width":1143,"height":854,"top":110,"right":1488.59375,"bottom":964,"left":345.59375},"controlMode":1,"position":"absolute","zIndex":"999","widthpx":"250px","heightpx":"35px","_id":"39517d10-536b-49cd-9ada-0009be3207c4"}'
												, ''
												, 'GROUP'
												, ''
												, @ClientPhoneFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											),
											(
												@ControlParentId2
												,'DraggableComponent'
												, @ScreenId
												, ''
												, N'{"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"mouse":{"x":650,"y":208,"dx":-115.59375,"dy":8},"mouseState":{"down":false,"over":true},"width":250,"height":35,"offset":{"x":0,"y":0},"canvasState":{"selected":false,"controlMode":0},"tabindex":1,"repositionFlag":false,"parentLayer":1,"snapConfig":{"x":10,"y":10,"dx":50,"dy":50},"_location":{"x":460,"y":100},"rect":{"x":805.59375,"y":210,"width":250,"height":35,"top":210,"right":1055.59375,"bottom":245,"left":805.59375},"parentRect":{"x":345.59375,"y":110,"width":1143,"height":854,"top":110,"right":1488.59375,"bottom":964,"left":345.59375},"controlMode":1,"position":"absolute","zIndex":"999","widthpx":"250px","heightpx":"35px","_id":"3ace9659-e64c-4c92-90de-cffa61a35698"}'
												, ''
												, 'GROUP'
												, ''
												, @ClientDOBFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											),
											(
												@ControlParentId3
												,'DraggableComponent'
												, @ScreenId
												, ''
												, N'{"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"mouse":{"x":653,"y":275,"dx":-112.59375,"dy":5},"mouseState":{"down":false,"over":true},"width":250,"height":35,"offset":{"x":0,"y":0},"canvasState":{"selected":false,"controlMode":0},"tabindex":1,"repositionFlag":false,"parentLayer":1,"snapConfig":{"x":10,"y":10,"dx":50,"dy":50},"_location":{"x":460,"y":170},"rect":{"x":805.59375,"y":280,"width":250,"height":35,"top":280,"right":1055.59375,"bottom":315,"left":805.59375},"parentRect":{"x":345.59375,"y":110,"width":1143,"height":854,"top":110,"right":1488.59375,"bottom":964,"left":345.59375},"controlMode":1,"position":"absolute","zIndex":"999","widthpx":"250px","heightpx":"35px","_id":"3f843bc0-65b3-4576-9a27-dd6846a408ad"}'
												, ''
												, 'GROUP'
												, ''
												, @ClientAddressFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											),
											(
												NEWID()
												,'InputFieldComponent'
												, @ScreenId
												, ''
												, N'{"flexDirection":"column","showSettingsIcon":false,"labelMode":0,"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"Alignments":{"TOP":"TOP","RIGHT":"RIGHT","BOTTOM":"BOTTOM","LEFT":"LEFT"},"hxfcClass":{},"hxfcSelected":false,"canvasState":{"selected":false,"controlMode":0},"_state":{"name":"ClientDateOfBirth","value":"","fieldId":313,"labelName":"ClientDateOfBirth","fieldAlignment":"LEFT"},"fieldContainerState":{"state":{"alignment":"LEFT","offset":{"left":10,"right":10,"top":10,"bottom":10},"visible":true,"dimension":{"top":0,"left":-260,"width":250,"height":35},"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true},"selected":false}},"valueContainerState":{"state":{"dimension":{"top":0,"left":0,"width":250,"height":35},"selected":true,"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true}}}}'
												, ''
												, 'CONTROL'
												, @ControlParentId1
												, @ClientPhoneFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											),
											(
												NEWID()
												,'InputFieldComponent'
												, @ScreenId
												, ''
												, N'{"flexDirection":"column","showSettingsIcon":false,"labelMode":0,"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"Alignments":{"TOP":"TOP","RIGHT":"RIGHT","BOTTOM":"BOTTOM","LEFT":"LEFT"},"hxfcClass":{},"hxfcSelected":false,"canvasState":{"selected":false,"controlMode":0},"_state":{"name":"ClientPhone","value":"","fieldId":312,"labelName":"ClientPhone"},"fieldContainerState":{"state":{"alignment":"LEFT","offset":{"left":10,"right":10,"top":10,"bottom":10},"visible":true,"dimension":{"top":0,"left":-260,"width":250,"height":35},"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true},"selected":false}},"valueContainerState":{"state":{"dimension":{"top":0,"left":0,"width":250,"height":35},"selected":true,"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true}}}}'
												, ''
												, 'CONTROL'
												, @ControlParentId2
												, @ClientDOBFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											),
											(
												NEWID()
												,'InputFieldComponent'
												, @ScreenId
												, ''
												, N'{"flexDirection":"column","showSettingsIcon":false,"labelMode":0,"CONTROL_MODES":{"0":"VIEW_MODE","1":"SELECTION_MODE","2":"EDIT_MODE","VIEW_MODE":0,"SELECTION_MODE":1,"EDIT_MODE":2},"Alignments":{"TOP":"TOP","RIGHT":"RIGHT","BOTTOM":"BOTTOM","LEFT":"LEFT"},"hxfcClass":{},"hxfcSelected":false,"canvasState":{"selected":false,"controlMode":0},"_state":{"name":"ClientAddress","value":"","fieldId":314,"labelName":"ClientAddress"},"fieldContainerState":{"state":{"alignment":"LEFT","offset":{"left":10,"right":10,"top":10,"bottom":10},"visible":true,"dimension":{"top":0,"left":-260,"width":250,"height":35},"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true},"selected":false}},"valueContainerState":{"state":{"dimension":{"top":0,"left":0,"width":250,"height":35},"selected":true,"resizerState":{"status":"HIDDEN","dimension":{"width":250,"height":35},"changeElementStyle":true}}}}'
												, ''
												, 'CONTROL'
												, @ControlParentId3
												, @ClientAddressFieldId
												, @CompanyId
												, GETDATE()
												, GETDATE()
											)

									----INSERT CALENDAR
										INSERT INTO [evn].[Calendar]
											([Name], [CreatedBy], [CompanyId], [IsDeleted], [CreatedDate], [ModifiedDate])
										VALUES
											(@FirstName + '' + @LastName, @UserId, @CompanyId, 0, GETDATE(), GETDATE())

									SET @StatusCode = 200
									SET @Message = 'Company Registration Successful.'
								END
							ELSE
								BEGIN
									SET @StatusCode = 409
									SET @Message = 'User Email already exists.'
								END
						END
					ELSE
						BEGIN
							SET @StatusCode = 409
							SET @Message = 'Username already exists.'					
						END
				END
			ELSE
				BEGIN
					SET @StatusCode = 409
					SET @Message = 'Company already exists.'
				END
			
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRAN
			END
		SET @StatusCode = 406
		SET @Message = 'Company Registration Failed.'
		PRINT ERROR_MESSAGE()
	END CATCH
	SET NOCOUNT OFF
	SELECT @StatusCode AS StatusCode, @Message AS [Message], @StorageName AS StorageName, @CompanyId AS CompanyId, @UserId AS UserId, @LibraryId AS LibraryId
END
