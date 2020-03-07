ALTER PROC [dbo].[sp_getDcEnergyMeterKwhLogData]
(
	@customerId INT,
	@startTime VARCHAR(30),
	@endTime VARCHAR(30),
	@rmsStationId INT = 0,
	@rmsNodeId INT = 0,
	@tenantId INT = 0,
	@isHourly TINYINT = 1,
	@page INT = 1,
	@pageSize INT = 20
)
AS
BEGIN
	IF(@isHourly = 1)
	BEGIN
		SELECT d.NodeName
			, d.ChannelName
			, d.TenantName
			, CONCAT(h.[Day], ' ', h.[Id], ':00:00') LogDateTime
			, d.[Regular]
			, d.[Battery]
			, d.[Generator]
			, d.[Value]
		FROM [GetEachDayHour] (@startTime, @endTime, 1) h
		LEFT JOIN (
			SELECT NodeName
				, ChannelName
				, TenantName
				, LogDate
				, [Hour]
				, [1] Regular
				, [2] Battery
				, [3] Generator
				, (ISNULL([1], 0) + ISNULL([2], 0)+ ISNULL([3], 0)) [Value]
			FROM
			(
				SELECT nt.[Name] NodeName
					, dmf.ChanelName ChannelName
					, o.[Name] TenantName
					, LogDate
					, DATEPART(HOUR, LogDateTime) [Hour]
					, dl.[Status]
					, CONVERT(DECIMAL(10,2), SUM(LogFloatValue)) [Value]  
				FROM [RmsDataLog] dl
					INNER JOIN RmsNodeTypes nt ON dl.RMS_NodeID = nt.ID
					INNER JOIN DeviceModelFeatures dmf ON dl.RMS_ChanelID = dmf.ChanelId
					LEFT JOIN Organizations o ON dl.RMS_TanentID = o.ID
				WHERE dl.CustomerID = @customerId AND LogType = 2 AND LogSubType = 1
					AND (dl.LogDateTime BETWEEN @startTime AND @endTime)
					AND (@rmsStationId = 0 OR RmsStationID = @rmsStationId)
					AND (@rmsNodeId = 0 OR dl.RMS_NodeID = @rmsNodeId)
					AND (@tenantId = 0 OR dl.RMS_TanentID = @tenantId)
				GROUP BY LogDate ,DATEPART(HOUR, LogDateTime), nt.[Name], dmf.ChanelName, o.[Name], dl.[Status]
			) r
			PIVOT
			(
				MAX([Value])
				FOR [Status] IN ([1], [2], [3])
			)
			AS piv
		) d ON h.Id = d.[Hour] AND h.[Day] = d.[LogDate]
		ORDER BY h.[Day] DESC, h.[Id] DESC
		OFFSET (@page * @pageSize - @pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY
	END
	ELSE IF(@isHourly = 2)
	BEGIN
		
		SELECT d.NodeName
			, d.ChannelName
			, d.TenantName
			, h.[Day] LogDateTime
			, d.Regular
			, d.Battery
			, d.Generator
			, d.[Value]
		FROM [GetEachDayHour] (@startTime, @endTime, 0) h
		LEFT JOIN (
			SELECT NodeName
				, ChannelName
				, TenantName
				, LogDate
				, [1] Regular
				, [2] Battery
				, [3] Generator
				, (ISNULL([1], 0) + ISNULL([2], 0)+ ISNULL([3], 0)) [Value]
			FROM
			(
				SELECT nt.[Name] NodeName
					, dmf.ChanelName ChannelName
					, o.[Name] TenantName
					, LogDate
					, [Status]
					, CONVERT(DECIMAL(10,2), SUM(LogFloatValue)) [Value] 
				FROM [RmsDataLog] dl
					INNER JOIN RmsNodeTypes nt ON dl.RMS_NodeID = nt.ID
					INNER JOIN DeviceModelFeatures dmf ON dl.RMS_ChanelID = dmf.ChanelId
					LEFT JOIN Organizations o ON dl.RMS_TanentID = o.ID
				WHERE dl.CustomerID = @customerId AND LogType = 2 AND LogSubType = 1
					AND (dl.LogDateTime BETWEEN @startTime AND @endTime)
					AND (@rmsStationId = 0 OR RmsStationID = @rmsStationId)
					AND (@rmsNodeId = 0 OR dl.RMS_NodeID = @rmsNodeId)
					AND (@tenantId = 0 OR dl.RMS_TanentID = @tenantId)
				GROUP BY LogDate, nt.[Name], dmf.ChanelName, o.[Name], [Status]
			) r
			PIVOT
			(
				MAX([Value])
				FOR [Status] IN ([1], [2], [3])
			)
			AS piv
		) d ON h.[Day] = d.[LogDate]
		ORDER BY h.[Day] DESC
		OFFSET (@page * @pageSize - @pageSize) ROWS FETCH NEXT @pageSize ROWS ONLY
	END
END

--EXEC [sp_getDcEnergyMeterKwhLogData] 1, 'JAN 28 2020 00:00:00', 'JAN 29 2020 23:59:59', 2, 0, 0, 1
--BETWEEN 'JAN 22 2020' AND 'JAN 22 2020 23:59:59'
--BETWEEN '01/22/2020' AND '01/22/2020 23:59:59'
