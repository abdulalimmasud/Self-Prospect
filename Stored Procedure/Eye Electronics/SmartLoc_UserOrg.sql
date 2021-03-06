ALTER PROCEDURE [dbo].[sp_getUsersOfOrg]
(
	@orgId INT,
	@customerId INT,
	@page INT,
	@pageSize INT
)
AS
BEGIN
	DECLARE @permissions TABLE 
	(
		PermissionId BIGINT,
		PermissionName VARCHAR(500)
	)
	INSERT INTO @permissions
	SELECT ap.ID PermissionId, ap.PermissionName
	FROM AccessPermissions ap
	LEFT JOIN Schedules s ON ap.ScheduleID = s.ID
	WHERE ap.IsDeleted = 0 AND ap.CustomerID = @customerId AND ap.IsScheduleEnabled = 0 OR (s.StartTime < GETDATE() AND s.EndTime > GETDATE())

	DECLARE @users TABLE
	(
		UserId INT,
		UserName NVARCHAR(100),
		IsWebLogInActive BIT,
		IsSmsUnlockActive BIT,
		IsCardUnlockActive BIT,
		AccessPermissionID INT
	)
	INSERT INTO @users
	SELECT j.UserID, u.UserName, u.IsWebLogInActive, u.IsSmsUnlockActive, u.IsCardUnlockActive, j.AccessPermissionID 
	FROM [Users] u
	INNER JOIN 
	(
		SELECT
			apju.UserID
			, apju.AccessPermissionID
		FROM [AccessPermissionJobUsers] apju
		INNER JOIN [AccessPermissions] ap ON apju.AccessPermissionID = ap.ID AND ap.IsJobTypePermission = 1 AND ap.IsScheduleEnabled = 0
		INNER JOIN [Users] u ON apju.UserID = u.ID AND apju.CustomerID = u.CustomerID AND apju.IsDeleted = 0 AND apju.IsActive = 1
		INNER JOIN [Organizations] org ON u.OrganizationID=org.ID AND org.IsActive=1 AND org.IsDeleted=0
		WHERE u.IsDeleted = 0 AND u.IsActive = 1 AND u.OrganizationID IS NOT NULL --u.IsCardUnlockActive = 1 AND 
		UNION 
		SELECT
			apju.UserID
			, apju.AccessPermissionID
		FROM [AccessPermissionJobUsers] apju
		INNER JOIN [AccessPermissions] ap ON apju.AccessPermissionID = ap.ID AND ap.IsJobTypePermission = 1 AND ap.IsScheduleEnabled = 1
		INNER JOIN [Users] u ON apju.UserID = u.ID AND apju.CustomerID = u.CustomerID AND apju.IsDeleted = 0 AND apju.IsActive = 1

		INNER JOIN [Organizations] org ON u.OrganizationID=org.ID AND org.IsActive=1 AND org.IsDeleted=0

		INNER JOIN [Schedules] s ON ap.ScheduleID = s.ID AND s.IsDeleted = 0 AND s.IsActive = 1 AND GETDATE() BETWEEN s.StartTime AND s.EndTime
		WHERE u.IsDeleted = 0 AND u.IsActive = 1 AND u.OrganizationID IS NOT NULL--u.IsCardUnlockActive = 1 AND
	) j ON u.ID = j.UserID
	--INNER JOIN [vm_JobUsers] j ON u.ID = j.UserID
	WHERE u.OrganizationID = @orgId AND u.CustomerID = @customerId AND u.IsDeleted = 0
	UNION
	SELECT u.ID UserID, u.UserName, u.IsWebLogInActive, u.IsSmsUnlockActive, u.IsCardUnlockActive, g.AccessPermissionID FROM [Users] u
	LEFT JOIN [UserGroups] g ON u.UserGroupID = g.ID
	WHERE u.OrganizationID = @orgId AND u.CustomerID = @customerId AND u.IsDeleted = 0
	ORDER BY u.UserName ASC OFFSET (@page * @pageSize - @pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY

	DECLARE @uP TABLE
	(
		UserId INT,
		PermissionName NVARCHAR(100)
	)
	INSERT INTO @uP
	SELECT UserId, p.PermissionName FROM @users u
	INNER  JOIN @permissions p ON u.AccessPermissionID = p.PermissionId


	SELECT DISTINCT u.UserId
	, u.UserName
	, u.IsCardUnlockActive
	, u.IsSmsUnlockActive
	, u.IsWebLogInActive 
	, (SELECT PermissionName FROM @uP WHERE UserId = u.UserId FOR JSON PATH) AS [PermissionsJson]
	FROM @users u

	SELECT COUNT(ID) FROM Users
	WHERE OrganizationID = @orgId AND CustomerID = @customerId AND IsDeleted = 0
END

-- EXEC sp_getUsersOfOrg 11, 8, 1, 25

--SELECT * FROM [Organizations] WHERE CustomerID = 8