ALTER PROC [dbo].[sp_getDcEnergyMeterKwhGraphData]
(
	@customerId INT,
	@startTime VARCHAR(30),
	@endTime VARCHAR(30),
	@rmsStationId INT = 0,
	@rmsNodeId INT = 0,
	@tenantId INT = 0,
	@isHourly TINYINT = 1
)
AS
BEGIN
	IF(@isHourly = 1)
	BEGIN
		SELECT CONCAT(h.[Day], ' ', h.[Id], ':00:00') LogDateTime
			, d.DC_CT_01
			, d.DC_CT_02
			, d.DC_CT_03
			, d.DC_CT_04
			, d.DC_CT_05
			, d.DC_CT_06
			, d.DC_CT_07
			, d.DC_CT_08
		FROM [GetEachDayHour] (@startTime, @endTime, 1) h
		LEFT JOIN (
			SELECT LogDate, [Hour], MAX([701]) [DC_CT_01], MAX([702]) [DC_CT_02], MAX([703]) [DC_CT_03], MAX([704]) [DC_CT_04], MAX([705]) [DC_CT_05], MAX([706]) [DC_CT_06], MAX([707]) [DC_CT_07], MAX([708]) [DC_CT_08]
			FROM (
				SELECT RMS_ChanelID ChannelId, LogDate, DATEPART(HOUR, LogDateTime) [Hour], CONVERT(DECIMAL(10,2), SUM(LogFloatValue)) [value] 
				FROM [RmsDataLog]
				WHERE LogType = 2 AND LogSubType = 1 AND CustomerID = @customerId
				AND (LogDateTime BETWEEN @startTime AND @endTime)
				AND (@rmsStationId = 0 OR RmsStationID = @rmsStationId)
				AND (@rmsNodeId = 0 OR RMS_NodeID = @rmsNodeId)
				AND (@tenantId = 0 OR RMS_TanentID = @tenantId)
				GROUP BY LogDate, RMS_ChanelID, DATEPART(HOUR, LogDateTime)
				--ORDER BY LogDate, [hour]
			) d
			PIVOT
			(
				MAX([Value])
				FOR ChannelId IN ([701], [702], [703], [704], [705], [706], [707], [708])
			) AS pivot_table
			GROUP BY LogDate, [Hour]
		) d ON h.Id = d.[Hour] AND h.[Day] = d.[LogDate]
		ORDER BY h.[Day], h.[Id]
	END
	ELSE IF(@isHourly = 2)
	BEGIN
		SELECT h.[Day] LogDateTime
			, d.DC_CT_01
			, d.DC_CT_02
			, d.DC_CT_03
			, d.DC_CT_04
			, d.DC_CT_05
			, d.DC_CT_06
			, d.DC_CT_07
			, d.DC_CT_08
		FROM  [GetEachDayHour] (@startTime, @endTime, 0) h
		LEFT JOIN
		(
			SELECT LogDate, MAX([701]) [DC_CT_01], MAX([702]) [DC_CT_02], MAX([703]) [DC_CT_03], MAX([704]) [DC_CT_04], MAX([705]) [DC_CT_05], MAX([706]) [DC_CT_06], MAX([707]) [DC_CT_07], MAX([708]) [DC_CT_08]
			FROM (
				SELECT RMS_ChanelID ChannelId, LogDate, CONVERT(DECIMAL(10,2), SUM(LogFloatValue)) [value] 
				FROM [RmsDataLog]
				WHERE LogType = 2 AND LogSubType = 1 AND CustomerID = @customerId
					AND (LogDateTime BETWEEN @startTime AND @endTime)
					AND (@rmsStationId = 0 OR RmsStationID = @rmsStationId)
					AND (@rmsNodeId = 0 OR RMS_NodeID = @rmsNodeId)
					AND (@tenantId = 0 OR RMS_TanentID = @tenantId)
				GROUP BY LogDate, RMS_ChanelID
			) d
			PIVOT
			(
				MAX([Value])
				FOR ChannelId IN ([701], [702], [703], [704], [705], [706], [707], [708])
			) AS pivot_table
			GROUP BY LogDate
		) d ON h.[Day] = d.[LogDate]
		ORDER BY h.[Day]
	END
END

--EXEC [sp_getDcEnergyMeterKwhGraphData] 1, 'JAN 29 2020 16:00:00', 'FEB 02 2020 15:59:59', 1, 20, 0, 2
--BETWEEN 'JAN 22 2020' AND 'JAN 22 2020 23:59:59'
--BETWEEN '01/22/2020' AND '01/22/2020 23:59:59'
