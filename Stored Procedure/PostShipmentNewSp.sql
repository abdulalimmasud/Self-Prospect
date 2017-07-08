CREATE TYPE [AD].[ServiceExperienceType] AS TABLE
(
	ProductQuality NVARCHAR(50),
	OverAllExperience NVARCHAR(50),
	FurtherShopping BIT,
	FeedbackComment NVARCHAR(1500),
	CouponId INT,
	ReceivedDate SMALLDATETIME,
	CustomerQuery NVARCHAR(500),
	PostedBy INT,
	PostedOn SMALLDATETIME,
	UserComment NVARCHAR(1500),
	PriceQuality TINYINT,
	PriceComment NVARCHAR(1500),
	CustomerFeedback NVARCHAR(1500),
	ProductQltyComment NVARCHAR(1500),
	CrmService NVARCHAR(200),
	DeliveryServiceOnTime TINYINT,
	BadProductQltyComment NVARCHAR(200)
)
GO
CREATE PROC [AD].[USP_InsertServiceExperienceForCoupon]
(
	@ServiceExperienceTVP [AD].[ServiceExperienceType] READONLY
)
AS
BEGIN
	INSERT INTO [AD].[ServiceExperience]
	SELECT * FROM @ServiceExperienceTVP
END


GO
CREATE TYPE [Deal].[RatingsType] AS TABLE
(
	RatingId INT,
	RatingType CHAR(15),
	RaterId INT,
	RaterType CHAR(15),
	Rating INT,
	Comments NVARCHAR(1500),
	PostedOn SMALLDATETIME,
	UpdatedOn SMALLDATETIME,
	IsActive BIT,
	RatingFrom NVARCHAR(100)
)
GO
CREATE PROC [Deal].[USP_InsertRatingForDeal]
(
	@RatingTVP [Deal].[RatingsType] READONLY
)
AS
BEGIN
	INSERT INTO [Deal].[Ratings]
	SELECT * FROM @RatingTVP
END
GO

--SELECT TOP 10 * FROM Deal.Coupons ORDER BY CouponId DESC

--EXEC [AD].[USP_UpdateAndManipulateCouponWithFeedback] '257319','9','N''Delivery Test''','122','-1',
--'1','VVYes','Huge','1','Nothing','No Comment','1','Nothing','No Feedback','1','-1','-1','1','Disgusting','Test','01255555'

CREATE PROC [AD].[USP_UpdateAndManipulateCouponWithFeedback]
(
	@CouponId VARCHAR(30),	
	@Status VARCHAR(10),
	@Comments NVARCHAR(500),
	@CommentedBy VARCHAR(30),
	@DeliveredDate VARCHAR(50)='-1',
	@ProductQuality NVARCHAR(50)='',
	@OverAllExperience NVARCHAR(50)='',
	@BadExperienceReason NVARCHAR(500)='',
	@FurtherShopping CHAR(5) = NULL,
	@CustomerQuery NVARCHAR(500)='',
	@CustomerComment NVARCHAR(1500)='',
	@PriceQuality VARCHAR(10)='',
	@PriceComment NVARCHAR(1500)='',
	@CustomerFeedback NVARCHAR(1500)='',
	@RatingValue INT = 0,
	@CrmService NVARCHAR(500)='-1',
	@ProductQualityComment NVARCHAR(500)='-1',
	@DeliveryService INT = 0,
	@BadProductQualityComment NVARCHAR(500)='-1',
	@FeedbackFrom NVARCHAR(50)='',
	@OrderToken VARCHAR(100)=''
)
AS
BEGIN
	DECLARE
		@RatingType CHAR(15)='Product',
		@RaterType CHAR(15)='Customer',
		@DealId VARCHAR(30),
		@CustomerId VARCHAR(30),
		@CustomerBillingAddress VARCHAR(1000),
		@DeliveredBy VARCHAR(20),
		@DeliveredType VARCHAR(20),
		@CRMConfirmationDate VARCHAR(20),
		@MerchantId VARCHAR(20),
		@OrderDate VARCHAR(20),
		@ConfirmationDate VARCHAR(20),
		@DeliveryTimeLimit VARCHAR(10),
		@RepeatCouponId INT,
		@RepeatStatusInsertTableValue INT,
		@IsConfirmedByMerchant INT = 0

	DECLARE @OrderStatusHistoryTVP AS [Deal].[OrderStatusHistroy],
			@CommentsTVP AS [AD].[Comments],
			@ServiceExperienceTVP AS [AD].[ServiceExperienceType],
			@RatingTVP AS [Deal].[RatingsType],
			@ModComment NVARCHAR(500) = SUBSTRING( @Comments ,3 , LEN(@Comments)-3 )

		SELECT 
			@DealId = c.DealId,
			@CustomerId = c.CustomerId,
			@CustomerBillingAddress = c.CustomerBillingAddress,
			@DeliveredBy = c.DeliveredBy,
			@DeliveredType = c.DeliveredType,
			@CRMConfirmationDate = CRMConfirmationDate,
			@MerchantId = d.ProfileId,
			@OrderDate = PostedOn,
			@ConfirmationDate = GETDATE(),
			@DeliveryTimeLimit = c.DeliveryTimeLimit
		FROM Deal.Coupons c 
			INNER JOIN Deal.Deals d ON c.DealId = d.DealId
		WHERE CouponId = @CouponId

		IF (@DeliveredDate = '-1' OR @DeliveredDate = '')
			SET @DeliveredDate = GETDATE()

		IF NOT EXISTS(SELECT CouponId from Deal.Coupons where CouponId = @CouponId AND Isdone = @Status AND CAST(CommentedOn AS DATE) = CAST(GETDATE() AS DATE))
		BEGIN
			EXEC Deal.USP_UpdateCouponForDeliveryWithPOD
				@DeliveredDate, @CustomerBillingAddress,	@DeliveredBy, @DeliveredType, @Comments,
				@CommentedBy, @CouponId, @Status, @DeliveryTimeLimit, '-1',	@DeliveredDate,'-1' ,
				@IsConfirmedByMerchant,	'-1' , '-1', '-1', '-1', '-1', '-1', '-1'
				
			UPDATE Deal.Coupons SET OrderToken = @OrderToken WHERE CouponId=@CouponId		

			SET NOCOUNT ON

				INSERT INTO @CommentsTVP
				SELECT  @CouponId,@ModComment,@Status,@CommentedBy,GETDATE(),1

				INSERT INTO @OrderStatusHistoryTVP 
				SELECT @OrderDate,@CouponId,@Status,@ConfirmationDate,@CommentedBy,@MerchantId,@DealId,@CustomerId,@DeliveredDate,@IsConfirmedByMerchant

				INSERT INTO @ServiceExperienceTVP
				SELECT @ProductQuality,@OverAllExperience,@FurtherShopping,@BadExperienceReason,@CouponId,
					   @DeliveredDate,@CustomerQuery,@CommentedBy,GETDATE(),@CustomerComment,@PriceQuality,
					   @PriceComment,@CustomerFeedback,@ProductQualityComment,@CrmService,@DeliveryService,@BadProductQualityComment

				INSERT INTO @RatingTVP
				SELECT @DealId,@RatingType,@CustomerId,@RaterType,@RatingValue,@ProductQualityComment,
					   GETDATE(),GETDATE(),1,@FeedbackFrom

			SET NOCOUNT OFF

		END
	EXEC [AD].[USP_InsertCommentsForCoupon] @CommentsTVP
	EXEC [Deal].[USP_InsertOrderStatusHistory] @OrderStatusHistoryTVP
	EXEC [AD].[USP_InsertServiceExperienceForCoupon] @ServiceExperienceTVP
	EXEC [Deal].[USP_InsertRatingForDeal] @RatingTVP
END

