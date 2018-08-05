BEGIN TRAN
UPDATE mdoc 
SET mdoc.CategoryId = cat.CategoryId
FROM Documents doc
LEFT JOIN mtr.MatterDocument mdoc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name]
LEFT JOIN mtr.Matter mtr on mtr.MatterRef = CAST(doc.[Matter Ref] AS nvarchar(MAX))
LEFT JOIN scr.Category cat ON cat.[Name] = doc.Party
WHERE cat.CompanyId = 2 AND  mdoc.[FileName] is not null

SELECT * FROM [mtr].[MatterDocument] WHERE CategoryId <> 2

--COMMIT TRAN

--ROLLBACK

SELECT COUNT(MatterDocumentId) FROM [mtr].MatterDocument
SELECT COUNT(*) FROM  dbo.Documents

SELECT COUNT(*) FROM dbo.Documents doc
INNER JOIN mtr.Matter mtr on mtr.MatterRef = CAST(doc.[Matter Ref] AS nvarchar(50))
INNER JOIN mtr.MatterDocument mdoc ON mdoc.MatterId = mtr.MatterId--'matter/'+doc.blob+'/'+doc.[File Name]
--WHERE doc.Party

SELECT  
	COUNT(mdoc.MatterDocumentId)
FROM Documents doc
LEFT JOIN mtr.MatterDocument mdoc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name]
LEFT JOIN mtr.Matter mtr on mtr.MatterRef = CAST(doc.[Matter Ref] AS nvarchar(MAX))
INNER JOIN gbl.Extension ex ON doc.Extension = ex.Name
INNER JOIN gbl.ActionType act ON doc.[Action type] = act.Name
WHERE mdoc.[FileName] is not null
