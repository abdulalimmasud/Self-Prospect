ALTER PROC [dbo].[sp_get_usergroup_childIds]
(
	@parentId INT
)
AS
BEGIN
	WITH temp (ID, ParentID, ChildrenChain)
	AS
	(
	    SELECT ID, ParentUserGroupID, CAST('' AS VARCHAR(100))
	    FROM [dbo].[UserGroups]
	    WHERE NOT EXISTS (SELECT * FROM [dbo].[UserGroups] ug WHERE ug.ParentUserGroupID = ug.ID) AND IsDeleted = 0
	
	    UNION ALL
	
	    SELECT ug.ID, ug.ParentUserGroupID, CAST((temp.ChildrenChain + ',' + CAST(temp.ID AS VARCHAR(100))) AS VARCHAR(100)) 
	    FROM [dbo].[UserGroups] ug
	    INNER JOIN temp ON ug.ID = temp.ParentID AND ug.IsDeleted = 0
	)
	
	SELECT DISTINCT ID,
	    STUFF(REPLACE(
	        STUFF(
	           (SELECT
	                ',' + t2.ChildrenChain
	                FROM temp t2
	                WHERE temp.ID=t2.ID
	                ORDER BY t2.ChildrenChain
	                FOR XML PATH(''), TYPE
	           ).value('.','varchar(max)')
	           ,1,2, ''
	        ), 
	    ',,', ','),1,1,'') AS ChildValues
	FROM temp
	WHERE LEN(ChildrenChain) > 0 AND temp.ID = @parentId
END

--EXEC [dbo].[sp_get_usergroup_childIds] 2

