BEGIN TRAN
DELETE FROM [trn].[ObjectOrdering]
DBCC CHECKIDENT( 'trn.ObjectOrdering', RESEED, 1)

INSERT INTO [trn].[ObjectOrdering]
(
	[ObjectTypeId]
	, [ObjectTypeName]
	, [ObjectId]
	, [OrderIndex]
	, [IsPinned]
	, [UserId]
	, [CompanyId]
	, [Biller]
)
SELECT 51, 'Matter', MatterId, 0, 0, Biller, CompanyId, Biller FROM [mtr].[Matter]


COMMIT