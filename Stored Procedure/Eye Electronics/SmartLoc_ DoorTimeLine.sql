ALTER PROC [dbo].[sp_getDoorTimeLine]
(
	@customerId INT,
	@groupId INT,--46
	@doorId INT = 0,
	@siteId INT = 0,
	@zoneId INT = 0,
	@clusterId INT = 0,
	@alertTypes VARCHAR(50) = '0,1,2,3,4,5,6,7,8',
	@logTypes VARCHAR(10) = '5,6',
	@page INT = 1,
	@pageSize INT = 20
)
AS
BEGIN
	DECLARE  @permissionLevel INT
		, @accessPermissionId INT
		, @toDate DATETIME = GETDATE()
		, @fromDate DATETIME
	
	DECLARE @alertTbl TABLE
	(
		AlertId INT
	)

	DECLARE @logTbl TABLE
	(
		LogId INT
	)

	IF (@alertTypes IS NULL OR @alertTypes = '*')
	BEGIN
		INSERT INTO @alertTbl VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8)
		--SET @alertTypes = '0,1,2,3,4,5,6,7,8'
	END
	ELSE
	BEGIN
		INSERT INTO @alertTbl SELECT * FROM STRING_SPLIT(@alertTypes, ',')
	END

	IF (@logTypes IS NULL OR @logTypes = '*')
	BEGIN
		INSERT INTO @logTbl VALUES (5), (6)
		--SET @logTypes = '5,6'
	END
	ELSE
	BEGIN
		INSERT INTO @logTbl SELECT * FROM STRING_SPLIT(@logTypes, ',')
	END
	SELECT @fromDate = DATEADD(DAY, -3, @toDate)

	SELECT @accessPermissionId = ID,  @permissionLevel = PermissionLevel FROM AccessPermissions WHERE ID = (SELECT AccessPermissionID FROM UserGroups WHERE ID = @groupId)

	DECLARE @doorIds TABLE
	(
		DoorId INT
	)
	IF(@permissionLevel = 0)
	BEGIN
		INSERT INTO @doorIds
		SELECT ID FROM Doors d
		INNER JOIN ClusterZoneSites czs ON d.SiteID = czs.SiteId
		WHERE CustomerID = @customerId 
		AND (@doorId = 0 OR d.ID = @doorId)
		AND (@siteId = 0 OR czs.SiteId = @siteId)
		AND (@zoneId = 0 OR czs.ZoneId = @zoneId)
		AND (@clusterId = 0 OR czs.ClusterId = @clusterId)
		AND IsActive = 1 AND IsDeleted = 0
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
			AND (@siteId = 0 OR ds.ID = @siteId)
			AND (@zoneId = 0 OR dz.ID = @zoneId)
			AND (@clusterId = 0 OR dc.ID = @clusterId)
	END


	SELECT dt.DoorId
		, d.DoorName
		, u.ID AS UserId
		, u.UserName
		, dt.LogType
		, dt.LogTime
		, dt.[Value]
		, ap.PermissionName
		, ap.IsJobTypePermission
		, umn.MobileNumber
		, o.[Name] Organization
		, (SELECT TOP 1 LogIntValue FROM SmartLock_DoorLogs WHERE DoorId = dt.DoorId AND EventId = dt.EventId AND LogType = 3 ORDER BY LogTime DESC) AS UnlockRequest

		FROM (
		SELECT DoorId, EventId, MAX(UserId) UserId, LogType, AlertDateTime LogTime, AlertType AS  [Value], MAX(AccessPermissionId) AccessPermissionId   FROM [SmartLock_DoorAlerts]
		WHERE DoorId IN (SELECT * FROM @doorIds) AND LogType = 7 AND AlertCategory = 0 AND AlertType IN (SELECT * FROM @alertTbl) AND IsDeleted = 0 -- AND EventId IS NOT NULL
		GROUP BY DoorId, EventId, LogType, AlertType, AlertDateTime
		UNION
		SELECT DoorId, EventId, MAX(UserId) UserId, LogType, LogTime, LogIntValue AS [Value], MAX(AccessPermissionId) AccessPermissionId FROM [SmartLock_DoorLogs]
		WHERE DoorId IN (SELECT * FROM @doorIds) AND LogType IN (SELECT * FROM @logTbl) AND EventId IS NOT NULL  AND IsDeleted = 0
		AND LogIntValue = CASE
							WHEN LogType = 5 THEN 2
							WHEN LogType = 6 THEN 1
						END
		GROUP BY DoorId, EventId, LogType, LogIntValue, LogTime) dt
	INNER JOIN [Doors] d ON dt.DoorId = d.ID
	LEFT JOIN [Users] u ON dt.UserId = u.ID
	LEFT JOIN [Organizations] o ON u.OrganizationID = o.ID
	LEFT JOIN [UserMobileNumbers] umn ON u.UserMobileNumberID = umn.ID
	LEFT JOIN [AccessPermissions] ap ON dt.AccessPermissionId = ap.ID
	ORDER BY dt.LogTime DESC
	OFFSET ((@page-1) * @pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY
END



--EXEC [sp_getDoorTimeLine] 8, 44, 0, 0, 0, 0, null, null, 1, 20