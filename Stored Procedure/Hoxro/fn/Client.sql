ALTER FUNCTION [mtr].[ufnClientIdByName](@CompanyId int,@Name nvarchar(50))
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT TOP 1 @ret =  ClientId FROM dev.Client where REPLACE(REPLACE(ClientFullName,'  ',''),' ','') =  REPLACE(REPLACE(@Name,' ',''),' ','') and CompanyId = @CompanyId;  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END;