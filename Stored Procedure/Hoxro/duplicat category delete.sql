DECLARE @CompanyId INT = 61

DELETE FROM [scr].[CategoryScreenMap] WHERE CompanyId = @CompanyId AND CategoryId IN 
(
	SELECT CategoryId FROM [scr].[Category] WHERE CompanyId = @CompanyId AND [Name] IN
	(
		SELECT [name] FROM [scr].[Category]
		WHERE CompanyId = @CompanyId
		GROUP BY
		[name]
		HAVING COUNT(CategoryId)>1
	)
)
DELETE FROM [scr].[Category] WHERE CompanyId = @CompanyId AND [Name] IN
(
	SELECT [name] FROM [scr].[Category]
	WHERE CompanyId = @CompanyId
	GROUP BY
	[name]
	HAVING COUNT(CategoryId)>1
)