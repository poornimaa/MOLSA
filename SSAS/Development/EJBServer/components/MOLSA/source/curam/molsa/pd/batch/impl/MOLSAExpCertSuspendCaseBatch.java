package curam.molsa.pd.batch.impl;

import java.util.Calendar;
import java.util.StringTokenizer;

import curam.codetable.BATCHPROCESSNAME;
import curam.codetable.CASESTATUS;
import curam.codetable.CASETYPECODE;
import curam.core.impl.BatchStreamHelper;
import curam.core.impl.EnvVars;
import curam.core.sl.infrastructure.assessment.struct.CREOLEBulkCaseChunkReassessmentResult;
import curam.core.struct.BatchProcessChunkDtlsList;
import curam.core.struct.BatchProcessDtls;
import curam.core.struct.BatchProcessingID;
import curam.core.struct.BatchProcessingIDList;
import curam.core.struct.ChunkMainParameters;
import curam.molsa.pd.batch.fact.MOLSAExpCertSuspendCaseBatchStreamFactory;
import curam.struct.CaseIDKey;
import curam.util.dataaccess.CuramValueList;
import curam.util.dataaccess.DynamicDataAccess;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;
import curam.util.resources.Configuration;
import curam.util.resources.Trace;
import curam.util.transaction.TransactionInfo;
import curam.util.type.Date;

/**
 * 
 * This class sets the chunk size and streams for MOLSA Expired Certification
 * Suspend Case Batch.
 * 
 * The case will be suspended by updating case status as �Suspended� when the
 * certification/expected case end date is less than or equal to (<=) to the
 * current date and the case status is �Active�.
 */
public class MOLSAExpCertSuspendCaseBatch extends
		curam.molsa.pd.batch.base.MOLSAExpCertSuspendCaseBatch {

	protected static final int kFirstKeyValue = 1;
	protected final int kChunkSize;
	protected final boolean kDontRunStream;
	protected final int kChunkKeyReadWait;
	protected final int kUnProcessedChunkReadWait;
	protected final boolean kProcessUnProcessedChunks;

	/**
	 * Constructor for the class
	 */
	public MOLSAExpCertSuspendCaseBatch() {

		String chunkSize = Configuration
				.getProperty(EnvVars.ENV_MOLSAEXPCERTSUSPCASE_CHUNK_SIZE);

		if (chunkSize == null) {
			this.kChunkSize = 500;

		} else {
			this.kChunkSize = Integer.parseInt(chunkSize);

		}

		this.kDontRunStream = Configuration
				.getBooleanProperty(EnvVars.ENV_MOLSAEXPCERTSUSPCASE_DONT_RUN_STREAM);

		String chunkKeyReadWait = Configuration
				.getProperty(EnvVars.ENV_MOLSAEXPCERTSUSPCASE_CHUNK_KEY_WAIT_INTERVAL);

		if (chunkKeyReadWait == null) {
			this.kChunkKeyReadWait = 1000;

		} else {
			this.kChunkKeyReadWait = Integer.parseInt(chunkKeyReadWait);

		}

		String unProcessedChunkReadWait = Configuration
				.getProperty(EnvVars.ENV_MOLSAEXPCERTSUSPCASE_UNPROCESSED_CHUNK_WAIT_INTERVAL);

		if (unProcessedChunkReadWait == null) {
			this.kUnProcessedChunkReadWait = 1000;

		} else {
			this.kUnProcessedChunkReadWait = Integer
					.parseInt(unProcessedChunkReadWait);

		}

		this.kProcessUnProcessedChunks = Configuration
				.getBooleanProperty(EnvVars.ENV_MOLSAEXPCERTSUSPCASE_PROCESS_UNPROCESSED_CHUNKS);
	}

	/**
	 * 
	 * This method would send the the details of the number of records processed
	 * and skipped.
	 * 
	 * @param instanceID
	 *            String
	 * @param batchProcessDtls
	 *            BatchProcessDtls
	 * @param processedBatchProcessChunkDtlsList
	 *            BatchProcessChunkDtlsList
	 * @param unprocessedBatchProcessChunkDtlsList
	 *            BatchProcessChunkDtlsList
	 * @return void
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General Exception
	 * 
	 */
	@Override
	public void process() throws AppException, InformationalException {
		BatchStreamHelper batchStreamHelper = new BatchStreamHelper();
		ChunkMainParameters chunkMainParameters = new ChunkMainParameters();
		MOLSAExpCertSuspendCaseBatchWrapper molsaExpCertSuspendCaseBatchWrapper = new MOLSAExpCertSuspendCaseBatchWrapper(
				this);
		curam.molsa.pd.batch.intf.MOLSAExpCertSuspendCaseBatchStream molsaExpCertSuspendCaseBatchStream = MOLSAExpCertSuspendCaseBatchStreamFactory
				.newInstance();
		MOLSAExpCertSuspendCaseBatchStreamWrapper molsaExpCertSuspendCaseBatchStreamWrapper = new MOLSAExpCertSuspendCaseBatchStreamWrapper(
				molsaExpCertSuspendCaseBatchStream);

		// The case will be suspended by updating case status as �Suspended�
		// when the certification/expected case end date is less than or equal
		// to (<=) to the current date
		// and the case status is �Active�.
		
		CuramValueList<CaseIDKey> curamValueList = null;

		Date currentDate = TransactionInfo.getSystemDate();
		Calendar currCalendar = currentDate.getCalendar();
		String expDate = currCalendar.get(Calendar.YEAR) + "-"
				+ (currCalendar.get(Calendar.MONTH) + 1) + "-"
				+ currCalendar.get(Calendar.DAY_OF_MONTH);

		String sql = " SELECT ch.caseID INTO :caseID " 
				+ "FROM CaseHeader ch "
				+ "WHERE ch.caseTypeCode = '" + CASETYPECODE.PRODUCTDELIVERY + "' "
				+ " AND ch.statusCode = '" + CASESTATUS.ACTIVE + "' "
				+ " AND ch.expectedEndDate <= '" + expDate + "' ";

		System.out.println("SQL is: " + sql);

		try {
			curamValueList = DynamicDataAccess.executeNsMulti(CaseIDKey.class,
					null, false, false, sql);
			Trace.kTopLevelLogger
					.info("********   Bulk Expired Certification Suspend Case Chunker. Total Active Cases with Certification Expired for 3 months ===> "
							+ curamValueList.size());
		} catch (Exception e) {
			Trace.kTopLevelLogger
					.info("********  Bulk Expired Certification Suspend Case Chunker. Couldn't read the IC cases to be procesed. See error below ******");
			e.printStackTrace();
		}

		BatchProcessingIDList batchProcessingIDList = new BatchProcessingIDList();
		BatchProcessingID batchProcessingID;

		for (CaseIDKey caseID : curamValueList) {
			batchProcessingID = new BatchProcessingID();
			batchProcessingID.recordID = caseID.caseID;
			batchProcessingIDList.dtls.add(batchProcessingID);
		}

		chunkMainParameters.chunkSize = kChunkSize;
		chunkMainParameters.dontRunStream = kDontRunStream;
		chunkMainParameters.processUnProcessedChunks = kProcessUnProcessedChunks;
		chunkMainParameters.startChunkKey = 1L;
		chunkMainParameters.unProcessedChunkReadWait = kUnProcessedChunkReadWait;
		batchStreamHelper.runChunkMain(BATCHPROCESSNAME.MOLSA_EXPCERTSUSPCASE,
				null, molsaExpCertSuspendCaseBatchWrapper,
				batchProcessingIDList, chunkMainParameters,
				molsaExpCertSuspendCaseBatchStreamWrapper);
	}

	@Override
	public CREOLEBulkCaseChunkReassessmentResult decodeProcessChunkResult(
			String resultString) throws AppException, InformationalException {

		CREOLEBulkCaseChunkReassessmentResult creoleBulkCaseChunkReassessmentResult = new CREOLEBulkCaseChunkReassessmentResult();
		StringTokenizer st = new StringTokenizer(resultString);
		int elementNumber = 0;
		while (st.hasMoreTokens()) {
			++elementNumber;
			switch (elementNumber) {
			case 1:
				creoleBulkCaseChunkReassessmentResult.casesSkippedCount = Integer
						.parseInt(st.nextToken());
				break;

			case 2:
				creoleBulkCaseChunkReassessmentResult.casesProcessedCount = Integer
						.parseInt(st.nextToken());
				break;

			case 3:
				creoleBulkCaseChunkReassessmentResult.casesChangedCount = Integer
						.parseInt(st.nextToken());
				break;
			}

		}

		return creoleBulkCaseChunkReassessmentResult;

	}

	/**
	 * 
	 * This method would send the the details of the number of records processed
	 * and skipped.
	 * 
	 * @param instanceID
	 *            String
	 * @param batchProcessDtls
	 *            BatchProcessDtls
	 * @param processedBatchProcessChunkDtlsList
	 *            BatchProcessChunkDtlsList
	 * @param unprocessedBatchProcessChunkDtlsList
	 *            BatchProcessChunkDtlsList
	 * @return void
	 * @throws AppException
	 *             General Exception
	 * @throws InformationalException
	 *             General Exception
	 * 
	 */
	@Override
	public void sendBatchReport(String instanceID,
			BatchProcessDtls batchProcessDtls,
			BatchProcessChunkDtlsList processedBatchProcessChunkDtlsList,
			BatchProcessChunkDtlsList unprocessedBatchProcessChunkDtlsList)
			throws AppException, InformationalException {

		long totalNumberOfCasesProcessed = 0L;
		long totalNumberOfCasesSkipped = 0L;

		for (int i = 0; i < processedBatchProcessChunkDtlsList.dtls.size(); ++i) {
			CREOLEBulkCaseChunkReassessmentResult creoleBulkCaseChunkReassessmentResult = 
					decodeProcessChunkResult(((curam.core.struct.BatchProcessChunkDtls) processedBatchProcessChunkDtlsList.dtls.item(i)).resultSummary);
			totalNumberOfCasesProcessed += creoleBulkCaseChunkReassessmentResult.casesProcessedCount;
			totalNumberOfCasesSkipped += creoleBulkCaseChunkReassessmentResult.casesSkippedCount;

		}

		System.out.println("TOTAL NUMBER OF CASES PROCESSESED "
				+ totalNumberOfCasesProcessed);
		System.out.println("TOTAL NUMBER OF CASES SKIPPED "
				+ totalNumberOfCasesSkipped);

	}

}
