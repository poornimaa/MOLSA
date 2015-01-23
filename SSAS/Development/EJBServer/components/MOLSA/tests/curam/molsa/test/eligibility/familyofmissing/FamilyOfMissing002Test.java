
package curam.molsa.test.eligibility.familyofmissing;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
import curam.codetable.impl.APPLICANTROLEEntry;
import curam.codetable.impl.CASESTATUSEntry;
import curam.core.facade.fact.IntegratedCaseFactory;
import curam.core.facade.intf.IntegratedCase;
import curam.core.facade.intf.ProductDelivery;
import curam.core.facade.struct.ActivateCaseKey_fo;
import curam.core.facade.struct.CertificationCaseIDKey;
import curam.core.facade.struct.ICProductDeliveryDetails;
import curam.core.facade.struct.ICProductDetails;
import curam.core.facade.struct.IntegratedCaseIDKey;
import curam.core.facade.struct.ListICAllCasesDetails;
import curam.core.facade.struct.ListICProductDeliveryCertDetailsAndVersionNo;
import curam.core.facade.struct.ListICProductDeliveryDetails;
import curam.core.facade.struct.ReadIntegratedCaseDetails1;
import curam.core.facade.struct.SubmitForApprovalKey;
import curam.core.fact.CachedCaseHeaderFactory;
import curam.core.fact.CaseHeaderFactory;
import curam.core.intf.CachedCaseHeader;
import curam.core.sl.infrastructure.assessment.impl.DeterminationInterval;
import curam.core.sl.infrastructure.impl.CalenderConst;
import curam.core.sl.infrastructure.struct.EIEvidenceKey;
import curam.core.struct.CaseAndConcernSummaryDetails;
import curam.core.struct.CaseHeaderDtls;
import curam.core.struct.CaseHeaderKey;
import curam.core.struct.CaseHeaderReadmultiDetails1;
import curam.core.struct.CaseHeaderReadmultiDetails1List;
import curam.core.struct.CaseHeaderReadmultiKey1;
import curam.core.struct.CaseKey;
import curam.core.struct.PersonRegistrationDetails;
import curam.creole.value.Interval;
import curam.creole.value.Timeline;
import curam.molsa.codetable.ABSENTFATHER;
import curam.molsa.codetable.EDUCATION;
import curam.molsa.codetable.EXPENSE;
import curam.molsa.codetable.MOLSABENEFITTYPE;
import curam.molsa.codetable.RESIDENCY;
import curam.molsa.core.facade.fact.MOLSAProductDeliveryFactory;
import curam.molsa.core.facade.intf.MOLSAProductDelivery;
import curam.molsa.test.util.MOLSAUnauthenticatedUserHelper;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;
import curam.util.transaction.TransactionInfo;
import curam.util.transaction.TransactionInfo.TransactionType;
import curam.util.type.Date;
import curam.molsa.test.base.CERScenarioTestBase;
import curam.molsa.test.base.HouseholdUnit;
import curam.molsa.test.framework.TestHelper;
import curam.piwrapper.caseheader.impl.CaseHeader;
import curam.piwrapper.caseheader.impl.CaseHeaderDAO;
/**
 * Test class used to test the end to end flow of widow product delivery case.
 */

public class FamilyOfMissing002Test extends CERScenarioTestBase {

	@Inject
	private TestHelper testHelper;
	
	@Inject
	private CaseHeaderDAO caseHeaderDAO;
	
	/**
	   * Default constructor for the class.
	   *  @param arg0
	   *  constructor
	   */
	
	public FamilyOfMissing002Test(String arg0) {
		super(arg0);
		// TODO Auto-generated constructor stub
	}
	/**
	   * Test Case used to test the scenario from person registration to product delivery case activation.
	   * 
	   * @throws AppException
	   *           Generic Exception Signature.
	   * 
	   * @throws InformationalException
	   *           Generic Exception Signature.
	   */

	
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
		createIntakeApplicant(application.getID(), FIRDOZ_UNIQUE_NAME,
				APPLICANTROLEEntry.PRIMARY_APPLICANT);
		createIntakeApplicant(application.getID(), ASIFA_UNIQUE_NAME,
				APPLICANTROLEEntry.NON_PRIMARY_APPLICANT);
		createIntakeApplicant(application.getID(), FATHIMA_UNIQUE_NAME,
				APPLICANTROLEEntry.NON_PRIMARY_APPLICANT);
		createIntakeApplicant(application.getID(), MOHAMMED_UNIQUE_NAME,
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
		// TODO Auto-generated method stub
		long participantid = getParticipantRoleID(FIRDOZ_UNIQUE_NAME).participantRoleID;
		long caseParticipantRoleID = getCaseParticipantRoleID(FIRDOZ_UNIQUE_NAME).caseParticipantRoleID;
		long sisterwifeparticipantid = getParticipantRoleID(FATHIMA_UNIQUE_NAME).participantRoleID;
		long sisterwifecaseParticipantRoleID = getCaseParticipantRoleID(FATHIMA_UNIQUE_NAME).caseParticipantRoleID;
		long childparticipantid = getParticipantRoleID(ASIFA_UNIQUE_NAME).participantRoleID;
		long childcaseParticipantRoleID = getCaseParticipantRoleID(ASIFA_UNIQUE_NAME).caseParticipantRoleID;
		long prisionedparticipantid = getParticipantRoleID(MOHAMMED_UNIQUE_NAME).participantRoleID;
		long prisionedcaseParticipantRoleID = getCaseParticipantRoleID(MOHAMMED_UNIQUE_NAME).caseParticipantRoleID;
		
		
	
		int incomeamount=2000;
		int rentamount=500;
		int amount=500;
		Date currentDate = Date.getCurrentDate();
		createHouseholdMemberEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		createHouseholdMemberEvidence(caseKey, sisterwifeparticipantid,
				sisterwifecaseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		createHouseholdMemberEvidence(caseKey, childparticipantid,
				childcaseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		createHouseholdMemberEvidence(caseKey, prisionedparticipantid,
				prisionedcaseParticipantRoleID, currentDate, CITIZENSHIPCODE.QATARI,
				RESIDENCY.YES);
		
		
		createBirthAndDeathEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, getDate(1, 1, 1980));
		createBirthAndDeathEvidence(caseKey, sisterwifeparticipantid,
				sisterwifecaseParticipantRoleID, currentDate, getDate(1, 1, 1984));
		createBirthAndDeathEvidence(caseKey, childparticipantid,
				childcaseParticipantRoleID, currentDate, getDate(1, 1, 1995));
		createBirthAndDeathEvidence(caseKey, prisionedparticipantid,
				prisionedcaseParticipantRoleID, currentDate, getDate(1, 1, 1974));
		
		
		
		createMaritalStatusEvidence(caseKey, participantid,
				caseParticipantRoleID, currentDate, MARITALSTATUS.MARRIED);
		createMaritalStatusEvidence(caseKey, sisterwifeparticipantid,
				sisterwifecaseParticipantRoleID, currentDate, MARITALSTATUS.MARRIED);
		createMaritalStatusEvidence(caseKey,childparticipantid,
				childcaseParticipantRoleID, currentDate, MARITALSTATUS.SINGLE);
		createMaritalStatusEvidence(caseKey, prisionedparticipantid,
				prisionedcaseParticipantRoleID, currentDate, MARITALSTATUS.MARRIED);
		
		createGenderEvidence(caseKey,
				participantid,caseParticipantRoleID,
				currentDate,GENDER.FEMALE);
		createGenderEvidence(caseKey,
				sisterwifeparticipantid,sisterwifecaseParticipantRoleID,
				currentDate,GENDER.FEMALE);
		createGenderEvidence(caseKey,
				childparticipantid,
				childcaseParticipantRoleID,
				currentDate,GENDER.FEMALE);
		createGenderEvidence(caseKey,
				prisionedparticipantid,
				prisionedcaseParticipantRoleID,
				currentDate,GENDER.MALE);
		
		createHeadOfHouseholdEvidence(caseKey,
				participantid,caseParticipantRoleID,
				currentDate);
		
		createIncomeEvidence(caseKey, participantid,
				caseParticipantRoleID,getDate(10, 1, 2013),
				INCOMETYPECODE.INHERITANCE,FREQUENCYCODE.MONTHLY,incomeamount);
		
		createExpenseEvidence(caseKey,
				participantid,caseParticipantRoleID,
				getDate(1, 1, 2014),EXPENSE.RESIDENTIAL,FREQUENCYCODE.MONTHLY,rentamount);
		
		createHouseholdRelationshipEvidence(caseKey,
				participantid,caseParticipantRoleID,
				sisterwifecaseParticipantRoleID,getDate(1, 1, 2000),
				RELATIONSHIPTYPECODE.SISTERWIFE);
		createHouseholdRelationshipEvidence(caseKey,
				participantid,caseParticipantRoleID,
				childcaseParticipantRoleID,getDate(1, 1, 1998),
				RELATIONSHIPTYPECODE.CHILD);
		createHouseholdRelationshipEvidence(caseKey,
				sisterwifeparticipantid,sisterwifecaseParticipantRoleID,
				childcaseParticipantRoleID,getDate(1, 1, 1998),
				RELATIONSHIPTYPECODE.UNRELATED);
		
		
	 createAbsentFatherEvidence(caseKey,
				participantid,
				caseParticipantRoleID,prisionedparticipantid,
				prisionedcaseParticipantRoleID,getDate(1, 8, 2014),
				ABSENTFATHER.MISSING);
		
	 createAbsentFatherEvidence(caseKey,
				childparticipantid,
				childcaseParticipantRoleID,prisionedparticipantid,
				prisionedcaseParticipantRoleID,getDate(1, 8, 2014),
				ABSENTFATHER.MISSING);
	
	 createAbsentFatherEvidence(caseKey,
			 sisterwifeparticipantid,sisterwifecaseParticipantRoleID,prisionedparticipantid,
				prisionedcaseParticipantRoleID,getDate(1, 8, 2014),
				ABSENTFATHER.MISSING);
	
		
		
		
		createAdditionalBenefitEvidence(caseKey, participantid, caseParticipantRoleID,
		        currentDate,amount,MOLSABENEFITTYPE.EID);
		
		
		
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

		customerRegistrationDetails.firstForename = FIRDOZ_UNIQUE_NAME;
		customerRegistrationDetails.surname = SULTANA_SURNAME;
		customerRegistrationDetails.dateOfBirth = getDate(1, 1, 1980);
		customerRegistrationDetails.registrationDate = claimDate;

		customerRegistrationDetails.sex = GENDER.FEMALE;
		customerRegistrationDetails.nationality = NATIONALITY.QATARI;
		customerRegistrationDetails.birthCountry = COUNTRY.QATAR;
		customerRegistrationDetails.currentMaritalStatus = MARITALSTATUS.MARRIED;
		customerRegistrationDetails.addressData = ADDRESS_DATA;
		customerRegistrationDetails.addressType = ADDRESSLAYOUTTYPE.US;

	}
	

	@Override
	protected void addCaseMember(Application application) throws AppException,
			InformationalException {
		// TODO Auto-generated method stub
		Date currentDate = Date.getCurrentDate();
		PersonRegistrationDetails registrationIDDetails = new  PersonRegistrationDetails();
        registrationIDDetails.currentMaritalStatus = MARITALSTATUS.SINGLE;
        registrationIDDetails.dateOfBirth = getDate(1, 1, 1995);
        registrationIDDetails.addressData = ADDRESS_DATA;
        registrationIDDetails.nationality = NATIONALITY.QATARI;
        registrationIDDetails.firstForename = ASIFA_UNIQUE_NAME;
        registrationIDDetails.surname = SULTANA_SURNAME;
        registrationIDDetails.sex=GENDER.FEMALE;
        registrationIDDetails.registrationDate=currentDate;
       
        registerPersonAndAddToCase(application.getCaseID(),registrationIDDetails,ASIFA_UNIQUE_NAME);
		
        PersonRegistrationDetails registrationIDDetails1 = new  PersonRegistrationDetails();
        registrationIDDetails1.currentMaritalStatus = MARITALSTATUS.MARRIED;
        registrationIDDetails1.dateOfBirth = getDate(1, 1, 1984);
        registrationIDDetails1.addressData = ADDRESS_DATA;
        registrationIDDetails1.nationality = NATIONALITY.QATARI;
        registrationIDDetails1.firstForename = FATHIMA_UNIQUE_NAME;
        registrationIDDetails1.surname = SULTANA_SURNAME;
        registrationIDDetails1.sex=GENDER.FEMALE;
        registrationIDDetails1.registrationDate=currentDate;
       
        registerPersonAndAddToCase(application.getCaseID(),registrationIDDetails1,FATHIMA_UNIQUE_NAME);
        
        PersonRegistrationDetails registrationIDDetails2 = new  PersonRegistrationDetails();
        registrationIDDetails2.currentMaritalStatus = MARITALSTATUS.MARRIED;
        registrationIDDetails2.dateOfBirth = getDate(1, 1, 1974);
        registrationIDDetails2.addressData = ADDRESS_DATA;
        registrationIDDetails2.nationality = NATIONALITY.QATARI;
        registrationIDDetails2.firstForename = MOHAMMED_UNIQUE_NAME;
        registrationIDDetails2.surname = SULTANA_SURNAME;
        registrationIDDetails2.sex=GENDER.MALE;
        registrationIDDetails2.registrationDate=currentDate;
       
        registerPersonAndAddToCase(application.getCaseID(),registrationIDDetails2,MOHAMMED_UNIQUE_NAME);
        
	}
	
	
	@Override
	protected void checkPDEligibilityResult(
			Timeline<? extends DeterminationInterval> determination) {
		super.checkPDEligibilityResult(determination);
	}

	@Override
	protected List<HouseholdUnit> getExpectedHouseholdUnits()
			throws AppException, InformationalException {
		// TODO Auto-generated method stub
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
				(long) 45003, new Timeline<Boolean>(eligibilityIntervals));
		householdUnitList.add(householdUnit);
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

	    int  incomeamount=1500;
	    int incomeamount1=8500;
	   	    long participantid = getParticipantRoleID(FIRDOZ_UNIQUE_NAME).participantRoleID;
	   	    long casePartcipantRoleID = getCaseParticipantRoleID(FIRDOZ_UNIQUE_NAME).caseParticipantRoleID;
	   	    long sisterwifeparticipantid = getParticipantRoleID(FATHIMA_UNIQUE_NAME).participantRoleID;
	   		long sisterwifecaseParticipantRoleID = getCaseParticipantRoleID(FATHIMA_UNIQUE_NAME).caseParticipantRoleID;

	   	    addVerifications(caseKey);
	   	    
	   	    createHouseholdMemberEvidence(caseKey, participantid, casePartcipantRoleID, currentDate, CITIZENSHIPCODE.QATARI, RESIDENCY.YES);
	   	    createIncomeEvidence(caseKey, participantid,
	   	    		casePartcipantRoleID,getDate(1, 1, 2013),INCOMETYPECODE.OtherHouseholdPaidEmployment,FREQUENCYCODE.MONTHLY,incomeamount);
	   	    createIncomeEvidence(caseKey, sisterwifeparticipantid,
	   	    		sisterwifecaseParticipantRoleID,getDate(1, 1, 2013),INCOMETYPECODE.INHERITANCE,FREQUENCYCODE.MONTHLY,incomeamount1);
	   	    
	   	    
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
		
	}
	
	
	

}