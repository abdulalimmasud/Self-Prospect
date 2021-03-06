CREATE TABLE dev.EntityType
(
  EntityTypeId INT,
  CompanyId INT,
  [Name] NVARCHAR(100)
)
GO
ALTER FUNCTION [std].[ufnGetEntityIdByName](@CompanyId int,@Name nvarchar(50))  
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = EntityTypeId FROM dev.EntityType WHERE CompanyId = @CompanyId AND [Name] = @Name;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;

--DROP TABLE #EntityType