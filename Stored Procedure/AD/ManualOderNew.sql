--SELECT TOP 10 * FROM Deal.Coupons ORDER BY CouponId DESC

ALTER PROC [Deal].[InsertManualOrder]
(

	@OldCouponId INT,
	@ProfileId INT,
	@DealId INT,	
	@CustomerId INT,
	@AgentId INT = 0,
	@CouponPrice INT,
	@CouponQtn INT,
	@PaymentType VARCHAR(30),
	@Sizes VARCHAR(30)='',
	@Colors VARCHAR(30)='',
	@CommissionPerCoupon MONEY=0.00,
	@DeliveryDist INT,
	@DeliveryCharge INT,
	@PaymentAmount MONEY,
	@DeliveryDate SMALLDATETIME,
	@CardType VARCHAR(35),
	@OrderFrom VARCHAR(30),
	@OrderSource VARCHAR(30),
	@AdvPaymentAmount MONEY,
	@BusinessModel TINYINT,
	@IsDone INT,
	@Comments VARCHAR(500),
	@DeliveryMobile VARCHAR(25),
	@AlternateMobile VARCHAR(25),
	@DeliveryAddress VARCHAR(500),
	@AgentFeed VARCHAR(500)='',
	@CouponCode VARCHAR(25),
	@CommentedBy VARCHAR(20),
	@UserType SMALLINT,
	@CouponId INT OUT
)
AS
BEGIN
	DECLARE @AskingDeliveryStatus INT,
			@StatusForOld VARCHAR(20),
			@CommentsForOld VARCHAR(500)
	IF(@DeliveryDist = 14)
		BEGIN
			SET @AskingDeliveryStatus = 2
		END
	ELSE
		BEGIN
			SET @AskingDeliveryStatus = 3
		END
	IF(@AgentId <> 0 OR @AgentId <> NULL)
		BEGIN
			SELECT @DeliveryDist = LocationId FROM [Agent].[Users] WHERE Id = @AgentId
			SET @StatusForOld = '4202'
		END
	ELSE
		BEGIN
			SET @StatusForOld = '45'
		END
	
	SET @CommentsForOld = 'N''Order Cancel For Unavailable Inventory'''
	INSERT INTO Deal.Coupons 
	(
		DealId, CustomerId, CouponQtn, CouponPrice, CouponCode, PostedOn, PaymentType, IsActive, CustomerMobile,
		CustomerAlternateMobile, CustomerBillingAddress, Sizes, Colors,	Commission,	DeliveryDist, AskingDeliveryStatus,
		DeliveryCharge,	OrderFrom, OrderSource,	BookingCode, MerchantId, AdvPaymentAmount,	AdvPaymentPhoneId, AgentFeedback,
		AgentId, OrderByAdmin, SiteOrderSource, BusinessModel, IsDone
	)

	VALUES 
	(
		@DealId, @CustomerId, @CouponQtn, @CouponPrice, @CouponCode, GETDATE(),	@PaymentType, 0, @DeliveryMobile,
		@AlternateMobile, @DeliveryAddress,	@Sizes,	@Colors, @CommissionPerCoupon, @DeliveryDist, @AskingDeliveryStatus,
		@DeliveryCharge, @OrderFrom, @OrderSource, @CouponCode,	@ProfileId,	@AdvPaymentAmount,
		0,	@AgentFeed,	@AgentId, @CommentedBy, 0,@BusinessModel,@IsDone
	)	
	SET @CouponId = SCOPE_IDENTITY()
	UPDATE Deal.Coupons SET BookingCode=@CouponId,CrmConfirmationDate = GETDATE() Where CouponId = @CouponId

	INSERT INTO Deal.Payments 
	(
		CouponId, PaymentAmount, TransactionId,	PaymentStatus, PostedOn, CardType, PaymentType,	Commission,	UnitPrice, 
		AdCashBackPercentage, OfferedCashBackPercentage, AdDiscountPercentage, OfferedDiscountPercentage, EMIPeriod
	)
	VALUES 
	(
		@CouponId, @PaymentAmount, @CouponCode + CONVERT(VARCHAR(20),@CouponId),'I', GETDATE(),	@CardType, @PaymentType,
		@CommissionPerCoupon, @CouponPrice, 0, 0, 0, 0,	0
	)

	---Log for change Coupon
	EXEC [Deal].[USP_ManualOrderProcess] @CouponId,@OldCouponId,@IsDone,@CommentedBy,@UserType
	---Add History for new Coupon
	EXEC [AD].[USP_Insert_OrderStatusHistory_Commnets_Update_Coupon]
	@CouponId,@Comments,@IsDone,@CommentedBy,0,'-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1'
	---Add History for old Coupon
	EXEC [AD].[USP_Insert_OrderStatusHistory_Commnets_Update_Coupon]
	@OldCouponId,@CommentsForOld,@StatusForOld,@CommentedBy,0,'-1','-1','-1','-1','-1','-1','-1','-1','-1','-1','-1'

	DECLARE @OldDealId INT
	SELECT @OldDealId = DealId FROM Deal.Coupons WHERE CouponId = @OldCouponId
	UPDATE [Deal].[Deals] SET [IsSoldOut]=1 WHERE [DealId] = @OldDealId 
END




--SELECT * FROM Deal.Customers WHERE CMobile = '01793960961'

--SELECT TOP 10* FROM Deal.Payments ORDER BY CouponId DESC

--SELECT * FROM Agent.Agents WHERE Id 

--SELECT * FROM [Deal].[Districts] WHERE [DistrictId] = 3

--SELECT * FROM Agent.Users WHERE Id BETWEEN 46 AND 65
--SELECT * FROM Agent.Location

--UPDATE [Agent].[Users] SET LocationId = 28 WHERE Id IN (62,63)
--UPDATE [Agent].[Users] SET LocationId = 47 WHERE Id = 64
--UPDATE [Agent].[Users] SET LocationId = 45 WHERE Id = 65

--INSERT INTO Agent.Users([Name],[Mobile],[Email],[Password],[Address],[Gender],[BKashMobile],NID,ManagerId,CompanyId,AccountType)
--SELECT [Name],[Mobile],[Email],[AgentPassword],[AgentAddress],[Mobile],000,1,1,4 FROM Agent.Agents WHERE Id BETWEEN 47 AND 65