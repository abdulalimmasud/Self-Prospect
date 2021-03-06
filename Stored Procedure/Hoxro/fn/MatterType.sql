CREATE TABLE dev.MatterType
(
	MatterTypeId INT PRIMARY KEY,
	[Name] NVARCHAR(100)
)
GO
ALTER FUNCTION [mtr].[ufnGetMatterTypeIdByName](@Name nvarchar(50))
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = MatterTypeId FROM dev.MatterType where [Name] =  @Name;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;