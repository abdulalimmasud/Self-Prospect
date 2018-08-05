USE [Hoxro]
GO
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
