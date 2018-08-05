ALTER PROCEDURE [mtr].[sp_edit_matter_view]
(
	@matterId int
)
AS
   DECLARE @BillerId int
   SELECT @BillerId=biller FROM MTR.Matter WHERE MatterId=@matterId  

   SELECT 
		 cnt.ClientFirstName
		,cnt.ClientLastName
		,cnt.ClientMiddleName
		,cnt.ClientId
		,mt.MatterTypeId
		,MatterTypeName = mt.[Name]
		,wt.WorkTypeId
		,WorkTypeName = wt.[Name]
		,mtr.SerialNumber
		,mtr.MatterRef
		,mtr.LinkMatterId
		,cmp.CompanyId
		,CompanyName = cmp.[Name]
		,mtr.Biller
		,BillerName=usr.FullName
		,bil.BillingTypeId
		,bil.Amount
		,cnt.EntityTypeId
		,EntityTypeName = ent.[Name]
		,mtr.CreatedDate
		,mtr.ModifiedDate
		,mtr.LastAccessedDate
		,mtr.MatterStatusId
		,objorder.[ObjectOrderingId]
		,objorder.Ispinned
		,objorder.UserId
		,usr.FirstName as  UserFirstName
		,usr.LastName as UserLastName
		,usr.UserName as BillerName
     FROM mtr.Matter mtr
		INNER JOIN mtr.Client cnt on cnt.ClientId = mtr.ClientId
		INNER JOIN std.EntityType ent on ent.EntityTypeId = cnt.EntityTypeId
		INNER JOIN mtr.WorkType wt on wt.WorkTypeId = mtr.WorkTypeId
		INNER JOIN mtr.MatterType mt on mt.MatterTypeId = wt.MatterTypeId
		INNER JOIN std.Company cmp on cmp.CompanyId = mtr.CompanyId
		INNER JOIN bil.Billing bil on bil.MatterId = mtr.MatterId
		INNER JOIN trn.[User] usr on usr.UserId = mtr.Biller
		left JOIN [trn].[ObjectOrdering] AS objorder on   objorder.[ObjectId] =mtr.matterId and objorder.UserId=@BillerId

    WHERE 1=1 and objorder.UserId=@BillerId AND mtr.MatterId = @matterId



-- EXEC [mtr].[sp_edit_matter_view] 22
