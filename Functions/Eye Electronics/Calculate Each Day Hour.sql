ALTER FUNCTION [dbo].[GetEachDayHour]
(
	@startDateTime DATETIME,
	@endDateTime DATETIME,
	@isHourly BIT = 1
)
RETURNS @data TABLE
	(
		Id INT,
		[Day] DATE
	)
AS
BEGIN
	DECLARE @hourCount INT = 0
			, @dayCount INT = 0
			, @numOfHour INT = 0
			, @numOfDay INT
			, @currentDay DATE
			, @currentDayStart DATETIME
			, @currentDayEnd DATETIME
			, @startHour INT
	SET @numOfDay = DATEDIFF(DAY, @startDateTime, @endDateTime)
	
	WHILE (@dayCount <= @numOfDay)
	BEGIN
		SET @currentDay = CONVERT(DATE,DATEADD(DAY, @dayCount, @startDateTime))
		IF(@isHourly = 1)
		BEGIN
			IF(@dayCount = 0)
			BEGIN
				SET @currentDayStart = @startDateTime
			END
			ELSE
			BEGIN
				SET @currentDayStart = CONCAT(@currentDay, ' ', '00:00:00')
			END

			IF(@dayCount = @numOfDay)
			BEGIN
				SET @currentDayEnd = @endDateTime
			END
			ELSE
			BEGIN
				SET @currentDayEnd = CONCAT(@currentDay, ' ', '23:59:59')
			END	
			SELECT @startHour = FORMAT(@currentDayStart,'HH')
			SET @numOfHour = DATEDIFF(HOUR, @currentDayStart, @currentDayEnd)

			WHILE(@hourCount <= @numOfHour)
			BEGIN
				INSERT INTO @data
				SELECT (@startHour + @hourCount), @currentDay
				SET @hourCount = @hourCount + 1
			END
			SET @hourCount = 0
		END
		ELSE
		BEGIN
			INSERT INTO @data
			SELECT @dayCount, @currentDay
		END
		SET @dayCount = @dayCount + 1		
	END
	RETURN;
END

--SELECT * FROM [GetEachDayHour]('JAN 29 2020 16:00:00', 'JAN 30 2020 15:59:59', 1)