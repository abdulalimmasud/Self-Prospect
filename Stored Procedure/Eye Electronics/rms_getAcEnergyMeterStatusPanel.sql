ALTER PROC [dbo].[sp_getAcEnergyMeterStatusPanel]
(
	@groupId INT,
	@customerId INT,
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
		Line_1_Voltage DECIMAL(10, 2),
		Line_2_Voltage DECIMAL(10, 2),
		Line_3_Voltage DECIMAL(10, 2),
		Line_1_Current DECIMAL(10, 2),
		Line_2_Current DECIMAL(10, 2),
		Line_3_Current DECIMAL(10, 2),
		Neutral_Current DECIMAL(10, 2),
		Total_Current DECIMAL(10, 2),
		Line_1_Power DECIMAL(10, 2),
		Line_2_Power DECIMAL(10, 2),
		Line_3_Power DECIMAL(10, 2),
		Total_Power_Log DECIMAL(10, 2),
		Reactive_Power_L1 DECIMAL(10, 2),
		Reactive_Power_L2 DECIMAL(10, 2),
		Reactive_Power_L3 DECIMAL(10, 2),
		Reactive_Power_Total DECIMAL(10, 2),
		Apparent_Power_L1 DECIMAL(10, 2),
		Apparent_Power_L2 DECIMAL(10, 2),
		Apparent_Power_L3 DECIMAL(10, 2),
		Apparent_Power_Total DECIMAL(10, 2),
		Line_1_Power_Factor DECIMAL(10, 2),
		Line_2_Power_Factor DECIMAL(10, 2),
		Line_3_Power_Factor DECIMAL(10, 2),
		Total_Power_Factor DECIMAL(10, 2),
		Frequency DECIMAL(10, 2),
		kWh_Reading DECIMAL(10, 2)
	)
	INSERT INTO @data
	SELECT RMS_TanentID, RMS_NodeID, [0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25] FROM(	
		SELECT RMS_TanentID
			, RMS_NodeID
			, LogSubType
			, LogFloatValue
		FROM [RmsDataLastLog]
		WHERE RmsStationID IN (SELECT * FROM @rmsStationIds)
				AND LogType = 3
	) d
	PIVOT
	(
		SUM(LogFloatValue)
		FOR LogSubType IN ([0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24], [25])
	) AS pivot_table
	
	--SELECT * FROM @data
	
	SELECT DISTINCT d.RMS_NodeID NodeId
		, nt.[Name] [NodeName]
		, d.RMS_TanentID TenantId
		, o.[Name] [TenantName]
		, Child = ( 
					SELECT
						Line_1_Voltage
						, Line_2_Voltage
						, Line_3_Voltage
						, Line_1_Current
						, Line_2_Current
						, Line_3_Current
						, Neutral_Current
						, Total_Current
						, Line_1_Power
						, Line_2_Power
						, Line_3_Power
						, Total_Power_Log
						, Reactive_Power_L1
						, Reactive_Power_L2
						, Reactive_Power_L3
						, Reactive_Power_Total
						, Apparent_Power_L1
						, Apparent_Power_L2
						, Apparent_Power_L3
						, Apparent_Power_Total
						, Line_1_Power_Factor
						, Line_2_Power_Factor
						, Line_3_Power_Factor
						, Total_Power_Factor
						, Frequency
						, kWh_Reading
					FROM @data c 
					WHERE c.RMS_NodeID = d.RMS_NodeID AND (d.RMS_TanentID IS NULL OR c.RMS_TanentID = d.RMS_TanentID)
					FOR JSON PATH
				  )
	
	FROM @data d
	INNER JOIN [RmsNodeTypes] nt ON d.RMS_NodeID = nt.ID
	LEFT JOIN [Organizations] o ON d.RMS_TanentID = o.ID
END

--EXEC [sp_getAcEnergyMeterStatusPanel] 2, 1, 0
--SELECT * FROM [RmsNodeTypes] WHERE ID = 22
--SELECT * FROM [Organizations] WHERE ID = 9
--SELECT * FROM [RmsDataLog] WHERE RMS_TanentID = 9

--SELECT * FROM [RmsStationNodes] WHERE RmsStationID = 1