BEGIN TRAN
UPDATE [std].[Field] 
SET FieldAttributes = N'[{"RequiredForCompany":"true","RequiredOnScreen":"false","Editable":[], "Visible":[], "Expression":{},"GroupField":[]}]'
WHERE InputType = '3'

BEGIN TRAN
UPDATE mdoc 
SET mdoc.CategoryId = cat.CategoryId
FROM mtr.MatterDocument mdoc
INNER JOIN mtr.Matter mtr on mtr.MatterId = mdoc.MatterId
INNER JOIN dbo.Documents doc ON mdoc.Blob = 'matter/'+doc.blob+'/'+doc.[File Name] 
INNER JOIN scr.Category cat ON cat.[Name] = doc.Party
WHERE mtr.CompanyId = 2
SELECT top 2 * FROM [mtr].MatterDocument


SELECT CAST(fm.ChildId as NVARCHAR(20)) + ',' FROM  [std].[Field] f 
RIGHT JOIN [std].[FieldMapping] fm ON fm.ParentId = f.FieldId
WHERE f.FieldId =2080

SELECT
    STUFF((SELECT 
        ',' + CAST(b.ChildId as NVARCHAR(20))
     FROM 
         [std].[FieldMapping] b 
     WHERE 
         b.ParentId = a.FieldId
    FOR XML PATH('')),1,1,'') AS Childs 
FROM 
    [std].[Field] a 
LEFT JOIN [std].[FieldMapping] c ON a.FieldId = c.ParentId
WHERE c.ParentId IS NOT NULL


SELECT 
  a.FieldId,
  STUFF((
    SELECT ', ' +CAST(b.ChildId AS VARCHAR(20)) 
    FROM [std].[FieldMapping] b
    WHERE (b.ParentId = a.FieldId) 
    FOR XML PATH(''))
  ,1,1,'') AS Childs
FROM [std].[Field] a 
GROUP BY a.FieldId