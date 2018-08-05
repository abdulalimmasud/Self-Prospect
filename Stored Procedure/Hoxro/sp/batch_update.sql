SELECT * FROM [std].[Company]

SELECT * FROM [trn].[User]

UPDATE [std].[Company] SET [StorageName] = 'cds' WHERE CompanyId = 2

EXEC [dbo].[sp_adding_new_company_datas] 2 

SELECT MAX(SerialNumber) 'SerialNumberMax', MIN(SerialNumber) 'SerialNumberMin' FROM [mtr].[Matter] WHERE CompanyId = 2

SELECT * FROM [std].[ApplicationConfigurationValue] WHERE CompanyId = 2

UPDATE [std].[ApplicationConfigurationValue] SET [Value] = '13425' WHERE ApplicationConfigurationValueId = 4

--EXEC [std].[sp_register_company] 'NetLawSolicitors', 'JF', 'josh@net-solicitors.co.uk', 'H10xr@999', 'Josh', 'Fell'


BEGIN TRAN
UPDATE mdoc 
SET mdoc.CategoryId = cat.CategoryId
FROM mtr.MatterDocument mdoc
INNER JOIN mtr.Matter mtr on mtr.MatterId = mdoc.MatterId
INNER JOIN dbo.Documents doc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name] 
INNER JOIN scr.Category cat ON cat.[Name] = doc.Party
WHERE mtr.CompanyId = 2
SELECT top 2 * FROM [mtr].MatterDocument

--COMMIT TRAN

--ROLLBACK

SELECT
cat.CategoryId
,cat.[Name]
 ,doc.Party,
 mdoc.MatterDocumentId
FROM mtr.MatterDocument mdoc
--INNER JOIN mtr.Matter mtr on mtr.MatterId = mdoc.MatterId
INNER JOIN dbo.Documents doc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name] 
INNER JOIN scr.Category cat ON cat.[Name] = doc.Party
WHERE cat.CompanyId = 2

SELECT COUNT(MatterDocumentId) FROM [mtr].MatterDocument
SELECT COUNT(*) FROM  dbo.Documents

SELECT COUNT(*) FROM dbo.Documents doc
INNER JOIN mtr.Matter mtr on mtr.MatterRef = CAST(doc.[Matter Ref] AS nvarchar(50))
INNER JOIN mtr.MatterDocument mdoc ON mdoc.MatterId = mtr.MatterId--'matter/'+doc.blob+'/'+doc.[File Name]
--WHERE doc.Party


SELECT top 1 * FROM Documents doc
SELECT top 1 * FROM mtr.MatterDocument md

SELECT * FROM [trn].[User] WHERE UserId = 2


BEGIN TRAN
INSERT INTO [mtr].[MatterDocument]
(
	[MatterId]
	,[DisplayDate]
	, [Unit]
	, [Charge]
	, [TimeSpent]
	, [Handler]
	, [Blob]
	, [CreatedDate]
	, [ModifiedDate]
	, [IsDeleted]
	, [Details]
	, [ActionTypeId]
	, [IsDraft]
	, [IsLocked]
	, [Name]
	, [FileName]
	, [ExtensionId]
	, [ParentId]
	, [VersionNo]
	, [IsCurrent]
)
SELECT  
	mtr.MatterId
	, doc.[History date]
	, 0
	, 0
	, CAST(doc.[Time Spent] AS nvarchar(50))
	, 2
	, 'matter/'+doc.blob+'/'+doc.[File Name]
	, GETDATE()
	, GETDATE()
	, 0
	, doc.Details
	, act.ActionTypeId
	, 0
	, 0
	, doc.[Document Name]
	, doc.[File Name]
	, ex.ExtensionId
	, 0
	, 1
	, 1
FROM Documents doc
LEFT JOIN mtr.MatterDocument mdoc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name]
LEFT JOIN mtr.Matter mtr on mtr.MatterRef = CAST(doc.[Matter Ref] AS nvarchar(MAX))
INNER JOIN gbl.Extension ex ON doc.Extension = ex.Name
INNER JOIN gbl.ActionType act ON doc.[Action type] = act.Name
WHERE mdoc.[FileName] is null




SELECT * FROM [trn].[User] WHERE CompanyId = 2

SELECT * FROM [gbl].[ActionType]
