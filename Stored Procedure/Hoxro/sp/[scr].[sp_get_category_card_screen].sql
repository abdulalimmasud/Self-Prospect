
ALTER PROC [scr].[sp_get_category_card_screen]
(
	 @companyId INT
)
AS
BEGIN
	DECLARE	@screenIds TABLE (ScreenId INT)
	DECLARE	@categories TABLE (CategoryId INT, [Name] NVARCHAR(100))
	DECLARE	@cards TABLE (CardId INT, [Name] NVARCHAR(100), ScreenIds NVARCHAR(500))
	DECLARE @categoryScreenMaps TABLE (CategoryId INT, ScreenId INT)
	
	INSERT INTO @cards (CardId, [Name], ScreenIds)
	SELECT CardId, [Name], [ScreenIds] FROM [std].[Card] 
	WHERE CompanyId = @companyId AND IsDeleted = 0
	
	INSERT INTO @categories
	SELECT CategoryId, [Name] FROM [scr].[Category] 
	WHERE CompanyId = @companyId AND IsDeleted = 0
	
	INSERT INTO @screenIds (ScreenId)
	SELECT j.[Value] FROM @cards c
	CROSS APPLY OPENJSON(c.ScreenIds) j
	
	INSERT INTO @categoryScreenMaps
	SELECT CategoryId, ScreenId FROM [scr].[CategoryScreenMap]
	WHERE CategoryId IN (SELECT CategoryId FROM @categories)

	INSERT INTO @screenIds (ScreenId)
	SELECT ScreenId FROM @categoryScreenMaps
	
	SELECT * FROM @cards
	SELECT * FROM @categories
	SELECT * FROM @categoryScreenMaps
	SELECT ScreenId, [Name] FROM [scr].[Screen] WHERE ScreenId IN (SELECT ScreenId FROM @screenIds) AND IsDeleted = 0
END