CREATE TABLE dev.WorkType
(
	WorkTypeId INT,
	[Name] NVARCHAR(100),
	CompanyId INT
)
GO
ALTER FUNCTION [mtr].[ufnWorkTypeIdByName](@CompanyId int,@Name nvarchar(50))
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT TOP 1 @ret =  WorkTypeId FROM dev.WorkType where [Name] = @Name and CompanyId = @CompanyId;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;