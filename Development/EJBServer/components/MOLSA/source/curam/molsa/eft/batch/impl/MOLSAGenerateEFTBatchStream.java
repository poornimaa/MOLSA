package curam.molsa.eft.batch.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.log4j.Logger;

import curam.codetable.ALTERNATENAMETYPE;
import curam.codetable.BATCHPROCESSNAME;
import curam.codetable.CASESTATUS;
import curam.codetable.CASETYPECODE;
import curam.codetable.CONCERNROLEALTERNATEID;
import curam.codetable.FINCOMPONENTSTATUS;
import curam.codetable.FINCOMPONENTTYPE;
import curam.codetable.PMTRECONCILIATIONSTATUS;
import curam.core.fact.CaseHeaderFactory;
import curam.core.fact.CaseStatusFactory;
import curam.core.fact.FinancialComponentFactory;
import curam.core.fact.InstructionLineItemFactory;
import curam.core.fact.PaymentInstrumentFactory;
import curam.core.impl.BatchStreamHelper;
import curam.core.impl.EnvVars;
import curam.core.impl.SecurityImplementationFactory;
import curam.core.intf.CaseHeader;
import curam.core.intf.CaseStatus;
import curam.core.intf.FinancialComponent;
import curam.core.intf.InstructionLineItem;
import curam.core.intf.PaymentInstrument;
import curam.core.sl.entity.fact.CaseNomineeFactory;
import curam.core.sl.entity.intf.CaseNominee;
import curam.core.sl.entity.struct.CaseNomineeDtls;
import curam.core.sl.entity.struct.CaseNomineeKey;
import curam.core.struct.BankAccountDtls;
import curam.core.struct.BankBranchDtls;
import curam.core.struct.BankDtls;
import curam.core.struct.BatchProcessStreamKey;
import curam.core.struct.BatchProcessingID;
import curam.core.struct.BatchProcessingSkippedRecord;
import curam.core.struct.BatchProcessingSkippedRecordList;
import curam.core.struct.CaseHeaderByStatusKey;
import curam.core.struct.CaseHeaderDtls;
import curam.core.struct.CaseHeaderDtlsList;
import curam.core.struct.CaseStatusDtls;
import curam.core.struct.Count;
import curam.core.struct.CurrentCaseStatusKey;
import curam.core.struct.EffectiveDateReconcilStatusVersionNo;
import curam.core.struct.FCstatusCodeCaseID;
import curam.core.struct.FinancialComponentDtls;
import curam.core.struct.FinancialComponentDtlsList;
import curam.core.struct.FinancialComponentID;
import curam.core.struct.PIStatusCode;
import curam.core.struct.PaymentInstrumentDtls;
import curam.core.struct.PaymentInstrumentDtlsList;
import curam.core.struct.PaymentInstrumentKey;
import curam.dynamicevidence.util.impl.DateUtil;
import curam.evidence.sl.struct.MonthYearDetails;
import curam.message.MOLSASMSSERVICE;
import curam.molsa.codetable.MOLSABICCODE;
import curam.molsa.codetable.MOLSASMSMESSAGETEMPLATE;
import curam.molsa.codetable.MOLSASMSMessageType;
import curam.molsa.eft.batch.struct.MOLSAGenerateEFTDetail;
import curam.molsa.eft.batch.struct.MOLSAGenerateEFTDetailList;
import curam.molsa.eft.batch.struct.MOLSAGenerateEFTMsWordDetail;
import curam.molsa.eft.batch.struct.MOLSAGenerateEFTParam;
import curam.molsa.message.MOLSABPOGENERATEEFT;
import curam.molsa.sms.sl.fact.MOLSASMSUtilFactory;
import curam.molsa.sms.sl.struct.MOLSAConcernRoleListAndMessageTextDetails;
import curam.molsa.util.impl.MOLSAFinancialHelper;
import curam.molsa.util.impl.MOLSAGenerateEFTHelper;
import curam.molsa.util.impl.MOLSAParticipantHelper;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;
import curam.util.exception.LocalisableString;
import curam.util.resources.Configuration;
import curam.util.transaction.TransactionInfo;
import curam.util.type.CodeTable;
import curam.util.type.Date;
import curam.util.type.FrequencyPattern;
import curam.util.type.Money;

/**
 * The Stream class to generate the EFT Document from Batch.
 * 
 */
public class MOLSAGenerateEFTBatchStream extends
		curam.molsa.eft.batch.base.MOLSAGenerateEFTBatchStream {

	/**
	 * Calls the runStream method.
	 * 
	 * @param batchProcessStreamKey
	 *            BatchProcessStreamKey
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	@Override
	public void process(BatchProcessStreamKey batchProcessStreamKey)
			throws AppException, InformationalException {
		BatchStreamHelper batchStreamHelper = new BatchStreamHelper();
		MOLSAGenerateEFTBatchStreamWrapper molsaGenerateEFTBatchStreamWrapper = new MOLSAGenerateEFTBatchStreamWrapper(
				this);
		SecurityImplementationFactory.register();
		if (batchProcessStreamKey.instanceID.length() == 0) {
			batchProcessStreamKey.instanceID = BATCHPROCESSNAME.MOLSA_GENERATE_EFT;
		}
		batchStreamHelper.runStream(batchProcessStreamKey,
				molsaGenerateEFTBatchStreamWrapper);

	}

	/**
	 * Note:- Not used in MOLSA. So empty implementation
	 * 
	 * @param skippedCasesCount
	 *            int
	 * @return String.
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	@Override
	public String getChunkResult(int skippedCasesCount) throws AppException,
			InformationalException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Note:- Not used in MOLSA. So empty implementation
	 * 
	 * @param batchProcessingSkippedRecordList
	 *            BatchProcessingSkippedRecordList
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	@Override
	public void processSkippedCases(
			BatchProcessingSkippedRecordList batchProcessingSkippedRecordList)
			throws AppException, InformationalException {
		// TODO Auto-generated method stub

	}

	/**
	 * Invoked from the batch program to generate the EFT documents. Read all
	 * the processed Payment Instrument and create the EFT documents (Word and
	 * Exel). Once the exel is generated, the Payment Instrument Status is
	 * updated to Issued.
	 * 
	 * @param batchProcessingID
	 *            BatchProcessingID
	 * @param generateEFTParam
	 *            MOLSAGenerateEFTParam
	 * @return BatchProcessingSkippedRecord
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	@Override
	public BatchProcessingSkippedRecord processRecord(
			BatchProcessingID batchProcessingID,
			MOLSAGenerateEFTParam generateEFTParam) throws AppException,
			InformationalException {

		PaymentInstrument paymentInstrumentObj = PaymentInstrumentFactory
				.newInstance();
		PIStatusCode piStatusCode = new PIStatusCode();
		piStatusCode.reconcilStatusCode = PMTRECONCILIATIONSTATUS.PROCESSED;
		PaymentInstrumentDtlsList paymentInstrumentDtlsList = paymentInstrumentObj
				.searchByStatusCode(piStatusCode);

		BatchProcessingSkippedRecord batchProcessingSkippedRecord = new BatchProcessingSkippedRecord();

		MOLSAGenerateEFTDetailList bankGenerateEFTDetailList = generateExelForBank(
				paymentInstrumentDtlsList, generateEFTParam);
		double totalAmount = bankGenerateEFTDetailList.totalAmount.getValue();
		generateExelForFinance(bankGenerateEFTDetailList, generateEFTParam);
		generateMsWord(totalAmount);
		updatePaymentInstrumentStatus(paymentInstrumentDtlsList);

		return batchProcessingSkippedRecord;
	}

	/**
	 * Populate the MsWord struct details.
	 * 
	 * @param totalAmount
	 *            double
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private void generateMsWord(double totalAmount) throws AppException,
			InformationalException {

		MOLSAGenerateEFTMsWordDetail generateEFTMsWordDetail = new MOLSAGenerateEFTMsWordDetail();
		String compBankAccountID = Configuration
				.getProperty(EnvVars.EFT_BANKACCOUNTID);
		BankAccountDtls bankAccountDtls = MOLSAFinancialHelper
				.returnBankAccountDetails(Long.parseLong(compBankAccountID));
		BankBranchDtls bankBranchDtls = MOLSAFinancialHelper
				.returnBankBranchDetails(bankAccountDtls.bankBranchID);
		BankDtls bankDtls = MOLSAFinancialHelper
				.returnBankDetails(bankBranchDtls.bankID);
		generateEFTMsWordDetail.compAccount = bankAccountDtls.bic;
		generateEFTMsWordDetail.socialAffairMinisterName = Configuration
				.getProperty(EnvVars.EFT_NAME_OF_ASST_MINISTER_SOCIAL_AFFAIR);
		generateEFTMsWordDetail.securityDirectorName = Configuration
				.getProperty(EnvVars.EFT_NAME_OF_SOCIAL_SECURITY_DIRECTOR);

		String dayOfMonth = Configuration
				.getProperty(EnvVars.ENV_MOLSA_FINANCIAL_PAYMENT_DAY);
		MonthYearDetails monthYearDetails = MOLSAGenerateEFTHelper
				.getMonthYearDetail(Date.getCurrentDate());
		Date dueDate = DateUtil.getISODate(monthYearDetails.year
				+ monthYearDetails.monthCode + dayOfMonth);
		generateEFTMsWordDetail.dueDate = dueDate.toString();
		generateEFTMsWordDetail.forMonth = monthYearDetails.monthCode + "/"
				+ monthYearDetails.year;
		generateEFTMsWordDetail.transferAmount = totalAmount + " / "
				+ Configuration.getProperty(EnvVars.ENV_BASECURRENCY);

		MOLSAGenerateEFTHelper.newInstance().generateMsWord(
				generateEFTMsWordDetail,
				MOLSAGenerateEFTHelper.getMsWordName(monthYearDetails));

	}

	/**
	 * Checks whether the Payment is generated for the Financial Component. This
	 * also remove the Benefit UnderPayment.
	 * 
	 * @param financialComponentDtls
	 *            FinancialComponentDtls
	 * @return boolean
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private boolean checkPaymentIsGenerated(
			FinancialComponentDtls financialComponentDtls) throws AppException,
			InformationalException {
		boolean isFinancialGenerated = false;
		InstructionLineItem instructionLineItemObj = InstructionLineItemFactory
				.newInstance();
		FinancialComponentID financialComponentID = new FinancialComponentID();
		financialComponentID.financialCompID = financialComponentDtls.financialCompID;
		Count count = instructionLineItemObj
				.countByFinancialCompID(financialComponentID);
		if (count.numberOfRecords > 0) {
			isFinancialGenerated = true;
		}
		return isFinancialGenerated;
	}

	/**
	 * Remove the Benefit UnderPayment record from the input list.
	 * 
	 * @param financialComponentDtlsList
	 *            FinancialComponentDtlsList
	 * @return FinancialComponentDtlsList
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private FinancialComponentDtlsList filterFinancialComponent(
			FinancialComponentDtlsList financialComponentDtlsList)
			throws AppException, InformationalException {
		for (FinancialComponentDtls financialComponentDtls : financialComponentDtlsList.dtls
				.items()) {
			if (!financialComponentDtls.typeCode
					.equals(FINCOMPONENTTYPE.MOLSA_COMP)
					|| !checkPaymentIsGenerated(financialComponentDtls)) {
				financialComponentDtlsList.dtls.remove(financialComponentDtls);
			}
		}
		return financialComponentDtlsList;
	}
	
	
	/**
	 * Return the Open and Suspended Case Details to the output struct.
	 * 
	 * @return List<MOLSAGenerateEFTDetail>
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private List<MOLSAGenerateEFTDetail> getOpenAndSubmittedCaseDetails()
			throws AppException, InformationalException {
		List<MOLSAGenerateEFTDetail> generateEFTDetailList = new ArrayList<MOLSAGenerateEFTDetail>();
		MOLSAGenerateEFTDetail generateEFTDetail;

		// Suspended Cases Amount
		CaseHeader caseHeaderObj = CaseHeaderFactory.newInstance();
		CaseHeaderByStatusKey caseHeaderByStatusKey = new CaseHeaderByStatusKey();
		caseHeaderByStatusKey.statusCode = CASESTATUS.OPEN;
		CaseHeaderDtlsList caseHeaderDtlsOpenList = caseHeaderObj
				.searchByStatusCode(caseHeaderByStatusKey);
		caseHeaderByStatusKey.statusCode = CASESTATUS.COMPLETED;
		CaseHeaderDtlsList caseHeaderDtlsSubmittedList = caseHeaderObj
		.searchByStatusCode(caseHeaderByStatusKey);
		CaseHeaderDtlsList caseHeaderDtlsList = new CaseHeaderDtlsList();
		caseHeaderDtlsList.dtls.addAll(caseHeaderDtlsOpenList.dtls);
		caseHeaderDtlsList.dtls.addAll(caseHeaderDtlsSubmittedList.dtls);
		caseHeaderDtlsList = filterProductDelivery(caseHeaderDtlsList);
		CaseStatus caseStatusObj = CaseStatusFactory.newInstance();
		CurrentCaseStatusKey currentCaseStatusKey;
		
		CaseNominee caseNomineeObj = CaseNomineeFactory.newInstance();
		CaseNomineeKey caseNomineeKey = new CaseNomineeKey();
		CaseNomineeDtls caseNomineeDtls;

		double totalSuspendedAmount = 0;
		FinancialComponent financialComponentObj = FinancialComponentFactory
				.newInstance();
		FCstatusCodeCaseID fcstatusCodeCaseID = new FCstatusCodeCaseID();
		Date currentDate = Date.getCurrentDate();
		FrequencyPattern frequencyPattern = new FrequencyPattern();
		for (CaseHeaderDtls caseHeaderDtls : caseHeaderDtlsList.dtls.items()) {
			currentCaseStatusKey = new CurrentCaseStatusKey();
			currentCaseStatusKey.caseID = caseHeaderDtls.caseID;
			

			fcstatusCodeCaseID = new FCstatusCodeCaseID();
			fcstatusCodeCaseID.caseID = caseHeaderDtls.caseID;
			fcstatusCodeCaseID.statusCode = FINCOMPONENTSTATUS.LIVE;
			FinancialComponentDtlsList financialComponentDtlsList = financialComponentObj
					.searchByStatusCaseID(fcstatusCodeCaseID);
			FinancialComponentDtls financialComponentDtls = returnLastFinancialComponentForOpenAndSubmittedCase(financialComponentDtlsList);
			if (financialComponentDtls != null) {
				generateEFTDetail = new MOLSAGenerateEFTDetail();
				generateEFTDetail.isSuspended = true;
				generateEFTDetail.deptCode = Configuration
						.getProperty(EnvVars.EFT_DEPT_CODE);
				generateEFTDetail.staffNumber = MOLSAParticipantHelper
						.returnConcernRoleAlternateID(
								financialComponentDtls.concernRoleID,
								CONCERNROLEALTERNATEID.INSURANCENUMBER);
				caseNomineeKey.caseNomineeID = financialComponentDtls.caseNomineeID;
				caseNomineeDtls = caseNomineeObj.read(caseNomineeKey);
				long concernRoleID = MOLSAParticipantHelper
						.returnConcernRoleIDFromCaseParticipantRoleID(caseNomineeDtls.caseParticipantRoleID);

				generateEFTDetail.fullname_ar = MOLSAParticipantHelper
						.returnConcernRoleName(concernRoleID);
				generateEFTDetail.fullname_en = MOLSAParticipantHelper
						.returnAlternateName(concernRoleID,
								ALTERNATENAMETYPE.ENGLISH);

				generateEFTDetail.currencyCode = Configuration
						.getProperty(EnvVars.ENV_BASECURRENCY);

				frequencyPattern = new FrequencyPattern(
						financialComponentDtls.frequency);
				Date[] dates = frequencyPattern.getAllOccurrences(
						financialComponentDtls.dueDate, currentDate);
				double amount = 0.00;
				int numberOfMonths = dates.length+1;
				amount = financialComponentDtls.amount.getValue()
				* numberOfMonths;

				generateEFTDetail.amount = new Money(amount);
				generateEFTDetailList.add(generateEFTDetail);

			}

		}
		return generateEFTDetailList;
	}
	
	private CaseHeaderDtlsList filterProductDelivery(CaseHeaderDtlsList caseHeaderDtlsList){
		CaseHeaderDtlsList pdcCaseHeaderDtlsList = new CaseHeaderDtlsList();
		for (CaseHeaderDtls caseHeaderDtls : caseHeaderDtlsList.dtls.items()) {
			if(caseHeaderDtls.caseTypeCode.equals(CASETYPECODE.PRODUCTDELIVERY)) {
				pdcCaseHeaderDtlsList.dtls.addRef(caseHeaderDtls);
			}
		}
		return pdcCaseHeaderDtlsList;
	}
			
	/**
	 * Return the latest Closed Financial Component.
	 * 
	 * @param financialComponentDtlsList
	 *            FinancialComponentDtlsList
	 * @return FinancialComponentDtls
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private FinancialComponentDtls returnLastFinancialComponentForOpenAndSubmittedCase(
			FinancialComponentDtlsList financialComponentDtlsList)
			throws AppException, InformationalException {
		FinancialComponentDtls outFinancialComponentDtls = null;
		filterFinancialComponent(financialComponentDtlsList);

		// Sort with respect to Next Processing Date Date
		Collections.sort(financialComponentDtlsList.dtls,
				new Comparator<FinancialComponentDtls>() {
					public int compare(FinancialComponentDtls o1,
							FinancialComponentDtls o2) {
						return o2.dueDate.compareTo(o1.dueDate);
					}
				});

		for (FinancialComponentDtls financialComponentDtls : financialComponentDtlsList.dtls
				.items()) {
			if ( financialComponentDtls.nextProcessingDate.before(Date
							.getCurrentDate()) || financialComponentDtls.nextProcessingDate
							.equals(Date.getCurrentDate())) {
				outFinancialComponentDtls = financialComponentDtls;
				break;
			}
		}
		return outFinancialComponentDtls;
	}
	

	/**
	 * Return the suspended Case Details to the output struct.
	 * 
	 * @return List<MOLSAGenerateEFTDetail>
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private List<MOLSAGenerateEFTDetail> getSupendedCaseDetails()
			throws AppException, InformationalException {
		List<MOLSAGenerateEFTDetail> generateEFTDetailList = new ArrayList<MOLSAGenerateEFTDetail>();
		MOLSAGenerateEFTDetail generateEFTDetail;

		// Suspended Cases Amount
		CaseHeader caseHeaderObj = CaseHeaderFactory.newInstance();
		CaseHeaderByStatusKey caseHeaderByStatusKey = new CaseHeaderByStatusKey();
		caseHeaderByStatusKey.statusCode = CASESTATUS.SUSPENDED;
		CaseHeaderDtlsList caseHeaderDtlsList = caseHeaderObj
				.searchByStatusCode(caseHeaderByStatusKey);
		caseHeaderDtlsList = filterProductDelivery(caseHeaderDtlsList);
		CaseStatus caseStatusObj = CaseStatusFactory.newInstance();
		CurrentCaseStatusKey currentCaseStatusKey;
		
		CaseNominee caseNomineeObj = CaseNomineeFactory.newInstance();
		CaseNomineeKey caseNomineeKey = new CaseNomineeKey();
		CaseNomineeDtls caseNomineeDtls;

		double totalSuspendedAmount = 0;
		FinancialComponent financialComponentObj = FinancialComponentFactory
				.newInstance();
		FCstatusCodeCaseID fcstatusCodeCaseID = new FCstatusCodeCaseID();
		Date currentDate = Date.getCurrentDate();
		FrequencyPattern frequencyPattern = new FrequencyPattern();
		for (CaseHeaderDtls caseHeaderDtls : caseHeaderDtlsList.dtls.items()) {
			currentCaseStatusKey = new CurrentCaseStatusKey();
			currentCaseStatusKey.caseID = caseHeaderDtls.caseID;
			

			fcstatusCodeCaseID = new FCstatusCodeCaseID();
			fcstatusCodeCaseID.caseID = caseHeaderDtls.caseID;
			fcstatusCodeCaseID.statusCode = FINCOMPONENTSTATUS.CLOSED_OUTOFDATE;
			FinancialComponentDtlsList financialComponentDtlsList = financialComponentObj
					.searchByStatusCaseID(fcstatusCodeCaseID);
			FinancialComponentDtls financialComponentDtls = returnLastFinancialComponentForSuspendedCase(financialComponentDtlsList);
			if (financialComponentDtls != null) {
				generateEFTDetail = new MOLSAGenerateEFTDetail();
				generateEFTDetail.isSuspended = true;
				generateEFTDetail.deptCode = Configuration
						.getProperty(EnvVars.EFT_DEPT_CODE);
				generateEFTDetail.staffNumber = MOLSAParticipantHelper
						.returnConcernRoleAlternateID(
								financialComponentDtls.concernRoleID,
								CONCERNROLEALTERNATEID.INSURANCENUMBER);
				caseNomineeKey.caseNomineeID = financialComponentDtls.caseNomineeID;
				caseNomineeDtls = caseNomineeObj.read(caseNomineeKey);
				long concernRoleID = MOLSAParticipantHelper
						.returnConcernRoleIDFromCaseParticipantRoleID(caseNomineeDtls.caseParticipantRoleID);

				generateEFTDetail.fullname_ar = MOLSAParticipantHelper
						.returnConcernRoleName(concernRoleID);
				generateEFTDetail.fullname_en = MOLSAParticipantHelper
						.returnAlternateName(concernRoleID,
								ALTERNATENAMETYPE.ENGLISH);

				generateEFTDetail.currencyCode = Configuration
						.getProperty(EnvVars.ENV_BASECURRENCY);

				frequencyPattern = new FrequencyPattern(
						financialComponentDtls.frequency);
				Date[] dates = frequencyPattern.getAllOccurrences(
						financialComponentDtls.dueDate, currentDate);
				double amount = 0.00;
				int numberOfMonths = dates.length+1;
				amount = financialComponentDtls.amount.getValue()
				* numberOfMonths;
				

				generateEFTDetail.amount = new Money(amount);
				generateEFTDetailList.add(generateEFTDetail);

			}

		}
		return generateEFTDetailList;
	}

	/**
	 * Return the latest Closed Financial Component.
	 * 
	 * @param financialComponentDtlsList
	 *            FinancialComponentDtlsList
	 * @return FinancialComponentDtls
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private FinancialComponentDtls returnLastFinancialComponentForSuspendedCase(
			FinancialComponentDtlsList financialComponentDtlsList)
			throws AppException, InformationalException {
		FinancialComponentDtls outFinancialComponentDtls = null;
		filterFinancialComponent(financialComponentDtlsList);

		// Sort with respect to Expiry Date
		Collections.sort(financialComponentDtlsList.dtls,
				new Comparator<FinancialComponentDtls>() {
					public int compare(FinancialComponentDtls o1,
							FinancialComponentDtls o2) {
						return o2.expiryDate.compareTo(o1.expiryDate);
					}
				});

		for (FinancialComponentDtls financialComponentDtls : financialComponentDtlsList.dtls
				.items()) {
			if (!financialComponentDtls.expiryDate.equals(Date.kZeroDate)
					&& (financialComponentDtls.nextProcessingDate.before(Date
							.getCurrentDate()) || financialComponentDtls.nextProcessingDate
							.equals(Date.getCurrentDate()))) {
				outFinancialComponentDtls = financialComponentDtls;
				break;
			}
		}
		return outFinancialComponentDtls;
	}

	/**
	 * Updates the Payment Instrument Status to Issued.
	 * 
	 * @param paymentInstrumentDtlsList
	 *            PaymentInstrumentDtlsList
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private void updatePaymentInstrumentStatus(
			PaymentInstrumentDtlsList paymentInstrumentDtlsList)
			throws AppException, InformationalException {
		PaymentInstrument paymentInstrumentObj = PaymentInstrumentFactory
				.newInstance();
		EffectiveDateReconcilStatusVersionNo effectiveDateReconcilStatusVersionNo;
		PaymentInstrumentKey paymentInstrumentKey;
		for (PaymentInstrumentDtls paymentInstrumentDtls : paymentInstrumentDtlsList.dtls
				.items()) {
			effectiveDateReconcilStatusVersionNo = new EffectiveDateReconcilStatusVersionNo();
			effectiveDateReconcilStatusVersionNo.versionNo = paymentInstrumentDtls.versionNo;
			effectiveDateReconcilStatusVersionNo.effectiveDate = Date
					.getCurrentDate();
			effectiveDateReconcilStatusVersionNo.reconcilStatusCode = PMTRECONCILIATIONSTATUS.ISSUED;
			paymentInstrumentKey = new PaymentInstrumentKey();
			paymentInstrumentKey.pmtInstrumentID = paymentInstrumentDtls.pmtInstrumentID;
			paymentInstrumentObj.modifyEffectiveDateReconcilStatus(
					paymentInstrumentKey, effectiveDateReconcilStatusVersionNo);

			// Code to send call SMS interface and select a
			// correct message.
			curam.molsa.sms.sl.intf.MOLSASMSUtil molsasmsUtilObj = MOLSASMSUtilFactory
					.newInstance();
			 AppException msg =new AppException(MOLSASMSSERVICE.SALARYINFORMATION);
		     msg.arg(paymentInstrumentDtls.amount);
		     String message=msg.getLocalizedMessage();
		        
			MOLSAConcernRoleListAndMessageTextDetails concernRoleListAndMessageTextDetails = new MOLSAConcernRoleListAndMessageTextDetails();
			// Set the message details.
			concernRoleListAndMessageTextDetails.dtls.smsMessageText = message;
			concernRoleListAndMessageTextDetails.dtls.concernRoleTabbedList = String
					.valueOf(paymentInstrumentDtls.concernRoleID);
			// Pointing to the message template.
			concernRoleListAndMessageTextDetails.dtls.smsMessageType = MOLSASMSMESSAGETEMPLATE.SALARYINFORMATION;
			molsasmsUtilObj.sendSMSDPMode(concernRoleListAndMessageTextDetails);
			invokeNotification(paymentInstrumentDtls.pmtInstrumentID, "paymentNotification");
		}
	}

	/**
	 * Method to invoke Mobility Payment Notification.
	 * 
	 * @param paymentId
	 *          - PaymentInstrument Id
	 * @param apiName
	 *          - method name to invoke
	 * @return
	 */
	private <T> T invokeNotification(long paymentId, String apiName) {
		T handler = null;
		try {

			String handlerClass = Configuration
					.getProperty("dm.notification.service.PaymentNotificationHandlerClass");
			if (handlerClass == null) {
				// assign default implementation.
				return null;
			}
			Class<?> eventClass = Class.forName(handlerClass);
			final T resultObjecct = (T) eventClass.newInstance();
			handler = resultObjecct;
			resultObjecct.getClass().getMethod(apiName, new Class[] { long.class })
					.invoke(resultObjecct, new Object[] { paymentId });
		} catch (InvocationTargetException e) {
			Logger.getLogger(this.getClass()).error(e.getMessage());
		} catch (Throwable e) {
			Logger.getLogger(this.getClass()).error(e.getMessage());
		}
		return handler;
	}

	/**
	 * Populate the general details and return the current Month/Year Details.
	 * 
	 * @param generateEFTDetailList
	 *            MOLSAGenerateEFTDetailList
	 * @return MonthYearDetails
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private MonthYearDetails populateExelGenericDetails(
			MOLSAGenerateEFTDetailList generateEFTDetailList)
			throws AppException, InformationalException {
		String compBankAccountID = Configuration
				.getProperty(EnvVars.EFT_BANKACCOUNTID);
		BankAccountDtls bankAccountDtls = MOLSAFinancialHelper
				.returnBankAccountDetails(Long.parseLong(compBankAccountID));
		BankBranchDtls bankBranchDtls = MOLSAFinancialHelper
				.returnBankBranchDetails(bankAccountDtls.bankBranchID);
		BankDtls bankDtls = MOLSAFinancialHelper
				.returnBankDetails(bankBranchDtls.bankID);
		generateEFTDetailList.bankCode = bankDtls.name;
		generateEFTDetailList.compAccount = CodeTable.getOneItem(MOLSABICCODE.TABLENAME, bankAccountDtls.bic, TransactionInfo.getProgramLocale());

		generateEFTDetailList.compCode = Configuration
				.getProperty(EnvVars.EFT_COMP_CODE);
		generateEFTDetailList.fileDesc = Configuration
				.getProperty(EnvVars.EFT_SAL_CODE);

		String dayOfMonth = Configuration
				.getProperty(EnvVars.ENV_MOLSA_FINANCIAL_PAYMENT_DAY);

		MonthYearDetails monthYearDetails = MOLSAGenerateEFTHelper
				.getMonthYearDetail(Date.getCurrentDate());
		Date dueDate = DateUtil.getISODate(monthYearDetails.year
				+ monthYearDetails.monthCode + dayOfMonth);
		generateEFTDetailList.dueDate = dueDate;
		return monthYearDetails;
	}

	/**
	 * This method will populate the exel details and Generate the Exel.
	 * 
	 * @param generateEFTDetailList
	 *            List<PaymentInstrumentDtls>
	 * @param generateEFTParam
	 *            MOLSAGenerateEFTParam
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */

	private void generateExelForFinance(
			MOLSAGenerateEFTDetailList generateEFTDetailList,
			MOLSAGenerateEFTParam generateEFTParam) throws AppException,
			InformationalException {

		double totalAmount = generateEFTDetailList.totalAmount.getValue();
		MonthYearDetails monthYearDetails = MOLSAGenerateEFTHelper
				.getMonthYearDetail(Date.getCurrentDate());
		List<MOLSAGenerateEFTDetail> generateEFTDetailListForSuspended = getSupendedCaseDetails();
		for (MOLSAGenerateEFTDetail molsaGenerateEFTDetail : generateEFTDetailListForSuspended) {
		  if(molsaGenerateEFTDetail.amount.getValue()>0) {
  			totalAmount += molsaGenerateEFTDetail.amount.getValue();
  			generateEFTDetailList.dtls.addRef(molsaGenerateEFTDetail);
		  }
		}
		List<MOLSAGenerateEFTDetail> generateEFTDetailListForOpenAndSubmitted = getOpenAndSubmittedCaseDetails();
		for (MOLSAGenerateEFTDetail molsaGenerateEFTDetail : generateEFTDetailListForOpenAndSubmitted) {
		  if(molsaGenerateEFTDetail.amount.getValue()>0) {
  			totalAmount += molsaGenerateEFTDetail.amount.getValue();
  			generateEFTDetailList.dtls.addRef(molsaGenerateEFTDetail);
		  }
		}

		LocalisableString remarks = new LocalisableString(
				MOLSABPOGENERATEEFT.REMARKS_CONTENT);
		remarks.arg(monthYearDetails.monthCode + "/" + monthYearDetails.year);
		remarks.arg(totalAmount);
		generateEFTDetailList.remarks = remarks.getMessage();

		MOLSAGenerateEFTHelper.newInstance().generateExel(
				generateEFTDetailList, generateEFTParam,
				MOLSAGenerateEFTHelper.getExelName(false, monthYearDetails));

	}

	/**
	 * This method will populate the exel details and Generate the Exel.
	 * 
	 * @param paymentInstrumentDtlsList
	 *            List<PaymentInstrumentDtls>
	 * @param generateEFTParam
	 *            MOLSAGenerateEFTParam
	 * @return MOLSAGenerateEFTDetailList
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General ExceptionList
	 */
	private MOLSAGenerateEFTDetailList generateExelForBank(
			PaymentInstrumentDtlsList paymentInstrumentDtlsList,
			MOLSAGenerateEFTParam generateEFTParam) throws AppException,
			InformationalException {

		MOLSAGenerateEFTDetailList generateEFTDetailList = new MOLSAGenerateEFTDetailList();

		MonthYearDetails monthYearDetails = populateExelGenericDetails(generateEFTDetailList);

		double totalAmount = 0;

		MOLSAGenerateEFTDetail generateEFTDetail;
		BankAccountDtls bankAccountDtls;
		for (PaymentInstrumentDtls paymentInstrumentDtls : paymentInstrumentDtlsList.dtls
				.items()) {
			generateEFTDetail = new MOLSAGenerateEFTDetail();
			generateEFTDetail.deptCode = Configuration
					.getProperty(EnvVars.EFT_DEPT_CODE);
			generateEFTDetail.staffNumber = MOLSAParticipantHelper
					.returnConcernRoleAlternateID(
							paymentInstrumentDtls.concernRoleID,
							CONCERNROLEALTERNATEID.INSURANCENUMBER);

			generateEFTDetail.fullname_ar = MOLSAParticipantHelper
					.returnConcernRoleName(paymentInstrumentDtls.concernRoleID);
			generateEFTDetail.fullname_en = MOLSAParticipantHelper
					.returnAlternateName(paymentInstrumentDtls.concernRoleID,
							ALTERNATENAMETYPE.ENGLISH);

			bankAccountDtls = MOLSAFinancialHelper
					.returnBankAccountDetails(paymentInstrumentDtls.bankAccountID);
			generateEFTDetail.accountNumber = bankAccountDtls.iban;
			generateEFTDetail.bankSwift = CodeTable.getOneItem(MOLSABICCODE.TABLENAME, bankAccountDtls.bic, TransactionInfo.getProgramLocale());
			generateEFTDetail.currencyCode = Configuration
					.getProperty(EnvVars.ENV_BASECURRENCY);
			generateEFTDetail.amount = paymentInstrumentDtls.amount;
			if(paymentInstrumentDtls.amount.getValue()> 0) {
  			totalAmount += generateEFTDetail.amount.getValue();
  			generateEFTDetailList.dtls.addRef(generateEFTDetail);
			}

		}

		LocalisableString remarks = new LocalisableString(
				MOLSABPOGENERATEEFT.REMARKS_CONTENT);
		remarks.arg(monthYearDetails.monthCode + "/" + monthYearDetails.year);
		remarks.arg(totalAmount);
		generateEFTDetailList.remarks = remarks.getMessage();
		generateEFTDetailList.totalAmount = new Money(totalAmount);

		MOLSAGenerateEFTHelper.newInstance().generateExel(
				generateEFTDetailList, generateEFTParam,
				MOLSAGenerateEFTHelper.getExelName(true, monthYearDetails));
		return generateEFTDetailList;

	}

}