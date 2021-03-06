ALTER PROC [std].[sp_register_company]
(
	@TradeName NVARCHAR(50),
	@UserName NVARCHAR(50),
	@Email NVARCHAR(50),
	@Password NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@test bit=0	
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Message NVARCHAR(200) = '',
			@StorageName	NVARCHAR(64) = '',
			@StatusCode INT,
			@UserId INT,
			@CompanyId INT,
			@LibraryId INT,
			@CalendarId INT
	BEGIN TRY
		BEGIN TRAN
			IF NOT EXISTS(SELECT 1 FROM [std].[Company] WHERE [Name] = @TradeName)
				BEGIN
					IF NOT EXISTS(SELECT 1 FROM [trn].[User] WHERE [UserName] = @UserName)
						BEGIN
							IF NOT EXISTS(SELECT 1 FROM [trn].[User] WHERE [Email] = @Email)
								BEGIN
									DECLARE 
										@LicenseId INT,
										@OwnerRoleId INT,
										--@AdminRoleId INT,
										--@UserRoleId INT,
										--@AppConfigIdConflictType INT,
										--@AppConfigIdNumberFormat INT,
										--@CardIdClient INT,
										@CurDate Datetime = GETUTCDATE(),
										--@ScreenId INT,
										--@ClientCardTypeId INT,
										--@DefendantCardTypeId INT,
										--@InsurarCardTypeId INT,
										--@SolicitorCardTypeId INT,
										--@ClientPhoneFieldId INT,
										--@ClientDOBFieldId INT,
										--@ClientAddressFieldId INT,
										@PasswordHash VARBINARY(MAX),
										@Salt VARBINARY(4) = CRYPT_GEN_RANDOM(4)--,
										--@Attributes NVARCHAR(1000)= N'[{"RequiredForCompany":"true","RequiredOnScreen":"false","Editable":[], "Visible":[], "Expression":{},"GroupField":[]}]'
									----Generate Password Hash
										SET @PasswordHash = 0x0200 + @Salt + HASHBYTES('SHA2_512', CAST(@Password AS VARBINARY(MAX)) + @Salt)

									----INSERT Company
										INSERT INTO [std].[Company]
										(
											[Name]
											, [DateFormat]
											, [RegistrationStatus]
											, [HasAgreedLicense]
											, [IsDeleted]
											, [IsChildExist]
											, [CreatedDate]
											, [ModifiedDate]
										)
										VALUES
										(
											@TradeName
											, 'MM/DD/YYYY'
											, 0
											, 1
											, 0
											, 0
											, @CurDate
											, @CurDate
										)
										SET @CompanyId = SCOPE_IDENTITY()										
										SET @StorageName = LOWER((SELECT REPLACE(@TradeName,' ', '')) + '-'+ CAST(@CompanyId AS NVARCHAR(10)))
										
									----Update Company With BucketName
										UPDATE [std].[Company]
											SET [StorageName] = @StorageName,
												[ParentCompanyId] = @CompanyId
										WHERE [CompanyId] = @CompanyId
										---- Insert Company localization
										INSERT INTO [upr].[CompanyLocalization] 
										(
											[ModuleKeyId]
											, [ModuleId]
											, [Name]
											, [DefaultValue]
											, [CompanyId]
											, [IsDeleted]
											, [CreatedDate]
											, [ModifiedDate]
										) 
										SELECT 
											[ModuleKeyId]
											, [ModuleId]
											, [Name]
											, [DefaultValue]
											, @CompanyId 
											, [IsDeleted]
											, @CurDate
											, @CurDate 
										FROM [upr].[Localization]

									----Insert Life Time License
										INSERT INTO [pmt].[License] 
											(
												[Code]
												, [IsValid]
												, [IsAlreadyAquired]
												, [ExpireAt]
												, [CompanyId]
												, [IsDeleted]
												, [Amount]
												, [CreatedDate]
												, [ModifiedDate]
											)
										VALUES
											(
												'HxFree'
												, 1
												, 1
												,CAST('12/31/9999 23:59:59.997' AS DATETIME)
												, @CompanyId
												, 0
												, 0.0
												, @CurDate
												, @CurDate
											)
										SET @LicenseId = SCOPE_IDENTITY()

									----Insert User Information
										INSERT INTO [trn].[User] 
											(
												[FirstName]
												, [LastName]
												, [FullName]
												, [Email]
												, [UserName]
												, [PasswordHash]
												, [Salt]
												, [IsDeleted]
												,[LicenseId]
												, [IsActive]
												, [CompanyId]
												, [IsPasswordDefault]
												, [LastLoginTime]
												, [IsExpired]
												, [CreatedDate]
												, [ModifiedDate]
												, [Is2FA]
											)
										VALUES
											(
												@FirstName
												, @LastName
												, @FirstName + ' ' + @LastName
												, @Email
												, @UserName
												, @PasswordHash
												, @Salt
												, 0
												, @LicenseId
												, 0
												, @CompanyId
												, 0
												, @CurDate
												, 0
												, @CurDate
												, @CurDate
												, 0
											)
										SET @UserId = SCOPE_IDENTITY()
										
									EXEC [std].[sp_register_company_static_data] @CompanyId, @UserId

									SELECT @OwnerRoleId = RoleId FROM [sec].[Role] WHERE CompanyId = @CompanyId AND [Name] = 'OWNER'

									--INSERT DATA USERCOMPANY TABLE FOR IMPLEMENTING GROUP OF COMPANY
								    INSERT INTO TRN.UserCompany 
									(
										[UserId]
										, [UserName]
										, [PasswordHash]
										, [HourlyRate]
										, [IsActive]
										, [IsApproved]
										, [RoleId]
										, [LicenseId]
										, [CompanyId]
										, [AssociationId]
										, [LastLoginTime]
										, [CreatedDate]
										, [ModifiedDate]
										, [IsDeleted]
									)
										SELECT 
											@UserId
											, @UserName
											, @PasswordHash
											, 0
											, 1
											, 1
											, @OwnerRoleId
											, @LicenseId
											, @CompanyId
											, NULL
											, @CurDate
											, @CurDate
											, @CurDate
											, 0

									----INSERT Library
									INSERT INTO [lib].[Library]
									(
										[CompanyId]
										, [Name]
										, [IsDeleted]
										, [ParentId]
										, [CreatedDate]
										, [ModifiedDate]
									)
									VALUES
									(
										@CompanyId
										, 'Default'
										, 0
										, 0
										, @CurDate
										, @CurDate
									)
									SET @LibraryId = SCOPE_IDENTITY()
									UPDATE [lib].[Library] SET [ParentId] = @LibraryId WHERE LibraryId = @LibraryId

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
										@FirstName + '' + @LastName
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
		IF @test=1 BEGIN 
		   ROLLBACK TRAN
		   SET @Message= 'TEST SUCCESSFULLY'
		  END
		ELSE BEGIN 
		  COMMIT TRAN
		END
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

----exec [std].[sp_register_company] 	'test11','test11','hoxro11@yopmail.com','Password1@','hoxro11','lms11',1


SELECT * FROM [std].Company

SELECT * FROM [std].[Card] WHERE CompanyId = 1031
SELECT * FROM [std].[Field] WHERE CompanyId = 1031