ALTER PROC [dbo].[sp_getHourlyEnergyMeterLog]
(
	@rmsStationId INT,
	@startTime VARCHAR(30),
	@endTime VARCHAR(30),
	@rmsNodeId INT = 0,
	@tenantId INT = 0,
	@isHourly TINYINT = 1
)
AS
BEGIN
	IF(@isHourly = 1)
	BEGIN
		SELECT nt.Name NodeName, dmf.ChanelName ChannelName, o.Name TenantName, LogDate, DATEPART(HOUR, LogDateTime) [hour], CONVERT(DECIMAL(10,2),SUM(LogFloatValue)) [value] 
		FROM [RmsDataLog] dl
		INNER JOIN RmsNodeTypes nt ON dl.RMS_NodeID = nt.ID
		INNER JOIN DeviceModelFeatures dmf ON dl.RMS_ChanelID = dmf.ChanelId
		LEFT JOIN Organizations o ON dl.RMS_TanentID = o.ID
		WHERE RmsStationID = @rmsStationId AND LogType = 2 AND LogSubType = 1
		AND (dl.LogDateTime BETWEEN @startTime AND @endTime)
		AND (@rmsNodeId = 0 OR dl.RMS_NodeID = @rmsNodeId)
		AND (@tenantId = 0 OR dl.RMS_TanentID = @tenantId)
		GROUP BY LogDate ,DATEPART(HOUR, LogDateTime), nt.Name, dmf.ChanelName, o.Name
		ORDER BY LogDate DESC, [hour] DESC
	END
	ELSE IF(@isHourly = 2)
	BEGIN
		SELECT nt.Name NodeName, dmf.ChanelName ChannelName, o.Name TenantName, LogDate, CONVERT(DECIMAL(10,2),SUM(LogFloatValue)) [value] 
		FROM [RmsDataLog] dl
		INNER JOIN RmsNodeTypes nt ON dl.RMS_NodeID = nt.ID
		INNER JOIN DeviceModelFeatures dmf ON dl.RMS_ChanelID = dmf.ChanelId
		LEFT JOIN Organizations o ON dl.RMS_TanentID = o.ID
		WHERE RmsStationID = @rmsStationId AND LogType = 2 AND LogSubType = 1
		AND (dl.LogDateTime BETWEEN @startTime AND @endTime)
		AND (@rmsNodeId = 0 OR dl.RMS_NodeID = @rmsNodeId)
		AND (@tenantId = 0 OR dl.RMS_TanentID = @tenantId)
		GROUP BY LogDate, nt.Name, dmf.ChanelName, o.Name
		ORDER BY LogDate DESC
	END
END

--EXEC [sp_getHourlyEnergyMeterLog] 1, 'JAN 21 2020 16:00:00', 'FEB 02 2020 23:59:59', 0, 0, 1
--BETWEEN 'JAN 22 2020' AND 'JAN 22 2020 23:59:59'
--BETWEEN '01/22/2020' AND '01/22/2020 23:59:59'

