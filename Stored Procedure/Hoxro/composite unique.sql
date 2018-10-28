ALTER TABLE [scr].[Category] ADD  CONSTRAINT [UQ__Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[CompanyId] ASC
)