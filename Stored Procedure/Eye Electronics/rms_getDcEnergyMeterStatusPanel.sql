USE [RMS]
GO
/****** Object:  StoredProcedure [dbo].[sp_getDcEnergyMeterStatusPanel]    Script Date: 15-Feb-20 11:15:58 AM ******/
ALTER PROC [dbo].[sp_getDcEnergyMeterStatusPanel]
(
	@groupId INT,
	@customerId INT,
	@filteredBy TINYINT, -- 1 = Tenant, 2 = node
	@tenantId INT = 0,
	@rmsStationId INT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @rmsStationIds TABLE
	(
		Id INT
	)
	INSERT INTO @rmsStationIds
	EXEC [sp_getPermittedRmsStationsId] @groupId, @customerId, @rmsStationId
	DECLARE @data TABLE
	(
		RMS_TanentID INT,
		RMS_NodeID INT,
		[Load] DECIMAL(10,2),
		[Alarm] INT
	)
	
	INSERT INTO @data
	SELECT RMS_TanentID, RMS_NodeID, [2], [4] FROM(	
		SELECT RMS_TanentID
			, RMS_NodeID
			, LogSubType
			, CASE 
				WHEN LogSubType = 2 THEN LogFloatValue
				ELSE 
				CASE 
					WHEN LogIntValue = 3 THEN 1
					ELSE 0
				END
			  END [Value]
		FROM [RmsDataLastLog]
		WHERE RmsStationID IN (SELECT * FROM @rmsStationIds)  
				AND (@tenantId = 0 OR RMS_TanentID = @tenantId)
				AND LogType = 2 
				AND LogSubType IN (2,4)
	) d
	PIVOT
	(
		SUM([Value])
		FOR LogSubType IN ([2], [4])
	) AS pivot_table
	
	IF(@filteredBy = 1)
	BEGIN
		SELECT DISTINCT RMS_TanentID [Id]
			, [Name] 
			, Child = (SELECT cd.RMS_NodeID [Id], nt.[Name], cd.[Load], cd.[Alarm] FROM @data cd INNER JOIN  RmsNodeTypes nt ON cd.RMS_NodeID = nt.ID WHERE cd.RMS_TanentID = d.RMS_TanentID FOR JSON PATH)
		FROM @data d
		INNER JOIN [Organizations] o ON d.RMS_TanentID = o.ID
	END
	ELSE IF(@filteredBy = 2)
	BEGIN
		SELECT DISTINCT d.RMS_NodeID [Id]
			, nt.[Name] 
			, Child = (SELECT cd.RMS_TanentID [Id], o.[Name], cd.[Load], cd.[Alarm] FROM @data cd INNER JOIN  Organizations o ON cd.RMS_TanentID = o.ID WHERE cd.RMS_NodeID = d.RMS_NodeID FOR JSON PATH)
		FROM @data d
		INNER JOIN [RmsNodeTypes] nt ON d.RMS_NodeID = nt.ID
	END
	SET NOCOUNT OFF
END

--EXEC [sp_getDcEnergyMeterStatusPanel] 2, 1, 1, 3, 0