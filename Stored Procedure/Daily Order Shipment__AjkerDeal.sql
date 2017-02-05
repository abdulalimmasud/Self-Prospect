
----Count Daily Shipment in Different Category-----
CREATE PROC [Reports].[USP_CountDailyOrderShipment]
(
	@FromDate varchar(20),
	@ToDate varchar(20)
)
AS
BEGIN

	Select Count(CouponId) AS OrderCount,'-7' AS CourierId,'Confirmed Order By CRM' AS CourierName From Deal.Coupons cu 
	where cu.CrmConfirmationDate >= @FromDate AND cu.CrmConfirmationDate < DateAdd(day, 1, @ToDate)
	AND IsDone Not In(2,4,5,6,8)

	UNION

	Select Count(CouponId) AS OrderCount,'-6' AS CourierId,'Total M1' AS CourierName From Deal.Coupons cu 
	where IsDone In(7,16,18,19,23,24,17,10,111,30,34,109) AND cu.CrmConfirmationDate >= @FromDate 
	AND cu.CrmConfirmationDate < DateAdd(day, 1, @ToDate)

	UNION

	SELECT((Select Count(CouponId)From Deal.Coupons cu 
	where cu.CrmConfirmationDate >= @FromDate AND cu.CrmConfirmationDate < DateAdd(day, 1, @ToDate)
	AND IsDone Not In(2,4,5,6,8)) - (Select Count(CouponId) From Deal.Coupons cu 
	where IsDone In(7,16,18,19,23,24,17,10,111,30,34,109) AND cu.CrmConfirmationDate >= @FromDate 
	AND cu.CrmConfirmationDate < DateAdd(day, 1, @ToDate))) AS OrderCount,'-5' AS CourierId, 'Total M2' AS CourierName

	UNION

	Select  Count(DISTINCT cu.CouponId) AS OrderCount,'-4' AS CourierId,'Total Shipment' AS CourierName 
	From Deal.Coupons cu Inner Join Delivery.DeliveryDetails cr On cu.CouponId=cr.CouponId 
	where IsDone In(1,11) AND cu.CommentedOn >= @FromDate AND cu.CommentedOn < DateAdd(day, 1, @ToDate) 
	AND TRY_CONVERT(INT,cr.CourierName) In (2,3,4)

	UNION

	Select Count(DISTINCT CouponId) AS OrderCount,'-3' AS CourierId,'Todays Shipment' AS CourierName From Deal.Coupons cu  
	where IsDone In(1,11) AND cu.CommentedOn >= @FromDate AND cu.CommentedOn < DateAdd(day, 1, @ToDate)
	AND cu.CrmConfirmationDate >= @FromDate AND cu.CrmConfirmationDate < DateAdd(day, 1, @ToDate)

	UNION

	Select  Count(DISTINCT CouponId) AS OrderCount,'-2' AS CourierId,'Previous Day Shipment' AS CourierName From Deal.Coupons cu
	where IsDone In(1,11) 
	AND cu.CommentedOn >= @FromDate AND cu.CommentedOn < DateAdd(day, 1, @ToDate)
	AND cu.CrmConfirmationDate >= DateAdd(day, -1, @FromDate) AND cu.CrmConfirmationDate < @ToDate

	UNION

	SELECT((Select Count(DISTINCT cu.CouponId)From Deal.Coupons cu Inner Join Delivery.DeliveryDetails cr On cu.CouponId=cr.CouponId 
	where IsDone In(1,11) AND cu.CommentedOn >= @FromDate AND cu.CommentedOn < DateAdd(day, 1, @ToDate) 
	AND TRY_CONVERT(INT,cr.CourierName) In (2,3,4)) - (Select  Count(DISTINCT CouponId) From Deal.Coupons cu
	where IsDone In(1,11) 
	AND cu.CommentedOn >= @FromDate AND cu.CommentedOn < DateAdd(day, 1, @ToDate)
	AND cu.CrmConfirmationDate >= DateAdd(day, -1, @FromDate) AND cu.CrmConfirmationDate < @ToDate)) AS OrderCount,'-1' AS CourierId, 'All Added Back Logs' AS CourierName

	UNION

	Select Count(DISTINCT cu.CouponId) AS OrderCount,cr.CourierId AS CourierId,cr.CourierName AS CourierName From Deal.Coupons cu 
	Inner Join Delivery.DeliveryDetails dd On cu.CouponId=dd.CouponId
	INNER JOIN deal.Couriers as cr ON cr.CourierId = TRY_CONVERT(INT,dd.CourierName)
	where IsDone In(1,11) 
	AND cu.CommentedOn >= @FromDate 
	AND cu.CommentedOn < DateAdd(day, 1, @ToDate) 
	
	GROUP BY cr.CourierId,cr.CourierName
	
	ORDER BY CourierId ASC
END

------ Report On Count ---------

CREATE PROC [Reports].[USP_DailyOrderShipmentDetails] 
(
	@FromDate varchar(20),
	@ToDate varchar(20),
	@CourierId varchar(10)
)
AS
BEGIN
	DECLARE @SQL nVarchar(4000)
	SET @SQL ='SELECT DISTINCT cu.CustomerId,cu.PaymentType,cu.BookingCode,u.CompanyName
				,cus.CName,cu.CustomerMobile,cu.CustomerBillingAddress
				,de.DealTitle,cu.DealId,'
	IF (@CourierId = 3 OR @CourierId =20)
		BEGIN
			SET @SQL += ' CASE WHEN cu.IsDone=1 THEN 0 ELSE ((cu.CouponPrice*cu.CouponQtn)+cu.DeliveryCharge) END AS CouponPrice 
						 ,cu.PODnumber,cu.CourierCharge'
		END
	ELSE IF 
	(
	@CourierId <> '-7' --CRM Confirm
	OR @CourierId <> '-6' --M1 
	OR @CourierId <> '-5' --M2
	OR @CourierId <> '-4' --Total Shipment
	OR @CourierId <> '-3' --Today's Shipment
	OR @CourierId <> '-2' --Prev.Day's Shipment
	OR @CourierId <> '-1' --AddBlocks
	)
		BEGIN
			SET @SQL += ' CouponPrice=(cu.CouponPrice*cu.CouponQtn) ,cu.PODnumber,cu.CourierCharge'
		END
	ELSE
		BEGIN
			SET @SQL += ' cu.CouponPrice,u.CompanyName'
		END
	
	SET @SQL += ' FROM Deal.Coupons cu
				  LEFT JOIN Deal.Deals de ON de.DealId = cu.DealId
				  LEFT JOIN UserProfile u ON u.ProfileID = de.ProfileID
				  LEFT JOIN deal.Customers  cus ON cus.CustomerId=cu.CustomerId'

	--IF (@CourierId <> '-7' OR @CourierId <> '-6' OR @CourierId <> '-5' OR @CourierId <> '-4' OR @CourierId <> '-3' OR @CourierId <> '-2' OR @CourierId <> '-1')
		--BEGIN
			SET @SQL += ' LEFT JOIN Delivery.DeliveryDetails dd ON dd.CouponId = cu.CouponId'
		--END
	IF(TRY_CONVERT(INT,@CourierId) >= -4)
	BEGIN
		SET @SQL += ' WHERE cu.CommentedOn >='+CHAR(39)+ @FromDate+CHAR(39)+' 
					AND cu.CommentedOn < DateAdd(day, 1, '+CHAR(39)+@ToDate+CHAR(39)+')'
	END
	ELSE 
	BEGIN
		SET @SQL += ' WHERE cu.CrmConfirmationDate >='+CHAR(39)+ @FromDate+CHAR(39)+' 
					AND cu.CrmConfirmationDate < DateAdd(day, 1, '+CHAR(39)+@ToDate+CHAR(39)+')'
	END

	IF (@CourierId = '-7')
		BEGIN
			SET @SQL += ' AND ISDONE NOT IN(2,4,5,6,8) '
		END
	ELSE IF (@CourierId = '-6' )
		BEGIN
			SET @SQL += ' AND ISDONE IN(7,16,18,19,23,24,17,10,111,30,34,109)'
		END
	ELSE IF (@CourierId = '-5')
		BEGIN
			SET @SQL +=' AND ISDONE NOT IN(2,4,5,6,8) And cu.CouponId Not In(
						Select DISTINCT CouponId From Deal.Coupons cu 
						WHERE IsDone In(7,16,18,19,23,24,17,10,111,30,34,109) 
						AND cu.CrmConfirmationDate >= '+CHAR(39)+ @FromDate+CHAR(39)+' 
						AND cu.CrmConfirmationDate < DateAdd(day, 1, '+CHAR(39)+@ToDate+CHAR(39)+')
						)'
			
		END
	ELSE IF (@CourierId = '-4' OR @CourierId = '-3' OR @CourierId = '-2' OR @CourierId = '-1')
		BEGIN
			SET @SQL += ' AND ISDONE IN(1,11)'
			IF(@CourierId = '-4')
			BEGIN
				SET @SQL += ' AND dd.CourierName IN (''2'',''3'',''4'')'
			END			
			ELSE IF(@CourierId = '-2')
			BEGIN
				SET @SQL += ' AND cu.CrmConfirmationDate >= DateAdd(day, -1,  '+CHAR(39)+ @FromDate+CHAR(39)+') AND cu.CrmConfirmationDate < '+CHAR(39)+@ToDate+CHAR(39)+''
			END
			ELSE IF(@CourierId = '-1')
			BEGIN
				SET @SQL += ' AND cu.CouponId Not In(Select DISTINCT  CouponId From Deal.Coupons cu
							where IsDone In(1,11) AND cu.CommentedOn >= '+CHAR(39)+ @FromDate+CHAR(39)+' AND cu.CommentedOn < DateAdd(day, 1,'+CHAR(39)+@ToDate+CHAR(39)+')
							AND cu.CrmConfirmationDate >= DateAdd(day, -1, '+CHAR(39)+ @FromDate+CHAR(39)+') AND cu.CrmConfirmationDate < '+CHAR(39)+@ToDate+CHAR(39)+')'
			END
		END
	ELSE
		BEGIN
			SET @SQL += ' AND ISDONE IN(1,11) AND TRY_CONVERT(INT,dd.CourierName)='+@CourierId
		END
	SET @SQL += ' ORDER BY cu.BookingCode DESC' 

	EXEC (@SQL) 
	--PRINT (@SQL) 
END