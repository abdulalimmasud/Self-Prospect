DECLARE @jValue NVARCHAR(MAX)
		,@CreatedBy INT = 5

SET @jValue =
(
SELECT FieldAttributes = '{}'
		, LabelName = 'Client'+[LabelName]
		, InitialValue = ''
		, [Name] = 'Client'+[Name]
		, DataType
		, [Length]
		, Placeholder
		, InputType
		, InputTypeValues = ''
		, CreatedBy = CAST(@CreatedBy AS NVARCHAR(20))
		, IsDeleted
		, [FORMAT] = ''
	 FROM [std].[DefaultFields] WHERE [Type] = 1 FOR JSON PATH
)

SELECT @jValue

SELECT  
JSON_QUERY('[' + STUFF(( SELECT ',' + '"' + [Name] + '"' 
FROM [std].[DefaultFields] FOR XML PATH('')),1,1,'') + ']' ) Fields  
FOR JSON PATH , WITHOUT_ARRAY_WRAPPER 