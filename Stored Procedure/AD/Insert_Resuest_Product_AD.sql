CREATE proc [Deal].[spInsertRequestProduct]
@pName nvarchar(200),
@link nvarchar(1000),
@image varchar(15),
@descrptn nvarchar(1000),
@price money,
@expctDate smallDatetime,
@custId int,
@id int out
as
if((select COUNT(LINK) as LinkCount from Deal.RequestedProduct where CustomerId = @custId and Link = @link AND LINK<>'')>0)
begin
	set @id = -1
end
else
begin
	insert Deal.RequestedProduct(ProductName,Link,[Description],Price,ExpectedDate,CustomerId)
	values(@pName,@link,@descrptn,@price,@expctDate,@custId)
	set @id = SCOPE_IDENTITY()
	if(@image <> '')
	begin
		update Deal.RequestedProduct set ImagePath=(CAST(@id as varchar(15))+@image) where Id = @id
	end
end

CREATE Procedure Deal.USP_Insert_RequestProduct_Evaluation
(
@RequestId int,
@MerchantList varchar(1000),
@UserId int
)
AS
Begin
SET @MerchantList=LTRIM(RTRIM(@MerchantList))
Declare  @Separator varchar(200) = null
Declare @MerchantId varchar(200)=''

While( LEN(@MerchantList) > 0)
Begin
	If(PATINDEX('%,%',@MerchantList) > 0)
	Begin
		SET @Separator = SUBSTRING(@MerchantList, 0, PATINDEX('%,%',@MerchantList))
		SET @MerchantId=@Separator
		IF Not Exists(Select 1 From Deal.RequestProductEvaluation Where RequestId=@RequestId And MerchantId=@MerchantId)
			INSERT INTO Deal.RequestProductEvaluation(RequestId, MerchantId, UserId)
			VALUES
			(@RequestId,@MerchantId,@UserId)

		SET @MerchantList = SUBSTRING(@MerchantList, LEN(@Separator + char(00)) + 1,LEN(@MerchantList)) 
	End
	ELSE
		Begin
			SET @Separator = @MerchantList
			SET @MerchantId=@Separator
			IF Not Exists(Select 1 From Deal.RequestProductEvaluation Where RequestId=@RequestId And MerchantId=@MerchantId)
			INSERT INTO Deal.RequestProductEvaluation(RequestId, MerchantId, UserId)
			VALUES
			(@RequestId,@MerchantId,@UserId)

			SET @MerchantList = NULL
		End
End
End