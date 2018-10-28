ALTER TABLE [mtr].[MatterDocument] ADD [TimeLog] BIGINT
BEGIN TRAN
UPDATE [mtr].[MatterDocument]
SET [TimeLog] = DATEDIFF(second, '00:00', CAST(TimeSpent AS time(7)))* cast(1000 as bigint) + RIGHT(CAST(TimeSpent AS time(7)),7)
WHERE MatterDocumentId NOT IN (938029,938028,694258,694200,694199,694198,694195,694194,694193,694162)
COMMIT

BEGIN TRAN
UPDATE [mtr].[MatterDocument]
SET [TimeLog] = 320400000
WHERE MatterDocumentId IN (938029,938028,694258,694200,694199,694198,694195,694194,694193,694162)
COMMIT

SELECT TOP 1000 TimeSpent, [TimeLog] FROM [mtr].[MatterDocument]

SELECT TimeSpent FROM [mtr].[MatterDocument]

SELECT  DATEDIFF(second, '00:00', CAST(TimeSpent AS time(7)))* cast(1000 as bigint) + RIGHT(CAST(TimeSpent AS time(7)),7) FROM [mtr].[MatterDocument]
WHERE MatterDocumentId NOT IN (938029,938028,694258,694200,694199,694198,694195,694194,694193,694162)
ORDER BY MatterDocumentId DESC


SELECT TOP 300 MatterDocumentId, TimeSpent, CompanyId FROM [mtr].[MatterDocument]
WHERE TimeSpent NOT LIKE '00:00:00'
ORDER BY MatterDocumentId DESC

SELECT * FROM [std].[Company] WHERE CompanyId = 51

SELECT TimeSpent
FROM [mtr].[MatterDocument]
WHERE TimeSpent NOT LIKE '[01][0-9]:[0-5][0-9]:[0-5][0-9]' AND
      TimeSpent NOT LIKE '2[0-3]:[0-5][0-9]:[0-5][0-9]';

BEGIN TRAN
DELETE FROM mtr.MatterDocument WHERE CompanyId = 51

COMMIT


SELECT * FROM [dbo].[Data] WHERE MatterRef = 67769

UPDATE [dbo].[Data]
SET ClientFirstName = 'Shannon White',
ClientLastName = 'June McLeod',
ClientMiddleName = 'LF',
ClientFullName = 'Shannon White LF June McLeod'
WHERE MatterRef = 67769


