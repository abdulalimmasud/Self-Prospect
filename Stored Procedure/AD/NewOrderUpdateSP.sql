
CREATE TYPE [AD].[Comments] AS TABLE
(
	CouponId INT,
	Comment NVARCHAR(500),
	IsDone INT,
	CommentedBy INT,
	CommentedOn SMALLDATETIME,
	IsActive BIT
)
GO
CREATE PROC [AD].[USP_InsertCommentsForCoupon]
(
	@CommentTVP [AD].[Comments] READONLY
)
AS
BEGIN
	INSERT INTO Deal.Comments ([CouponId],[Comments],[IsDone],[CommentedBy],[CommentedOn],[IsActive])
	SELECT * FROM @CommentTVP
END
GO

CREATE TYPE [Deal].[OrderStatusHistroy] AS TABLE
(
	[OrderDate] SMALLDATETIME,
	[CouponId] INT,
	[OrderStatus] INT,
	[ConfirmationDate] SMALLDATETIME,
	[ConfirmedBy] INT,
	[MerchantId] INT,
	[DealId] INT,
	[CustomerId] INT,
	[DeliveryConfirmationDate] SMALLDATETIME,
	[IsConfirmedByMerchant] TINYINT
)
GO

CREATE PROC [Deal].[USP_InsertOrderStatusHistory]
(
	@OrderStatusHistoryTVP [Deal].[OrderStatusHistroy] READONLY
)
AS
BEGIN
	INSERT INTO [Deal].[Order_Status_History]
	SELECT * FROM @OrderStatusHistoryTVP
END
GO

select * from deal.payments where paymenttype='gtalk'
--SELECT * FROM Deal.Coupons WHERE CouponId IN (615973,640431) ORDER BY CouponId DESC

--EXEC [AD].[USP_UpdateAndManipulateCoupons] '615973,640431',N'This is test purpose','15','222',0,'-1','-1'
--,'-1','-1','-1','-1','-1','-1','-1','-1','-1',0

SELECT * FROM Deal.Order_Status_History WHERE OrderStatus BETWEEN 231 AND 238 ORDER BY CouponId DESC

SELECT StatusId, OrderStatus,StatusNameForReport,Model,Postedon
FROM Deal.OrderStatus
WHERE StatusId NOT IN 
(
9,10,109,110,23,100,210,111,13,32,1,11,131,7,16,
19,101,201,33,20,3,12,15,130,134,30,34,18,103,104,
181,180,30,34,28,125,105,205,155,35,172,177,175,176,
5,55,204,41,304,255,102,202,127,126,213,129,128,324,224,
24,17,171,173,174,151,152,153,154,117,124,31,
70,71,72,73,74,75,76,77,78,79,112,113,114,115,116,118,119,120,121,122,123,273,
42,43,279,135,404,280,190,290,

2,4,6,8,44
)
AND Model NOT IN (4)
ORDER By Postedon

SELECT * FROM [Deal].[Order_Status_History] WHERE CouponId IN (640431)

SELECT * FROM [Deal].[Payments] WHERE CouponId IN (615973,640431)


SELECT * FROM [AD].Users WHERE AdminType = 7 AND IsActive = 1


CREATE PROC [AD].[USP_UpdateAndManipulateCoupons]
(
	@CouponIds VARCHAR(400),
	@Comments NVARCHAR(1000),
	@Status VARCHAR(10),
	@CommentedBy VARCHAR(20),
	@IsConfirmedByMerchant INT,
	@POD VARCHAR(130),
	@Delivered VARCHAR(50),
	@CourierCharge VARCHAR(10),
	@DeliveryDateGiven VARCHAR(20)='-1',
	@CourierId VARCHAR(20)='-1',
	@CODCharge VARCHAR(20)='-1',
	@ReturnCharge VARCHAR(20)='-1',
	@AdvPaymentPhoneId VARCHAR(3)='-1',
	@IsAdvPaymentConfirmByCrm VARCHAR(2)='-1',
	@BKashPaymentVerifiedBy VARCHAR(5)='-1',
	@BusinessModelChange VARCHAR(3)='-1',
	@IsSoldOut BIT = 0
)
AS
BEGIN
	SET @CouponIds=LTRIM(RTRIM(@CouponIds))
	DECLARE
		@Separator VARCHAR(400) = NULL,
		@CouponId VARCHAR(400),
		@DeliveryDate VARCHAR(20),
		@CustomerBillingAddress VARCHAR(1000),
		@DeliveredBy VARCHAR(20),
		@DeliveredType VARCHAR(20),
		@CRMConfirmationDate VARCHAR(20),
		@MerchantId VARCHAR(20),
		@DealId VARCHAR(20),
		@CustomerId VARCHAR(20),
		@OrderDate VARCHAR(20),
		@ConfirmationDate VARCHAR(20),
		@DeliveryTimeLimit VARCHAR(10)

	DECLARE @OrderStatusHistoryTVP AS [Deal].[OrderStatusHistroy]
	DECLARE @CommentsTVP AS [AD].[Comments]

	DECLARE @ModComment NVARCHAR(500) = SUBSTRING( @Comments ,3 , len(@Comments)-3 )

	WHILE(LEN(@CouponIds)>0)
	BEGIN
		If(PATINDEX('%,%',@CouponIds) > 0)		
			BEGIN
				SET @Separator = SUBSTRING(@CouponIds, 0, PATINDEX('%,%',@CouponIds))
				SET @CouponId=@Separator
				SELECT 
				@DeliveryDate = c.DeliveryDate ,
				@CustomerBillingAddress = c.CustomerBillingAddress,
				@DeliveredBy = c.DeliveredBy,
				@DeliveredType = c.DeliveredType,
				@CRMConfirmationDate = CRMConfirmationDate,
				@MerchantId = d.ProfileId,
				@DealId = c.DealId,
				@CustomerId = c.CustomerId,
				@OrderDate = PostedOn,
				@ConfirmationDate = GETDATE(),
				@DeliveryTimeLimit = c.DeliveryTimeLimit
				FROM Deal.Coupons c 
				INNER JOIN deal.Deals d ON c.DealId=d.DealId
				WHERE CouponId = @CouponId

				IF (@DeliveryDateGiven <> '-1')
					SET  @DeliveryDate = @DeliveryDateGiven

				IF ((@Delivered = '-1' Or @Delivered = '') AND (@Status=9 OR @Status=10 OR @Status=100 OR @Status=4403))
					SET @Delivered = GETDATE()

				IF NOT EXISTS(SELECT CouponId FROM Deal.Coupons WHERE CouponId=@CouponId and Isdone=@Status and CAST(CommentedOn AS DATE) = CAST(GETDATE() AS DATE))
				BEGIN
				
					EXEC Deal.USP_UpdateCouponForDeliveryWithPOD
						@DeliveryDate,
						@CustomerBillingAddress,
						@DeliveredBy,
						@DeliveredType,
						@Comments,
						@CommentedBy,
						@CouponId,
						@Status,
						@DeliveryTimeLimit,
						@POD,
						@Delivered,
						@CourierCharge ,
						@IsConfirmedByMerchant,
						@CourierId ,
						@CODCharge,
						@ReturnCharge,
						@AdvPaymentPhoneId,
						@IsAdvPaymentConfirmByCrm, 
						@BKashPaymentVerifiedBy,
						@BusinessModelChange	

						--PRINT 'Deal.USP_UpdateCouponForDeliveryWithPOD'
						--PRINT @Comments
					
					--SET @Comments=SUBSTRING( @Comments ,3 , len(@Comments)-3 )

					---Customized
					SET NOCOUNT ON

					INSERT INTO @CommentsTVP
					SELECT  @CouponId,@ModComment,@Status,@CommentedBy,GETDATE(),1

					INSERT INTO @OrderStatusHistoryTVP 
					SELECT @OrderDate,@CouponId,@Status,@ConfirmationDate,@CommentedBy,@MerchantId,@DealId,@CustomerId,@DeliveryDate,@IsConfirmedByMerchant

					SET NOCOUNT OFF
					---Customized
					IF(@Status IN(17,151,152,153,154,117,103,104,181,18,28,4271,4202))
					BEGIN
						EXEC [Merchant].[USP_UpdateMerchantPoint] @MerchantId,@CouponId,0,0
						--PRINT '[Merchant].[USP_UpdateMerchantPoint]'
					END

					IF(@IsSoldOut = 1 OR @Status IN (28,125,4202,4231,4232))
					BEGIN
						UPDATE Deal.Deals SET [IsSoldOut]=1,[UpdatedBy]=CAST(@CommentedBy AS INT),[UpdatedOn]=GETDATE() WHERE [DealId] = @DealId

						--PRINT 'Update soldout'
					END

					--SET @Comments = 'N'+@Comments+''
				END

				SET @CouponIds = SUBSTRING(@CouponIds, LEN(@Separator + char(00)) + 1,LEN(@CouponIds)) 
			END
		ELSE
			BEGIN
				SET @Separator = @CouponIds
				SET @CouponId=@Separator
				SELECT 
				@DeliveryDate = c.DeliveryDate ,
				@CustomerBillingAddress = c.CustomerBillingAddress,
				@DeliveredBy = c.DeliveredBy,
				@DeliveredType = c.DeliveredType,
				@CRMConfirmationDate = CRMConfirmationDate,
				@MerchantId = d.ProfileId,
				@DealId = c.DealId,
				@CustomerId = c.CustomerId,
				@OrderDate = PostedOn,
				@ConfirmationDate = GETDATE(),
				@DeliveryTimeLimit = c.DeliveryTimeLimit
				FROM Deal.Coupons c 
				INNER JOIN deal.Deals d ON c.DealId=d.DealId
				WHERE CouponId = @CouponId

				IF (@DeliveryDateGiven <> '-1')
					SET  @DeliveryDate = @DeliveryDateGiven

				IF ((@Delivered = '-1' Or @Delivered = '') AND (@Status=9 OR @Status=10 OR @Status=100 OR @Status=4403))
					SET @Delivered = GETDATE()

				IF NOT EXISTS(SELECT CouponId FROM Deal.Coupons WHERE CouponId=@CouponId and Isdone=@Status and CAST(CommentedOn AS DATE) = CAST(GETDATE() AS DATE))
				BEGIN
					EXEC Deal.USP_UpdateCouponForDeliveryWithPOD
						@DeliveryDate,
						@CustomerBillingAddress,
						@DeliveredBy,
						@DeliveredType,
						@Comments,
						@CommentedBy,
						@CouponId,
						@Status,
						@DeliveryTimeLimit,
						@POD,
						@Delivered,
						@CourierCharge ,
						@IsConfirmedByMerchant,
						@CourierId ,
						@CODCharge,
						@ReturnCharge,
						@AdvPaymentPhoneId,
						@IsAdvPaymentConfirmByCrm, 
						@BKashPaymentVerifiedBy,
						@BusinessModelChange					

						--PRINT 'Deal.USP_UpdateCouponForDeliveryWithPOD'
						--PRINT @Comments

					--SET @Comments=SUBSTRING( @Comments ,3 , len(@Comments)-3 )

					---Customized
					SET NOCOUNT ON
					INSERT INTO @CommentsTVP
					SELECT  @CouponId,@ModComment,@Status,@CommentedBy,GETDATE(),1

					INSERT INTO @OrderStatusHistoryTVP 
					SELECT @OrderDate,@CouponId,@Status,@ConfirmationDate,@CommentedBy,@MerchantId,@DealId,@CustomerId,@DeliveryDate,@IsConfirmedByMerchant

					SET NOCOUNT OFF
					---Customized
					
					IF(@Status IN(17,151,152,153,154,117,103,104,181,18,28,4271,4202))
					BEGIN
						EXEC [Merchant].[USP_UpdateMerchantPoint] @MerchantId,@CouponId,0,0
						--PRINT '[Merchant].[USP_UpdateMerchantPoint]'
					END
					
					IF(@IsSoldOut = 1 OR @Status IN (28,125,4202,4231,4232))
					BEGIN
						UPDATE Deal.Deals SET [IsSoldOut]=1,[UpdatedBy]=CAST(@CommentedBy AS INT),[UpdatedOn]=GETDATE() WHERE [DealId] = @DealId
					END
				END
				SET @CouponIds = NULL
			END
	END

		EXEC [AD].[USP_InsertCommentsForCoupon] @CommentsTVP
		--PRINT '[AD].[USP_InsertCommentsForCoupon]'
		EXEC [Deal].[USP_InsertOrderStatusHistory] @OrderStatusHistoryTVP
		--PRINT '[Deal].[USP_InsertOrderStatusHistory]'
END