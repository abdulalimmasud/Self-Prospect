
EXEC sp_rename '[std].[Field].[Type]', 'InputType', 'COLUMN'

ALTER TABLE [std].[Field] ALTER COLUMN [InputType] NVARCHAR(50) NOT NULL

EXEC sp_rename '[std].[Field].[IsRequired]', 'Length', 'COLUMN'

ALTER TABLE [std].[Field] ALTER COLUMN [Length] INT NULL

EXEC sp_rename '[std].[Field].[PermissionId]', 'InputTypeValues', 'COLUMN'

ALTER TABLE [std].[Field] ALTER COLUMN [InputTypeValues] NVARCHAR(1000) NULL

EXEC sp_rename '[std].[Field].[IsGroupField]', 'FieldAttributes', 'COLUMN'

ALTER TABLE [std].[Field] ALTER COLUMN [FieldAttributes] NVARCHAR(1000) NULL