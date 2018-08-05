CREATE SCHEMA dev
GO
CREATE PROC [dev].[sp_delete_matter]
(
	@MatterId INT 
)
AS
BEGIN
	DECLARE @ClientId INT,
			@ClientCount INT,
			@ObjectTypeId INT,
			@BillingId INT,
			@EventCount INT = 0,
			@SectionDetailCount INT = 0,
			@ObejctTypeName NVARCHAR(50) = 'Matter' 
	DECLARE	@DraftIds TABLE
			(
				Id INT 
			)
	DECLARE	@TaskIds TABLE
			(
				Id INT 
			)
	
	BEGIN TRY
		BEGIN TRAN
			SELECT @ClientId = ClientId FROM [mtr].[Matter] WHERE MatterId = @MatterId
			SELECT @ClientCount = COUNT(ClientId) FROM [mtr].[Matter] WHERE ClientId = @ClientId
			SELECT @ObjectTypeId = ObjectTypeId FROM [gbl].[ObjectType] WHERE ObejctTypeName = @ObejctTypeName
			SELECT @BillingId = BillingId FROM [bil].[Billing] WHERE MatterId = @MatterId
		
			INSERT INTO @DraftIds (Id) 
			SELECT DraftId FROM [bil].[Draft] WHERE BillingId = @BillingId
		
			INSERT INTO @TaskIds(Id)
			SELECT TaskId FROM [evn].[TaskRelationship] WHERE ObjectId = @MatterId AND [ObjectTypeId] = @ObjectTypeId
		
			DELETE FROM [evn].[TaskRelationship] WHERE ObjectId = @MatterId AND [ObjectTypeId] = @ObjectTypeId
			DELETE FROM [evn].[Task] WHERE TaskId IN (SELECT Id FROM @TaskIds)
		
			DELETE FROM [mtr].[MatterCategoryScreenMap] WHERE MatterId = @MatterId
			DELETE FROM [mtr].[MatterDocument] WHERE MatterId = @MatterId
			DELETE FROM [trn].[ObjectOrdering] WHERE ObjectTypeId = @ObjectTypeId AND ObjectId = @MatterId
		
			DELETE FROM [bil].[DraftDetails] WHERE DraftId IN (SELECT Id FROM @DraftIds)
			DELETE FROM [bil].[Draft] WHERE BillingId = @BillingId
			DELETE FROM [bil].[BillingTransaction] WHERE BillingId = @BillingId
			DELETE FROM [bil].[Billing] WHERE BillingId = @BillingId
		
			SELECT @EventCount = COUNT(EventId) FROM [evn].[Event] WHERE ObjectTypeId = @ObjectTypeId AND ObjectId = @MatterId
			IF(@EventCount > 0)
			BEGIN
				DELETE FROM [evn].[Event] WHERE ObjectTypeId = @ObjectTypeId AND ObjectId = @MatterId 
			END
		
			SELECT @SectionDetailCount = COUNT(SectionId) FROM [evn].[SectionDetail] WHERE  ObjectTypeId = @ObjectTypeId AND ObjectId = @MatterId
			IF(@SectionDetailCount > 0)
			BEGIN
				DELETE FROM [evn].[SectionDetail] WHERE  ObjectTypeId = @ObjectTypeId AND ObjectId = @MatterId
			END
		
			DELETE FROM [mtr].[Contacts] WHERE MatterId = @MatterId
			DELETE FROM [gbd].[GlobalData] WHERE MatterId = @MatterId
			DELETE FROM [mtr].[Matter] WHERE MatterId = @MatterId
		
			IF(@ClientCount < 2)
			BEGIN
				DELETE FROM [mtr].[Client] WHERE ClientId = @ClientId
			END
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRAN
			END
		PRINT ERROR_MESSAGE()
	END CATCH
END

--EXEC [mtr].[sp_delete_matter] 6907
