USE Hoxro
GO

ALTER PROC [trn].[sp_get_login_info]
(
	@Email NVARCHAR(50)
)
AS
BEGIN
	DECLARE @UserId INT
	SELECT
		u.UserId,
		u.Email AS UserEmail,
		u.UserName,
		u.IsPasswordDefault,
		c.CompanyId,
		c.[Name] AS CompanyName,
		c.RegistrationStatus
	FROM [trn].[User] u
	INNER JOIN [std].[Company] c ON u.CompanyId = c.CompanyId
	WHERE u.[Email] = @Email

	SELECT 
		r.RightId,
		r.[Name],
		r.[Category],
		r.[Description],
		r.RighTtype 
	FROM [trn].[User] u
	INNER JOIN [sec].[RoleRightsMap] rrm ON u.[RoleId] = rrm.[RoleId]
	INNER JOIN [sec].[Right] r ON rrm.RightId = r.RightId
	WHERE u.[Email] = @Email
END

