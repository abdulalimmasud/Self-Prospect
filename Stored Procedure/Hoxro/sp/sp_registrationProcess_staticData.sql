ALTER PROC [std].[sp_register_company_static_data]
(
	@CompanyId INT,
	@UserId INT
)
AS
BEGIN
	BEGIN TRY
		DECLARE 
			@OwnerRoleId INT,
			@AdminRoleId INT,
			@UserRoleId INT,
			@AppConfigIdConflictType INT,
			@AppConfigIdNumberFormat INT,
			@CardIdClient INT,
			@CurDate Datetime = GETUTCDATE(),
			@ScreenId INT,
			@ClientCardTypeId INT,
			@DefendantCardTypeId INT,
			@InsurarCardTypeId INT,
			@SolicitorCardTypeId INT,
			@CalendarId INT,
			@Attributes NVARCHAR(1000)= N'[{"RequiredForCompany":"true","RequiredOnScreen":"false","Editable":[], "Visible":[], "Expression":{},"GroupField":[]}]'
			
			----INSERT ROLES
			INSERT INTO [sec].[Role]
				(
					[Name]
					,[Description]
					, [CreatedDate]
					, [ModifiedDate]
					, [CompanyId]
					, [IsDeleted]
					, [CreatedBy]
				)
			VALUES
				(
					'OWNER'
					, 'OWNER'
					, @CurDate
					, @CurDate
					, @CompanyId
					, 0
					, @UserId
				)
			SET @OwnerRoleId = SCOPE_IDENTITY()

			INSERT INTO [sec].[Role]
				(
					[Name]
					,[Description]
					, [CreatedDate]
					, [ModifiedDate]
					, [CompanyId]
					, [IsDeleted]
					, [CreatedBy]
				)
			VALUES
				(
					'Admin'
					, 'Admin'
					, @CurDate
					, @CurDate
					, @CompanyId
					, 0
					, @UserId
				)
			SET @AdminRoleId = SCOPE_IDENTITY()

			INSERT INTO [sec].[Role]
				(
					[Name]
					, [Description]
					, [CreatedDate]
					, [ModifiedDate]
					, [CompanyId]
					, [IsDeleted]
					, [CreatedBy]
				)
			VALUES
				(
					'User'
					, 'User'
					, @CurDate
					, @CurDate
					, @CompanyId
					, 0
					, @UserId
				)
			SET @UserRoleId = SCOPE_IDENTITY()

			----Insert Role Right Mappings
			--Owner Role Mappings
			INSERT INTO [sec].[RoleRightsMap]
			(
				[RoleId]
				, [RightId]
				, [CreatedDate]
				, [ModifiedDate]
				, [CompanyId]
			)
			SELECT 
				@OwnerRoleId AS RoleId
				, [RightId]
				, @CurDate AS [CreatedDate]
				, @CurDate AS [ModifiedDate]
				, @CompanyId 
			FROM [sec].[Right] WHERE [CompanyId] IS NULL
			--Admin Role Mappings
			INSERT INTO [sec].[RoleRightsMap]
			(
				[RoleId]
				, [RightId]
				, [CreatedDate]
				, [ModifiedDate] 
				, [CompanyId]
			)
			SELECT 
				@AdminRoleId AS RoleId
				, [RightId]
				, @CurDate AS [CreatedDate]
				, @CurDate AS [ModifiedDate]
				, @CompanyId 
			FROM [sec].[Right] WHERE [CompanyId] IS NULL AND [RightId] <> 1
			--User Role Mappings
			INSERT INTO [sec].[RoleRightsMap]
			(
				[RoleId]
				, [RightId]
				, [CreatedDate]
				, [ModifiedDate] 
				, [CompanyId]
			)
			SELECT 
				@UserRoleId AS RoleId
				, [RightId]
				, @CurDate AS [CreatedDate]
				, @CurDate AS [ModifiedDate]
				, @CompanyId 
			FROM [sec].[Right] WHERE [CompanyId] IS NULL AND [RightId] NOT IN (1, 4, 7, 125, 134)
			----Update User For Assign Role										
			UPDATE [trn].[User]
				SET [RoleId] = @OwnerRoleId
			WHERE [UserId] = @UserId

			----Insert ApplicationConfiguration
			--Conflict Type
			INSERT INTO [std].[ApplicationConfiguration]
				(
					[CompanyId]
					, [AppconfigurationTypeId]
					, [IsDeleted]
					, [CreatedDate]
					, [ModifiedDate]
				)
			VALUES
				(
					@CompanyId
					, 1
					, 0
					, @CurDate
					, @CurDate
				)
			SET @AppConfigIdConflictType = SCOPE_IDENTITY()
				
			--Number Format
			INSERT INTO [std].[ApplicationConfiguration]
				(
					[CompanyId]
					, [AppconfigurationTypeId]
					, [IsDeleted]
					, [CreatedDate]
					, [ModifiedDate]
				)
			VALUES
				(
					@CompanyId
					, 2
					, 0
					, @CurDate
					, @CurDate
				)
			SET @AppConfigIdNumberFormat = SCOPE_IDENTITY()

			----Insert ApplicationConfigurationValue
			INSERT INTO [std].[ApplicationConfigurationValue]
			(
				[CompanyId]
				, [AppConfigurationTypeId]
				, [Value]
			)
			VALUES
			(
				@CompanyId
				, 1
				, '[{"name":"OpponentFirstName","placeholder":"Opponent_First_Name","type":"text","format":"Text","value":"","orderId":"0"},{"name":"OpponentLastName","placeholder":"Opponent_Last_Name","type":"text","format":"Text","value":"","orderId":"0"}]'
			),
			(
				@CompanyId
				, 2
				,'[{"name":"SerialNumber","placeholder":"eg: 100001","type":"format","format":"","value":"100001","orderId":"1"}]'
			)
			
			----Create Defult MatterType

			INSERT INTO [mtr].[MatterType]
			(	
				[Name]
				,[CompanyId]
				,[IsDeleted]
				,[Description]
				,[CreatedDate]
				,[ModifiedDate]
			)
			VALUES 
				('Debt Recovery',@CompanyId,0,'Debt Recovery',@CurDate,@CurDate)
				,('Personal Injury',@CompanyId,0,'Personal Injury',@CurDate,@CurDate)
				,('Professional Negligence',@CompanyId,0,'Professional Negligence',@CurDate,@CurDate)
				,('Commercial',@CompanyId,0,'Commercial',@CurDate,@CurDate)
				,('Criminal',@CompanyId,0,'Criminal',@CurDate,@CurDate)
				,('Land Dispute',@CompanyId,0,'Land Dispute',@CurDate,@CurDate)
				,('Conveyancing',@CompanyId,0,'Conveyancing',@CurDate,@CurDate)
				,('Pension',@CompanyId,0,'Pension',@CurDate,@CurDate)
				,('Family',@CompanyId,0,'Family',@CurDate,@CurDate)
			----Insert Entity Type
			--INSERT INTO [std].[Entitytype]
			--	([Name], [CompanyId], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate])
			--VALUES
			--	('Individual', @CompanyId, 0, @CurDate, @UserId, @CurDate)

			

			----Card Type---
			
			INSERT INTO [std].[CardType]
			(
				[Name]
				, [Description]
				, [CompanyId]
				, [IsDefault]
			) 
			VALUES  
			(
				'Client'
				,'Client'
				,@CompanyId
				, 1
			)
			SET @ClientCardTypeId = SCOPE_IDENTITY()

			DECLARE @clientFields NVARCHAR(MAX)
			SET @clientFields =
			(
				SELECT FieldAttributes = '{}'
					, LabelName = 'Client'+[LabelName]
					, InitialValue = ''
					, [Name] = 'Client'+[Name]
					, DataType
					, [Length]
					, Placeholder
					, InputType
					, InputTypeValues = ''
					, CreatedBy = CAST(@UserId AS NVARCHAR(20))
					, IsDeleted
					, [FORMAT] = ''
				 FROM [std].[DefaultFields] WHERE [Type] = 1 FOR JSON PATH
			)
			
			EXEC [std].[sp_insert_field_card] 'Client', @ClientCardTypeId, @clientFields, @CompanyId, @UserId, 0

			INSERT INTO [std].[CardType]
			(
				[Name]
				, [Description]
				, [CompanyId]
				, [IsDefault]
			) 
			VALUES(
				'Defendant'
				, 'Defendant'
				, @CompanyId
				, 1
			)
			SET @DefendantCardTypeId = SCOPE_IDENTITY()

			DECLARE @defendantFields NVARCHAR(MAX)
			SET @defendantFields =
			(
				SELECT FieldAttributes = '{}'
					, LabelName = 'Defendant'+[LabelName]
					, InitialValue = ''
					, [Name] = 'Defendant'+[Name]
					, DataType
					, [Length]
					, Placeholder
					, InputType
					, InputTypeValues = ''
					, CreatedBy = CAST(@UserId AS NVARCHAR(20))
					, IsDeleted
					, [FORMAT] = ''
				 FROM [std].[DefaultFields] WHERE [Type] = 1 FOR JSON PATH
			)
			EXEC [std].[sp_insert_field_card] 'Defendant', @DefendantCardTypeId, @defendantFields, @CompanyId, @UserId, 0
			
			INSERT INTO [std].[CardType]
			(
				[Name]
				, [Description]
				, [CompanyId]
				, [IsDefault]
			) 
			VALUES(
				'Other Sides Insurar'
				, 'Other Side Insurar'
				, @CompanyId
				, 1
			)
			SET @InsurarCardTypeId = SCOPE_IDENTITY()

			DECLARE @insurarFields NVARCHAR(MAX)
			SET @insurarFields =
			(
				SELECT FieldAttributes = @Attributes
					, LabelName = 'OtherSidesInsurar'+[LabelName]
					, InitialValue = ''
					, [Name] = 'OtherSidesInsurar'+[Name]
					, DataType
					, [Length]
					, Placeholder
					, InputType
					, InputTypeValues = ''
					, CreatedBy = CAST(@UserId AS NVARCHAR(20))
					, IsDeleted
					, [FORMAT] = ''
				 FROM [std].[DefaultFields] WHERE [Type] = 1 FOR JSON PATH
			)
			EXEC [std].[sp_insert_field_card] 'Other Sides Insurar', @InsurarCardTypeId, @insurarFields, @CompanyId, @UserId, 0 

			INSERT INTO [std].[CardType]
			(
				[Name]
				, [Description]
				, [CompanyId]
				, [IsDefault]
			) 
			VALUES(
				'Other Sides Solicitor'
				, 'Other Side Solicitor'
				, @CompanyId
				, 1
			)
			SET @SolicitorCardTypeId = SCOPE_IDENTITY()

			DECLARE @solicitorFields NVARCHAR(MAX)
			SET @solicitorFields =
			(
				SELECT FieldAttributes = @Attributes
					, LabelName = 'OtherSidesSolicitor'+[LabelName]
					, InitialValue = ''
					, [Name] = 'OtherSidesSolicitor'+[Name]
					, DataType
					, [Length]
					, Placeholder
					, InputType
					, InputTypeValues = ''
					, CreatedBy = CAST(@UserId AS NVARCHAR(20))
					, IsDeleted
					, [FORMAT] = ''
				 FROM [std].[DefaultFields] WHERE [Type] = 1 FOR JSON PATH
			)
			EXEC [std].[sp_insert_field_card] 'Other Sides Solicitor', @SolicitorCardTypeId, @solicitorFields, @CompanyId, @UserId, 0 

			INSERT INTO [std].[CardType]
			(
				[Name]
				, [Description]
				, [CompanyId]
				, [IsDefault]
			) 
			VALUES(
				'Expert'
				, 'Expert'
				, @CompanyId
				, 0
			) 
			----INSERT SYSTEM DEFINED FIELD
			INSERT INTO [std].[Field]
			(
				[Name]
				, [LabelName]
				, [InitialValue]
				, [CompanyId]
				, [DataType]
				, [Length]
				, [CreatedDate]
				, [Placeholder]
				, [InputType]
				, [InputTypeValues]
				, [FieldAttributes]
				, [CreatedBy]
				, [ModifiedDate]
				, [IsDeleted]
				, [Format]
			)
			VALUES
			(
				'MatterRef'
				, 'MatterRef'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				,  'MatterRef'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				,''
			),
			(
				'MatterType'
				, 'MatterType'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'MatterType'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'WorkType'
				, 'WorkType'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				,  'WorkType'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'Biller'
				, 'Biller'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'FeeEarner'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'LinkMatterId'
				, 'LinkMatterId'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'LinkMatterId'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'SerialNumber'
				, 'SerialNumber'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'SerialNumber'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'Notes'
				, 'Notes'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'Notes'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			),
			(
				'EntityType'
				, 'EntityType'
				, ''
				, @CompanyId
				, 'Text'
				, 100
				, @CurDate
				, 'EntityType'
				, 'Text'
				, ''
				, @Attributes
				, @UserId
				, @CurDate
				, 0
				, ''
			)
			----INSERT CALENDAR
			INSERT INTO [evn].[Calendar]
			(
				[Name]
				, [CreatedBy]
				, [CompanyId]
				, [IsDeleted]
				, [CreatedDate]
				, [ModifiedDate]
				, [IsDefaultCalendar]
			)
			VALUES
			(
				'My Task'
				, @UserId
				, @CompanyId
				, 0
				, @CurDate
				, @CurDate
				,1
			)
			SET @CalendarId = SCOPE_IDENTITY()

			INSERT INTO [evn].[UserCalendar]
			(
				[CalendarId]
				,[CompanyId]
				,[CreatedDate]
				,[ModifiedDate]
				,[Permission]
				,[UserId]
			)		
			VALUES
			(
				@CalendarId
				,@CompanyId
				,@CurDate
				,@CurDate
				,NULL
				, @UserId
			)
	END TRY
	BEGIN CATCH

	END CATCH
END
