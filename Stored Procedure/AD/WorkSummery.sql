Create PROC [Deal].[USP_GenerateDropdownlistdata]
	@adminType int
AS
BEGIN
	SELECT FullName,UserId FROM AD.Users WHERE AdminType=@adminType AND IsActive=1
END

SELECT FullName,UserId FROM AD.Users WHERE AdminType=7 AND IsActive=1

CREATE PROC [Deal].[USP_GetM1WorkSummaryReport]
(
	@userId int,
	@fromDate varchar(10),
	@toDate varchar(10)
)
AS 
BEGIN
	DECLARE @sql AS NVARCHAR(800)
	SELECT UP.CompanyName,C.BookingCode,C.Comments,C.CommentedOn
	FROM Deal.Order_Status_History OSH 
		--LEFT JOIN Deal.Deals D On OSH.DealId = D.DealId
		LEFT JOIN UserProfile UP ON UP.ProfileId = OSH.MerchantId
		LEFT JOIN Deal.Coupons C ON C.CouponId = OSH.CouponId
		--LEFT JOIN AD.Users U ON U.UserId = C.CommentedBy
	WHERE OSH.ConfirmedBy =@userId AND (OSH.ConfirmationDate >=@fromDate AND OSH.ConfirmationDate < DATEADD(d, 1, @toDate))
	--PRINT(@sql) [Deal].[USP_GetM1WorkSummaryReport] 29,'2014-05-18','2014-12-10'
END

SELECT * FROM UserProfile WHERE CompanyName LIKE '%MR%'

CREATE PROCEDURE [Reports].[USP_LoadCorporateReports]
 AS
	BEGIN
		SELECT ProfileId, CompanyName, ContactAddress, Mobile, 
			ContactPerson, InsertedOn, UpdatedOn, CompanyURL  --,LoginPassword

		FROM UserProfile 
		WHERE IsAdmin=0 AND LoginPassword<>'123'

		ORDER BY InsertedOn DESC
	END


CREATE Procedure [Reports].[USP_LoadSmsLogReport]
        @FromDate As varchar(20)='',
        @Todate AS varchar(20),
		@InsertedBy AS int=0,
		@ContactNumber AS varchar(20)='',
		@Flag AS Int=0
AS

BEGIN

   IF(@Flag=1)

		 BEGIN
		
			SELECT u.UserName,sl.InsertedBy,sl.InsertedOn,sl.ContactNumber,sl.Referrer,sl.MessageText 
				from AD.SMSLog as sl
				INNER JOIN Ad.Users u On sl.InsertedBy=u.UserId 
				where (@FromDate='' OR InsertedOn>=@FromDate AND InsertedOn<= DateAdd(day, 1,@ToDate))
				And (@InsertedBy=0  OR InsertedBy=@InsertedBy)
				And (@ContactNumber='' OR ContactNumber=@ContactNumber)
		 END

	IF(@Flag=0)

		BEGIN

		   Select top 100  u.UserName,sl.InsertedBy,sl.InsertedOn,sl.ContactNumber,sl.Referrer,sl.MessageText 
				from AD.SMSLog as sl
				INNER JOIN Ad.Users u 
				On sl.InsertedBy=u.UserId  Order by 1 desc
		END

	IF(@Flag=3)

	   BEGIN

		   Select distinct InsertedBy,u.UserName  
		   from AD.SMSLog Inner JOIN AD.Users as u
		   On u.UserId=SMSLog.InsertedBy 
		   Where InsertedBy=u.UserId
	   END

END

--EXEC [Reports].[USP_LoadSmsLogReport] '','','',' ',0


CREATE PROC [Deal].[USP_GetTotalCountOnIsDone]
@isDone int
AS
BEGIN
SELECT COUNT(CouponId)  AS totalCount FROM Deal.Coupons WHERE isDone=@isDone
END


CREATE PROC [Deal].[USP_GetReportByStatus]
@isDone int
AS
BEGIN
SELECT 
	C.BookingCode,C.PODnumber,D.DealTitle,C.CouponQtn,C.CouponPrice,U.CompanyName,C.OrderFrom,Cr.CourierId,C.PostedOn,C.CrmConfirmationDate,C.Comments,D.IsSoldOut,D.FolderName
FROM 
	Deal.Coupons C 
	INNER JOIN Deal.Deals D ON C.DealId = D.DealId
	INNER JOIN UserProfile U ON U.ProfileId = D.ProfileId
	LEFT JOIN Deal.Couriers Cr ON Cr.CourierId = C.CourierId
WHERE isDone=@isDone
--EXEC [Deal].[USP_GetCourierReport] 100
END


CREATE PROC [Deal].[USP_GetMerchantReportDateWise]
 @merchantId varchar(11),
  @fromDate varchar(15), 
  @toDate varchar(15),
  @searchCouponId int
  AS 
  BEGIN DECLARE @sql AS NVARCHAR(1000) 
  SET @sql ='SELECT DISTINCT(osh.CouponId)' 
  SET @sql +=' ,cu.PODnumber,D.DealTitle,cu.CouponQtn,cu.CouponPrice,'
   SET @sql +=' U.CompanyName,dd.ContactInfo,cu.PostedOn' 
   SET @sql +=' FROM Deal.Order_Status_History osh ' 
   SET @sql +=' INNER JOIN Deal.Coupons cu ON osh.CouponId=cu.CouponId' 
   SET @sql +=' INNER JOIN UserProfile U ON U.ProfileId = osh.MerchantId' 
   SET @sql +=' INNER JOIN Deal.Deals D ON osh.DealId = D.DealId' 
   SET @sql +=' LEFT JOIN Delivery.DeliveryDetails dd ON dd.CouponId = osh.CouponId' 
   SET @sql +=' WHERE' 
   SET @sql +=' osh.OrderStatus=111 AND osh.IsConfirmedByMerchant=1 AND cu.PODnumber is not null AND osh.MerchantId='+char(39)+@merchantId+char(39) 
   IF(@fromDate <> '-1' AND @toDate <> '-1')
	BEGIN
		SET @sql +=' AND osh.ConfirmationDate >='+char(39)+@fromDate+char(39)+'AND osh.ConfirmationDate <'+char(39)+@toDate+char(39) 
    END
    IF(@searchCouponId <> 0)
	BEGIN
		SET @sql +=' AND osh.CouponId ='+CONVERT(varchar(10), @searchCouponId)
    END
	 
   EXEC(@sql) 
   --PRINT(@sql) 
   --EXEC [Deal].[USP_GetMerchantReportDateWise] '1100','-1','-1' ,374351
   END





CREATE PROCEDURE [AD].[CustomerSearchCollection]
(
	@SearchKeyword nvarchar(50),
	@Top VARCHAR(10)='0'
)
AS
BEGIN

DECLARE @SQL nvarchar(2500)

SET @SQL=' WITH cte 
     AS (SELECT keyword,login_time,log_type,log_from,url,

                DataCount=count(keyword) 
                           OVER( 
                             partition BY keyword), 
                rn = Row_number() 
                       OVER( 
                         partition BY keyword 
                         ORDER BY login_time ASC) 
         FROM   Reports.Logs'
		
		SET @SQL+= ' where (log_type=''0'' OR log_type=''1'' OR log_type=''2'' OR log_type=''Search'' OR log_type=''Merchant'')'
		if(@SearchKeyword<>'')
		   SET @SQL+=' AND keyword Like ''%'+@SearchKeyword+'%'''
		else
		SET @SQL+=' AND keyword IS NOT NULL'
		SET @SQL+=' )'

IF (@Top <> 0)
BEGIN
	SET @SQL+=' SELECT top '+@Top+' keyword,login_time,log_type,log_from,url,DataCount
	FROM   cte 
	WHERE  rn = 1
	ORDER BY DataCount DESC'
END
ELSE
BEGIN
SET @SQL+=' SELECT keyword,login_time,log_type,log_from,url,DataCount
	FROM   cte 
	WHERE  rn = 1
	ORDER BY DataCount DESC'
END


EXEC (@SQL)
	--PRINT (@SQL)
END

