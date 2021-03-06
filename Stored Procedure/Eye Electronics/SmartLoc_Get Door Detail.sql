ALTER PROC [dbo].[sp_getDoorStatusDetail]
(
	@groupId INT
	, @customerId INT
	, @logType INT
	, @searchType INT -- LockFail = 1, LockOpen = 2, DoorOpen = 3
	, @filter NVARCHAR(50) = '*'
	, @page INT = 1
	, @pageSize INT = 10
	, @doorId INT = 0
)
AS
BEGIN
	DECLARE @permissionLevel INT
		, @accessPermissionId INT
		, @totalDoor INT
		, @count INT = 0
		, @fDoorId INT
		, @itemCount INT
		, @toDate DATETIME = GETDATE()
		, @fromDate DATETIME

	SELECT @fromDate = DATEADD(DAY, -3, @toDate)		
	
	SELECT @accessPermissionId = ID,  @permissionLevel = PermissionLevel FROM AccessPermissions WHERE ID = (SELECT AccessPermissionID FROM UserGroups WHERE ID = @groupId)
	
	DECLARE @doorIds TABLE
	(
		DoorId INT
	)
	IF(@permissionLevel = 0)
	BEGIN
		INSERT INTO @doorIds
		SELECT ID FROM Doors WHERE CustomerID = @customerId AND IsActive = 1 AND IsDeleted = 0 AND (@doorId = 0 OR ID = @doorId)
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
			AND (@doorId = 0 OR d.ID = @doorId)
	END
	
	IF(@searchType < 5)
	BEGIN
		DECLARE @doorLastLogs TABLE
		(
			Id INT,
			DoorId INT,
			[Value] INT,
			[LogTime] DATETIME,
			UserId INT
		)
		INSERT INTO @doorLastLogs
		SELECT Id, DoorId, LogIntValue, LogTime, UserId FROM [SmartLock_DoorLastLogs]
		WHERE CustomerId = @customerId
		AND DoorId IN (SELECT * FROM @doorIds)
		AND LogType = @logType
		ORDER BY [LogTime] DESC
		
		DECLARE @lastLogDoors TABLE
		(
			Id INT IDENTITY(1,1),
			DoorId INT
		)
		INSERT INTO @lastLogDoors
		SELECT DISTINCT DoorId FROM @doorLastLogs
		--GROUP BY DoorId
	
		DECLARE @searchValue TABLE
		(
			[Value] INT
		)
		
		IF(@searchType = 1)
		BEGIN
			INSERT INTO @searchValue
			VALUES (3), (4)
		END
		ELSE IF(@searchType = 2)
		BEGIN
			INSERT INTO @searchValue
			VALUES (5)
		END
		ELSE
		BEGIN
			INSERT INTO @searchValue
			VALUES (2)
		END
	
		SELECT @totalDoor = COUNT(DoorId) FROM @lastLogDoors

		DECLARE @doorLogs TABLE
		(
			Id INT,
			DoorId INT,
			[Value] INT,
			[LogTime] DATETIME,
			UserId INT
		)
	
		WHILE (@count < @totalDoor)
		BEGIN
			SET @count = @count + 1
			SELECT @fDoorId = DoorId FROM @lastLogDoors WHERE Id = @count
		
			INSERT INTO @doorLogs
			SELECT TOP 1 Id, DoorId, [Value], [LogTime], UserId FROM @doorLastLogs WHERE DoorId = @fDoorId ORDER BY LogTime DESC
		END

		SELECT COUNT(Id) AS Total FROM @doorLogs WHERE [Value] IN (SELECT * FROM @searchValue)
		SELECT dl.Id
			, dl.DoorId
			, d.DoorName
			, dl.[Value] AS [Status]
			, dl.[LogTime]
			, dl.UserId
			, u.[UserName]
			, u.[UserEmail]
			, umn.MobileNumber
			, o.[Name] OrgName
		FROM @doorLogs dl
		INNER JOIN [Doors] d ON dl.DoorId = d.ID
		LEFT JOIN [Users] u ON dl.UserId = u.ID
		LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
		LEFT JOIN [Organizations] o ON u.OrganizationID = o.ID
		WHERE dl.[Value] IN (SELECT * FROM @searchValue)
		AND (@doorId = 0 OR d.ID = @doorId)
		ORDER BY dl.[LogTime] DESC
		OFFSET @pageSize * (@page - 1) ROWS FETCH NEXT @pageSize ROWS ONLY 
	END
	ELSE IF(@searchType = 5)
	BEGIN
		DECLARE @filters TABLE
		(
			Id INT
		)

		IF(@filter <> '*')
		BEGIN
			INSERT INTO @filters SELECT * FROM STRING_SPLIT(@filter, ',')
		END
		DECLARE @doorAlert TABLE
		(
			Id INT,
			DoorId INT,
			[Status] INT,
			[LogTime] DATETIME,
			UserId INT,
			PermissionId INT
		)
		INSERT INTO @doorAlert
		SELECT 
			id,
			DoorId,
			AlertType,
			AlertDateTime,
			UserId,
			AccessPermissionId
		FROM [SmartLock_DoorAlerts]
		WHERE CustomerID = @customerId
			AND (@doorId = 0 OR DoorId = @doorId)
			AND DoorId IN (SELECT * FROM @doorIds)
			AND LogType = @logType
			AND AlertCategory = 0
			AND IsExecuted = 0
			AND IsDeleted = 0
			AND AlertDateTime BETWEEN @fromDate AND @toDate
			AND (@filter = '*' OR (AlertType IN (SELECT * FROM @filters)))
		SELECT COUNT(Id) FROM @doorAlert
		
		SELECT da.*
			, d.DoorName
			, CASE
				WHEN da.[Status] NOT IN (3,4,5,7,8) THEN u.UserName
				ELSE NULL
			  END AS UserName
			, ap.PermissionName
			, CASE
				WHEN da.[Status] NOT IN (3,4,5,7,8) THEN u.UserEmail
				ELSE NULL
			  END AS UserEmail
			, CASE
				WHEN da.[Status] NOT IN (3,4,5,7,8) THEN umn.MobileNumber
				ELSE NULL
			  END AS MobileNumber
			, CASE
				WHEN da.[Status] NOT IN (3,4,5,7,8) THEN o.[Name]
				ELSE NULL
			  END AS OrgName
			
		FROM @doorAlert da
		INNER JOIN [Doors] d ON da.DoorId = d.ID
		LEFT JOIN [AccessPermissions] ap ON da.PermissionId = ap.ID
		LEFT JOIN [Users] u ON da.UserId = u.ID
		LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
		LEFT JOIN [Organizations] o ON u.OrganizationID = o.ID
		WHERE (@doorId = 0 OR d.ID = @doorId)
		ORDER BY da.[LogTime] DESC
		OFFSET @pageSize * (@page - 1) ROWS FETCH NEXT @pageSize ROWS ONLY 
	END
	ELSE IF(@searchType = 6)
	BEGIN
		DECLARE @24StartDate DATETIME = DATEADD(HOUR, -24, @toDate)
				, @48StartDate DATETIME = DATEADD(HOUR, -42, @toDate)
				, @72StartDate DATETIME = DATEADD(HOUR, -72, @toDate)
				, @count24 INT = 0
				, @count72 INT = 0
				, @count48 INT = 0
				, @countAll INT = 0

		DECLARE @doorOffline TABLE
		(
			Id INT,
			DeviceId INT,
			DoorId INT,
			DoorName NVARCHAR(100),
			[LogTime] DATETIME
		)
		INSERT INTO @doorOffline
		SELECT dlct.Id, dlct.DeviceId, d.ID, d.DoorName, dlct.LastCommunicationTime FROM [DeviceLastCommunicationTime] dlct
		INNER JOIN [Doors] d ON dlct.DeviceId = d.DeviceID AND d.IsActive = 1
		WHERE dlct.CustomerId = @customerId
		AND (@doorId = 0 OR d.ID = @doorId)
		AND DATEADD(MINUTE, 3, dlct.LastCommunicationTime) < @toDate
		SELECT @count24 = COUNT(Id) FROM @doorOffline WHERE LogTime <= @24StartDate AND LogTime > @48StartDate
		SELECT @count48 = COUNT(Id) FROM @doorOffline WHERE LogTime <= @48StartDate AND LogTime > @72StartDate
		SELECT @count72 = COUNT(Id) FROM @doorOffline WHERE LogTime < @72StartDate
		SELECT @countAll = COUNT(Id) FROM @doorOffline


		SELECT COUNT(Id) FROM @doorOffline WHERE
		(
			(@filter = '*' AND DATEADD(MINUTE, 3, LogTime) < @toDate)
			OR (@filter = '1' AND LogTime <= @24StartDate AND LogTime > @48StartDate)
			OR (@filter = '2' AND LogTime <= @48StartDate AND LogTime > @72StartDate)
			OR (@filter = '3' AND LogTime < @72StartDate)
		)

		SELECT * FROM @doorOffline WHERE
		(
			(@filter = '*' AND DATEADD(MINUTE, 3, LogTime) < @toDate)
			OR (@filter = '1' AND LogTime <= @24StartDate AND LogTime > @48StartDate)
			OR (@filter = '2' AND LogTime <= @48StartDate AND LogTime > @72StartDate)
			OR (@filter = '3' AND LogTime < @72StartDate)
		)
		ORDER BY [LogTime] DESC
		OFFSET @pageSize * (@page - 1) ROWS FETCH NEXT @pageSize ROWS ONLY 

		SELECT @count24 [Count24], @count48 [Count48], @count72 [Count72], @countAll CountAll
	END
	ELSE IF(@searchType = 7)
	BEGIN
		DECLARE @readerFaults TABLE
		(
			Id INT,
			DoorId INT,
			SubType INT,
			[LogTime] DATETIME
		)
		INSERT INTO @readerFaults
		SELECT dll.Id, dll.DoorID, dll.LogSubType, dll.LogDateTime FROM [SmartLock_DeviceLastLogs] dll
		INNER JOIN [Doors] d ON dll.DeviceID = d.DeviceID
		WHERE  DoorID IN (SELECT * FROM @doorIds)
		AND LogType = 8
		AND LogIntegerValue = 2

		SELECT COUNT(Id) FROM @readerFaults
		SELECT rf.*, d.DoorName FROM @readerFaults rf
		INNER JOIN [Doors] d ON rf.DoorId = d.ID
		WHERE (@doorId = 0 OR d.ID = @doorId)
		ORDER BY [LogTime] DESC
	END
END

-- EXEC [sp_getDoorStatusDetail] 25, 8, 0, 6, '*', 1, 10
--LockFail = 1,
--LockFault = 2
--LockOpen = 3,
--DoorOpen = 4,
--DoorAlert = 5,
--DoorOffline = 6,
--DoorReaderFault = 7
