ALTER PROC [dbo].[sp_getElapsedReport]
(
		@searchId INT,
		@searchType INT = 0, -- specificDoor = 0, cluster = 1, zone = 2, site = 3, permission = 4, organization = 5, user = 6, jobPermission=7
		@startDate DATETIME,
		@endtDate DATETIME,
		@customerId INT,
		@page INT,
		@pageSize INT
)
AS
BEGIN
	DECLARE @doorIds TABLE
	(
		DoorId INT
	)

	DECLARE @users TABLE
	(
		UserName NVARCHAR(100),
		EventId INT,
		Organization NVARCHAR(100),
		MobileNumber VARCHAR(20)
	)

	DECLARE @data TABLE
	(
		Id BIGINT,
		EventId INT,
		LogTime DATETIME,
		LogType INT,
		LogSubType INT,
		UserId INT,
		LogIntValue INT,
		DoorName NVARCHAR(100)
	)

	DECLARE @elapsedTime TABLE 
	(
		ElapsedTime INT,
		EventId INT
	)

	IF(@searchType = 4 OR @searchType = 5 OR @searchType = 6 OR @searchType = 7)
	BEGIN
		IF(@searchType = 4)
		BEGIN
			INSERT INTO @users
			SELECT DISTINCT u.UserName, s.EventId, o.[Name], umn.MobileNumber
			FROM SmartLock_DoorLogs s
			INNER JOIN Users u ON s.UserId = u.ID
			INNER JOIN UserGroups ug ON u.UserGroupID = ug.ID
			INNER JOIN AccessPermissions ap ON ug.AccessPermissionID = ap.ID
			INNER JOIN Organizations o ON u.OrganizationID = o.ID
			LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
			WHERE s.IsDeleted = 0 AND s.CustomerId = @customerId AND s.LogType = 3 AND ap.ID = @searchId AND s.LogTime >= @startDate AND s.LogTime <= @endtDate
		END
		ELSE IF (@searchType = 5)
		BEGIN
			INSERT INTO @users
			SELECT DISTINCT u.UserName, s.EventId, o.[Name], umn.MobileNumber
			FROM SmartLock_DoorLogs s
			INNER JOIN Users u ON s.UserId = u.ID
			INNER JOIN Organizations o ON u.OrganizationID = o.ID
			LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
			WHERE s.IsDeleted =0 AND s.CustomerId = @customerId AND s.LogType = 3 AND u.OrganizationID = @searchId AND s.LogTime >= @startDate AND s.LogTime <= @endtDate
		END
		ELSE IF (@searchType = 6)
		BEGIN
			INSERT INTO @users
			SELECT DISTINCT u.UserName, dl.EventId, o.[Name], umn.MobileNumber
			FROM SmartLock_DoorLogs dl
			INNER JOIN Users u ON dl.UserId = u.ID
			INNER JOIN Organizations o ON u.OrganizationID = o.ID
			LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
			WHERE dl.IsDeleted =0 AND dl.CustomerId = @customerId AND dl.LogType = 3 AND dl.UserId = @searchId AND dl.LogTime >= @startDate AND dl.LogTime <= @endtDate
		END
		ELSE IF (@searchType = 7)
		BEGIN
			INSERT INTO @users
			SELECT DISTINCT u.UserName, dl.EventId, o.[Name], umn.MobileNumber
			FROM SmartLock_DoorLogs dl
			INNER JOIN Users u ON dl.UserId = u.ID
			INNER JOIN AccessPermissionJobUsers apu ON u.ID = apu.UserID
			INNER JOIN AccessPermissions ap ON apu.AccessPermissionID = ap.ID
			INNER JOIN Organizations o ON u.OrganizationID = o.ID
			LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
			WHERE dl.IsDeleted = 0 AND dl.CustomerId = @customerId AND dl.LogType = 3 AND dl.AccessPermissionId = @searchId AND dl.LogTime >= @startDate AND dl.LogTime <= @endtDate
		END


		INSERT INTO @data
		SELECT dl.Id, dl.EventId, dl.LogTime, dl.LogType, dl.LogSubType, dl.UserId, dl.LogIntValue, d.DoorName FROM [SmartLock_DoorLogs] dl
		INNER JOIN [Doors] d ON dl.DoorId = d.ID
		WHERE 1 = 1
		AND dl.CustomerID = @customerId 
		AND dl.EventId IN (SELECT EventId FROM @users)
		AND dl.IsDeleted = 0
		AND dl.LogTime BETWEEN @startDate AND @endtDate
		AND dl.LogType = 9
	END
	ELSE
	BEGIN
		IF(@searchType = 0)
		BEGIN
			INSERT INTO @doorIds SELECT @searchId
		END
		ELSE IF (@searchType = 1)
		BEGIN
			INSERT INTO @doorIds
			SELECT d.ID
			FROM DoorClusters c
			INNER JOIN DoorZones z ON c.ID = z.ClusterID
			INNER JOIN DoorSites s ON z.ID = s.ZoneID
			INNER JOIN Doors d ON s.ID = d.SiteID
			WHERE c.ID = @searchId AND c.CustomerID = @customerId
		END
		ELSE IF (@searchType = 2)
		BEGIN
			INSERT INTO @doorIds
			SELECT d.ID
			FROM DoorZones z
			INNER JOIN DoorSites s ON z.ID = s.ZoneID
			INNER JOIN Doors d ON s.ID = d.SiteID
			WHERE z.ID = @searchId AND z.CustomerID = @customerId
		END
		ELSE IF (@searchType = 3)
		BEGIN
			INSERT INTO @doorIds
			SELECT d.ID
			FROM DoorSites s
			INNER JOIN Doors d ON s.ID = d.SiteID
			WHERE s.ID = @searchId AND s.CustomerID = @customerId
		END
		
		INSERT INTO @data
		SELECT dl.Id, dl.EventId, dl.LogTime, dl.LogType, dl.LogSubType, dl.UserId, dl.LogIntValue, d.DoorName FROM [SmartLock_DoorLogs] dl
		INNER JOIN [Doors] d ON dl.DoorId = d.ID
		WHERE 1 = 1
		AND dl.CustomerID = @customerId 
		AND dl.DoorID IN (SELECT * FROM @doorIds) 
		AND dl.IsDeleted = 0
		AND dl.LogTime BETWEEN @startDate AND @endtDate
		AND dl.LogType IN (3, 9)

		INSERT INTO @users
		SELECT u.UserName, d.EventId, o.[Name], umn.MobileNumber FROM @data d
		INNER JOIN Users u ON d.UserId = u.ID
		INNER JOIN Organizations o ON u.OrganizationID = o.ID
		LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
		WHERE d.UserId IS NOT NULL AND d.LogType = 3
	END

	
	INSERT INTO @elapsedTime
	SELECT SUM(LogIntValue), EventId FROM @data WHERE LogType = 9 AND LogSubType = 2
	GROUP BY EventId
	
	DECLARE @parent TABLE
	(
		LogTime DATETIME,
		DoorName VARCHAR(100),
		UserName VARCHAR(100),
		Organization NVARCHAR(100),
		EventId INT,
		ElapsedTime INT,
		MobileNumber VARCHAR(20)
	)
	INSERT INTO @parent
	SELECT MIN(d.LogTime) LogTime, d.DoorName, u.UserName, u.Organization, d.EventId, et.ElapsedTime, MAX(u.MobileNumber) FROM @data d
	INNER JOIN @elapsedTime et ON d.EventId = et.EventId
	INNER JOIN @users u ON et.EventId = u.EventId
	WHERE LogType = 9 
	GROUP BY d.EventId, u.UserName, u.Organization, et.ElapsedTime, d.DoorName
	HAVING COUNT(d.EventId) > 2
	ORDER BY LogTime DESC OFFSET (@page * @pageSize - @pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY

	DECLARE @child TABLE
	(
		Id INT IDENTITY(1,1),
		SubLogType INT,
		LogTime DATETIME,
		ElapsedTime INT,
		EventId INT
	)
	--INSERT INTO @child
	--SELECT LogSubType, LogTime, LogIntValue ElapsedTime, EventId FROM @data
	--WHERE LogType = 9
	--ORDER BY LogTime DESC, EventId DESC, LogSubType ASC

	INSERT INTO @child
	SELECT LogSubType, LogTime, LogIntValue ElapsedTime, EventId FROM @data
	WHERE LogType = 9 AND LogSubType = 0
	ORDER BY LogTime DESC, LogSubType ASC

	INSERT INTO @child
	SELECT LogSubType, LogTime, LogIntValue ElapsedTime, EventId FROM @data
	WHERE LogType = 9 AND LogSubType = 1
	ORDER BY LogTime DESC, LogSubType ASC

	INSERT INTO @child
	SELECT LogSubType, LogTime, LogIntValue ElapsedTime, EventId FROM @data
	WHERE LogType = 9 AND LogSubType = 2
	ORDER BY LogTime DESC, LogSubType ASC

	SELECT p.DoorName
		, p.UserName
		, p.Organization
		, p.LogTime
		, p.ElapsedTime
		, p.MobileNumber
		, (SELECT 
				c.SubLogType
				, c.LogTime
				, c.ElapsedTime 
			FROM @child c WHERE c.EventId = p.EventId ORDER BY LogTime ASC, ElapsedTime ASC FOR JSON AUTO
		) AS childJson
	FROM @parent p
	ORDER BY p.LogTime DESC

	SELECT COUNT(EventId) AS [Count] FROM @elapsedTime
END

--DOOR EXAMPLE
--EXEC [sp_getElapsedReport] 22, 0, 'JAN 01 2019', 'AUG 30 2019', 8, 1, 25
--EXEC sp_getElapsedReport 51, 0, 'JAN 01 2018', 'JUL 21 2019', 8, 1,10

--CLUSTER EXAMPLE
--EXEC [sp_getElapsedReport] 18, 1, 'JAN 01 2019', 'AUG 30 2019', 8, 1, 20

--ZONE EXAMPLE
--EXEC [sp_getElapsedReport] 33, 2, 'JAN 01 2019', 'AUG 30 2019', 8, 1, 20

--SITE EXAMPLE
--EXEC [sp_getElapsedReport] 96, 3,'JAN 01 2019', 'AUG 30 2019', 8, 1, 20

--PERMISSION EXAMPLE
--EXEC [sp_getElapsedReport] 29, 4,'JUNE 1 2019', 'JUNE 10 2019', 7, 1, 20

--ORGANIZATION EXAMPLE
--EXEC [sp_getElapsedReport] 6, 5,'JUNE 1 2019', 'JUNE 10 2019', 7, 1, 20

--USER EXAMPLE
--EXEC [sp_getElapsedReport] 44, 6,'JUNE 1 2019', 'JUNE 10 2019', 7, 1, 20

--JOB PERMISSION EXAMPLE
--EXEC [sp_getElapsedReport] 46, 7,'JUNE 1 2019', 'JUNE 10 2019', 7, 1, 20


--SELECT * FROM [DoorSites] WHERE ZoneID = 33