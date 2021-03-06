ALTER PROC [dbo].[sp_get_permission_by_door]
(
	@doorId INT
)
AS
BEGIN
	SELECT DISTINCT ISNULL(ap.ID,0)'PermissionID'
		, ISNULL(ap.ScheduleID,0)'ScheduleID'
		, CASE 
			WHEN u.ID IS NULL AND job.UserID IS NULL THEN 0
			WHEN u.ID IS NULL THEN job.UserID
			ELSE u.ID
			END AS UserID
		, ISNULL(uc.CardIntegerNumber,0) 'CardNumber' 
	FROM [dbo].[Doors] d
	INNER JOIN [dbo].[vmSiteZoneView] vm ON d.SiteID = vm.SiteId
	INNER JOIN [dbo].[AccessPermissionDoors] apd ON apd.IsActive = 1 AND apd.IsDeleted = 0 AND (d.ID = apd.DoorID OR apd.SiteID = d.SiteID OR apd.ZoneID = vm.ZoneId OR vm.ClusterId = apd.ClusterID OR (apd.IsGlobal = 1 AND d.CustomerID = apd.CustomerID))
	INNER JOIN [dbo].[AccessPermissions] ap ON apd.AccessPermissionID = ap.ID AND ap.IsActive = 1 AND ap.IsDeleted = 0 AND d.CustomerID = ap.CustomerID
	LEFT JOIN [dbo].[UserGroups] ug ON ap.ID = ug.AccessPermissionID AND ug.IsDeleted = 0 AND ug.IsActive = 1
	LEFT JOIN [dbo].[Users] u ON ug.ID = u.UserGroupID AND u.IsCardUnlockActive = 1 AND u.IsDeleted = 0 AND u.IsActive = 1
	LEFT JOIN [dbo].[vm_JobUsers] job ON ap.ID = job.AccessPermissionID AND d.CustomerID = job.CustomerID
	LEFT JOIN [dbo].[UserCards] uc ON (u.UserCardID = uc.ID OR job.UserCardID = uc.ID) AND uc.IsDeleted = 0 AND uc.IsActive = 1
	LEFT JOIN [dbo].[Schedules] s ON (uc.ScheduleID = s.ID AND uc.IsScheduleEnabled = 1) AND s.IsDeleted = 0 AND s.IsActive = 1 AND GETDATE() BETWEEN s.StartTime AND s.EndTime
	WHERE d.ID = @doorId AND d.IsActive = 1 AND d.IsDeleted = 0 AND uc.CardIntegerNumber IS NOT NULL
	ORDER BY CardNumber ASC
END

--EXEC [dbo].[sp_get_permission_by_door] 4

