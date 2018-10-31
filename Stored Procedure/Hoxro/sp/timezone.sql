SELECT CONVERT(datetime, 
               SWITCHOFFSET(CONVERT(datetimeoffset, 
                                    GETUTCDATE()), 
                            DATENAME(TzOffset, SYSDATETIMEOFFSET())))

SELECT GETUTCDATE() AT TIME ZONE 'Hawaiian Standard Time'
SELECT GETUTCDATE() AT TIME ZONE 'Bangladesh Standard Time'
SELECT GETUTCDATE() AT TIME ZONE 'Pakistan Standard Time'

SELECT CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, 
                                    GETUTCDATE()), 
                            DATENAME(TzOffset, GETUTCDATE() AT TIME ZONE 'Bangladesh Standard Time')))