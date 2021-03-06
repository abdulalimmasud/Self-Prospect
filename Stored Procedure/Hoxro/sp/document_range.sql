
 ALTER PROCEDURE [mtr].[matter_document_range]
    @CompanyId int=0,  
    @MatterId int=0,  
    @UserId int =0,  
    @FromRange int=0,  
    @PageSize int=0  
 AS
    BEGIN

    DECLARE 
        @DocumentCount INT,  
        @TotalCharge DECIMAL(18,2),  
        @TotalUnit  DECIMAL(18,2)

        SELECT * 
            FROM vwMatterDocuments
            WHERE 1 = 1
            ORDER BY vwMatterDocuments.MatterDocumentId
            OFFSET @FromRange ROWS FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE);

        SELECT  @DocumentCount=COUNT(MatterDocumentId), 
                @TotalCharge=SUM(MTDOC.Charge),
                @TotalUnit=SUM(MTDOC.Unit) 
                FROM vwMatterDocuments AS MTDOC 
                WHERE MTDOC.CompanyId=@CompanyId AND MTDOC.MatterId=@MatterId;

        SELECT  @DocumentCount as count, 
                @TotalCharge as charge, 
                @TotalUnit as unit;

    END
