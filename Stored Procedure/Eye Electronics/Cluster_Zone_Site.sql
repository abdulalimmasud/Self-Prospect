ALTER PROC [dbo].[sp_getClusterZoneSites]
(
	@searchId INT,
	@searchType INT, -- Cluster = 1, Zone = 2, Site = 3
	@customerId INT,
	@page INT,
	@pageSize INT
)
AS
BEGIN
	IF(@searchType = 1)
	BEGIN
		SELECT dc.ID
			, dc.ClusterName [Name]
			, (SELECT COUNT(ClusterID) FROM [DoorZones] WHERE ClusterID = dc.ID) Zones 
			, (SELECT COUNT(DISTINCT SiteId) FROM [ClusterZoneSites] WHERE ClusterId = dc.ID) Sites
			, (SELECT COUNT(d.ID) FROM [Doors] d
					INNER JOIN [ClusterZoneSites] czs ON d.SiteID = czs.SiteId
					WHERE czs.ClusterId = dc.ID AND d.IsActive = 1
				) Doors 
		FROM [DoorClusters] dc
		WHERE dc.CustomerID = @customerId 
		AND dc.IsDeleted = 0
		AND (@searchId = 0 OR dc.ID = @searchId)
		ORDER BY [Name]
		OFFSET ((@page-1)*@pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY

		SELECT COUNT(ID) FROM [DoorClusters]
		WHERE CustomerID = @customerId
		AND (@searchId = 0 OR ID = @searchId)
	END
	ELSE IF(@searchType = 2)
	BEGIN
		SELECT dz.ID
			, dz.ZoneName [Name]
			, (SELECT COUNT (ID) FROM [DoorSites] WHERE ZoneID = dz.ID AND IsDeleted = 0) Sites
			, (SELECT COUNT(d.ID) FROM [Doors] d
				INNER JOIN [DoorSites] ds ON d.SiteID = ds.ID
				WHERE ds.ZoneID = dz.ID AND d.IsActive = 1
			) Doors 
		FROM [DoorZones] dz
		WHERE (@searchId = 0 OR dz.ID = @searchId)
		AND CustomerID = @customerId
		AND dz.IsDeleted = 0
		ORDER BY [Name]
		OFFSET ((@page-1)*@pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY

		SELECT COUNT(ID) FROM [DoorZones]
		WHERE CustomerID = @customerId
		AND (@searchId = 0 OR ID = @searchId)
	END
	ELSE IF(@searchType = 3)
	BEGIN
		SELECT ds.ID
			, ds.SiteName [Name]
			, ds.[Address]
			, ds.GeoCordinate
			, (SELECT COUNT(ID) Doors FROM [Doors] WHERE SiteID = ds.ID AND IsActive = 1) Doors
		FROM [DoorSites] ds
		WHERE (@searchId = 0 OR ds.ID = @searchId)
		AND CustomerID = @customerId
		AND ds.IsDeleted = 0
		ORDER BY [Name]
		OFFSET ((@page-1)*@pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY

		SELECT COUNT(ID) FROM [DoorSites]
		WHERE CustomerID = @customerId
		AND (@searchId = 0 OR ID = @searchId)
	END
END

--EXEC [sp_getClusterZoneSites] 0, 1, 8, 1 , 100
--EXEC [sp_getClusterZoneSites] 18, 2, 8, 1 , 100
--EXEC [sp_getClusterZoneSites] 0, 2, 8, 1 , 100
--EXEC [sp_getClusterZoneSites] 34, 3, 8, 1 , 100
--EXEC [sp_getClusterZoneSites] 0, 3, 8, 1 , 100