CREATE TABLE dev.Category
(
	CategoryId INT,
	[Name] NVARCHAR(100),
	CompanyId INT
)
GO
ALTER FUNCTION [scr].[ufnGetCategoryIdByName](@Name nvarchar(50),@CompanyId int)
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = CategoryId FROM dev.Category WHERE  [Name] = @Name AND CompanyId =  @CompanyId;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;