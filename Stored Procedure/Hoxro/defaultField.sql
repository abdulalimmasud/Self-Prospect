DECLARE	@CreatedDate DATETIME = GETUTCDATE(),
		@ModifiedDate DATETIME = GETUTCDATE()

INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('First Name', 'FirstName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Middle Name', 'MiddleName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Last Name', 'LastName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Line1', 'HomeAddressLine1', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Line2', 'HomeAddressLine2', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Line3', 'HomeAddressLine3', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Line4', 'HomeAddressLine4', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Line5', 'HomeAddressLine5', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Home Address Postcode', 'HomeAddressPostcode', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Trading Name', 'TradingName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Owner Name', 'CompanyOwnerName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Secretary Name', 'CompanySecretaryName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Name', 'CompanyName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Number', 'CompanyNumber', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Address Line1', 'CompanyAddressLine1', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Address Line2', 'CompanyAddressLine2', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Address Line3', 'CompanyAddressLine3', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Address Line4', 'CompanyAddressLine4', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Address Line5', 'CompanyAddressLine5', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Company Postcode', 'CompanyPostcode', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Personal Email', 'PersonalEmail', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Personal Telephone', 'PersonalTelephone', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Personal Mobile', 'PersonalMobile', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Work Email', 'WorkEmail', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Work Telephone', 'WorkTelephone', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Work Mobile', 'WorkMobile', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Instructed Date', 'InstructedDate', 'Date', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Instructed Basis', 'InstructedBasis', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Instructions', 'Instructions', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Date of Birth', 'DateOfBirth', 'Date', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Bank Account Name', 'BankAccountName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Bank Account Code', 'BankAccountCode', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Bank Account Number', 'BankAccountNumber', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('PO Box Number', 'POBoxNumber', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('DX Name', 'DXName', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('DX Number', 'DXNumber', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Agreed Rate', 'AgreedRate', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Expert Qualifications', 'ExpertQualifications', 'Text', @CreatedDate, 'Text', @ModifiedDate, 0)
INSERT INTO [std].[DefaultFields] ([LabelName],[Name], [DataType], [CreatedDate], [InputType], [ModifiedDate], [IsDeleted])VALUES('Years Qualified', 'YearsQualified', 'Number', @CreatedDate, 'Text', @ModifiedDate, 0)

