CREATE TABLE dev.[User]
(
	UserId INT,
	UserName NVARCHAR(100),
	CompanyId INT
)
GO
ALTER FUNCTION [trn].[ufnUserIdByUserName](@UserName nvarchar(50),@CompanyId int)
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = UserId FROM dev.[User] WHERE REPLACE(UserName,' ','')  = REPLACE(@UserName,' ','') AND CompanyId =  @CompanyId;  
     IF (@ret IS NULL)
		SELECT TOP 1 @ret = UserId FROM dev.[User] 
        --SET @ret = 0;  
    RETURN @ret;  
END;