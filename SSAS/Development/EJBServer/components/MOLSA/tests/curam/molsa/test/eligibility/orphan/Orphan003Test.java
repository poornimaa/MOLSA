package curam.molsa.test.eligibility.orphan;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;

import com.google.inject.Inject;

import curam.application.impl.Application;
import curam.codetable.ADDRESSLAYOUTTYPE;
import curam.codetable.CITIZENSHIPCODE;
import curam.codetable.COUNTRY;
import curam.codetable.FREQUENCYCODE;
import curam.codetable.GENDER;
import curam.codetable.INCOMETYPECODE;
import curam.codetable.MARITALSTATUS;
import curam.codetable.NATIONALITY;
import curam.codetable.RELATIONSHIPTYPECODE;
import curam.codetable.SCHOOLTYPE;
import curam.codetable.VERIFICATIONSTATUS;
import curam.codetable.impl.APPLICANTROLEEntry;
import curam.codetable.impl.CASESTATUSEntry;
import curam.core.facade.struct.SubmitForApprovalKey;
import curam.core.fact.CachedCaseHeaderFactory;
import curam.core.intf.CachedCaseHeader;
import curam.core.sl.entity.struct.CaseKeyStruct;
import curam.core.sl.infrastructure.assessment.impl.DeterminationInterval;
import curam.core.struct.CaseHeaderReadmultiDetails1;
import curam.core.struct.CaseHeaderReadmultiDetails1List;
import curam.core.struct.CaseHeaderReadmultiKey1;
import curam.core.struct.CaseKey;
import curam.core.struct.PersonRegistrationDetails;
import curam.creole.value.Interval;
import curam.creole.value.Timeline;
import curam.molsa.codetable.ABSENTFATHER;
import curam.molsa.codetable.EDUCATION;
import curam.molsa.codetable.EDUCATIONLEVEL;
import curam.molsa.codetable.EXPENSE;
import curam.molsa.codetable.RESIDENCY;
import curam.molsa.test.base.CERScenarioTestBase;
import curam.molsa.test.base.HouseholdUnit;
import curam.molsa.test.base.ParticipantTestDetails;
import curam.molsa.test.framework.TestHelper;
import curam.piwrapper.caseheader.impl.CaseHeaderDAO;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;
import curam.util.type.Date;
import curam.verification.facade.infrastructure.fact.VerificationApplicationFactory;
import curam.verification.facade.infrastructure.intf.VerificationApplication;
import curam.verification.facade.infrastructure.struct.CreateVerificaitonItemProvidedDetails;
import curam.verification.facade.infrastructure.struct.ListVerificationItemNameAndLevelDetails;
import curam.verification.facade.infrastructure.struct.VDIEDLinkKey;
import curam.verification.sl.infrastructure.fact.VerificationFactory;
import curam.verification.sl.infrastructure.fact.VerificationItemProvidedFactory;
import curam.verification.sl.infrastructure.intf.Verification;
import curam.verification.sl.infrastructure.intf.VerificationItemProvided;
import curam.verification.sl.infrastructure.struct.CaseEvidenceVerificationDetails;
import curam.verification.sl.infrastructure.struct.CaseEvidenceVerificationDetailsList;
import curam.verification.sl.infrastructure.struct.OutstandingIndicator;
/**
 * Test class used to test the end to end flow of widow product delivery case.
 */

public class Orphan003Test extends CERScenarioTestBase {

	@Inject
	private TestHelper testHelper;
	
	@Inject
	private CaseHeaderDAO caseHeaderDAO;
	
	/**
	   * Default constructor for the class.
	   *  @param arg0
	   *  constructor
	   */
	
	public Orphan003Test(String arg0) {
		super(arg0);
		
	}
	/**
	   * Test Case used to test the scenario from person registration to product delivery case activation.
	 * @return 
	   * 
	   * @throws AppException
	   *           Generic Exception Signature.
	   * 
	   * @throws InformationalException
	   *           Generic Exception Signature.
	   */

	@Test
	public void testScenario() throws AppException, InformationalException {
		  testHelper.simulateLogin("molsamanager");
   testScenario(Date.getCurrentDate());

		}

	  /**
	  * Adds the new applicant to the application.
	  * 
	  *  @param application
	  *     Contains a application details.
	  * 
	  * @throws AppException
	  *           Generic Exception Signature.
	  * 
	  * @throws InformationalException
	  *           Generic Exception Signature.
	  */
	@Override
	protected void addIntakeApplicant(Application application)
			throws AppException, InformationalException {
		// TODO Auto-generated method stub
		createIntakeApplicant(application.getID(), ASIFA_UNIQUE_NAME,
				APPLICANTROLEEntry.PRIMARY_APPLICANT);
		
		createIntakeApplicant(application.getID(), ASMA_UNIQUE_NAME,
				APPLICANTROLEEntry.NON_PRIMARY_APPLICANT);
		
		
	}
	 /**
	  * Adds the required evidences to make the client eligible for Widow product delivery benefit.
	  * 
	  *    * @param caseKey
	  *      Contains a case identifier.
	  * @throws AppException
	  *           Generic Exception Signature.
	  * 
	  * @throws InformationalException
	  *           Generic Exception Signature.
	  */

	@Override
	protected void addEvidence(CaseKey caseKey) throws AppException,
			InformationalException {
		long participantid = getParticipantRoleID(ASIFA_UNIQUE_NAME).participantRoleID;
		long caseParticipantRoleID = getCaseParticipantRoleID(ASIFA_UNIQUE_NAME).caseParticipantRoleID;
		long siblingparticipantid = getParticipantRoleID(ASMA_UNIQUE_NAME).participantRoleID;
		long siblingcaseParticipantRoleID = getCaseParticipantRoleID(ASMA_UNIQUE_NAME).caseParticipantRoleID;
		long apCPRID = getCaseParticipantRoleID(MOHAMMED_UNIQUE_NAME).caseParticipantRoleID;
		
		
		Date currentDate = Date.getCurrentDate();
		
		createHouseholdMemberEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		createHouseholdMemberEvidence(caseKey, siblingparticipantid,
				siblingcaseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		
		
		createBirthAndDeathEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, getDate(1, 1, 1998));
		createBirthAndDeathEvidence(caseKey, siblingparticipantid,
				siblingcaseParticipantRoleID, currentDate, getDate(1, 1, 2013));
		
		
		
		
		
		createMaritalStatusEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, MARITALSTATUS.SINGLE);
		createMaritalStatusEvidence(caseKey, siblingparticipantid,
				siblingcaseParticipantRoleID, currentDate, MARITALSTATUS.SINGLE);
		
		
		
		
		
		createGenderEvidence(caseKey,
				participantid,caseParticipantRoleID,
				currentDate,GENDER.FEMALE);
		createGenderEvidence(caseKey,
				siblingparticipantid,
				siblingcaseParticipantRoleID,
				currentDate,GENDER.FEMALE);
		
		
		
		createHeadOfHouseholdEvidence(caseKey,
				participantid,caseParticipantRoleID,
				currentDate);
		

		createHouseholdRelationshipEvidence(caseKey,
				participantid,caseParticipantRoleID,
				siblingcaseParticipantRoleID,currentDate,
				RELATIONSHIPTYPECODE.SIBLING);
		createAbsentPersonEvidence(caseKey, participantid, caseParticipantRoleID, apCPRID, getDate(1, 1, 2012), ABSENTFATHER.DECEASED, "12345678915");
		createAbsentPersonEvidence(caseKey, siblingparticipantid, siblingcaseParticipantRoleID, apCPRID, getDate(1, 1, 2012), ABSENTFATHER.DECEASED, "12345678915");
		 createEducationEvidence(caseKey,
					participantid,caseParticipantRoleID,
					currentDate,EDUCATION.ENROLLED,
					EDUCATIONLEVEL.SECONDARY); 
	}
	

	/**
	 * Set the details of the claimant to be registered.
	 * 
	 * @param customerRegistrationDetails
	 *            The registration details of the claimant.
	 * 
	 * @throws AppException
	 * Generic Exception Signature.
	 * 
	 * @throws InformationalException
	 * Generic Exception Signature.
	 */
	
	protected void setClaimantRegistrationDetails(
			final PersonRegistrationDetails customerRegistrationDetails)
			throws AppException, InformationalException {
		final Date claimDate = getClaimDate();

		customerRegistrationDetails.firstForename = ASIFA_UNIQUE_NAME;
		customerRegistrationDetails.surname = SULTANA_SURNAME;
		customerRegistrationDetails.dateOfBirth = getDate(1, 1, 1998);
		customerRegistrationDetails.registrationDate = claimDate;

		customerRegistrationDetails.sex = GENDER.FEMALE;
		customerRegistrationDetails.nationality = NATIONALITY.QATARI;
		customerRegistrationDetails.birthCountry = COUNTRY.QATAR;
		customerRegistrationDetails.currentMaritalStatus = MARITALSTATUS.SINGLE;
		customerRegistrationDetails.addressData = ADDRESS_DATA;
		customerRegistrationDetails.addressType = ADDRESSLAYOUTTYPE.US;
		
		

	}
	

	@Override
	protected void addCaseMember(Application application) throws AppException,
			InformationalException {
		
		Date currentDate = Date.getCurrentDate();
		PersonRegistrationDetails registrationIDDetails = new  PersonRegistrationDetails();
        registrationIDDetails.currentMaritalStatus = MARITALSTATUS.SINGLE;
        registrationIDDetails.dateOfBirth = getDate(1, 1, 2013);
        registrationIDDetails.addressData = ADDRESS_DATA;
        registrationIDDetails.nationality = NATIONALITY.QATARI;
        registrationIDDetails.firstForename = ASMA_UNIQUE_NAME;
        registrationIDDetails.surname = SULTANA_SURNAME;
        registrationIDDetails.sex=GENDER.FEMALE;
        registrationIDDetails.registrationDate=currentDate;
          registerPersonAndAddToCase(application.getCaseID(),registrationIDDetails,ASMA_UNIQUE_NAME);
          
          PersonRegistrationDetails registrationIDDetails1 = new  PersonRegistrationDetails();
          registrationIDDetails1.currentMaritalStatus = MARITALSTATUS.SINGLE;
          registrationIDDetails1.dateOfBirth = getDate(1, 1, 1970);
          registrationIDDetails1.addressData = ADDRESS_DATA;
          registrationIDDetails1.nationality = NATIONALITY.QATARI;
          registrationIDDetails1.firstForename = MOHAMMED_UNIQUE_NAME;
          registrationIDDetails1.surname = HAMEED_SURNAME;
          registrationIDDetails1.sex=GENDER.MALE;
          registrationIDDetails1.registrationDate=currentDate;
            registerPersonAndAddToCase(application.getCaseID(),registrationIDDetails1,MOHAMMED_UNIQUE_NAME);
            
	}
	
	@Override
	protected void checkPDEligibilityResult(
			Timeline<? extends DeterminationInterval> determination) {
		super.checkPDEligibilityResult(determination);
	}

	@Override
	protected List<HouseholdUnit> getExpectedHouseholdUnits()
			throws AppException, InformationalException {

		List<HouseholdUnit> householdUnitList = new ArrayList<HouseholdUnit>();
		List<Long> mandatoryMembers = new ArrayList<Long>();
		mandatoryMembers
				.add(getCaseParticipantRoleID(ASIFA_UNIQUE_NAME).caseParticipantRoleID);
		Calendar calendar = Date.getCurrentDate().getCalendar();
		calendar.add(Calendar.MONTH, 13);
		calendar.set(Calendar.DATE, 1);
		List<Interval<Boolean>> eligibilityIntervals = new ArrayList<Interval<Boolean>>();
		eligibilityIntervals.add(new Interval<Boolean>(null, false));

		eligibilityIntervals.add(new Interval<Boolean>(Date.getCurrentDate(),
				true));
		eligibilityIntervals.add(new Interval<Boolean>(new Date(calendar),
				false));

		HouseholdUnit householdUnit = new HouseholdUnit(mandatoryMembers,  new ArrayList<Long>(),
				(long) 45010, new Timeline<Boolean>(eligibilityIntervals));
		householdUnitList.add(householdUnit);
		
		//Unit 2
		
		List<Long> mandatoryMembers1 = new ArrayList<Long>();
		mandatoryMembers1
				.add(getCaseParticipantRoleID(ASMA_UNIQUE_NAME).caseParticipantRoleID);
		Calendar calendar1 = Date.getCurrentDate().getCalendar();
		calendar1.add(Calendar.MONTH, 13);
		calendar1.set(Calendar.DATE, 1);
		List<Interval<Boolean>> eligibilityIntervals1 = new ArrayList<Interval<Boolean>>();
		eligibilityIntervals1.add(new Interval<Boolean>(null, false));

		eligibilityIntervals1.add(new Interval<Boolean>(Date.getCurrentDate(),
				true));
		eligibilityIntervals1.add(new Interval<Boolean>(new Date(calendar),
				false));

		HouseholdUnit householdUnit1 = new HouseholdUnit(mandatoryMembers1,  new ArrayList<Long>(),
				(long) 45010, new Timeline<Boolean>(eligibilityIntervals1));
		householdUnitList.add(householdUnit1);
		
		return householdUnitList;
	}
	/**
	   * Checks whether the COC  is applicable or not.
	   *  
	   * @return boolean
	   */
	  public boolean isCOCApplicable() {
	    return false;
	  }
	  
	  /**
	   * Perform COC changes.
	   * 
	   * @param caseKey
	   *        case identifier.
	   * @throws InformationalException
	   *        Generic Exception Signature
	   * @throws AppException
	   *        Generic Exception Signature
	   */
	  protected void performCOC(final CaseKey caseKey) throws AppException, InformationalException {

	    final String citizenship = CITIZENSHIPCODE.QATARI;
	    final String residency = RESIDENCY.YES;
	    Date currentDate = Date.getCurrentDate();

	    long participantid = getParticipantRoleID(ASIFA_UNIQUE_NAME).participantRoleID;
	    long casePartcipantRoleID = getCaseParticipantRoleID(ASIFA_UNIQUE_NAME).caseParticipantRoleID;
	    long siblingparticipantid = getParticipantRoleID(ASMA_UNIQUE_NAME).participantRoleID;
		long siblingcaseParticipantRoleID = getCaseParticipantRoleID(ASMA_UNIQUE_NAME).caseParticipantRoleID;

		
	    addVerifications(caseKey);
	    createHouseholdMemberEvidence(caseKey, participantid, casePartcipantRoleID, currentDate, CITIZENSHIPCODE.QATARI, RESIDENCY.YES);

	    createIncomeEvidence(caseKey,participantid,
	    		casePartcipantRoleID,getDate(1, 1, 2013),
				INCOMETYPECODE.OtherHouseholdPaidEmployment,FREQUENCYCODE.MONTHLY,200);
		
	    createIncomeEvidence(caseKey,participantid,
	    		casePartcipantRoleID,getDate(1, 1, 2013),
				INCOMETYPECODE.INHERITANCE,FREQUENCYCODE.MONTHLY,2000);
	    
	    
	    
	    addVerifications(caseKey);

	    CachedCaseHeader cachedCaseHeaderObj = CachedCaseHeaderFactory.newInstance();
	    CaseHeaderReadmultiKey1 paramCaseHeaderReadmultiKey = new CaseHeaderReadmultiKey1();

	    paramCaseHeaderReadmultiKey.integratedCaseID = caseKey.caseID;
	    CaseHeaderReadmultiDetails1List caseHeaderReadmultiDetails1List = ((curam.core.impl.CachedCaseHeader) cachedCaseHeaderObj)
	        .searchByIntegratedCaseID(paramCaseHeaderReadmultiKey);
	    CaseHeaderReadmultiDetails1 caseHeaderReadmultiDetails1 = caseHeaderReadmultiDetails1List.dtls.get(0);

	    evidenceControllerObj.applyAllChanges(caseKey);

	    // Check the status of the PDC Case after apply changes it should be "OPEN".
	    assertEquals(CASESTATUSEntry.OPEN.getCode(), caseHeaderDAO.get(caseHeaderReadmultiDetails1.caseID).getStatus().getCode());
	  }
	@Override
	protected void preAssertionOnCase(CaseKey caseKey) throws AppException,
			InformationalException {
		// TODO Auto-generated method stub
		
	}
	@Override
	protected void postAssertionOnCase(CaseKey caseKey) throws AppException,
			InformationalException {
		// TODO Auto-generated method stub
		
	}
	
	
	protected void addPDCVerification(final SubmitForApprovalKey approvalKey)
			throws AppException, InformationalException {

		CreateVerificaitonItemProvidedDetails details = new CreateVerificaitonItemProvidedDetails();

		final VerificationApplication verificationApplicationObj = VerificationApplicationFactory
				.newInstance();

		VerificationItemProvided verificationItemProvidedObj = VerificationItemProvidedFactory
				.newInstance();
		final Verification verificationObj = VerificationFactory.newInstance();
		
		final OutstandingIndicator outstandingIndicator = new OutstandingIndicator();

	    outstandingIndicator.verificationStatus = VERIFICATIONSTATUS.NOTVERIFIED;

	    final CaseKeyStruct caseKeyStruct = new CaseKeyStruct();

	    caseKeyStruct.caseID = approvalKey.caseID;

		for (int i = 0; i < participantTestDetailsList.size(); i++) {

			ParticipantTestDetails participantTestDetails = (ParticipantTestDetails) participantTestDetailsList
					.get(i);


			final CaseEvidenceVerificationDetailsList participantList = verificationObj
					.listCaseVerificationDetails(
						      caseKeyStruct, outstandingIndicator);
			for (final CaseEvidenceVerificationDetails verificationDetails : participantList.dtls) {
				details = new CreateVerificaitonItemProvidedDetails();

				details.dtls.itemDtls.caseID = approvalKey.caseID;
				details.dtls.itemDtls.caseParticipantConcernRoleID = participantTestDetails.participantRoleID;

				details.dtls.createDtls.dateReceived = Date.getCurrentDate();
				details.dtls.createDtls.VDIEDLinkID = verificationDetails.vDIEDLinkID;

				final VDIEDLinkKey vDIEDLinkKey = new VDIEDLinkKey();
				vDIEDLinkKey.dtls.VDIEDLinkID = verificationDetails.vDIEDLinkID;

				final ListVerificationItemNameAndLevelDetails listVerificationItemNameAndLevelDetails = verificationApplicationObj
						.readAllActiveVerificationItemNameAndLevel(vDIEDLinkKey);

				details.dtls.createDtls.verificationItemUtilizationID = listVerificationItemNameAndLevelDetails.listDtls.dtls
						.get(0).code;
				verificationItemProvidedObj
						.createVerificationItemProvided(details.dtls);

			}

		}

	}
	

}
