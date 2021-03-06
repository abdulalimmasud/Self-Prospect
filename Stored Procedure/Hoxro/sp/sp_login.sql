ALTER PROC [trn].[sp_user_login]
(
	@Password NVARCHAR(50),
	@Email NVARCHAR(50)
)
AS
BEGIN
	DECLARE @PasswordHash VARBINARY(MAX),
			@StatusCode INT = 404,
			@Message NVARCHAR(MAX) = '',
			@IsActive BIT,
			@CompanyId INT = 0,
			@CompanyName NVARCHAR(50) = '',
			@StorageName NVARCHAR(64) = '',
			@RegistrationStatus TINYINT,
			@LicenseId INT,
			@UserId INT,
			@Psk NVARCHAR(MAX) = '',
			@UserName NVARCHAR(50) = '',
			@LicenseExpireAt DATETIME,
			@RoleId int,
			@timeZoneId NVARCHAR(200)= ''

 -- SELECT 

	SELECT @PasswordHash = u.[PasswordHash],
			@UserId = u.[UserId],
			@IsActive = u.[IsActive], 
			@CompanyId = u.[CompanyId],
			@CompanyName = c.[Name],
			@StorageName = c.[StorageName],
			@RegistrationStatus = c.[RegistrationStatus],
			@LicenseId = u.[LicenseId],
			@Psk = u.[PSK],
			@UserName = u.[UserName],
			@LicenseExpireAt = l.[ExpireAt],
			@RoleId = u.RoleId,
			@timeZoneId = c.TimeZoneId
	FROM [trn].[User] u 
	INNER JOIN [std].[Company] c ON u.CompanyId = c.CompanyId
	LEFT JOIN [pmt].[License] l ON u.LicenseId = l.LicenseId
	WHERE 1=1
	AND [Email] = @Email

	--select @PasswordHash



	IF(@PasswordHash IS NOT NULL AND PWDCOMPARE(@Password, @PasswordHash) = 1)
		BEGIN

		--print 
		

			IF(@IsActive = 1)
				BEGIN
				
					IF(@LicenseId IS NOT NULL)
						BEGIN
							IF(@LicenseExpireAt > GETDATE())
								BEGIN									
									UPDATE [trn].[User]
										SET [IsExpired] = 0,
											[LastLoginTime] = GETDATE()
									WHERE [UserId] = @UserId

									SET @StatusCode = 200
									SET @Message = 'Success'
								END
							ELSE
								BEGIN
									SET @StatusCode = 402
									SET @Message = 'License Expired. Please ask your Administrator to assign a License.'
								END
						END
					ELSE
						BEGIN
					
							SET @StatusCode = 402
							SET @Message = 'Unassigned License. Please ask your Administrator to assign a License.'							
							
						END
				END
			ELSE
				BEGIN
					SET @StatusCode = 401
					SET @Message = 'The user is not yet activated. Please check your mail at: '+ @Email
				END
		END
	ELSE
		BEGIN
			SET @StatusCode = 419
			SET @Message = 'The email or password is incorrect.'
		END
	SELECT @UserId 'UserId'
		, @UserName 'UserName'
		, @CompanyId 'CompanyId'
		, @CompanyName 'CompanyName'
		, @StorageName 'StorageName'
		, @Psk 'PSK'
		, @StatusCode 'StatusCode'
		, @Message 'Message'
		, @RoleId 'RoleId'
		, ISNULL(@timeZoneId, '') 'TimeZoneId'
END
