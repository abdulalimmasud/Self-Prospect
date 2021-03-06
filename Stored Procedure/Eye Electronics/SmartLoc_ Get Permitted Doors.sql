ALTER PROCEDURE [dbo].[sp_getUserGroupPermittedDoorIds]
(
	@groupId INT,
	@customerId INT,
	@keyword NVARCHAR(50) = '*'
)
AS
BEGIN
	
	DECLARE @permissionLevel INT,
			@doorId VARCHAR(MAX)

	SELECT @permissionLevel = ap.PermissionLevel, 
			@doorId = STRING_AGG( 
						CASE
							WHEN ap.PermissionLevel = 0 THEN 0
							WHEN ap.PermissionLevel = 1 THEN apd.ClusterID
							WHEN ap.PermissionLevel = 2 THEN apd.ZoneID
							WHEN ap.PermissionLevel = 3 THEN apd.SiteID
						END, ',')
	FROM AccessPermissionDoors apd
	INNER JOIN AccessPermissions ap ON apd.AccessPermissionID = ap.ID AND apd.IsActive = 1 AND apd.IsDeleted = 0
	INNER JOIN UserGroups ug ON ap.ID = ug.AccessPermissionID AND ap.IsJobTypePermission = 0 AND ap.IsActive = 1 AND ap.IsDeleted = 0
	WHERE ug.ID = @groupId AND ug.CustomerID = @customerId
	GROUP BY ap.ID, ap.PermissionLevel

	--SELECT @permissionLevel, @doorId

	IF @permissionLevel = 0
		BEGIN
			SELECT ID AS DoorId
			FROM Doors
			WHERE CustomerID = @customerId AND IsActive = 1 AND IsDeleted = 0
			AND (@keyword = '*' OR @keyword IS NULL OR [DoorName] LIKE '%'+@keyword+'%')
		END
	ELSE
		BEGIN
	
			SELECT d.ID AS DoorId
			FROM Doors as d 
			INNER JOIN DoorSites as s ON d.SiteID = s.ID AND s.IsDeleted = 0 AND s.IsActive = 1
			INNER JOIN DoorZones as z ON s.ZoneID = z.ID AND z.IsDeleted = 0 AND z.IsActive = 1
			INNER JOIN  DoorClusters as c ON z.ClusterID = c.ID AND c.IsDeleted = 0 AND c.IsActive = 1
			WHERE
			CASE 
				WHEN @permissionLevel = 1
					THEN c.ID
				WHEN @permissionLevel = 2
					THEN z.ID
				WHEN @permissionLevel = 3
					THEN s.ID
			END
			IN (SELECT * FROM string_split(@doorId, ',')) AND d.IsDeleted = 0 AND d.IsActive = 1
			AND (@keyword = '*' OR @keyword IS NULL OR d.[DoorName] LIKE '%'+@keyword+'%')
		END
END

-- EXEC sp_getUserGroupPermittedDoorIds 46, 8