ALTER PROC [dbo].[sp_getDoorStatusInfo]
(
	@groupId INT 
	, @customerId INT
	, @searchType INT
	, @page INT = 1
	, @pageSize INT = 10
	, @keyword VARCHAR(50) = '*'
)
AS
BEGIN
	DECLARE  @permissionLevel INT
		, @accessPermissionId INT
		, @toDate DATETIME = GETDATE()
		, @fromDate DATETIME
		, @totalCount INT
		, @count INT = 0
		, @doorId INT

	SELECT @fromDate = DATEADD(DAY, -3, @toDate)

	SELECT @accessPermissionId = ID,  @permissionLevel = PermissionLevel FROM AccessPermissions WHERE ID = (SELECT AccessPermissionID FROM UserGroups WHERE ID = @groupId)

	DECLARE @doorIds TABLE
	(
		DoorId INT
	)
	IF(@permissionLevel = 0)
	BEGIN
		INSERT INTO @doorIds
		SELECT ID FROM Doors WHERE CustomerID = @customerId AND IsActive = 1 AND IsDeleted = 0
	END
	ELSE
	BEGIN
		INSERT INTO @doorIds
		SELECT d.ID FROM Doors d
		INNER JOIN DoorSites ds ON d.SiteID = ds.ID AND ds.IsDeleted = 0
		INNER JOIN DoorZones dz ON ds.ZoneID = dz.ID AND dz.IsDeleted = 0
		INNER JOIN DoorClusters dc ON dz.ClusterID = dc.ID AND dc.IsDeleted = 0
		WHERE
			CASE
				WHEN @permissionLevel = 1 THEN dc.ID
				WHEN @permissionLevel = 2 THEN dz.ID
				WHEN @permissionLevel = 3 THEN ds.ID
			END
			IN
				(
					SELECT
						CASE
							WHEN @permissionLevel = 1 AND ClusterID IS NOT NULL THEN ClusterID
							WHEN @permissionLevel = 2 AND ZoneID IS NOT NULL THEN ZoneID
							WHEN @permissionLevel = 3 AND SiteID IS NOT NULL THEN SiteID
						END
					FROM AccessPermissionDoors
					WHERE AccessPermissionID = @accessPermissionId
					AND IsDeleted = 0 AND IsActive = 1
				)
			AND d.IsDeleted = 0 AND d.IsActive = 1
	END

	DECLARE @doorLogs TABLE
	(
		DoorId INT,
		[LogType] INT,
		[Value] INT,
		[LogTime] DATETIME
	)
	INSERT INTO @doorLogs
	SELECT DISTINCT DoorId, LogType, LogIntValue, [LogTime] FROM [SmartLock_DoorLastLogs] 
	WHERE DoorId IN (SELECT * FROM @doorIds) AND LogType IN(5, 6)
	ORDER BY LogTime DESC


	DECLARE @doors TABLE
	(
		Id INT IDENTITY(1,1),
		DoorId INT 
	)

	INSERT INTO @doors
	SELECT DISTINCT DoorId FROM @doorLogs

	SELECT @totalCount = COUNT(DoorId) FROM @doors

	DECLARE @doorLocFail TABLE
	(
		DoorId INT,
		[Value] INT
	)
	DECLARE @doorOpen TABLE
	(
		DoorId INT,
		[Value] INT
	)
	IF(@searchType < 5)
	BEGIN
		WHILE(@count < @totalCount)
		BEGIN
			SET @count = @count + 1
			SELECT @doorId = DoorId FROM @doors WHERE Id = @count
		
			INSERT INTO @doorLocFail
			SELECT TOP 1 DoorId, [Value] FROM @doorLogs WHERE DoorId = @doorId AND LogType = 6 ORDER BY LogTime DESC
		
			INSERT INTO @doorOpen
			SELECT TOP 1 DoorId, [Value] FROM @doorLogs WHERE DoorId = @doorId AND LogType = 5 ORDER BY LogTime DESC
		END
	END
	DECLARE @selectedDoor TABLE
	(
		Id INT
	)

	IF(@searchType = 1)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT DoorId FROM @doorLocFail
		WHERE [Value] IN (3,4)
	END
	ELSE IF(@searchType = 2)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT DoorId FROM @doorLocFail
		WHERE [Value] = 5
	END
	ELSE IF (@searchType = 3)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT DoorId FROM @doorLocFail
		WHERE [Value] = 2
	END
	ELSE IF (@searchType = 4)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT DoorId FROM @doorOpen
		WHERE [Value] = 2
	END
	ELSE IF (@searchType = 5)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT DoorId FROM SmartLock_DoorAlerts
		WHERE DoorId IN (SELECT * FROM @doorIds)
		AND AlertCategory = 0 AND IsExecuted = 0 AND IsDeleted = 0
		AND AlertDateTime BETWEEN @fromDate AND @toDate
	END
	ELSE IF (@searchType = 6)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT d.ID FROM DeviceLastCommunicationTime dlct
		INNER JOIN [Doors] d ON dlct.DeviceId = d.DeviceID AND d.IsActive = 1
		AND dlct.CustomerId = @customerId
		AND d.ID IN (SELECT * FROM @doorIds)
		AND DATEADD(MINUTE, 3, dlct.LastCommunicationTime) < GETDATE()
	END
	ELSE IF (@searchType = 7)
	BEGIN
		INSERT INTO @selectedDoor
		SELECT dl.DoorID FROM [SmartLock_DeviceLastLogs] dl
		INNER JOIN [Doors] d ON dl.DeviceID = d.DeviceID
		WHERE  DoorID IN (SELECT * FROM @doorIds)
		AND LogType = 8
		AND LogIntegerValue = 2
		--INSERT INTO @selectedDoor
		--SELECT DoorID FROM [SmartLock_DeviceLastLogs]
		--WHERE  DoorID IN (SELECT * FROM @doorIds)
		--AND LogType = 8
		--AND LogIntegerValue = 2
	END

	
	--DECLARE @doorLockStatus TABLE
	--(
	--	DoorId INT,
	--	[LogType] INT,
	--	[Value] INT,
	--	[LogTime] DATETIME
	--)
	--INSERT INTO @doorLockStatus
	--SELECT DISTINCT DoorId, LogType, LogIntValue, [LogTime] FROM [SmartLock_DoorLastLogs] 
	--WHERE DoorId IN (SELECT * FROM @selectedDoor) AND LogType IN(5, 6)
	--ORDER BY LogTime DESC

	DECLARE @doorAlert TABLE
	(
		DoorId INT,
		[Value] INT,
		[AlertDateTime] DATETIME
	)
	INSERT INTO @doorAlert
	SELECT DISTINCT DoorId, AlertType, AlertDateTime FROM SmartLock_DoorAlerts
	WHERE DoorId IN (SELECT * FROM @selectedDoor)
	AND AlertCategory = 0 AND IsExecuted = 0 AND IsDeleted = 0
	AND AlertDateTime BETWEEN @fromDate AND @toDate
	ORDER BY AlertDateTime DESC
	

	DECLARE @alertTime TABLE
	(
		DoorId INT,
		[AlertDateTime] DATETIME
	)
	INSERT INTO @alertTime
	SELECT DoorId, MAX([AlertDateTime]) FROM @doorAlert
	GROUP BY DoorId


	DECLARE @lastAlert TABLE
	(
		DoorId INT,
		[Value] INT
	)
	INSERT INTO @lastAlert
	SELECT DoorId, [Value] FROM @doorAlert 
	WHERE DoorId IN (SELECT DoorId FROM @alertTime)
	AND [AlertDateTime] IN (SELECT [AlertDateTime] FROM @alertTime)

	DECLARE @deviceLastLog TABLE
	(
		DoorId INT,
		LogType INT,
		LogSubType INT,
		[Value] INT,
		LogDateTime DATETIME
	)
	INSERT INTO @deviceLastLog
	SELECT DISTINCT DoorID, LogType, LogSubType, LogIntegerValue, LogDateTime FROM [SmartLock_DeviceLastLogs]
	WHERE
		DoorID IN (SELECT * FROM @selectedDoor)
		AND LogType IN (1, 8)
	ORDER BY [LogDateTime] DESC
	
	IF (@keyword = '*')
	BEGIN
		SELECT COUNT(DISTINCT Id) FROM @selectedDoor
	END
	ELSE
	BEGIN
		SELECT COUNT(DISTINCT ID) FROM [Doors]
		WHERE ID IN (SELECT * FROM @selectedDoor)
		AND DoorName LIKE '%'+@keyword+'%'
	END
	
	SELECT do.ID Id
	, do.[DoorName]
	, do.SiteID
	, s.SiteName
	, z.ZoneName
	, c.ClusterName
	, (SELECT TOP 1 [Value] FROM @doorLogs WHERE DoorId = do.ID AND LogType = 5 ORDER BY [LogTime] DESC) DoorStatus
	, (SELECT TOP 1 [LogTime] FROM @doorLogs WHERE DoorId = do.ID ORDER BY [LogTime] DESC) DoorLogTime
	, (SELECT TOP 1 [Value] FROM @doorLogs WHERE DoorId = do.ID AND LogType = 6 ORDER BY [LogTime] DESC) LockStatus
	, la.[Value] Alert
	, (SELECT TOP 1 [Value] FROM @deviceLastLog WHERE DoorId = do.ID AND LogType = 1 AND LogSubType = 2 ORDER BY [LogDateTime] DESC) Rssi
	, CASE
		WHEN DATEADD(MINUTE, 3, dlct.LastCommunicationTime) > GETDATE() THEN 1
		ELSE 0
	  END AS IsOnline
	, (SELECT TOP 1 [Value] FROM @deviceLastLog WHERE DoorId = do.ID AND LogType = 8 AND LogSubType = 1 ORDER BY [LogDateTime] DESC) AS OutdoorReader
	, (SELECT TOP 1 [Value] FROM @deviceLastLog WHERE DoorId = do.ID AND LogType = 8 AND LogSubType = 0 ORDER BY [LogDateTime] DESC) AS IndoorReader
	--, dll.LogSubType
	FROM Doors do
	INNER JOIN DoorSites s ON do.SiteID = s.ID
	INNER JOIN DoorZones z ON s.ZoneID = z.ID
	INNER JOIN DoorClusters c ON z.ClusterID = c.ID
	LEFT JOIN [dbo].[DeviceLastCommunicationTime] dlct ON do.DeviceID = dlct.DeviceId
	LEFT JOIN @lastAlert la ON do.ID = la.DoorId
	WHERE do.ID IN (SELECT * FROM @selectedDoor) AND do.IsActive = 1
	AND (@searchType <> 5 OR la.[Value] IS NOT NULL)
	AND (@keyword = '*' OR do.DoorName LIKE '%'+@keyword+'%')
	ORDER BY do.[DoorName] ASC
	OFFSET (@pageSize * (@page - 1)) ROWS FETCH NEXT @pageSize ROWS ONLY
	
END

--EXEC [sp_getDoorStatusInfo] 25, 7, 5, 1, 10, '*'


--SELECT * FROM [SmartLock_DeviceLastLogs] WHERE LogIntegerValue = 2 AND LogType = 8