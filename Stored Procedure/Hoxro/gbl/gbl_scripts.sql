USE [Hoxro]
GO

--Insert AppConfigurationType
INSERT [std].[AppConfigurationType] ([AppConfigurationTypeId], [Name], [Description]) VALUES (1, N'ConflictType', N'ConflictType')
GO
INSERT [std].[AppConfigurationType] ([AppConfigurationTypeId], [Name], [Description]) VALUES (2, N'NumberFormat', N'NumberFormat')
GO

--Insert Country
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (1, N'AF', N'Afghanistan', N'Afghanistan', NULL, N'Afghan afghani', N'؋', N'Pashto', CAST(33.000000 AS Decimal(9, 6)), CAST(65.000000 AS Decimal(9, 6)), NULL, N'Uzbek', N'Turkmen', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (2, N'AX', N'Åland Islands', N'Åland Islands', NULL, N'Euro', N'€', N'Swedish', CAST(60.116700 AS Decimal(9, 6)), CAST(19.900000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (3, N'AL', N'Albania', N'Albania', NULL, N'Albanian lek', N'L', N'Albanian', CAST(41.000000 AS Decimal(9, 6)), CAST(20.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (4, N'DZ', N'Algeria', N'Algeria', NULL, N'Algerian dinar', N'د.ج', N'Arabic', CAST(28.000000 AS Decimal(9, 6)), CAST(3.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (5, N'AS', N'American Samoa', N'American Samoa', NULL, N'United State Dollar', N'$', N'English', CAST(-14.333300 AS Decimal(9, 6)), CAST(-170.000000 AS Decimal(9, 6)), NULL, N'Samoan', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (6, N'AD', N'Andorra', N'Andorra', NULL, N'Euro', N'€', N'Catalan', CAST(42.500000 AS Decimal(9, 6)), CAST(1.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (7, N'AO', N'Angola', N'Angola', NULL, N'Angolan kwanza', N'Kz', N'Portuguese', CAST(-12.500000 AS Decimal(9, 6)), CAST(18.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (8, N'AI', N'Anguilla', N'Anguilla', NULL, N'East Caribbean dollar', N'$', N'English', CAST(18.250000 AS Decimal(9, 6)), CAST(-63.166700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (9, N'AQ', N'Antarctica', N'Antarctica', NULL, N'Australian dollar', N'$', N'English', CAST(-74.650000 AS Decimal(9, 6)), CAST(4.480000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (10, N'AG', N'Antigua and Barbuda', N'Antigua and Barbuda', NULL, N'East Caribbean dollar', N'$', N'English', CAST(17.050000 AS Decimal(9, 6)), CAST(-61.800000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (11, N'AR', N'Argentina', N'Argentina', NULL, N'Argentine peso', N'$', N'Spanish', CAST(-34.000000 AS Decimal(9, 6)), CAST(-64.000000 AS Decimal(9, 6)), NULL, N'Guaraní', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (12, N'AM', N'Armenia', N'Armenia', NULL, N'Armenian dram', NULL, N'Armenian', CAST(40.000000 AS Decimal(9, 6)), CAST(45.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (13, N'AW', N'Aruba', N'Aruba', NULL, N'Aruban florin', N'ƒ', N'Dutch', CAST(12.500000 AS Decimal(9, 6)), CAST(-69.966700 AS Decimal(9, 6)), NULL, N'(Eastern) Punjabi', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (14, N'AU', N'Australia', N'Australia', NULL, N'Australian dollar', N'$', N'English', CAST(-27.000000 AS Decimal(9, 6)), CAST(133.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (15, N'AT', N'Austria', N'Austria', NULL, N'Euro', N'€', N'German', CAST(47.333300 AS Decimal(9, 6)), CAST(13.333300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (16, N'AZ', N'Azerbaijan', N'Azerbaijan', NULL, N'Azerbaijani manat', NULL, N'Azerbaijani', CAST(40.500000 AS Decimal(9, 6)), CAST(47.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (17, N'BS', N'Bahamas', N'Bahamas', NULL, N'Bahamian dollar', N'$', N'English', CAST(24.250000 AS Decimal(9, 6)), CAST(-76.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (18, N'BH', N'Bahrain', N'Bahrain', NULL, N'Bahraini dinar', N'.د.ب', N'Arabic', CAST(26.000000 AS Decimal(9, 6)), CAST(50.550000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (19, N'BD', N'Bangladesh', N'Bangladesh', NULL, N'Bangladeshi taka', N'৳', N'Bengali', CAST(24.000000 AS Decimal(9, 6)), CAST(90.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (20, N'BB', N'Barbados', N'Barbados', NULL, N'Barbadian dollar', N'$', N'English', CAST(13.166700 AS Decimal(9, 6)), CAST(-59.533300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (21, N'BY', N'Belarus', N'Belarus', NULL, N'New Belarusian ruble', N'Br', N'Belarusian', CAST(53.000000 AS Decimal(9, 6)), CAST(28.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (22, N'BE', N'Belgium', N'Belgium', NULL, N'Euro', N'€', N'Dutch', CAST(50.833300 AS Decimal(9, 6)), CAST(4.000000 AS Decimal(9, 6)), NULL, N'French', N'German', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (23, N'BZ', N'Belize', N'Belize', NULL, N'Belize dollar', N'$', N'English', CAST(17.250000 AS Decimal(9, 6)), CAST(-88.750000 AS Decimal(9, 6)), NULL, N'Spanish', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (24, N'BJ', N'Benin', N'Benin', NULL, N'West African CFA franc', N'Fr', N'French', CAST(9.500000 AS Decimal(9, 6)), CAST(2.250000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (25, N'BM', N'Bermuda', N'Bermuda', NULL, N'Bermudian dollar', N'$', N'English', CAST(32.333300 AS Decimal(9, 6)), CAST(-64.750000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (26, N'BT', N'Bhutan', N'Bhutan', NULL, N'Bhutanese ngultrum', N'Nu.', N'Dzongkha', CAST(27.500000 AS Decimal(9, 6)), CAST(90.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (27, N'BO', N'Bolivia (Plurinational State of)', N'Bolivia (Plurinational State of)', NULL, N'Bolivian boliviano', N'Bs.', N'Spanish', CAST(-17.000000 AS Decimal(9, 6)), CAST(-65.000000 AS Decimal(9, 6)), NULL, N'Aymara', N'Quechua', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (28, N'BQ', N'Bonaire, Sint Eustatius and Saba', N'Bonaire, Sint Eustatius and Saba', NULL, N'United States dollar', N'$', N'Dutch', CAST(12.150000 AS Decimal(9, 6)), CAST(-68.266700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (29, N'BA', N'Bosnia and Herzegovina', N'Bosnia and Herzegovina', NULL, N'Bosnia and Herzegovina convertible mark', NULL, N'Bosnian', CAST(44.000000 AS Decimal(9, 6)), CAST(18.000000 AS Decimal(9, 6)), NULL, N'Croatian', N'Serbian', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (30, N'BW', N'Botswana', N'Botswana', NULL, N'Botswana pula', N'P', N'English', CAST(-22.000000 AS Decimal(9, 6)), CAST(24.000000 AS Decimal(9, 6)), NULL, N'Tswana', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (31, N'BV', N'Bouvet Island', N'Bouvet Island', NULL, N'Norwegian krone', N'kr', N'Norwegian', CAST(-54.433300 AS Decimal(9, 6)), CAST(3.400000 AS Decimal(9, 6)), NULL, N'Norwegian Bokmål', N'Norwegian Nynorsk', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (32, N'BR', N'Brazil', N'Brazil', NULL, N'Brazilian real', N'R$', N'Portuguese', CAST(-10.000000 AS Decimal(9, 6)), CAST(-55.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (33, N'IO', N'British Indian Ocean Territory', N'British Indian Ocean Territory', NULL, N'United States dollar', N'$', N'English', CAST(-6.000000 AS Decimal(9, 6)), CAST(71.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (34, N'UM', N'United States Minor Outlying Islands', N'United States Minor Outlying Islands', NULL, N'United States Dollar', N'$', N'English', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (35, N'VG', N'Virgin Islands (British)', N'Virgin Islands (British)', NULL, N'[D]', N'$', N'English', CAST(18.431400 AS Decimal(9, 6)), CAST(-64.623100 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (36, N'VI', N'Virgin Islands (U.S.)', N'Virgin Islands (U.S.)', NULL, N'United States dollar', N'$', N'English', CAST(18.340000 AS Decimal(9, 6)), CAST(-64.930000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (37, N'BN', N'Brunei Darussalam', N'Brunei Darussalam', NULL, N'Brunei dollar', N'$', N'Malay', CAST(4.500000 AS Decimal(9, 6)), CAST(114.666700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (38, N'BG', N'Bulgaria', N'Bulgaria', NULL, N'Bulgarian lev', N'лв', N'Bulgarian', CAST(43.000000 AS Decimal(9, 6)), CAST(25.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (39, N'BF', N'Burkina Faso', N'Burkina Faso', NULL, N'West African CFA franc', N'Fr', N'French', CAST(13.000000 AS Decimal(9, 6)), CAST(-2.000000 AS Decimal(9, 6)), NULL, N'Fula', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (40, N'BI', N'Burundi', N'Burundi', NULL, N'Burundian franc', N'Fr', N'French', CAST(-3.500000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, N'Kirundi', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (41, N'KH', N'Cambodia', N'Cambodia', NULL, N'Cambodian riel', N'៛', N'Khmer', CAST(13.000000 AS Decimal(9, 6)), CAST(105.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (42, N'CM', N'Cameroon', N'Cameroon', NULL, N'Central African CFA franc', N'Fr', N'English', CAST(6.000000 AS Decimal(9, 6)), CAST(12.000000 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (43, N'CA', N'Canada', N'Canada', NULL, N'Canadian dollar', N'$', N'English', CAST(60.000000 AS Decimal(9, 6)), CAST(-95.000000 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (44, N'CV', N'Cabo Verde', N'Cabo Verde', NULL, N'Cape Verdean escudo', N'Esc', N'Portuguese', CAST(16.000000 AS Decimal(9, 6)), CAST(-24.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (45, N'KY', N'Cayman Islands', N'Cayman Islands', NULL, N'Cayman Islands dollar', N'$', N'English', CAST(19.500000 AS Decimal(9, 6)), CAST(-80.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (46, N'CF', N'Central African Republic', N'Central African Republic', NULL, N'Central African CFA franc', N'Fr', N'French', CAST(7.000000 AS Decimal(9, 6)), CAST(21.000000 AS Decimal(9, 6)), NULL, N'Sango', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (47, N'TD', N'Chad', N'Chad', NULL, N'Central African CFA franc', N'Fr', N'French', CAST(15.000000 AS Decimal(9, 6)), CAST(19.000000 AS Decimal(9, 6)), NULL, N'Arabic', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (48, N'CL', N'Chile', N'Chile', NULL, N'Chilean peso', N'$', N'Spanish', CAST(-30.000000 AS Decimal(9, 6)), CAST(-71.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (49, N'CN', N'China', N'China', NULL, N'Chinese yuan', N'¥', N'Chinese', CAST(35.000000 AS Decimal(9, 6)), CAST(105.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (50, N'CX', N'Christmas Island', N'Christmas Island', NULL, N'Australian dollar', N'$', N'English', CAST(-10.500000 AS Decimal(9, 6)), CAST(105.666700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (51, N'CC', N'Cocos (Keeling) Islands', N'Cocos (Keeling) Islands', NULL, N'Australian dollar', N'$', N'English', CAST(-12.500000 AS Decimal(9, 6)), CAST(96.833300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (52, N'CO', N'Colombia', N'Colombia', NULL, N'Colombian peso', N'$', N'Spanish', CAST(4.000000 AS Decimal(9, 6)), CAST(-72.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (53, N'KM', N'Comoros', N'Comoros', NULL, N'Comorian franc', N'Fr', N'Arabic', CAST(-12.166700 AS Decimal(9, 6)), CAST(44.250000 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (54, N'CG', N'Congo', N'Congo', NULL, N'Central African CFA franc', N'Fr', N'French', CAST(-1.000000 AS Decimal(9, 6)), CAST(15.000000 AS Decimal(9, 6)), NULL, N'Lingala', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (55, N'CD', N'Congo (Democratic Republic of the)', N'Congo (Democratic Republic of the)', NULL, N'Congolese franc', N'Fr', N'French', CAST(0.000000 AS Decimal(9, 6)), CAST(25.000000 AS Decimal(9, 6)), NULL, N'Lingala', N'Kongo', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (56, N'CK', N'Cook Islands', N'Cook Islands', NULL, N'New Zealand dollar', N'$', N'English', CAST(-21.233300 AS Decimal(9, 6)), CAST(-159.766700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (57, N'CR', N'Costa Rica', N'Costa Rica', NULL, N'Costa Rican colón', N'₡', N'Spanish', CAST(10.000000 AS Decimal(9, 6)), CAST(-84.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (58, N'HR', N'Croatia', N'Croatia', NULL, N'Croatian kuna', N'kn', N'Croatian', CAST(45.166700 AS Decimal(9, 6)), CAST(15.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (59, N'CU', N'Cuba', N'Cuba', NULL, N'Cuban convertible peso', N'$', N'Spanish', CAST(21.500000 AS Decimal(9, 6)), CAST(-80.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (60, N'CW', N'Curaçao', N'Curaçao', NULL, N'Netherlands Antillean guilder', N'ƒ', N'Dutch', CAST(12.116700 AS Decimal(9, 6)), CAST(-68.933300 AS Decimal(9, 6)), NULL, N'(Eastern) Punjabi', N'English', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (61, N'CY', N'Cyprus', N'Cyprus', NULL, N'Euro', N'€', N'Greek (modern)', CAST(35.000000 AS Decimal(9, 6)), CAST(33.000000 AS Decimal(9, 6)), NULL, N'Turkish', N'Armenian', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (62, N'CZ', N'Czech Republic', N'Czech Republic', NULL, N'Czech koruna', N'Kč', N'Czech', CAST(49.750000 AS Decimal(9, 6)), CAST(15.500000 AS Decimal(9, 6)), NULL, N'Slovak', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (63, N'DK', N'Denmark', N'Denmark', NULL, N'Danish krone', N'kr', N'Danish', CAST(56.000000 AS Decimal(9, 6)), CAST(10.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (64, N'DJ', N'Djibouti', N'Djibouti', NULL, N'Djiboutian franc', N'Fr', N'French', CAST(11.500000 AS Decimal(9, 6)), CAST(43.000000 AS Decimal(9, 6)), NULL, N'Arabic', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (65, N'DM', N'Dominica', N'Dominica', NULL, N'East Caribbean dollar', N'$', N'English', CAST(15.416700 AS Decimal(9, 6)), CAST(-61.333300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (66, N'DO', N'Dominican Republic', N'Dominican Republic', NULL, N'Dominican peso', N'$', N'Spanish', CAST(19.000000 AS Decimal(9, 6)), CAST(-70.666700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (67, N'EC', N'Ecuador', N'Ecuador', NULL, N'United States dollar', N'$', N'Spanish', CAST(-2.000000 AS Decimal(9, 6)), CAST(-77.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (68, N'EG', N'Egypt', N'Egypt', NULL, N'Egyptian pound', N'£', N'Arabic', CAST(27.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (69, N'SV', N'El Salvador', N'El Salvador', NULL, N'United States dollar', N'$', N'Spanish', CAST(13.833300 AS Decimal(9, 6)), CAST(-88.916700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (70, N'GQ', N'Equatorial Guinea', N'Equatorial Guinea', NULL, N'Central African CFA franc', N'Fr', N'Spanish', CAST(2.000000 AS Decimal(9, 6)), CAST(10.000000 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (71, N'ER', N'Eritrea', N'Eritrea', NULL, N'Eritrean nakfa', N'Nfk', N'Tigrinya', CAST(15.000000 AS Decimal(9, 6)), CAST(39.000000 AS Decimal(9, 6)), NULL, N'Arabic', N'English', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (72, N'EE', N'Estonia', N'Estonia', NULL, N'Euro', N'€', N'Estonian', CAST(59.000000 AS Decimal(9, 6)), CAST(26.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (73, N'ET', N'Ethiopia', N'Ethiopia', NULL, N'Ethiopian birr', N'Br', N'Amharic', CAST(8.000000 AS Decimal(9, 6)), CAST(38.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (74, N'FK', N'Falkland Islands (Malvinas)', N'Falkland Islands (Malvinas)', NULL, N'Falkland Islands pound', N'£', N'English', CAST(-51.750000 AS Decimal(9, 6)), CAST(-59.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (75, N'FO', N'Faroe Islands', N'Faroe Islands', NULL, N'Danish krone', N'kr', N'Faroese', CAST(62.000000 AS Decimal(9, 6)), CAST(-7.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (76, N'FJ', N'Fiji', N'Fiji', NULL, N'Fijian dollar', N'$', N'English', CAST(-18.000000 AS Decimal(9, 6)), CAST(175.000000 AS Decimal(9, 6)), NULL, N'Fijian', N'Hindi', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (77, N'FI', N'Finland', N'Finland', NULL, N'Euro', N'€', N'Finnish', CAST(64.000000 AS Decimal(9, 6)), CAST(26.000000 AS Decimal(9, 6)), NULL, N'Swedish', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (78, N'FR', N'France', N'France', NULL, N'Euro', N'€', N'French', CAST(46.000000 AS Decimal(9, 6)), CAST(2.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (79, N'GF', N'French Guiana', N'French Guiana', NULL, N'Euro', N'€', N'French', CAST(4.000000 AS Decimal(9, 6)), CAST(-53.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (80, N'PF', N'French Polynesia', N'French Polynesia', NULL, N'CFP franc', N'Fr', N'French', CAST(-15.000000 AS Decimal(9, 6)), CAST(-140.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (81, N'TF', N'French Southern Territories', N'French Southern Territories', NULL, N'Euro', N'€', N'French', CAST(-49.250000 AS Decimal(9, 6)), CAST(69.167000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (82, N'GA', N'Gabon', N'Gabon', NULL, N'Central African CFA franc', N'Fr', N'French', CAST(-1.000000 AS Decimal(9, 6)), CAST(11.750000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (83, N'GM', N'Gambia', N'Gambia', NULL, N'Gambian dalasi', N'D', N'English', CAST(13.466700 AS Decimal(9, 6)), CAST(-16.566700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (84, N'GE', N'Georgia', N'Georgia', NULL, N'Georgian Lari', N'ლ', N'Georgian', CAST(42.000000 AS Decimal(9, 6)), CAST(43.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (85, N'DE', N'Germany', N'Germany', NULL, N'Euro', N'€', N'German', CAST(51.000000 AS Decimal(9, 6)), CAST(9.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (86, N'GH', N'Ghana', N'Ghana', NULL, N'Ghanaian cedi', N'₵', N'English', CAST(8.000000 AS Decimal(9, 6)), CAST(-2.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (87, N'GI', N'Gibraltar', N'Gibraltar', NULL, N'Gibraltar pound', N'£', N'English', CAST(36.133300 AS Decimal(9, 6)), CAST(-5.350000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (88, N'GR', N'Greece', N'Greece', NULL, N'Euro', N'€', N'Greek (modern)', CAST(39.000000 AS Decimal(9, 6)), CAST(22.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (89, N'GL', N'Greenland', N'Greenland', NULL, N'Danish krone', N'kr', N'Kalaallisut', CAST(72.000000 AS Decimal(9, 6)), CAST(-40.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (90, N'GD', N'Grenada', N'Grenada', NULL, N'East Caribbean dollar', N'$', N'English', CAST(12.116700 AS Decimal(9, 6)), CAST(-61.666700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (91, N'GP', N'Guadeloupe', N'Guadeloupe', NULL, N'Euro', N'€', N'French', CAST(16.250000 AS Decimal(9, 6)), CAST(-61.583300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (92, N'GU', N'Guam', N'Guam', NULL, N'United States dollar', N'$', N'English', CAST(13.466700 AS Decimal(9, 6)), CAST(144.783300 AS Decimal(9, 6)), NULL, N'Chamorro', N'Spanish', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (93, N'GT', N'Guatemala', N'Guatemala', NULL, N'Guatemalan quetzal', N'Q', N'Spanish', CAST(15.500000 AS Decimal(9, 6)), CAST(-90.250000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (94, N'GG', N'Guernsey', N'Guernsey', NULL, N'British pound', N'£', N'English', CAST(49.466700 AS Decimal(9, 6)), CAST(-2.583300 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (95, N'GN', N'Guinea', N'Guinea', NULL, N'Guinean franc', N'Fr', N'French', CAST(11.000000 AS Decimal(9, 6)), CAST(-10.000000 AS Decimal(9, 6)), NULL, N'Fula', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (96, N'GW', N'Guinea-Bissau', N'Guinea-Bissau', NULL, N'West African CFA franc', N'Fr', N'Portuguese', CAST(12.000000 AS Decimal(9, 6)), CAST(-15.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (97, N'GY', N'Guyana', N'Guyana', NULL, N'Guyanese dollar', N'$', N'English', CAST(5.000000 AS Decimal(9, 6)), CAST(-59.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (98, N'HT', N'Haiti', N'Haiti', NULL, N'Haitian gourde', N'G', N'French', CAST(19.000000 AS Decimal(9, 6)), CAST(-72.416700 AS Decimal(9, 6)), NULL, N'Haitian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (99, N'HM', N'Heard Island and McDonald Islands', N'Heard Island and McDonald Islands', NULL, N'Australian dollar', N'$', N'English', CAST(-53.100000 AS Decimal(9, 6)), CAST(72.516700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (100, N'VA', N'Holy See', N'Holy See', NULL, N'Euro', N'€', N'Latin', CAST(41.900000 AS Decimal(9, 6)), CAST(12.450000 AS Decimal(9, 6)), NULL, N'Italian', N'French', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (101, N'HN', N'Honduras', N'Honduras', NULL, N'Honduran lempira', N'L', N'Spanish', CAST(15.000000 AS Decimal(9, 6)), CAST(-86.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (102, N'HK', N'Hong Kong', N'Hong Kong', NULL, N'Hong Kong dollar', N'$', N'English', CAST(22.250000 AS Decimal(9, 6)), CAST(114.166700 AS Decimal(9, 6)), NULL, N'Chinese', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (103, N'HU', N'Hungary', N'Hungary', NULL, N'Hungarian forint', N'Ft', N'Hungarian', CAST(47.000000 AS Decimal(9, 6)), CAST(20.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (104, N'IS', N'Iceland', N'Iceland', NULL, N'Icelandic króna', N'kr', N'Icelandic', CAST(65.000000 AS Decimal(9, 6)), CAST(-18.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (105, N'IN', N'India', N'India', NULL, N'Indian rupee', N'₹', N'Hindi', CAST(20.000000 AS Decimal(9, 6)), CAST(77.000000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (106, N'ID', N'Indonesia', N'Indonesia', NULL, N'Indonesian rupiah', N'Rp', N'Indonesian', CAST(-5.000000 AS Decimal(9, 6)), CAST(120.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (107, N'CI', N'Côte d''Ivoire', N'Côte d''Ivoire', NULL, N'West African CFA franc', N'Fr', N'French', CAST(8.000000 AS Decimal(9, 6)), CAST(-5.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (108, N'IR', N'Iran (Islamic Republic of)', N'Iran (Islamic Republic of)', NULL, N'Iranian rial', N'﷼', N'Persian (Farsi)', CAST(32.000000 AS Decimal(9, 6)), CAST(53.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (109, N'IQ', N'Iraq', N'Iraq', NULL, N'Iraqi dinar', N'ع.د', N'Arabic', CAST(33.000000 AS Decimal(9, 6)), CAST(44.000000 AS Decimal(9, 6)), NULL, N'Kurdish', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (110, N'IE', N'Ireland', N'Ireland', NULL, N'Euro', N'€', N'Irish', CAST(53.000000 AS Decimal(9, 6)), CAST(-8.000000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (111, N'IM', N'Isle of Man', N'Isle of Man', NULL, N'British pound', N'£', N'English', CAST(54.250000 AS Decimal(9, 6)), CAST(-4.500000 AS Decimal(9, 6)), NULL, N'Manx', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (112, N'IL', N'Israel', N'Israel', NULL, N'Israeli new shekel', N'₪', N'Hebrew (modern)', CAST(31.500000 AS Decimal(9, 6)), CAST(34.750000 AS Decimal(9, 6)), NULL, N'Arabic', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (113, N'IT', N'Italy', N'Italy', NULL, N'Euro', N'€', N'Italian', CAST(42.833300 AS Decimal(9, 6)), CAST(12.833300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (114, N'JM', N'Jamaica', N'Jamaica', NULL, N'Jamaican dollar', N'$', N'English', CAST(18.250000 AS Decimal(9, 6)), CAST(-77.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (115, N'JP', N'Japan', N'Japan', NULL, N'Japanese yen', N'¥', N'Japanese', CAST(36.000000 AS Decimal(9, 6)), CAST(138.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (116, N'JE', N'Jersey', N'Jersey', NULL, N'British pound', N'£', N'English', CAST(49.250000 AS Decimal(9, 6)), CAST(-2.166700 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (117, N'JO', N'Jordan', N'Jordan', NULL, N'Jordanian dinar', N'د.ا', N'Arabic', CAST(31.000000 AS Decimal(9, 6)), CAST(36.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (118, N'KZ', N'Kazakhstan', N'Kazakhstan', NULL, N'Kazakhstani tenge', NULL, N'Kazakh', CAST(48.000000 AS Decimal(9, 6)), CAST(68.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (119, N'KE', N'Kenya', N'Kenya', NULL, N'Kenyan shilling', N'Sh', N'English', CAST(1.000000 AS Decimal(9, 6)), CAST(38.000000 AS Decimal(9, 6)), NULL, N'Swahili', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (120, N'KI', N'Kiribati', N'Kiribati', NULL, N'Australian dollar', N'$', N'English', CAST(1.416700 AS Decimal(9, 6)), CAST(173.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (121, N'KW', N'Kuwait', N'Kuwait', NULL, N'Kuwaiti dinar', N'د.ك', N'Arabic', CAST(29.500000 AS Decimal(9, 6)), CAST(45.750000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (122, N'KG', N'Kyrgyzstan', N'Kyrgyzstan', NULL, N'Kyrgyzstani som', N'с', N'Kyrgyz', CAST(41.000000 AS Decimal(9, 6)), CAST(75.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (123, N'LA', N'Lao People''s Democratic Republic', N'Lao People''s Democratic Republic', NULL, N'Lao kip', N'₭', N'Lao', CAST(18.000000 AS Decimal(9, 6)), CAST(105.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (124, N'LV', N'Latvia', N'Latvia', NULL, N'Euro', N'€', N'Latvian', CAST(57.000000 AS Decimal(9, 6)), CAST(25.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (125, N'LB', N'Lebanon', N'Lebanon', NULL, N'Lebanese pound', N'ل.ل', N'Arabic', CAST(33.833300 AS Decimal(9, 6)), CAST(35.833300 AS Decimal(9, 6)), NULL, N'French', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (126, N'LS', N'Lesotho', N'Lesotho', NULL, N'Lesotho loti', N'L', N'English', CAST(-29.500000 AS Decimal(9, 6)), CAST(28.500000 AS Decimal(9, 6)), NULL, N'Southern Sotho', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (127, N'LR', N'Liberia', N'Liberia', NULL, N'Liberian dollar', N'$', N'English', CAST(6.500000 AS Decimal(9, 6)), CAST(-9.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (128, N'LY', N'Libya', N'Libya', NULL, N'Libyan dinar', N'ل.د', N'Arabic', CAST(25.000000 AS Decimal(9, 6)), CAST(17.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (129, N'LI', N'Liechtenstein', N'Liechtenstein', NULL, N'Swiss franc', N'Fr', N'German', CAST(47.266700 AS Decimal(9, 6)), CAST(9.533300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (130, N'LT', N'Lithuania', N'Lithuania', NULL, N'Euro', N'€', N'Lithuanian', CAST(56.000000 AS Decimal(9, 6)), CAST(24.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (131, N'LU', N'Luxembourg', N'Luxembourg', NULL, N'Euro', N'€', N'French', CAST(49.750000 AS Decimal(9, 6)), CAST(6.166700 AS Decimal(9, 6)), NULL, N'German', N'Luxembourgish', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (132, N'MO', N'Macao', N'Macao', NULL, N'Macanese pataca', N'P', N'Chinese', CAST(22.166700 AS Decimal(9, 6)), CAST(113.550000 AS Decimal(9, 6)), NULL, N'Portuguese', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (133, N'MK', N'Macedonia (the former Yugoslav Republic of)', N'Macedonia (the former Yugoslav Republic of)', NULL, N'Macedonian denar', N'ден', N'Macedonian', CAST(41.833300 AS Decimal(9, 6)), CAST(22.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (134, N'MG', N'Madagascar', N'Madagascar', NULL, N'Malagasy ariary', N'Ar', N'French', CAST(-20.000000 AS Decimal(9, 6)), CAST(47.000000 AS Decimal(9, 6)), NULL, N'Malagasy', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (135, N'MW', N'Malawi', N'Malawi', NULL, N'Malawian kwacha', N'MK', N'English', CAST(-13.500000 AS Decimal(9, 6)), CAST(34.000000 AS Decimal(9, 6)), NULL, N'Chichewa', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (136, N'MY', N'Malaysia', N'Malaysia', NULL, N'Malaysian ringgit', N'RM', N'Malaysian', CAST(2.500000 AS Decimal(9, 6)), CAST(112.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (137, N'MV', N'Maldives', N'Maldives', NULL, N'Maldivian rufiyaa', N'.ރ', N'Divehi', CAST(3.250000 AS Decimal(9, 6)), CAST(73.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (138, N'ML', N'Mali', N'Mali', NULL, N'West African CFA franc', N'Fr', N'French', CAST(17.000000 AS Decimal(9, 6)), CAST(-4.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (139, N'MT', N'Malta', N'Malta', NULL, N'Euro', N'€', N'Maltese', CAST(35.833300 AS Decimal(9, 6)), CAST(14.583300 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (140, N'MH', N'Marshall Islands', N'Marshall Islands', NULL, N'United States dollar', N'$', N'English', CAST(9.000000 AS Decimal(9, 6)), CAST(168.000000 AS Decimal(9, 6)), NULL, N'Marshallese', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (141, N'MQ', N'Martinique', N'Martinique', NULL, N'Euro', N'€', N'French', CAST(14.666700 AS Decimal(9, 6)), CAST(-61.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (142, N'MR', N'Mauritania', N'Mauritania', NULL, N'Mauritanian ouguiya', N'UM', N'Arabic', CAST(20.000000 AS Decimal(9, 6)), CAST(-12.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (143, N'MU', N'Mauritius', N'Mauritius', NULL, N'Mauritian rupee', N'₨', N'English', CAST(-20.283300 AS Decimal(9, 6)), CAST(57.550000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (144, N'YT', N'Mayotte', N'Mayotte', NULL, N'Euro', N'€', N'French', CAST(-12.833300 AS Decimal(9, 6)), CAST(45.166700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (145, N'MX', N'Mexico', N'Mexico', NULL, N'Mexican peso', N'$', N'Spanish', CAST(23.000000 AS Decimal(9, 6)), CAST(-102.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (146, N'FM', N'Micronesia (Federated States of)', N'Micronesia (Federated States of)', NULL, N'[D]', N'$', N'English', CAST(6.916700 AS Decimal(9, 6)), CAST(158.250000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (147, N'MD', N'Moldova (Republic of)', N'Moldova (Republic of)', NULL, N'Moldovan leu', N'L', N'Romanian', CAST(47.000000 AS Decimal(9, 6)), CAST(29.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (148, N'MC', N'Monaco', N'Monaco', NULL, N'Euro', N'€', N'French', CAST(43.733300 AS Decimal(9, 6)), CAST(7.400000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (149, N'MN', N'Mongolia', N'Mongolia', NULL, N'Mongolian tögrög', N'₮', N'Mongolian', CAST(46.000000 AS Decimal(9, 6)), CAST(105.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (150, N'ME', N'Montenegro', N'Montenegro', NULL, N'Euro', N'€', N'Serbian', CAST(42.500000 AS Decimal(9, 6)), CAST(19.300000 AS Decimal(9, 6)), NULL, N'Bosnian', N'Albanian', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (151, N'MS', N'Montserrat', N'Montserrat', NULL, N'East Caribbean dollar', N'$', N'English', CAST(16.750000 AS Decimal(9, 6)), CAST(-62.200000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (152, N'MA', N'Morocco', N'Morocco', NULL, N'Moroccan dirham', N'د.م.', N'Arabic', CAST(32.000000 AS Decimal(9, 6)), CAST(-5.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (153, N'MZ', N'Mozambique', N'Mozambique', NULL, N'Mozambican metical', N'MT', N'Portuguese', CAST(-18.250000 AS Decimal(9, 6)), CAST(35.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (154, N'MM', N'Myanmar', N'Myanmar', NULL, N'Burmese kyat', N'Ks', N'Burmese', CAST(22.000000 AS Decimal(9, 6)), CAST(98.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (155, N'NA', N'Namibia', N'Namibia', NULL, N'Namibian dollar', N'$', N'English', CAST(-22.000000 AS Decimal(9, 6)), CAST(17.000000 AS Decimal(9, 6)), NULL, N'Afrikaans', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (156, N'NR', N'Nauru', N'Nauru', NULL, N'Australian dollar', N'$', N'English', CAST(-0.533300 AS Decimal(9, 6)), CAST(166.916700 AS Decimal(9, 6)), NULL, N'Nauruan', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (157, N'NP', N'Nepal', N'Nepal', NULL, N'Nepalese rupee', N'₨', N'Nepali', CAST(28.000000 AS Decimal(9, 6)), CAST(84.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (158, N'NL', N'Netherlands', N'Netherlands', NULL, N'Euro', N'€', N'Dutch', CAST(52.500000 AS Decimal(9, 6)), CAST(5.750000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (159, N'NC', N'New Caledonia', N'New Caledonia', NULL, N'CFP franc', N'Fr', N'French', CAST(-21.500000 AS Decimal(9, 6)), CAST(165.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (160, N'NZ', N'New Zealand', N'New Zealand', NULL, N'New Zealand dollar', N'$', N'English', CAST(-41.000000 AS Decimal(9, 6)), CAST(174.000000 AS Decimal(9, 6)), NULL, N'Māori', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (161, N'NI', N'Nicaragua', N'Nicaragua', NULL, N'Nicaraguan córdoba', N'C$', N'Spanish', CAST(13.000000 AS Decimal(9, 6)), CAST(-85.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (162, N'NE', N'Niger', N'Niger', NULL, N'West African CFA franc', N'Fr', N'French', CAST(16.000000 AS Decimal(9, 6)), CAST(8.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (163, N'NG', N'Nigeria', N'Nigeria', NULL, N'Nigerian naira', N'₦', N'English', CAST(10.000000 AS Decimal(9, 6)), CAST(8.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (164, N'NU', N'Niue', N'Niue', NULL, N'New Zealand dollar', N'$', N'English', CAST(-19.033300 AS Decimal(9, 6)), CAST(-169.866700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (165, N'NF', N'Norfolk Island', N'Norfolk Island', NULL, N'Australian dollar', N'$', N'English', CAST(-29.033300 AS Decimal(9, 6)), CAST(167.950000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (166, N'KP', N'Korea (Democratic People''s Republic of)', N'Korea (Democratic People''s Republic of)', NULL, N'North Korean won', N'₩', N'Korean', CAST(40.000000 AS Decimal(9, 6)), CAST(127.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (167, N'MP', N'Northern Mariana Islands', N'Northern Mariana Islands', NULL, N'United States dollar', N'$', N'English', CAST(15.200000 AS Decimal(9, 6)), CAST(145.750000 AS Decimal(9, 6)), NULL, N'Chamorro', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (168, N'NO', N'Norway', N'Norway', NULL, N'Norwegian krone', N'kr', N'Norwegian', CAST(62.000000 AS Decimal(9, 6)), CAST(10.000000 AS Decimal(9, 6)), NULL, N'Norwegian Bokmål', N'Norwegian Nynorsk', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (169, N'OM', N'Oman', N'Oman', NULL, N'Omani rial', N'ر.ع.', N'Arabic', CAST(21.000000 AS Decimal(9, 6)), CAST(57.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (170, N'PK', N'Pakistan', N'Pakistan', NULL, N'Pakistani rupee', N'₨', N'English', CAST(30.000000 AS Decimal(9, 6)), CAST(70.000000 AS Decimal(9, 6)), NULL, N'Urdu', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (171, N'PW', N'Palau', N'Palau', NULL, N'[E]', N'$', N'English', CAST(7.500000 AS Decimal(9, 6)), CAST(134.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (172, N'PS', N'Palestine, State of', N'Palestine, State of', NULL, N'Israeli new sheqel', N'₪', N'Arabic', CAST(31.900000 AS Decimal(9, 6)), CAST(35.200000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (173, N'PA', N'Panama', N'Panama', NULL, N'Panamanian balboa', N'B/.', N'Spanish', CAST(9.000000 AS Decimal(9, 6)), CAST(-80.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (174, N'PG', N'Papua New Guinea', N'Papua New Guinea', NULL, N'Papua New Guinean kina', N'K', N'English', CAST(-6.000000 AS Decimal(9, 6)), CAST(147.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (175, N'PY', N'Paraguay', N'Paraguay', NULL, N'Paraguayan guaraní', N'₲', N'Spanish', CAST(-23.000000 AS Decimal(9, 6)), CAST(-58.000000 AS Decimal(9, 6)), NULL, N'Guaraní', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (176, N'PE', N'Peru', N'Peru', NULL, N'Peruvian sol', N'S/.', N'Spanish', CAST(-10.000000 AS Decimal(9, 6)), CAST(-76.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (177, N'PH', N'Philippines', N'Philippines', NULL, N'Philippine peso', N'₱', N'English', CAST(13.000000 AS Decimal(9, 6)), CAST(122.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (178, N'PN', N'Pitcairn', N'Pitcairn', NULL, N'New Zealand dollar', N'$', N'English', CAST(-25.066700 AS Decimal(9, 6)), CAST(-130.100000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (179, N'PL', N'Poland', N'Poland', NULL, N'Polish złoty', N'zł', N'Polish', CAST(52.000000 AS Decimal(9, 6)), CAST(20.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (180, N'PT', N'Portugal', N'Portugal', NULL, N'Euro', N'€', N'Portuguese', CAST(39.500000 AS Decimal(9, 6)), CAST(-8.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (181, N'PR', N'Puerto Rico', N'Puerto Rico', NULL, N'United States dollar', N'$', N'Spanish', CAST(18.250000 AS Decimal(9, 6)), CAST(-66.500000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (182, N'QA', N'Qatar', N'Qatar', NULL, N'Qatari riyal', N'ر.ق', N'Arabic', CAST(25.500000 AS Decimal(9, 6)), CAST(51.250000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (183, N'XK', N'Republic of Kosovo', N'Republic of Kosovo', NULL, N'Euro', N'€', N'Albanian', CAST(42.666700 AS Decimal(9, 6)), CAST(21.166700 AS Decimal(9, 6)), NULL, N'Serbian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (184, N'RE', N'Réunion', N'Réunion', NULL, N'Euro', N'€', N'French', CAST(-21.150000 AS Decimal(9, 6)), CAST(55.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (185, N'RO', N'Romania', N'Romania', NULL, N'Romanian leu', N'lei', N'Romanian', CAST(46.000000 AS Decimal(9, 6)), CAST(25.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (186, N'RU', N'Russian Federation', N'Russian Federation', NULL, N'Russian ruble', N'₽', N'Russian', CAST(60.000000 AS Decimal(9, 6)), CAST(100.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (187, N'RW', N'Rwanda', N'Rwanda', NULL, N'Rwandan franc', N'Fr', N'Kinyarwanda', CAST(-2.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, N'English', N'French', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (188, N'BL', N'Saint Barthélemy', N'Saint Barthélemy', NULL, N'Euro', N'€', N'French', CAST(18.500000 AS Decimal(9, 6)), CAST(-63.416700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (189, N'SH', N'Saint Helena, Ascension and Tristan da Cunha', N'Saint Helena, Ascension and Tristan da Cunha', NULL, N'Saint Helena pound', N'£', N'English', CAST(-15.950000 AS Decimal(9, 6)), CAST(-5.700000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (190, N'KN', N'Saint Kitts and Nevis', N'Saint Kitts and Nevis', NULL, N'East Caribbean dollar', N'$', N'English', CAST(17.333300 AS Decimal(9, 6)), CAST(-62.750000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (191, N'LC', N'Saint Lucia', N'Saint Lucia', NULL, N'East Caribbean dollar', N'$', N'English', CAST(13.883300 AS Decimal(9, 6)), CAST(-60.966700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (192, N'MF', N'Saint Martin (French part)', N'Saint Martin (French part)', NULL, N'Euro', N'€', N'English', CAST(18.083300 AS Decimal(9, 6)), CAST(-63.950000 AS Decimal(9, 6)), NULL, N'French', N'Dutch', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (193, N'PM', N'Saint Pierre and Miquelon', N'Saint Pierre and Miquelon', NULL, N'Euro', N'€', N'French', CAST(46.833300 AS Decimal(9, 6)), CAST(-56.333300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (194, N'VC', N'Saint Vincent and the Grenadines', N'Saint Vincent and the Grenadines', NULL, N'East Caribbean dollar', N'$', N'English', CAST(13.250000 AS Decimal(9, 6)), CAST(-61.200000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (195, N'WS', N'Samoa', N'Samoa', NULL, N'Samoan tālā', N'T', N'Samoan', CAST(-13.583300 AS Decimal(9, 6)), CAST(-172.333300 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (196, N'SM', N'San Marino', N'San Marino', NULL, N'Euro', N'€', N'Italian', CAST(43.766700 AS Decimal(9, 6)), CAST(12.416700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (197, N'ST', N'Sao Tome and Principe', N'Sao Tome and Principe', NULL, N'São Tomé and Príncipe dobra', N'Db', N'Portuguese', CAST(1.000000 AS Decimal(9, 6)), CAST(7.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (198, N'SA', N'Saudi Arabia', N'Saudi Arabia', NULL, N'Saudi riyal', N'ر.س', N'Arabic', CAST(25.000000 AS Decimal(9, 6)), CAST(45.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (199, N'SN', N'Senegal', N'Senegal', NULL, N'West African CFA franc', N'Fr', N'French', CAST(14.000000 AS Decimal(9, 6)), CAST(-14.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (200, N'RS', N'Serbia', N'Serbia', NULL, N'Serbian dinar', N'дин.', N'Serbian', CAST(44.000000 AS Decimal(9, 6)), CAST(21.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (201, N'SC', N'Seychelles', N'Seychelles', NULL, N'Seychellois rupee', N'₨', N'French', CAST(-4.583300 AS Decimal(9, 6)), CAST(55.666700 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (202, N'SL', N'Sierra Leone', N'Sierra Leone', NULL, N'Sierra Leonean leone', N'Le', N'English', CAST(8.500000 AS Decimal(9, 6)), CAST(-11.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (203, N'SG', N'Singapore', N'Singapore', NULL, N'Brunei dollar', N'$', N'English', CAST(1.366700 AS Decimal(9, 6)), CAST(103.800000 AS Decimal(9, 6)), NULL, N'Malay', N'Tamil', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (204, N'SX', N'Sint Maarten (Dutch part)', N'Sint Maarten (Dutch part)', NULL, N'Netherlands Antillean guilder', N'ƒ', N'Dutch', CAST(18.033300 AS Decimal(9, 6)), CAST(-63.050000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (205, N'SK', N'Slovakia', N'Slovakia', NULL, N'Euro', N'€', N'Slovak', CAST(48.666700 AS Decimal(9, 6)), CAST(19.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (206, N'SI', N'Slovenia', N'Slovenia', NULL, N'Euro', N'€', N'Slovene', CAST(46.116700 AS Decimal(9, 6)), CAST(14.816700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (207, N'SB', N'Solomon Islands', N'Solomon Islands', NULL, N'Solomon Islands dollar', N'$', N'English', CAST(-8.000000 AS Decimal(9, 6)), CAST(159.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (208, N'SO', N'Somalia', N'Somalia', NULL, N'Somali shilling', N'Sh', N'Somali', CAST(10.000000 AS Decimal(9, 6)), CAST(49.000000 AS Decimal(9, 6)), NULL, N'Arabic', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (209, N'ZA', N'South Africa', N'South Africa', NULL, N'South African rand', N'R', N'Afrikaans', CAST(-29.000000 AS Decimal(9, 6)), CAST(24.000000 AS Decimal(9, 6)), NULL, N'English', N'Southern Ndebele', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (210, N'GS', N'South Georgia and the South Sandwich Islands', N'South Georgia and the South Sandwich Islands', NULL, N'British pound', N'£', N'English', CAST(-54.500000 AS Decimal(9, 6)), CAST(-37.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (211, N'KR', N'Korea (Republic of)', N'Korea (Republic of)', NULL, N'South Korean won', N'₩', N'Korean', CAST(37.000000 AS Decimal(9, 6)), CAST(127.500000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (212, N'SS', N'South Sudan', N'South Sudan', NULL, N'South Sudanese pound', N'£', N'English', CAST(7.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (213, N'ES', N'Spain', N'Spain', NULL, N'Euro', N'€', N'Spanish', CAST(40.000000 AS Decimal(9, 6)), CAST(-4.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (214, N'LK', N'Sri Lanka', N'Sri Lanka', NULL, N'Sri Lankan rupee', N'Rs', N'Sinhalese', CAST(7.000000 AS Decimal(9, 6)), CAST(81.000000 AS Decimal(9, 6)), NULL, N'Tamil', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (215, N'SD', N'Sudan', N'Sudan', NULL, N'Sudanese pound', N'ج.س.', N'Arabic', CAST(15.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (216, N'SR', N'Suriname', N'Suriname', NULL, N'Surinamese dollar', N'$', N'Dutch', CAST(4.000000 AS Decimal(9, 6)), CAST(-56.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (217, N'SJ', N'Svalbard and Jan Mayen', N'Svalbard and Jan Mayen', NULL, N'Norwegian krone', N'kr', N'Norwegian', CAST(78.000000 AS Decimal(9, 6)), CAST(20.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (218, N'SZ', N'Swaziland', N'Swaziland', NULL, N'Swazi lilangeni', N'L', N'English', CAST(-26.500000 AS Decimal(9, 6)), CAST(31.500000 AS Decimal(9, 6)), NULL, N'Swati', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (219, N'SE', N'Sweden', N'Sweden', NULL, N'Swedish krona', N'kr', N'Swedish', CAST(62.000000 AS Decimal(9, 6)), CAST(15.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (220, N'CH', N'Switzerland', N'Switzerland', NULL, N'Swiss franc', N'Fr', N'German', CAST(47.000000 AS Decimal(9, 6)), CAST(8.000000 AS Decimal(9, 6)), NULL, N'French', N'Italian', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (221, N'SY', N'Syrian Arab Republic', N'Syrian Arab Republic', NULL, N'Syrian pound', N'£', N'Arabic', CAST(35.000000 AS Decimal(9, 6)), CAST(38.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (222, N'TW', N'Taiwan', N'Taiwan', NULL, N'New Taiwan dollar', N'$', N'Chinese', CAST(23.500000 AS Decimal(9, 6)), CAST(121.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (223, N'TJ', N'Tajikistan', N'Tajikistan', NULL, N'Tajikistani somoni', N'ЅМ', N'Tajik', CAST(39.000000 AS Decimal(9, 6)), CAST(71.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (224, N'TZ', N'Tanzania, United Republic of', N'Tanzania, United Republic of', NULL, N'Tanzanian shilling', N'Sh', N'Swahili', CAST(-6.000000 AS Decimal(9, 6)), CAST(35.000000 AS Decimal(9, 6)), NULL, N'English', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (225, N'TH', N'Thailand', N'Thailand', NULL, N'Thai baht', N'฿', N'Thai', CAST(15.000000 AS Decimal(9, 6)), CAST(100.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (226, N'TL', N'Timor-Leste', N'Timor-Leste', NULL, N'United States dollar', N'$', N'Portuguese', CAST(-8.833300 AS Decimal(9, 6)), CAST(125.916700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (227, N'TG', N'Togo', N'Togo', NULL, N'West African CFA franc', N'Fr', N'French', CAST(8.000000 AS Decimal(9, 6)), CAST(1.166700 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (228, N'TK', N'Tokelau', N'Tokelau', NULL, N'New Zealand dollar', N'$', N'English', CAST(-9.000000 AS Decimal(9, 6)), CAST(-172.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (229, N'TO', N'Tonga', N'Tonga', NULL, N'Tongan paʻanga', N'T$', N'English', CAST(-20.000000 AS Decimal(9, 6)), CAST(-175.000000 AS Decimal(9, 6)), NULL, N'Tonga (Tonga Islands)', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (230, N'TT', N'Trinidad and Tobago', N'Trinidad and Tobago', NULL, N'Trinidad and Tobago dollar', N'$', N'English', CAST(11.000000 AS Decimal(9, 6)), CAST(-61.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (231, N'TN', N'Tunisia', N'Tunisia', NULL, N'Tunisian dinar', N'د.ت', N'Arabic', CAST(34.000000 AS Decimal(9, 6)), CAST(9.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (232, N'TR', N'Turkey', N'Turkey', NULL, N'Turkish lira', NULL, N'Turkish', CAST(39.000000 AS Decimal(9, 6)), CAST(35.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (233, N'TM', N'Turkmenistan', N'Turkmenistan', NULL, N'Turkmenistan manat', N'm', N'Turkmen', CAST(40.000000 AS Decimal(9, 6)), CAST(60.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (234, N'TC', N'Turks and Caicos Islands', N'Turks and Caicos Islands', NULL, N'United States dollar', N'$', N'English', CAST(21.750000 AS Decimal(9, 6)), CAST(-71.583300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (235, N'TV', N'Tuvalu', N'Tuvalu', NULL, N'Australian dollar', N'$', N'English', CAST(-8.000000 AS Decimal(9, 6)), CAST(178.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (236, N'UG', N'Uganda', N'Uganda', NULL, N'Ugandan shilling', N'Sh', N'English', CAST(1.000000 AS Decimal(9, 6)), CAST(32.000000 AS Decimal(9, 6)), NULL, N'Swahili', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (237, N'UA', N'Ukraine', N'Ukraine', NULL, N'Ukrainian hryvnia', N'₴', N'Ukrainian', CAST(49.000000 AS Decimal(9, 6)), CAST(32.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (238, N'AE', N'United Arab Emirates', N'United Arab Emirates', NULL, N'United Arab Emirates dirham', N'د.إ', N'Arabic', CAST(24.000000 AS Decimal(9, 6)), CAST(54.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (239, N'GB', N'United Kingdom of Great Britain and Northern Irela', N'United Kingdom of Great Britain and Northern Ireland', NULL, N'British pound', N'£', N'English', CAST(54.000000 AS Decimal(9, 6)), CAST(-2.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (240, N'US', N'United States of America', N'United States of America', NULL, N'United States dollar', N'$', N'English', CAST(38.000000 AS Decimal(9, 6)), CAST(-97.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (241, N'UY', N'Uruguay', N'Uruguay', NULL, N'Uruguayan peso', N'$', N'Spanish', CAST(-33.000000 AS Decimal(9, 6)), CAST(-56.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (242, N'UZ', N'Uzbekistan', N'Uzbekistan', NULL, N'Uzbekistani so''m', NULL, N'Uzbek', CAST(41.000000 AS Decimal(9, 6)), CAST(64.000000 AS Decimal(9, 6)), NULL, N'Russian', NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (243, N'VU', N'Vanuatu', N'Vanuatu', NULL, N'Vanuatu vatu', N'Vt', N'Bislama', CAST(-16.000000 AS Decimal(9, 6)), CAST(167.000000 AS Decimal(9, 6)), NULL, N'English', N'French', NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (244, N'VE', N'Venezuela (Bolivarian Republic of)', N'Venezuela (Bolivarian Republic of)', NULL, N'Venezuelan bolívar', N'Bs F', N'Spanish', CAST(8.000000 AS Decimal(9, 6)), CAST(-66.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (245, N'VN', N'Viet Nam', N'Viet Nam', NULL, N'Vietnamese đồng', N'₫', N'Vietnamese', CAST(16.166700 AS Decimal(9, 6)), CAST(107.833300 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (246, N'WF', N'Wallis and Futuna', N'Wallis and Futuna', NULL, N'CFP franc', N'Fr', N'French', CAST(-13.300000 AS Decimal(9, 6)), CAST(-176.200000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (247, N'EH', N'Western Sahara', N'Western Sahara', NULL, N'Moroccan dirham', N'د.م.', N'Spanish', CAST(24.500000 AS Decimal(9, 6)), CAST(-13.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (248, N'YE', N'Yemen', N'Yemen', NULL, N'Yemeni rial', N'﷼', N'Arabic', CAST(15.000000 AS Decimal(9, 6)), CAST(48.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (249, N'ZM', N'Zambia', N'Zambia', NULL, N'Zambian kwacha', N'ZK', N'English', CAST(-15.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, NULL, NULL, NULL)
GO
INSERT [gbl].[Country] ([CountryId], [Code], [Name], [Description], [Culture], [Currency], [CurrencySymbol], [Language], [Lattitude], [Longitude], [Payment], [LanguageSecond], [LanguageThird], [HoxroLicensePrice]) VALUES (250, N'ZW', N'Zimbabwe', N'Zimbabwe', NULL, N'Botswana pula', N'P', N'English', CAST(-20.000000 AS Decimal(9, 6)), CAST(30.000000 AS Decimal(9, 6)), NULL, N'Shona', N'Northern Ndebele', NULL)
GO

--Insert Extension
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (1, N'docx', N'Microsoft Word 2007 upper document')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (2, N'pdf', N'Portable Document Format')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (3, N'xlsx', N'XML spreadsheet')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (4, N'pptx', N'Microsoft Power Point 2007 upper presentation')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (5, N'html', N'Hypertext Markup Language')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (6, N'mov', N'Metal Oxide Varistor')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (7, N'jpeg', N'Joint Photographic Experts Group')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (8, N'jpg', N'jpg')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (9, N'avi', N'Audio Video Interleaved')
GO
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (10, N'bmp', N'bitmap')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (11, N'msg', N'monosodium glutamate')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (12, N'eml', N'Ecological Metadata Language')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (13, N'mp3', N'Moving Picture Experts Group Layer-3 Audio')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (14, N'mp4', N'Moving Picture Expert Group-4 ')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (15, N'tif', N'Tagged Image File')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (16, N'tiff', N'Tagged Image File Format')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (17, N'png', N'Portable Network Graphics')
GO																		
INSERT [gbl].[Extension] ([ExtensionId], [Name], [Description]) VALUES (18, N'wav', N'Windows Wave')
GO


--Insert Gender
INSERT [gbl].[Gender] ([GenderId], [Name], [Description]) VALUES (1, N'Male', N'')
GO
INSERT [gbl].[Gender] ([GenderId], [Name], [Description]) VALUES (2, N'Female', N'')
GO
INSERT [gbl].[Gender] ([GenderId], [Name], [Description]) VALUES (3, N'Other', N'Undefine')
GO

--Insert RightType
INSERT [sec].[RighTtype] ([RighTtypeId], [Name], [Description]) VALUES (1, N'System', N'System Define')
GO
INSERT [sec].[RighTtype] ([RighTtypeId], [Name], [Description]) VALUES (2, N'Custom', N'Custom Define')
GO

--Insert Right
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (1, N'CAN_CREATE_COMPANY', N'COMPANY', N'CAN_CREATE_COMPANY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (2, N'CAN_VIEW_COMPANY', N'COMPANY', N'CAN_VIEW_COMPANY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (3, N'CAN_EDIT_COMPANY', N'COMPANY', N'CAN_EDIT_COMPANY', 0, 1, NULL, 2, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (4, N'CAN_ADD_LICENSE', N'COMPANY', N'CAN_ADD_LICENSE', 0, 1, NULL, 2, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (5, N'CAN_VIEW_LICENSE', N'COMPANY', N'CAN_VIEW_LICENSE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (6, N'CAN_UPGRADE_LICENSE', N'COMPANY', N'CAN_UPGRADE_LICENSE', 0, 1, NULL, 5, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (7, N'CAN_CANCEL_LICENSE', N'COMPANY', N'CAN_CANCEL_LICENSE', 0, 1, NULL, 5, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (8, N'CAN_VIEW_USER_LIST', N'USER', N'CAN_VIEW_USER_LIST', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (9, N'CAN_VIEW_USER_DETAILS', N'USER', N'CAN_VIEW_USER_DETAILS', 0, 1, NULL, 8, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (10, N'CAN_CREATE_NEW_USER', N'USER', N'CAN_CREATE_NEW_USER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (11, N'CAN_EDIT_USER', N'USER', N'CAN_EDIT_USER', 0, 1, NULL, 9, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (12, N'CAN_DELETE_USER', N'USER', N'CAN_DELETE_USER', 0, 1, NULL, 8, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (13, N'CAN_VIEW_DASHBOARD', N'USER', N'CAN_VIEW_DASHBOARD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (14, N'CAN_CHANGE_ROLE', N'USER', N'CAN_CHANGE_ROLE', 0, 1, NULL, 8, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (15, N'CAN_MANAGE_USER', N'USER', N'CAN_MANAGE_USER', 0, 1, NULL, 8, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (16, N'CAN_VIEW_ROLE_LIST', N'ROLE', N'CAN_VIEW_ROLE_LIST', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (17, N'CAN_VIEW_ROLE_DETAILS', N'ROLE', N'CAN_VIEW_ROLE_DETAILS', 0, 1, NULL, 16, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (18, N'CAN_CREATE_NEW_ROLE', N'ROLE', N'CAN_CREATE_NEW_ROLE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (19, N'CAN_EDIT_ROLE', N'ROLE', N'CAN_EDIT_ROLE', 0, 1, NULL, 17, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (20, N'CAN_DELETE_ROLE', N'ROLE', N'CAN_DELETE_ROLE', 0, 1, NULL, 17, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (21, N'CAN_DELEGATE_ROLE_RIGHT', N'ROLE', N'CAN_DELEGATE_ROLE_RIGHT', 0, 1, NULL, 17, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (22, N'CAN_VIEW_RIGHTS_LIST', N'RIGHT', N'CAN_VIEW_RIGHTS_LIST', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (23, N'CAN_VIEW_RIGHTS_DETAILS', N'RIGHT', N'CAN_VIEW_RIGHTS_DETAILS', 0, 1, NULL, 22, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (24, N'CAN_CREATE_NEW_RIGHT', N'RIGHT', N'CAN_CREATE_NEW_RIGHT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (25, N'CAN_EDIT_RIGHT', N'RIGHT', N'CAN_EDIT_RIGHT', 0, 1, NULL, 23, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (26, N'CAN_DELETE_RIGHT', N'RIGHT', N'CAN_DELETE_RIGHT', 0, 1, NULL, 23, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (27, N'CAN_VIEW_INBOX', N'MAIL', N'CAN_VIEW_INBOX', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (28, N'CAN_VIEW_OUTBOX', N'MAIL', N'CAN_VIEW_OUTBOX', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (29, N'CAN_VIEW_PROVIDER', N'MAIL', N'CAN_VIEW_PROVIDER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (30, N'CAN_DELETE_PROVIDER', N'MAIL', N'CAN_DELETE_PROVIDER', 0, 1, NULL, 29, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (31, N'CAN_REPLAY_MAIL', N'MAIL', N'CAN_REPLAY_MAIL', 0, 1, NULL, 27, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (32, N'CAN_REPLAYALL_MAIL', N'MAIL', N'CAN_REPLAYALL_MAIL', 0, 1, NULL, 27, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (33, N'CAN_FORWARD_MAIL', N'MAIL', N'CAN_FORWARD_MAIL', 0, 1, NULL, 27, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (34, N'CAN_MOVE_TO_MATTER_MAIL', N'MAIL', N'CAN_MOVE_TO_MATTER_MAIL', 0, 1, NULL, 27, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (35, N'CAN_DOWNLOAD_MAIL', N'MAIL', N'CAN_DOWNLOAD_MAIL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (36, N'CAN_DELETE_MAIL', N'MAIL', N'CAN_DELETE_MAIL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (37, N'CAN_MARK_AS_READ', N'MAIL', N'CAN_MARK_AS_READ', 0, 1, NULL, 27, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (38, N'CAN_ADD_PROVIDER', N'MAIL', N'CAN_ADD_PROVIDER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (39, N'CAN_CREATE_MATTER', N'MATTER', N'CAN_CREATE_MATTER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (40, N'CAN_VIEW_MATTER', N'MATTER', N'CAN_VIEW_MATTER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (41, N'CAN_EDIT_MATTER', N'MATTER', N'CAN_EDIT_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (42, N'CAN_DELETE_MATTER', N'MATTER', N'CAN_DELETE_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (43, N'CAN_PIN_UNPIN_MATTER', N'MATTER', N'CAN_PIN_UNPIN_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (44, N'CAN_LOCK_MATTER', N'MATTER', N'CAN_LOCK_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (45, N'CAN_UNLOCK_MATTER', N'MATTER', N'CAN_UNLOCK_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (46, N'CAN_UNLINK_MATTER', N'MATTER', N'CAN_UNLINK_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (47, N'CAN_LINK_MATTER', N'MATTER', N'CAN_LINK_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (48, N'CAN_VIEW_MATTER_FIELD', N'MATTER', N'CAN_VIEW_MATTER_FIELD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (49, N'CAN_ADD_MATTER_FIELD', N'MATTER', N'CAN_ADD_MATTER_FIELD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (50, N'CAN_PHONE_IN', N'MATTER', N'CAN_PHONE_IN', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (51, N'CAN_PHONE_OUT', N'MATTER', N'CAN_PHONE_OUT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (52, N'CAN_WRITE_LETTER', N'MATTER', N'CAN_WRITE_LETTER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (53, N'CAN_WRITE_EMAIL', N'MATTER', N'CAN_WRITE_EMAIL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (54, N'CAN_WRITE_MEMO', N'MATTER', N'CAN_WRITE_MEMO', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (55, N'CAN_WRITE_COURT_DOCUMENT', N'MATTER', N'CAN_WRITE_COURT_DOCUMENT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (56, N'CAN_VIEW_PARTIES', N'MATTER', N'CAN_VIEW_PARTIES', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (57, N'CAN_PANAL1_EXPORT', N'MATTER', N'CAN_PANAL1_EXPORT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (58, N'CAN_PANAL1_IMPORT', N'MATTER', N'CAN_PANAL1_IMPORT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (59, N'CAN_PANAL2_EXPORT', N'MATTER', N'CAN_PANAL2_EXPORT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (60, N'CAN_PANAL2_IMPORT', N'MATTER', N'CAN_PANAL2_IMPORT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (61, N'CAN_PANAL3_EXPORT', N'MATTER', N'CAN_PANAL3_EXPORT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (62, N'CAN_RENAME_MATTER_REFERENCE', N'MATTER', N'CAN_RENAME_MATTER_REFERENCE', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (63, N'CAN_SEARCH_MATTER', N'MATTER', N'CAN_SEARCH_MATTER', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (64, N'CAN_SAVE_DOCUMENT', N'MATTER', N'CAN_SAVE_DOCUMENT', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (65, N'CAN_BATCH_EDIT', N'MATTER', N'CAN_BATCH_EDIT', 0, 1, NULL, 40, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (66, N'CAN_VIEW_RTA', N'MATTER', N'CAN_VIEW_RTA', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (67, N'CAN_SEND_RTA', N'MATTER', N'CAN_SEND_RTA', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (68, N'CAN_TOGGLE_SEARCH_BAR', N'MATTER', N'CAN_TOGGLE_SEARCH_BAR', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (69, N'CAN_DOWNLOAD_SELECTED', N'MATTER', N'CAN_DOWNLOAD_SELECTED', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (70, N'CAN_UPLOAD', N'MATTER', N'CAN_UPLOAD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (71, N'CAN_EXPORT_SELECTED', N'MATTER', N'CAN_EXPORT_SELECTED', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (72, N'CAN_COLUMN_CHOOSER', N'MATTER', N'CAN_COLUMN_CHOOSER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (73, N'CAN_ADD_INVOICE', N'MATTER', N'CAN_ADD_INVOICE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (74, N'CAN_CREATE_MATTER_TYPE', N'MATTERTYPE', N'CAN_CREATE_MATTER_TYPE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (75, N'CAN_VIEW_MATTER_TYPE', N'MATTERTYPE', N'CAN_VIEW_MATTER_TYPE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (76, N'CAN_EDIT_MATTER_TYPE', N'MATTERTYPE', N'CAN_EDIT_MATTER_TYPE', 0, 1, NULL, 75, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (77, N'CAN_DELETE_MATTER_TYPE', N'MATTERTYPE', N'CAN_DELETE_MATTER_TYPE', 0, 1, NULL, 75, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (78, N'CAN_CREATE_PARTY_WRAPPER', N'PARTY_WRAPPER', N'CAN_CREATE_PARTY_WRAPPER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (79, N'CAN_VIEW_PARTY_WRAPPER', N'PARTY_WRAPPER', N'CAN_VIEW_PARTY_WRAPPER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (80, N'CAN_EDIT_PARTY_WRAPPER', N'PARTY_WRAPPER', N'CAN_EDIT_PARTY_WRAPPER', 0, 1, NULL, 79, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (81, N'CAN_DELETE_PARTY_WRAPPER', N'PARTY_WRAPPER', N'CAN_DELETE_PARTY_WRAPPER', 0, 1, NULL, 79, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (82, N'CAN_CREATE_LINK_MATTER', N'LINK_MATTER', N'CAN_CREATE_LINK_MATTER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (83, N'CAN_VIEW_LINK_MATTER', N'LINK_MATTER', N'CAN_VIEW_LINK_MATTER', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (84, N'CAN_EDIT_LINK_MATTER', N'LINK_MATTER', N'CAN_EDIT_LINK_MATTER', 0, 1, NULL, 83, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (85, N'CAN_DELETE_LINK_MATTER', N'LINK_MATTER', N'CAN_DELETE_LINK_MATTER', 0, 1, NULL, 83, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (86, N'CAN_CREATE_FIELD', N'FIELD', N'CAN_CREATE_FIELD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (87, N'CAN_VIEW_FIELD', N'FIELD', N'CAN_VIEW_FIELD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (88, N'CAN_EDIT_FIELD', N'FIELD', N'CAN_EDIT_FIELD', 0, 1, NULL, 87, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (89, N'CAN_DELETE_FIELD', N'FIELD', N'CAN_DELETE_FIELD', 0, 1, NULL, 87, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (90, N'CAN_CREATE_MATTER_WORK_TYPE', N'MATTER_WORKTYPE', N'CAN_CREATE_MATTER_WORK_TYPE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (91, N'CAN_VIEW_MATTER_WORK_TYPE', N'MATTER_WORKTYPE', N'CAN_VIEW_MATTER_WORK_TYPE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (92, N'CAN_EDIT_MATTER_WORK_TYPE', N'MATTER_WORKTYPE', N'CAN_EDIT_MATTER_WORK_TYPE', 0, 1, NULL, 91, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (93, N'CAN_DELETE_MATTER_WORK_TYPE', N'MATTER_WORKTYPE', N'CAN_DELETE_MATTER_WORK_TYPE', 0, 1, NULL, 91, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (94, N'CAN_CREATE_MATTER_ATTACEMENT', N'ATTACHEMENT_TO_MATTER', N'CAN_CREATE_MATTER_ATTACEMENT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (95, N'CAN_VIEW_MATTER_ATTACEMENT', N'ATTACHEMENT_TO_MATTER', N'CAN_VIEW_MATTER_ATTACEMENT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (96, N'CAN_EDIT_MATTER_ATTACEMENT', N'ATTACHEMENT_TO_MATTER', N'CAN_EDIT_MATTER_ATTACEMENT', 0, 1, NULL, 95, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (97, N'CAN_DELETE_MATTER_ATTACEMENT', N'ATTACHEMENT_TO_MATTER', N'CAN_DELETE_MATTER_ATTACEMENT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (98, N'CAN_VIEW_LIBRARY_LIST', N'LIBRARY', N'CAN_VIEW_LIBRARY_LIST', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (99, N'CAN_VIEW_LIBRARY_DETAILS', N'LIBRARY', N'CAN_VIEW_LIBRARY_DETAILS', 0, 1, NULL, 98, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (100, N'CAN_CREATE_NEW_LIBRARY', N'LIBRARY', N'CAN_CREATE_NEW_LIBRARY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (101, N'CAN_EDIT_LIBRARY', N'LIBRARY', N'CAN_EDIT_LIBRARY', 0, 1, NULL, 99, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (102, N'CAN_DELETE_LIBRARY', N'LIBRARY', N'CAN_DELETE_LIBRARY', 0, 1, NULL, 99, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (103, N'CAN_RENAME_LIBRARY', N'LIBRARY', N'CAN_RENAME_LIBRARY', 0, 1, NULL, 99, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (104, N'CAN_UPLOAD_LIBRARY', N'LIBRARY', N'CAN_UPLOAD_LIBRARY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (105, N'CAN_VIEW_LIBRARY', N'LIBRARY', N'CAN_VIEW_LIBRARY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (106, N'CAN_VIEW_TASK_LIST', N'TASK', N'CAN_VIEW_TASK_LIST', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (107, N'CAN_VIEW_TASK_DETAILS', N'TASK', N'CAN_VIEW_TASK_DETAILS', 0, 1, NULL, 106, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (108, N'CAN_CREATE_NEW_TASK', N'TASK', N'CAN_CREATE_NEW_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (109, N'CAN_EDIT_TASK', N'TASK', N'CAN_EDIT_TASK', 0, 1, NULL, 107, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (110, N'CAN_DELETE_TASK', N'TASK', N'CAN_DELETE_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (111, N'CAN_SET_TASK_PRIORITY', N'TASK', N'CAN_SET_TASK_PRIORITY', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (112, N'CAN_ADD_TASK_REFERENCE', N'TASK', N'CAN_ADD_TASK_REFERENCE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (113, N'CAN_ADD_TASK_LABEL', N'TASK', N'CAN_ADD_TASK_LABEL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (114, N'CAN_VIEW_SUBORDINATE', N'TASK', N'CAN_VIEW_SUBORDINATE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (115, N'CAN_EDIT_SUBORDINATE', N'TASK', N'CAN_EDIT_SUBORDINATE', 0, 1, NULL, 114, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (116, N'CAN_DELETE_SUBORDINATE', N'TASK', N'CAN_DELETE_SUBORDINATE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (117, N'CAN_VIEW_TEAM', N'TASK', N'CAN_VIEW_TEAM', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (118, N'CAN_DELETE_TEAM', N'TASK', N'CAN_DELETE_TEAM', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (119, N'CAN_EDIT_TEAM', N'TASK', N'CAN_EDIT_TEAM', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (120, N'CAN_ESCALATE_TASK', N'TASK', N'CAN_ESCALATE_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (121, N'CAN_ASSIGN_TASK', N'TASK', N'CAN_ASSIGN_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (122, N'CAN_PIN_TASK', N'TASK', N'CAN_PIN_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (123, N'CAN_COMPLETE_TASK', N'TASK', N'CAN_COMPLETE_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (124, N'CAN_SEARCH_TASK', N'TASK', N'CAN_SEARCH_TASK', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (125, N'CAN_VIEW_APP_SETTING', N'APPSETTING', N'CAN_VIEW_APP_SETTING', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (126, N'CAN_ADD_NEW_EVENT', N'CALENDER', N'CAN_ADD_NEW_EVENT', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (127, N'CAN_ADD_NEW_WIDGET', N'INTELLIGENCE', N'CAN_ADD_NEW_WIDGET', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (128, N'CAN_DELETE_WIDGET', N'INTELLIGENCE', N'CAN_DELETE_WIDGET', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (129, N'CAN_ASSIGN_WIDGET', N'INTELLIGENCE', N'CAN_ASSIGN_WIDGET', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (130, N'CAN_CREATE_PARTY_SCREEN', N'PARTIES', N'CAN_CREATE_PARTY_SCREEN', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (131, N'CAN_SEARCH_PARTY_SCREEN', N'PARTIES', N'CAN_SEARCH_PARTY_SCREEN', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (132, N'CAN_SEARCH_GLOBAL_FIELD', N'PARTIES', N'CAN_SEARCH_GLOBAL_FIELD', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (133, N'CAN_SUBMIT_BILL', N'BILLING', N'CAN_SUBMIT_BILL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (134, N'CAN_APPROVE_BILL', N'BILLING', N'CAN_APPROVE_BILL', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (135, N'CAN_SUBMIT_BILL_ANYTIME', N'BILLING', N'CAN_SUBMIT_BILL_ANYTIME', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO
INSERT [sec].[Right] ([RightId], [Name], [Category], [Description], [IsDeleted], [RighTtype], [CompanyId], [PrerequisiteRight], [CreatedDate], [ModifiedDate]) VALUES (136, N'CAN_CREATE_NEW_FINANCE', N'FINANCE', N'CAN_CREATE_NEW_FINANCE', 0, 1, NULL, NULL, GETDATE(), GETDATE())
GO

--Insert TimeZone
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (1, N'Coordinated Universal Time', N'(UTC) Coordinated Universal Time', N'Coordinated Universal Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (2, N'Morocco Daylight Time', N'(UTC+00:00) Casablanca', N'Morocco Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (3, N'GMT Daylight Time', N'(UTC+00:00) Dublin, Edinburgh, Lisbon, London', N'GMT Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (4, N'Greenwich Daylight Time', N'(UTC+00:00) Monrovia, Reykjavik', N'Greenwich Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (5, N'W. Europe Daylight Time', N'(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockho', N'W. Europe Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (6, N'Central Europe Daylight Time', N'(UTC+01:00) Belgrade, Bratislava, Budapest, Ljublj', N'Central Europe Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (7, N'Romance Daylight Time', N'(UTC+01:00) Brussels, Copenhagen, Madrid, Paris', N'Romance Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (8, N'Central European Daylight Time', N'(UTC+01:00) Sarajevo, Skopje, Warsaw, Zagreb', N'Central European Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (9, N'W. Central Africa Daylight Time', N'(UTC+01:00) West Central Africa', N'W. Central Africa Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (10, N'Jordan Daylight Time', N'(UTC+02:00) Amman', N'Jordan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (11, N'GTB Daylight Time', N'(UTC+02:00) Athens, Bucharest', N'GTB Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (12, N'Middle East Daylight Time', N'(UTC+02:00) Beirut', N'Middle East Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (13, N'Egypt Daylight Time', N'(UTC+02:00) Cairo', N'Egypt Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (14, N'E. Europe Daylight Time', N'(UTC+02:00) Chisinau', N'E. Europe Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (15, N'Syria Daylight Time', N'(UTC+02:00) Damascus', N'Syria Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (16, N'West Bank Gaza Daylight Time', N'(UTC+02:00) Gaza, Hebron', N'West Bank Gaza Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (17, N'South Africa Daylight Time', N'(UTC+02:00) Harare, Pretoria', N'South Africa Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (18, N'FLE Daylight Time', N'(UTC+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, ', N'FLE Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (19, N'Jerusalem Daylight Time', N'(UTC+02:00) Jerusalem', N'Jerusalem Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (20, N'Russia TZ 1 Daylight Time', N'(UTC+02:00) Kaliningrad', N'Russia TZ 1 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (21, N'Sudan Daylight Time', N'(UTC+02:00) Khartoum', N'Sudan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (22, N'Libya Daylight Time', N'(UTC+02:00) Tripoli', N'Libya Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (23, N'Namibia Daylight Time', N'(UTC+02:00) Windhoek', N'Namibia Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (24, N'Arabic Daylight Time', N'(UTC+03:00) Baghdad', N'Arabic Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (25, N'Turkey Daylight Time', N'(UTC+03:00) Istanbul', N'Turkey Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (26, N'Arab Daylight Time', N'(UTC+03:00) Kuwait, Riyadh', N'Arab Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (27, N'Belarus Daylight Time', N'(UTC+03:00) Minsk', N'Belarus Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (28, N'Russia TZ 2 Daylight Time', N'(UTC+03:00) Moscow, St. Petersburg, Volgograd', N'Russia TZ 2 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (29, N'E. Africa Daylight Time', N'(UTC+03:00) Nairobi', N'E. Africa Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (30, N'Iran Daylight Time', N'(UTC+03:30) Tehran', N'Iran Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (31, N'Arabian Daylight Time', N'(UTC+04:00) Abu Dhabi, Muscat', N'Arabian Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (32, N'Astrakhan Daylight Time', N'(UTC+04:00) Astrakhan, Ulyanovsk', N'Astrakhan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (33, N'Azerbaijan Daylight Time', N'(UTC+04:00) Baku', N'Azerbaijan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (34, N'Russia TZ 3 Daylight Time', N'(UTC+04:00) Izhevsk, Samara', N'Russia TZ 3 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (35, N'Mauritius Daylight Time', N'(UTC+04:00) Port Louis', N'Mauritius Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (36, N'Saratov Daylight Time', N'(UTC+04:00) Saratov', N'Saratov Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (37, N'Georgian Daylight Time', N'(UTC+04:00) Tbilisi', N'Georgian Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (38, N'Caucasus Daylight Time', N'(UTC+04:00) Yerevan', N'Caucasus Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (39, N'Afghanistan Daylight Time', N'(UTC+04:30) Kabul', N'Afghanistan Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (40, N'West Asia Daylight Time', N'(UTC+05:00) Ashgabat, Tashkent', N'West Asia Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (41, N'Russia TZ 4 Daylight Time', N'(UTC+05:00) Ekaterinburg', N'Russia TZ 4 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (42, N'Pakistan Daylight Time', N'(UTC+05:00) Islamabad, Karachi', N'Pakistan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (43, N'India Daylight Time', N'(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi', N'India Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (44, N'Sri Lanka Daylight Time', N'(UTC+05:30) Sri Jayawardenepura', N'Sri Lanka Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (45, N'Nepal Daylight Time', N'(UTC+05:45) Kathmandu', N'Nepal Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (46, N'Central Asia Daylight Time', N'(UTC+06:00) Astana', N'Central Asia Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (47, N'Bangladesh Daylight Time', N'(UTC+06:00) Dhaka', N'Bangladesh Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (48, N'Omsk Daylight Time', N'(UTC+06:00) Omsk', N'Omsk Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (49, N'Myanmar Daylight Time', N'(UTC+06:30) Yangon (Rangoon)', N'Myanmar Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (50, N'SE Asia Daylight Time', N'(UTC+07:00) Bangkok, Hanoi, Jakarta', N'SE Asia Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (51, N'Altai Daylight Time', N'(UTC+07:00) Barnaul, Gorno-Altaysk', N'Altai Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (52, N'W. Mongolia Daylight Time', N'(UTC+07:00) Hovd', N'W. Mongolia Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (53, N'Russia TZ 6 Daylight Time', N'(UTC+07:00) Krasnoyarsk', N'Russia TZ 6 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (54, N'Novosibirsk Daylight Time', N'(UTC+07:00) Novosibirsk', N'Novosibirsk Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (55, N'Tomsk Daylight Time', N'(UTC+07:00) Tomsk', N'Tomsk Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (56, N'China Daylight Time', N'(UTC+08:00) Beijing, Chongqing, Hong Kong, Urumqi', N'China Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (57, N'Russia TZ 7 Daylight Time', N'(UTC+08:00) Irkutsk', N'Russia TZ 7 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (58, N'Malay Peninsula Daylight Time', N'(UTC+08:00) Kuala Lumpur, Singapore', N'Malay Peninsula Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (59, N'W. Australia Daylight Time', N'(UTC+08:00) Perth', N'W. Australia Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (60, N'Taipei Daylight Time', N'(UTC+08:00) Taipei', N'Taipei Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (61, N'Ulaanbaatar Daylight Time', N'(UTC+08:00) Ulaanbaatar', N'Ulaanbaatar Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (62, N'North Korea Daylight Time', N'(UTC+08:30) Pyongyang', N'North Korea Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (63, N'Aus Central W. Daylight Time', N'(UTC+08:45) Eucla', N'Aus Central W. Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (64, N'Transbaikal Daylight Time', N'(UTC+09:00) Chita', N'Transbaikal Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (65, N'Tokyo Daylight Time', N'(UTC+09:00) Osaka, Sapporo, Tokyo', N'Tokyo Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (66, N'Korea Daylight Time', N'(UTC+09:00) Seoul', N'Korea Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (67, N'Russia TZ 8 Daylight Time', N'(UTC+09:00) Yakutsk', N'Russia TZ 8 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (68, N'Cen. Australia Daylight Time', N'(UTC+09:30) Adelaide', N'Cen. Australia Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (69, N'AUS Central Daylight Time', N'(UTC+09:30) Darwin', N'AUS Central Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (70, N'E. Australia Daylight Time', N'(UTC+10:00) Brisbane', N'E. Australia Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (71, N'AUS Eastern Daylight Time', N'(UTC+10:00) Canberra, Melbourne, Sydney', N'AUS Eastern Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (72, N'West Pacific Daylight Time', N'(UTC+10:00) Guam, Port Moresby', N'West Pacific Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (73, N'Tasmania Daylight Time', N'(UTC+10:00) Hobart', N'Tasmania Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (74, N'Russia TZ 9 Daylight Time', N'(UTC+10:00) Vladivostok', N'Russia TZ 9 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (75, N'Lord Howe Daylight Time', N'(UTC+10:30) Lord Howe Island', N'Lord Howe Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (76, N'Bougainville Daylight Time', N'(UTC+11:00) Bougainville Island', N'Bougainville Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (77, N'Russia TZ 10 Daylight Time', N'(UTC+11:00) Chokurdakh', N'Russia TZ 10 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (78, N'Magadan Daylight Time', N'(UTC+11:00) Magadan', N'Magadan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (79, N'Norfolk Daylight Time', N'(UTC+11:00) Norfolk Island', N'Norfolk Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (80, N'Sakhalin Daylight Time', N'(UTC+11:00) Sakhalin', N'Sakhalin Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (81, N'Central Pacific Daylight Time', N'(UTC+11:00) Solomon Is., New Caledonia', N'Central Pacific Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (82, N'Russia TZ 11 Daylight Time', N'(UTC+12:00) Anadyr, Petropavlovsk-Kamchatsky', N'Russia TZ 11 Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (83, N'New Zealand Daylight Time', N'(UTC+12:00) Auckland, Wellington', N'New Zealand Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (84, N'UTC+12', N'(UTC+12:00) Coordinated Universal Time+12', N'UTC+12', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (85, N'Fiji Daylight Time', N'(UTC+12:00) Fiji', N'Fiji Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (86, N'Kamchatka Daylight Time', N'(UTC+12:00) Petropavlovsk-Kamchatsky - Old', N'Kamchatka Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (87, N'Chatham Islands Daylight Time', N'(UTC+12:45) Chatham Islands', N'Chatham Islands Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (88, N'UTC+13', N'(UTC+13:00) Coordinated Universal Time+13', N'UTC+13', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (89, N'Tonga Daylight Time', N'(UTC+13:00) Nuku''alofa', N'Tonga Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (90, N'Samoa Daylight Time', N'(UTC+13:00) Samoa', N'Samoa Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (91, N'Line Islands Daylight Time', N'(UTC+14:00) Kiritimati Island', N'Line Islands Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (92, N'Azores Daylight Time', N'(UTC-01:00) Azores', N'Azores Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (93, N'Cabo Verde Daylight Time', N'(UTC-01:00) Cabo Verde Is.', N'Cabo Verde Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (94, N'UTC-02', N'(UTC-02:00) Coordinated Universal Time-02', N'UTC-02', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (95, N'Mid-Atlantic Daylight Time', N'(UTC-02:00) Mid-Atlantic - Old', N'Mid-Atlantic Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (96, N'Tocantins Daylight Time', N'(UTC-03:00) Araguaina', N'Tocantins Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (97, N'E. South America Daylight Time', N'(UTC-03:00) Brasilia', N'E. South America Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (98, N'SA Eastern Daylight Time', N'(UTC-03:00) Cayenne, Fortaleza', N'SA Eastern Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (99, N'Argentina Daylight Time', N'(UTC-03:00) City of Buenos Aires', N'Argentina Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (100, N'Greenland Daylight Time', N'(UTC-03:00) Greenland', N'Greenland Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (101, N'Montevideo Daylight Time', N'(UTC-03:00) Montevideo', N'Montevideo Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (102, N'Magallanes Daylight Time', N'(UTC-03:00) Punta Arenas', N'Magallanes Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (103, N'Saint Pierre Daylight Time', N'(UTC-03:00) Saint Pierre and Miquelon', N'Saint Pierre Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (104, N'Bahia Daylight Time', N'(UTC-03:00) Salvador', N'Bahia Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (105, N'Newfoundland Daylight Time', N'(UTC-03:30) Newfoundland', N'Newfoundland Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (106, N'Paraguay Daylight Time', N'(UTC-04:00) Asuncion', N'Paraguay Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (107, N'Atlantic Daylight Time', N'(UTC-04:00) Atlantic Time (Canada)', N'Atlantic Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (108, N'Venezuela Daylight Time', N'(UTC-04:00) Caracas', N'Venezuela Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (109, N'Central Brazilian Daylight Time', N'(UTC-04:00) Cuiaba', N'Central Brazilian Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (110, N'SA Western Daylight Time', N'(UTC-04:00) Georgetown, La Paz, Manaus, San Juan', N'SA Western Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (111, N'Pacific SA Daylight Time', N'(UTC-04:00) Santiago', N'Pacific SA Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (112, N'SA Pacific Daylight Time', N'(UTC-05:00) Bogota, Lima, Quito, Rio Branco', N'SA Pacific Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (113, N'Eastern Daylight Time (Mexico)', N'(UTC-05:00) Chetumal', N'Eastern Standard Time (Mexico)', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (114, N'Eastern Daylight Time', N'(UTC-05:00) Eastern Time (US & Canada)', N'Eastern Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (115, N'Haiti Daylight Time', N'(UTC-05:00) Haiti', N'Haiti Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (116, N'Cuba Daylight Time', N'(UTC-05:00) Havana', N'Cuba Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (117, N'US Eastern Daylight Time', N'(UTC-05:00) Indiana (East)', N'US Eastern Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (118, N'Turks and Caicos Daylight Time', N'(UTC-05:00) Turks and Caicos', N'Turks and Caicos Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (119, N'Central America Daylight Time', N'(UTC-06:00) Central America', N'Central America Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (120, N'Central Daylight Time', N'(UTC-06:00) Central Time (US & Canada)', N'Central Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (121, N'Easter Island Daylight Time', N'(UTC-06:00) Easter Island', N'Easter Island Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (122, N'Central Daylight Time (Mexico)', N'(UTC-06:00) Guadalajara, Mexico City, Monterrey', N'Central Standard Time (Mexico)', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (123, N'Canada Central Daylight Time', N'(UTC-06:00) Saskatchewan', N'Canada Central Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (124, N'US Mountain Daylight Time', N'(UTC-07:00) Arizona', N'US Mountain Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (125, N'Mountain Daylight Time (Mexico)', N'(UTC-07:00) Chihuahua, La Paz, Mazatlan', N'Mountain Standard Time (Mexico)', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (126, N'Mountain Daylight Time', N'(UTC-07:00) Mountain Time (US & Canada)', N'Mountain Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (127, N'Pacific Daylight Time (Mexico)', N'(UTC-08:00) Baja California', N'Pacific Standard Time (Mexico)', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (128, N'UTC-08', N'(UTC-08:00) Coordinated Universal Time-08', N'UTC-08', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (129, N'Pacific Daylight Time', N'(UTC-08:00) Pacific Time (US & Canada)', N'Pacific Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (130, N'Alaskan Daylight Time', N'(UTC-09:00) Alaska', N'Alaskan Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (131, N'UTC-09', N'(UTC-09:00) Coordinated Universal Time-09', N'UTC-09', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (132, N'Marquesas Daylight Time', N'(UTC-09:30) Marquesas Islands', N'Marquesas Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (133, N'Aleutian Daylight Time', N'(UTC-10:00) Aleutian Islands', N'Aleutian Standard Time', 1)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (134, N'Hawaiian Daylight Time', N'(UTC-10:00) Hawaii', N'Hawaiian Standard Time', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (135, N'UTC-11', N'(UTC-11:00) Coordinated Universal Time-11', N'UTC-11', 0)
GO
INSERT [gbl].[TimeZone] ([TimeZoneId], [DaylightName], [DisplayName], [StandardName], [SupportsDaylightSavingTime]) VALUES (136, N'Dateline Daylight Time', N'(UTC-12:00) International Date Line West', N'Dateline Standard Time', 0)
GO

--Insert Matter State
INSERT [mtr].[State] ([StateId], [Name], [Description]) VALUES (1, N'Start', N'')
GO
INSERT [mtr].[State] ([StateId], [Name], [Description]) VALUES (2, N'Close', N'')
GO

--Insert Matter Status

INSERT [mtr].[MatterStatus] ([MatterStatusId], [Name], [Description]) VALUES (1, N'Abandon', N' ')
GO
INSERT [mtr].[MatterStatus] ([MatterStatusId], [Name], [Description]) VALUES (2, N'Won', N' ')
GO
INSERT [mtr].[MatterStatus] ([MatterStatusId], [Name], [Description]) VALUES (3, N'Lost', N' ')
GO
INSERT [mtr].[MatterStatus] ([MatterStatusId], [Name], [Description]) VALUES (4, N'Running', N' ')
GO

--Insert MatterState and MatterStatusMapping

INSERT [mtr].[StateMatterStatusMap] ([StateId], [MatterStatusId], [Description]) VALUES (1, 4, N' ')
GO
INSERT [mtr].[StateMatterStatusMap] ([StateId], [MatterStatusId], [Description]) VALUES (2, 1, N' ')
GO
INSERT [mtr].[StateMatterStatusMap] ([StateId], [MatterStatusId], [Description]) VALUES (2, 2, N' ')
GO
INSERT [mtr].[StateMatterStatusMap] ([StateId], [MatterStatusId], [Description]) VALUES (2, 3, N' ')
GO




EXEC [std].[SP_RegisterNewCompany] 'Demo', 'DemoUser', 'support@hoxro.com', 'Password1@', 'Hoxro', 'DevTest'
GO
UPDATE [trn].[User]
	SET [IsActive] = 1
WHERE [Email] = 'support@hoxro.com'
GO


DECLARE @ClientId INT,
		@CompanyId INT,
		@UserId INT,
		@MatterTypeId INT,
		@WorkTypeId INT,
		@EntityTypeId INT,
		@MatterId INT

SELECT @CompanyId = [CompanyId], @UserId = [UserId] FROM [trn].[User] WHERE [Email] = 'support@hoxro.com'


	INSERT INTO [mtr].[MatterType]
		([Name], [CompanyId], [IsDeleted], [Description], [CreatedDate], [ModifiedDate])
	VALUES
		('Personal Injury', @CompanyId, 0, 'Created By System', GETDATE(), GETDATE())
	SET @MatterTypeId = SCOPE_IDENTITY()

	INSERT INTO [mtr].[WorkType]
		([Name], [MatterTypeId], [IsDeleted], [CompanyId], [CreatedDate], [ModifiedDate])
	VALUES
		('Road Traffic Accident', @MatterTypeId, 0, @CompanyId, GETDATE(), GETDATE())
	SET @WorkTypeId = SCOPE_IDENTITY()

	SELECT @EntityTypeId = [EntitytypeId] FROM [std].[Entitytype] WHERE [CompanyId] = @CompanyId AND [Name] = 'Individual'

	INSERT INTO [mtr].[Client]
		([ClientFirstName], [ClientLastName], [ClientFullName], [EntityTypeId], [CompanyId], [IsDeleted], [GenderId], [CreatedDate], [ModifiedDate])
	VALUES
		('Roger', 'Federar', 'Roger Federar', @EntityTypeId, @CompanyId, 0, 1, GETDATE(), GETDATE())
	SET @ClientId = SCOPE_IDENTITY()

	INSERT INTO [mtr].[Matter]
		([CompanyId], [ClientId], [MatterRef], [MatterStatusId], [StateId], [Biller], [CreatedDate], [ModifiedDate], [BillingStatusId], [WorkTypeId], [IsDeleted])
	VALUES
		(@CompanyId, @ClientId, '100001', 4, 1, @UserId, GETDATE(), GETDATE(), 1, @WorkTypeId, 0)
	SET @MatterId = SCOPE_IDENTITY()

	UPDATE [std].[ApplicationConfigurationValue]
		SET [Value] = '100002'
	WHERE [CompanyId] = @CompanyId AND [AppConfigurationTypeId] = 2

	DECLARE @clientLibraryContentFieldId INT,
			@clientFirstNameFieldId INT,
			@clientLastNameFieldId INT,
			@matterTypeFieldId INT,
			@workTypeFieldId INT,
			@matterRefFieldId INT,
			@billerFieldId INT,
			@serialNumberFieldId INT,
			@entityTypeField INT,
			@notesFieldId INT
			
	SELECT @clientLibraryContentFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'ClientLibraryContentId'
	SELECT @clientFirstNameFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'ClientFirstName'
	SELECT @clientLastNameFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'ClientLastName'
	SELECT @matterTypeFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'MatterType'
	SELECT @workTypeFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'WorkType'
	SELECT @matterRefFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'MatterRef'
	SELECT @billerFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'Biller'
	SELECT @serialNumberFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'SerialNumber'
	SELECT @entityTypeField = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'EntityType'
	SELECT @notesFieldId = FieldId  FROM [std].[Field] WHERE [CompanyId] = @CompanyId AND [Name] = 'Notes'
	
	INSERT INTO [gbd].[GlobalData]
		([Name], [Initialvalue], [CompanyId], [MatterId], [ModifiedDate], [CreatedDate], [CreatedBy], [FieldId], [IsDeleted])
	VALUES
		('ClientLibraryContentId', CAST(@ClientId AS NVARCHAR(MAX)), @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @clientLibraryContentFieldId, 0),
		('ClientFirstName', 'Roger', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @clientFirstNameFieldId, 0),
		('ClientLastName', 'Federar', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @clientLastNameFieldId, 0),
		('MatterType', 'Personal Injury', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @matterTypeFieldId, 0),
		('WorkType', 'Road Traffic Accident', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @workTypeFieldId, 0),
		('MatterRef', '100001', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @matterRefFieldId, 0),
		('Biller', 'TestUser', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @billerFieldId, 0),
		('SerialNumber', '100001', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @serialNumberFieldId, 0),
		('EntityType', 'Individual', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @entityTypeField, 0),
		('Notes', '', @CompanyId, @MatterId, GETDATE(), GETDATE(), @UserId, @notesFieldId, 0)
