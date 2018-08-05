ALTER PROC [dev].[sp_delete_company]
(
	@CompanyId INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			DELETE bdd FROM [bil].[DraftDetails] bdd
				INNER JOIN [bil].[Draft] bd ON bd.DraftId = bdd.DraftId
				INNER JOIN [bil].[Billing] bb ON bd.BillingId = bb.BillingId
			WHERE 1 = 1 
				AND bb.CompanyId = @CompanyId

			DELETE bd FROM [bil].[Draft] bd 
				INNER JOIN [bil].[Billing] bb ON bd.BillingId = bb.BillingId
			WHERE 1 = 1 
				AND bb.CompanyId = @CompanyId

			DELETE bbt FROM [bil].[BillingTransaction] bbt
				INNER JOIN [bil].[Billing] bb ON bbt.BillingId = bb.BillingId
			WHERE 1 = 1 
				AND bb.CompanyId = @CompanyId

			DELETE FROM [bil].[Billing] WHERE CompanyId = @CompanyId

			DELETE FROM [trn].[ObjectOrdering] WHERE CompanyId = @CompanyId
			DELETE FROM [upr].[UserPreference] WHERE CompanyId = @CompanyId

			DELETE esd FROM [evn].[SectionDetail] esd
				INNER JOIN [evn].[Section] es ON es.SectionId = esd.SectionId
			WHERE 1 = 1 
				AND es.CompanyId = @CompanyId

			DELETE FROM [evn].[Section] WHERE CompanyId = @CompanyId

			DELETE FROM [evn].[Event] WHERE CompanyId = @CompanyId
			DELETE FROM [evn].[Calendar] WHERE CompanyId = @CompanyId

			DELETE etr FROM [evn].[TaskRelationship] etr
				INNER JOIN [evn].[Task] et ON et.TaskId = etr.TaskId
				INNER JOIN [trn].[User] u ON et.AssignedTo = u.UserId
			WHERE 1 = 1 
				AND u.CompanyId = @CompanyId

			DELETE FROM [evn].[Task] WHERE AssignedTo IN (SELECT UserId FROM [trn].[User] WHERE CompanyId = @CompanyId)
			
			--Finance
			DELETE FROM [fin].[AuditLogSubsidyLedgerRegister] WHERE CompanyId = @CompanyId	
			DELETE FROM [fin].[AuditLogDetails] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[AuditLog] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[SubsidyLedgerRegister] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[FinanceTransactionDetails] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[FinanceTransaction] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[DayEnd] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[YearEnd] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[MonthEnd] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[FinanceConfiguration] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[TransactionStatus] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[PeriodEnd] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[Tax] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[Department] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[Branch] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[RelatedAccount] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[TransactionType] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[Account] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[AccountType] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[Currency] WHERE CompanyId = @CompanyId
			DELETE FROM [fin].[PaymentType] WHERE CompanyId = @CompanyId

			DELETE FROM [gbd].[GlobalData] WHERE CompanyId = @CompanyId

			DELETE llcctm FROM [lib].[LibraryContentCategoryTypeMapping] llcctm
				INNER JOIN [lib].[LibraryContent] llc ON llc.LibraryContentId = llcctm.LibraryContentId
			WHERE 1 = 1 
				AND llc.CompanyId = @CompanyId

			DELETE FROM [lib].[Attachment] WHERE CompanyId = @CompanyId
			DELETE FROM [lib].[LibraryContent] WHERE CompanyId = @CompanyId
			DELETE FROM [lib].[Library] WHERE CompanyId = @CompanyId

			DELETE FROM [mtr].[MatterTag] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[Contacts] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[MatterCategoryScreenMap] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[MatterDocument] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[Matter] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[Client] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[WorkTypeStage] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[WorkType] WHERE CompanyId = @CompanyId
			DELETE FROM [mtr].[MatterType] WHERE CompanyId = @CompanyId
			
			DELETE ppd FROM [pmt].[PaymentDetails] ppd
				INNER JOIN [pmt].[Payment] pp ON pp.PaymentId = ppd.PaymentId
			WHERE 1 = 1 
				AND pp.CompanyId = @CompanyId
			DELETE FROM [pmt].[Payment] WHERE CompanyId = @CompanyId
			
			DELETE FROM [rpt].[ReportViewColumn] WHERE CompanyId = @CompanyId

			DELETE rrp FROM [rpt].[ReportParameter] rrp
				INNER JOIN [rpt].[Report] rr ON rr.ReportId = rrp.ReportId
			WHERE 1 = 1 
				AND rr.CompanyId = @CompanyId
			DELETE FROM [rpt].[Report] WHERE CompanyId = @CompanyId

			DELETE FROM [scr].[CategoryScreenMap] WHERE CompanyId = @CompanyId
			DELETE FROM [scr].[Category] WHERE CompanyId = @CompanyId
			DELETE FROM [scr].[Component] WHERE CompanyId = @CompanyId
			DELETE FROM [scr].[Screen] WHERE CompanyId = @CompanyId

			DELETE FROM [sec].[RoleRightsMap] WHERE CompanyId = @CompanyId
			DELETE FROM [sec].[Right] WHERE CompanyId = @CompanyId
			DELETE FROM [sec].[Role] WHERE CompanyId = @CompanyId

			DELETE FROM [trn].[Email] WHERE CompanyId = @CompanyId


			DELETE FROM [std].[ApplicationConfigurationValue] WHERE CompanyId = @CompanyId
			DELETE FROM [std].[ApplicationConfiguration] WHERE CompanyId = @CompanyId
			DELETE FROM [std].[EntityType] WHERE CompanyId = @CompanyId
			DELETE FROM [std].[Grade] WHERE CompanyId = @CompanyId
			DELETE FROM [std].[Field] WHERE CompanyId = @CompanyId
			DELETE tp FROM [trn].[Provider] tp
				INNER JOIN [trn].[User] tu ON tp.UserId = tu.UserId
			WHERE 1 = 1 
				AND tu.CompanyId = @CompanyId

			DELETE FROM [trn].[User] WHERE CompanyId = @CompanyId
			DELETE FROM [pmt].[License] WHERE CompanyId = @CompanyId
			DELETE FROM [std].[Company] WHERE CompanyId = @CompanyId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF(@@ROWCOUNT > 0)
		BEGIN
			ROLLBACK
			PRINT ERROR_MESSAGE()
		END
	END CATCH
END