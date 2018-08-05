CREATE PROC [Deal].[USP_UpdateCustomerOrderInfo]
(
	@NewPhoneNumber NVARCHAR(20),
	@NewDistrictId VARCHAR(10),
	@OldDeliveryCharge VARCHAR(30),
	@NewDeliveryCharge VARCHAR(30),
	@OldDeliveryAddress VARCHAR(500),
	@NewDeliveryAddress VARCHAR(500),
	@OldPaymentAmount VARCHAR(30),
	@UpdatedBy VARCHAR(30),
	@CouponId VARCHAR(30)
)
AS
BEGIN

IF(@NewDeliveryAddress <> '' OR @NewDeliveryAddress IS NOT NULL)
	BEGIN
		DECLARE @Sql varchar(500),
				@NewPaymentAmount MONEY = 0.0
		
		SET @Sql = 'UPDATE Deal.Coupons SET '

		
		IF(@NewDeliveryCharge <> '' OR @NewDeliveryCharge IS NOT NULL)
			BEGIN
			 SET @Sql+= ' DeliveryCharge=' + @NewDeliveryCharge
			END
		 
		IF(@NewDistrictId <> '' OR @NewDistrictId IS NOT NULL )
			BEGIN
			    IF (CHARINDEX('DeliveryCharge', @Sql) > 0)
					BEGIN
						SET @Sql +=','
					END
				SET @Sql += ' DeliveryDist=' + @NewDistrictId
			END

		IF ((CHARINDEX('DeliveryCharge', @Sql) > 0) OR (charindex('DeliveryDist', @Sql) > 0))
			BEGIN
				SET @Sql+=','
			END
		SET @Sql += ' CustomerBillingAddress=' + CHAR(39)+@NewDeliveryAddress + CHAR(39)
		
		IF(@NewPhoneNumber <> '' OR @NewPhoneNumber IS NOT NULL )
			BEGIN
				IF ((CHARINDEX('DeliveryCharge', @Sql) > 0) OR (charindex('CustomerBillingAddress', @Sql) > 0))
					BEGIN
						SET @Sql+=','
					END
				SET @Sql += ' CustomerMobile = '+@NewPhoneNumber
			END

		SET @Sql += ' UpdatedBy =' + @UpdatedBy
		SET @Sql +=' WHERE CouponId = '+ @CouponId

	 EXEC(@Sql)

	   SET @NewPaymentAmount = (SELECT (( CouponQtn * CouponPrice) + DeliveryCharge ) FROM Deal.Coupons WHERE CouponId = @CouponId)
	    IF(@NewPaymentAmount <> @OldPaymentAmount)
		BEGIN
		UPDATE Deal.Payments SET PaymentAmount = @NewPaymentAmount, UpdatedBy = @UpdatedBy,UpdatedOn = GETDATE() WHERE CouponId = @CouponId

			INSERT INTO [Deal].[PaymentTransaction] 
			(
				CouponId
				,FieldType
				,OldValue
				,NewValue
				,UpdateBy
				,UpdateOn
			)
			VALUES 
			(
				@CouponId
				,'PaymentAmount'
				,@OldPaymentAmount
				,@NewPaymentAmount
				,@UpdatedBy
				,GETDATE()
			)

			
		END
	END

	INSERT INTO [Deal].[CouponTransaction] (CouponId,FieldType,OldValue,NewValue,UpdateBy,UpdateOn)
			VALUES (@CouponId,'CustomerBillingAddress',@OldDeliveryAddress,@NewDeliveryAddress,@UpdatedBy,GETDATE())
	
END


SELECT TOP 1 * FROM Deal.Coupons ORDER BY CouponId DESC

UPDATE [Deal].[Coupons] SET [UpdatedBy]='',