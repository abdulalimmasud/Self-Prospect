CREATE PROC [dev].[sp_getCompanyData]
(
	@CompanyId INT,
	@ModifiedDate NVARCHAR(50)='2018-05-08 00:00:00.000',
	@From INT,
	@To INT
)
AS
BEGIN
	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY CategoryId ) AS RowNum, *
	          FROM      [scr].[Category]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY ClientId ) AS RowNum, *
	          FROM      [mtr].[Client]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY FieldId ) AS RowNum, *
	          FROM      [std].[Field]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY FieldMappingId ) AS RowNum, *
	          FROM      [std].[FieldMapping]
	          WHERE     [CompanyId] = @CompanyId
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY GlobalDataId ) AS RowNum, *
	          FROM      [gbd].[GlobalData]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY LibraryId ) AS RowNum, *
	          FROM      [lib].[Library]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY LibraryContentId ) AS RowNum, *
	          FROM      [lib].[LibraryContent]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY LibraryContentCategoryTypeMappingId ) AS RowNum, map.[LibraryContentCategoryTypeMappingId],
							map.LibraryContentId, map.[CategoryTypeId], map.[CategoryTypePK], map.[CreatedDate], map.[ModifiedDate]
	          FROM      [lib].[LibraryContentCategoryTypeMapping] map
			  INNER JOIN [lib].[LibraryContent] lc ON map.LibraryContentId = lc.LibraryContentId
	          WHERE     lc.[CompanyId] = @CompanyId
						AND  map.[ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY MatterId ) AS RowNum, *
	          FROM      [mtr].[Matter]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY MatterDocumentId ) AS RowNum, *
	          FROM      [mtr].[MatterDocument]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY MatterTypeId ) AS RowNum, *
	          FROM      [mtr].[MatterType]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY UserId ) AS RowNum, *
	          FROM      [trn].[User]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum

	SELECT  *
	FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY WorkTypeId ) AS RowNum, *
	          FROM      [mtr].[WorkType]
	          WHERE     [CompanyId] = @CompanyId
						AND  [ModifiedDate] >= @ModifiedDate
	        ) AS RowConstrainedResult
	WHERE   RowNum BETWEEN @From AND @To
	ORDER BY RowNum
END


--EXEC [dev].[sp_getCompanyData] 2, '2018-05-08 00:00:00.000', 20, 30

GO

CREATE PROC [dev].[sp_CompanyMaxCount]
(
	@CompanyId INT,
	@ModifiedDate NVARCHAR(50)='2018-05-08 00:00:00.000'
)
AS
BEGIN
	DECLARE @fieldCount INT,
			@docCount INT,
			@gDataCount INT
	SELECT	@fieldCount = COUNT(FieldId) 
	FROM	[std].[Field]
	WHERE   [CompanyId] = @CompanyId
		AND  [ModifiedDate] >= @ModifiedDate

	SELECT	@docCount = COUNT(MatterDocumentId) 
	FROM	[mtr].[MatterDocument]
	WHERE   [CompanyId] = @CompanyId
		AND  [ModifiedDate] >= @ModifiedDate

	SELECT	@gDataCount = COUNT(GlobalDataId) 
	FROM	[gbd].[GlobalData]
	WHERE   [CompanyId] = @CompanyId
		AND  [ModifiedDate] >= @ModifiedDate

	SELECT
    CASE
        WHEN @fieldCount >= @docCount AND @fieldCount >= @gDataCount THEN @fieldCount
        WHEN @docCount >= @fieldCount AND @docCount >= @gDataCount THEN @docCount
        WHEN @gDataCount >= @fieldCount AND @gDataCount >= @docCount THEN @gDataCount
        ELSE	@fieldCount
    END AS TotalCount
END
