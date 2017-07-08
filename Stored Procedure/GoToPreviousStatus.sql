
SELECT * FROM Deal.OrderStatus WHERE StatusId IN (4301,4303,4304,4314,4315)

--SELECT * FROM Deal.Customers WHERE CMobile = '01559714188'
SELECT CouponId,BusinessModel, IsDone, ShopCartId FROM Deal.Coupons WHERE CustomerId = 310872

SELECT * FROM AD.Users WHERE AdminTYpe = 8

CREATE Procedure [Deal].[USP_GoToBackStatus]
(
	@CouponId As int
)
AS
Begin
	Select Top 1 
	c.CommentId, c.IsDone, c.Comments, c.CommentedBy, 
	adu.username as CommentedByName, c.CommentedOn 
	From Deal.Comments c
	Left Join ad.Users adu On adu.userId=c.CommentedBy
	Where CouponId=@CouponId 
	AND IsDone <> ( select Distinct IsDone From Deal.Coupons Where  CouponId=@CouponId )
	Order By c.CommentId Desc
End


ALTER PROC [AD].[USP_UpdateCouponsForPrevStatus]
(
	@CouponIds VARCHAR(400),
	@CommentedBy VARCHAR(20)
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
		@DeliveryTimeLimit VARCHAR(10),
		@Comments NVARCHAR(1000),
		@Status VARCHAR(10),
		@IsConfirmedByMerchant INT=0,
		@POD VARCHAR(130)='-1',
		@Delivered VARCHAR(50)='-1',
		@CourierCharge VARCHAR(10)='-1',
		@DeliveryDateGiven VARCHAR(20)='-1',
		@CourierId VARCHAR(20)='-1',
		@CODCharge VARCHAR(20)='-1',
		@ReturnCharge VARCHAR(20)='-1',
		@AdvPaymentPhoneId VARCHAR(3)='-1',
		@IsAdvPaymentConfirmByCrm VARCHAR(2)='-1',
		@BKashPaymentVerifiedBy VARCHAR(5)='-1',
		@BusinessModelChange VARCHAR(3)='-1'

	DECLARE @OrderStatusHistoryTVP AS [Deal].[OrderStatusHistroy]
	DECLARE @CommentsTVP AS [AD].[Comments]

	DECLARE @ModComment NVARCHAR(500)=''

	WHILE(LEN(@CouponIds)>0)
	BEGIN
		If(PATINDEX('%,%',@CouponIds) > 0)		
			BEGIN
				SET @Separator = SUBSTRING(@CouponIds, 0, PATINDEX('%,%',@CouponIds))
				SET @CouponId=@Separator
				---------------
				SELECT TOP 1 
				@Status = IsDone, @Comments = 'N'''+ Comments+''''
				FROM Deal.Comments
				WHERE CouponId=@CouponId 
				AND IsDone <> ( SELECT DISTINCT IsDone FROM Deal.Coupons WHERE  CouponId = @CouponId )
				ORDER BY CommentId DESC
				---------------

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
				INNER JOIN Deal.Deals d ON c.DealId=d.DealId
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

					SET NOCOUNT ON
					SET @ModComment = SUBSTRING( @Comments ,3 , len(@Comments)-3)
					INSERT INTO @CommentsTVP
					SELECT  @CouponId,@ModComment,@Status,@CommentedBy,GETDATE(),1

					INSERT INTO @OrderStatusHistoryTVP 
					SELECT @OrderDate,@CouponId,@Status,@ConfirmationDate,@CommentedBy,@MerchantId,@DealId,@CustomerId,@DeliveryDate,@IsConfirmedByMerchant

					SET NOCOUNT OFF					
				END

				SET @CouponIds = SUBSTRING(@CouponIds, LEN(@Separator + char(00)) + 1,LEN(@CouponIds)) 
			END
		ELSE
			BEGIN
				SET @Separator = @CouponIds
				SET @CouponId=@Separator

				---------------
				SELECT TOP 1 
				@Status = IsDone, @Comments = 'N'''+ Comments+''''
				FROM Deal.Comments
				WHERE CouponId=@CouponId 
				AND IsDone <> ( SELECT DISTINCT IsDone FROM Deal.Coupons WHERE  CouponId = @CouponId )
				ORDER BY CommentId DESC
				---------------

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

						
					SET NOCOUNT ON
					SET @ModComment = SUBSTRING( @Comments ,3 , len(@Comments)-3)
					INSERT INTO @CommentsTVP
					SELECT  @CouponId,@ModComment,@Status,@CommentedBy,GETDATE(),1

					INSERT INTO @OrderStatusHistoryTVP 
					SELECT @OrderDate,@CouponId,@Status,@ConfirmationDate,@CommentedBy,@MerchantId,@DealId,@CustomerId,@DeliveryDate,@IsConfirmedByMerchant

					SET NOCOUNT OFF					
				END
				SET @CouponIds = NULL
			END
	END

		EXEC [AD].[USP_InsertCommentsForCoupon] @CommentsTVP
		EXEC [Deal].[USP_InsertOrderStatusHistory] @OrderStatusHistoryTVP
END
