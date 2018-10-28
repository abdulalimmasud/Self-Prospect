BEGIN TRAN
UPDATE [std].[Field] 
SET FieldAttributes = N'{"RequiredForCompany":1,"RequiredOnScreen":0,"Editable":[], "Visible":[], "Expression":{},"GroupFields":[]}'
	--, InputType = 'Text'
	--, [Length] = 100
WHERE InputType = 3

UPDATE f 
SET f.FieldAttributes = N'{"RequiredForCompany":0,"RequiredOnScreen":0,"Editable":["*"], "Visible":[], "Expression":{},"GroupFields":['+ STUFF((SELECT ',"'+CAST(fm.ChildId AS NVARCHAR(20))+'"' FROM [std].[FieldMapping] fm WHERE fm.ParentId = f.FieldId FOR XML PATH('')),1,1,'')+']}'
	--, f.InputType = 'Text'
	--, f.[Length] = 100
FROM [std].[Field] f
LEFT JOIN [std].[FieldMapping] c ON f.FieldId = c.ParentId
WHERE c.ParentId IS NOT NULL

UPDATE [std].[Field] 
SET FieldAttributes = N'{"RequiredForCompany":0,"RequiredOnScreen":0,"Editable":["*"], "Visible":["*"], "Expression":{},"GroupFields":[]}'
	--, InputType = 'Text'
	--, [Length] = 100
WHERE InputType = 9 AND FieldAttributes IS NULL

UPDATE [std].[Field] 
SET FieldAttributes = N'{"RequiredForCompany":0,"RequiredOnScreen":0,"Editable":["*"], "Visible":["*"], "Expression":{},"GroupFields":[]}'
	--, InputType = 'Text'
	--, [Length] = 100
WHERE InputType = 4

UPDATE [std].[Field] 
SET FieldAttributes = N'{"RequiredForCompany":0,"RequiredOnScreen":0,"Editable":["*"], "Visible":["*"], "Expression":{},"GroupFields":[]}'
	--, InputType = 'Text'
	--, [Length] = 100
WHERE InputType IN (1,8,0)

UPDATE [std].[Field] 
SET FieldAttributes = N'{"RequiredForCompany":0,"RequiredOnScreen":0,"Editable":["*"], "Visible":["*"], "Expression":{},"GroupFields":[]}'
	--, InputType = 'Dropdown'
	--, [Length] = 100
WHERE InputType = 2

COMMIT
SELECT * FROM [std].[Field]

--UPDATE [std].[Field] SET InputType = 2 WHERE InputType = 'Text'

ROLLBACK

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


SELECT [Name],
  FORMAT(CAST(
    JSON_VALUE(FieldAttributes, '$.GroupFields') AS int), 'N0')
    AS GroupFields
FROM [std].[Field]
WHERE ISJSON(FieldAttributes) > 0 AND
  JSON_VALUE(FieldAttributes,'$.Population') > 100000000
ORDER BY JSON_VALUE(FieldAttributes, '$.AreaInSqKm')

Select [Name], FieldAttributes as [FieldAttributes.GroupFields]
  From [std].[Field] 
Where FieldId = 453 
FOR JSON AUTO


SELECT FieldId, [Name],
  (SELECT JSON_QUERY(FieldAttributes) FOR JSON PATH)
FROM [std].[Field]
Where FieldId = 453 

ALTER TABLE [std].[Field] ADD  CONSTRAINT [UQ__FieldName] UNIQUE 
(
	[Name] ASC,
	[CompanyId] ASC
)

SELECT FieldId, [Name] FROM [std].[Field] WHERE CompanyId = 2 AND [Name] = 'Address Block' --, COUNT(FieldId)
GROUP BY [Name]
HAVING COUNT([Name]) > 1

SELECT GlobalDataId, MatterId, FieldId FROM [gbd].[GlobalData] WHERE FieldId IN (451,452,453)

DELETE [std].[Field] WHERE FieldId IN(452,453) 
DELETE [gbd].[GlobalData] WHERE FieldId IN(452,453) 
