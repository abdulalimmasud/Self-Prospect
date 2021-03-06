ALTER PROC [dbo].[sp_getPermittedUsers]
(
	@doorId INT = 0
	,	@siteId INT = 0
	,	@zoneId INT = 0
	,	@clusterId INT = 0
	,	@permissionId INT = 0
	,	@isJobType BIT = 0
	,	@customerId INT = 0
)
AS
BEGIN
	SELECT DISTINCT ISNULL(ap.ID,0)'PermissionID'
		, CASE 
			WHEN u.ID IS NULL THEN job.UserID
			ELSE u.ID
			END AS UserID
		, CASE
			WHEN u.UserName IS NULL THEN job.UserName
			ELSE u.UserName
			END AS UserName
		, ap.PermissionName
		, vm.ClusterName
		, d.ID
		, CASE
			WHEN u.IsCardUnlockActive IS NULL THEN job.IsCardUnlockActive
			ELSE u.IsCardUnlockActive
			END IsCardUnlockActive
		, CASE
			WHEN u.IsSmsUnlockActive IS NULL THEN job.IsSmsUnlockActive
			ELSE u.IsSmsUnlockActive
		  END IsSmsUnlockActive
		, CASE
			WHEN u.IsWebLogInActive IS NULL THEN job.IsWebLogInActive
			ELSE u.IsWebLogInActive
		  END IsWebLogInActive
		, o.[Name] AS Organization
		, umn.MobileNumber
	FROM [dbo].[Doors] d
	INNER JOIN [dbo].[vmSiteZoneView] vm ON d.SiteID = vm.SiteId
	INNER JOIN [dbo].[AccessPermissionDoors] apd ON apd.IsActive = 1 AND apd.IsDeleted = 0 AND (d.ID = apd.DoorID OR apd.SiteID = d.SiteID OR apd.ZoneID = vm.ZoneId OR vm.ClusterId = apd.ClusterID OR (apd.IsGlobal = 1 AND d.CustomerID = apd.CustomerID))
	INNER JOIN [dbo].[AccessPermissions] ap ON apd.AccessPermissionID = ap.ID   AND ap.IsActive = 1 AND ap.IsDeleted = 0 AND d.CustomerID = ap.CustomerID AND (@isJobType = 0 OR ap.IsJobTypePermission = @isJobType)
	LEFT JOIN [dbo].[UserGroups] ug ON (ap.ID = ug.AccessPermissionID OR (apd.IsGlobal = 1 AND apd.AccessPermissionID = ug.AccessPermissionID)) AND ug.IsDeleted = 0 AND ug.IsActive = 1
	LEFT JOIN [dbo].[Users] u ON ug.ID = u.UserGroupID  AND u.IsDeleted = 0 AND u.IsActive = 1
	LEFT JOIN [dbo].[vm_JobUsers] job ON ap.ID = job.AccessPermissionID AND d.CustomerID = job.CustomerID
	INNER JOIN [Organizations] o ON (u.OrganizationID = o.ID OR job.OrganizationID = o.ID) AND o.IsActive = 1 AND o.IsDeleted = 0
	INNER JOIN [UserMobileNumbers] umn ON (u.UserMobileNumberID = umn.ID OR job.UserMobileNumberID = umn.ID) AND umn.IsActive = 1 AND umn.IsDeleted = 0
	WHERE
	d.CustomerID = @customerId
	AND	(@doorId = 0 OR d.ID = @doorId)
	AND (@siteId = 0 OR vm.SiteId = @siteId)
	AND (@zoneId = 0 OR vm.ZoneId = @zoneId)
	AND (@clusterId = 0 OR vm.ClusterId = @clusterId)
	AND (@permissionId = 0 OR (ap.ID = @permissionId AND ap.IsJobTypePermission = @isJobType))
	AND d.IsActive = 1 AND d.IsDeleted = 0
	AND (apd.IsGlobal = 1 OR u.ID IS NOT NULL)
	AND (u.UserName IS NOT NULL OR job.UserName IS NOT NULL)
	ORDER BY PermissionID ASC
END

-- EXEC [sp_getPermittedUsers] 412, 0, 0, 0, 0, 0, 8