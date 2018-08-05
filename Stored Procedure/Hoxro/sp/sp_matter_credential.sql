ALTER PROC [mtr].[sp_get_matter_credentials]
(
	@CompanyId INT
)
AS
BEGIN
	SELECT 
		[EntityTypeId]
		, [Name] 	
	FROM [std].[EntityType] 
		WHERE [IsDeleted] = 0 AND [CompanyId] = @CompanyId OR  [CompanyId] IS NULL

	SELECT 
		[UserId]
		, [FirstName]
		, [LastName]
		, [FullName]
		, [UserName]
	FROM [trn].[User] 
		WHERE [CompanyId] = @CompanyId AND [IsDeleted] = 0

	SELECT 
		 [MatterTypeId]
		 , [Name]
	FROM [mtr].[MatterType] 
		WHERE [CompanyId] = @CompanyId AND [IsDeleted] = 0

	SELECT 
		[WorkTypeId]
		, [Name]
		, [MatterTypeId]
	FROM [mtr].[WorkType] 
		WHERE [CompanyId] = @CompanyId AND [IsDeleted] = 0

	SELECT 
		[BillingTransactionTypeId],
		[Name]
	FROM [bil].[BillingTransactionType]
END