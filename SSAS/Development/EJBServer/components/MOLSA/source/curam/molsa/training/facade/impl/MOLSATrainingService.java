package curam.molsa.training.facade.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.google.inject.Inject;

import curam.codetable.LOCATIONACCESSTYPE;
import curam.codetable.RECORDSTATUS;
import curam.codetable.impl.CASEPARTICIPANTROLETYPEEntry;
import curam.codetable.impl.SENSITIVITYEntry;
import curam.core.facade.struct.ConcernRoleAttachmentDetails;
import curam.core.fact.CaseHeaderFactory;
import curam.core.fact.ConcernRoleAttachmentLinkFactory;
import curam.core.fact.ConcernRoleFactory;
import curam.core.fact.MaintainAttachmentAssistantFactory;
import curam.core.fact.UniqueIDFactory;
import curam.core.impl.CuramConst;
import curam.core.impl.DataBasedSecurity;
import curam.core.impl.SecurityImplementationFactory;
import curam.core.intf.ConcernRoleAttachmentLink;
import curam.core.intf.MaintainAttachmentAssistant;
import curam.core.sl.fact.AttachmentFactory;
import curam.core.sl.fact.CaseUserRoleFactory;
import curam.core.sl.infrastructure.cmis.impl.CMSMetadataConst;
import curam.core.sl.infrastructure.cmis.impl.CMSMetadataInterface;
import curam.core.sl.intf.CaseUserRole;
import curam.core.sl.struct.CaseHeaderDtlsList;
import curam.core.sl.struct.ParticipantSecurityCheckKey;
import curam.core.sl.struct.UserNameAndFullName;
import curam.core.struct.AttachmentDtls;
import curam.core.struct.AttachmentKey;
import curam.core.struct.AttachmentNameStruct;
import curam.core.struct.CaseHeaderByConcernRoleIDKey;
import curam.core.struct.CaseHeaderDtls;
import curam.core.struct.CaseHeaderKey;
import curam.core.struct.ConcernRoleAttachmentLinkDtls;
import curam.core.struct.ConcernRoleKey;
import curam.core.struct.ConcernRoleNameAndAlternateID;
import curam.core.struct.DataBasedSecurityResult;
import curam.cpm.facade.struct.ServiceDeliveryVersionKey;
import curam.cpm.sl.entity.fact.ProviderFactory;
import curam.cpm.sl.entity.intf.Provider;
import curam.cpm.sl.entity.struct.ProviderDtls;
import curam.cpm.sl.entity.struct.ProviderDtlsList;
import curam.cpm.sl.entity.struct.ProviderKey;
import curam.cpm.sl.entity.struct.ServiceOfferingKey;
import curam.federalallowablecomponent.impl.FederalAllowableComponent;
import curam.federalallowablecomponent.impl.FederalAllowableComponentDAO;
import curam.message.GENERALCONCERN;
import curam.molsa.sms.entity.struct.MOLSASMSWMInstanceDtls;
import curam.molsa.sms.entity.struct.MOLSASMSWMInstanceKey;
import curam.molsa.sms.sl.fact.MOLSASMSUtilFactory;
import curam.molsa.sms.sl.intf.MOLSASMSUtil;
import curam.molsa.sms.sl.struct.MOLSAConcernRoleListAndMessageTextDetails;
import curam.molsa.training.entity.base.MOLSATraining;
import curam.molsa.training.entity.fact.MOLSASerDelTraininingMappingFactory;
import curam.molsa.training.entity.fact.MOLSATrainingAtttachmentLinkFactory;
import curam.molsa.training.entity.fact.MOLSATrainingFactory;
import curam.molsa.training.entity.intf.MOLSASerDelTraininingMapping;
import curam.molsa.training.entity.intf.MOLSATrainingAtttachmentLink;
import curam.molsa.training.entity.struct.MOLSASerDelTraininingMappingDtls;
import curam.molsa.training.entity.struct.MOLSASerDelTraininingMappingDtlsStruct1;
import curam.molsa.training.entity.struct.MOLSASerDelTraininingMappingDtlsStruct1List;
import curam.molsa.training.entity.struct.MOLSASerDelTraininingMappingKey;
import curam.molsa.training.entity.struct.MOLSASerDelTraininingMappingKeyStruct1;
import curam.molsa.training.entity.struct.MOLSATrainingAtttachmentLinkDtls;
import curam.molsa.training.entity.struct.MOLSATrainingAtttachmentLinkDtlsStruct1;
import curam.molsa.training.entity.struct.MOLSATrainingAtttachmentLinkDtlsStruct1List;
import curam.molsa.training.entity.struct.MOLSATrainingAtttachmentLinkKey;
import curam.molsa.training.entity.struct.MOLSATrainingDtls;
import curam.molsa.training.entity.struct.MOLSATrainingDtlsList;
import curam.molsa.training.entity.struct.MOLSATrainingKey;
import curam.molsa.training.entity.struct.MOLSATrainingKeyStruct1;
import curam.molsa.training.facade.struct.MOLSAAttachmentDetailsList;
import curam.molsa.training.facade.struct.MOLSATrainingAttachmentDetails;
import curam.molsa.training.struct.MOLSATrainingDetails;
import curam.participant.impl.ConcernRole;
import curam.participant.impl.ConcernRoleDAO;
import curam.piwrapper.caseheader.impl.CaseHeader;
import curam.piwrapper.caseheader.impl.CaseHeaderDAO;
import curam.piwrapper.casemanager.impl.CaseParticipantRole;
import curam.piwrapper.casemanager.impl.CaseParticipantRoleDAO;
import curam.provider.impl.ProviderDAO;
import curam.servicedelivery.impl.ServiceDelivery;
import curam.servicedelivery.impl.ServiceDeliveryDAO;
import curam.serviceoffering.impl.SODELIVERYTYPEEntry;
import curam.serviceoffering.impl.ServiceDeliveryConfigurationAccessor;
import curam.serviceoffering.impl.ServiceOffering;
import curam.serviceoffering.impl.ServiceOfferingDAO;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;
import curam.util.persistence.GuiceWrapper;
import curam.util.resources.StringUtil;
import curam.util.transaction.TransactionInfo;
import curam.util.type.Date;
import curam.util.type.DateTime;
import curam.util.type.Money;
import curam.util.type.StringHelper;
import curam.util.type.StringList;

public class MOLSATrainingService extends
curam.molsa.training.facade.base.MOLSATrainingService {

  @Inject
  protected CaseHeaderDAO caseHeaderDAO;

  @Inject
  protected CaseParticipantRoleDAO caseParticipantRoleDAO;

  @Inject
  protected ServiceDeliveryDAO serviceDeliveryDAO;

  @Inject
  protected ServiceOfferingDAO serviceOfferingDAO;

  @Inject
  protected ConcernRoleDAO concernRoleDAO;
  @Inject
  protected FederalAllowableComponentDAO federalAllowableComponentDAO;
  @Inject
  protected ProviderDAO providerDAO;
  @Inject
  private com.google.inject.Provider<CMSMetadataInterface> cmsMetadataProvider;

  public MOLSATrainingService() {
    GuiceWrapper.getInjector().injectMembers(this);

  }

  @Override
  public MOLSATrainingKey insertMOLSATraining(
      MOLSATrainingDtls trainingDetails) throws AppException,
      InformationalException {
    // TODO Auto-generated method stub
    System.out.println("tabbed:"+trainingDetails.tableOfContents);
    System.out.println("Case:"+trainingDetails.trainingID);
    curam.molsa.training.entity.intf.MOLSATraining trainingObj=MOLSATrainingFactory.newInstance();
    MOLSATrainingKey key =  new MOLSATrainingKey();

    trainingObj.insert(trainingDetails);
    key.trainingID=trainingDetails.trainingID;
    return key;
  }

  @Override
  public ProviderDtlsList readProviders() throws AppException,
  InformationalException {
    // TODO Auto-generated method stub
    ProviderDtlsList list= new ProviderDtlsList();
    Provider providerObj=ProviderFactory.newInstance();
    list=providerObj.readAll();
    return list;

  }



  @Override
  public void createBeneficiaryService(
      MOLSATrainingDetails trainingDetails) throws AppException,
      InformationalException {

    //Handle the scenarios for the new inserts along with the old ones

    // skip inserting the not started and in progress + SOID and display information message to case worker with skipped list "An active service already exists for the below  recepients for this training.



    //-------------------------Inserting into MOLSATrainingDetails-----------------------------------------------------------------------------------------------------

    MOLSATrainingKey trainingKey= new MOLSATrainingKey();
    MOLSATrainingDtls trainingDtls= new MOLSATrainingDtls();
    trainingDtls.providerName=trainingDetails.providerName;
    trainingDtls.serviceOfferingID=trainingDetails.serviceOfferingID;
    trainingDtls.tableOfContents=trainingDetails.tableOfContents;
    trainingDtls.targetAudience=trainingDetails.targetAudience;
    trainingDtls.trainingEndDate=trainingDetails.trainingEndDate;
    trainingDtls.trainingGoal=trainingDetails.trainingGoal;
    trainingDtls.trainingStartDate=trainingDetails.trainingStartDate;
    trainingDtls.trainingSubject=trainingDetails.trainingSubject;
    trainingDtls.trainingTopic=trainingDetails.trainingTopic;
    trainingDtls.trainingType=trainingDetails.trainingType;
    trainingDtls.trainingLocation=trainingDetails.trainingLocation;
    trainingKey=insertMOLSATraining(trainingDtls);


    //-------------------------Adding Service Details to each Integrated Case of Beneficiaries ---------------------------------------------

    StringList concernRoleIDStringArr = StringUtil.delimitedText2StringList(trainingDetails.concernRoleList, CuramConst.gkTabDelimiterChar);
    ArrayList<Long> concernRoleIDList = new ArrayList<Long>();
    for(String concernRoleID :concernRoleIDStringArr) {
      concernRoleIDList.add(Long.valueOf(concernRoleID));
    }
    System.out.println("Tabbed ConcernRoleIds:"+trainingDetails.concernRoleList);

    for(long concernRoleIDListValue:concernRoleIDList){

      List<curam.piwrapper.casemanager.impl.CaseParticipantRole> recipients = new ArrayList();

      //Getting  the integrated case id from the concernroleid

      long integratedCaseID=getCaseIDFromConcernRole(concernRoleIDListValue);
      CaseHeader caseHeader = caseHeaderDAO.get(integratedCaseID);
      List<CaseParticipantRole> primaryList = 
        caseParticipantRoleDAO.listActiveByCaseAndType(caseHeader, CASEPARTICIPANTROLETYPEEntry.PRIMARY);
      List<CaseParticipantRole> memberList = 
        caseParticipantRoleDAO.listActiveByCaseAndType(caseHeader, CASEPARTICIPANTROLETYPEEntry.MEMBER);
      for(CaseParticipantRole caseParticipantRole :primaryList) {
        if(concernRoleIDList.contains(caseParticipantRole.getConcernRole().getID())) {

          recipients.add(caseParticipantRole);
        }
      }
      for(CaseParticipantRole caseParticipantRole :memberList) {
        if(concernRoleIDList.contains(caseParticipantRole.getConcernRole().getID())) {
          recipients.add(caseParticipantRole);
        }
      }

      //Getting the service offering id from the MOLSATrainingSMS Page

      long soID=trainingDetails.serviceOfferingID;
      ServiceOffering serviceOffering = (ServiceOffering)this.serviceOfferingDAO.get(Long.valueOf(soID));
      ServiceDeliveryConfigurationAccessor serviceDeliveryConfiguration = serviceOffering.getServiceDeliveryConfiguration();
      ServiceDelivery serviceDelivery = this.serviceDeliveryDAO.newInstance(SODELIVERYTYPEEntry.SERVICEDELIVERY);

      Money money=new Money(0);
      serviceDelivery.setAuthorizedRate(money);
      serviceDelivery.setDuration(0,0);
      SENSITIVITYEntry sensitivity = SENSITIVITYEntry.get("1");
      serviceDelivery.setSensitivity(sensitivity);
      serviceDelivery.setUnitsAuthorized(1);
      serviceDelivery.setServiceOffering(serviceOffering);	
      serviceDelivery.setCoverPeriodStartDate(trainingDetails.trainingStartDate);
      serviceDelivery.setCoverPeriodEndDate(trainingDetails.trainingEndDate);
      serviceDelivery.setCaseHeader(caseHeader);
      String ownerUserName=TransactionInfo.getProgramUser();
      System.out.println("ownerUserName:"+ownerUserName);
      serviceDelivery.setOwner(ownerUserName);
      serviceDelivery.setReason("Training For The Benefit Of Beneficiary");
      CaseUserRole caseUserRoleObj = CaseUserRoleFactory.newInstance();
      CaseHeaderKey relatedCaseKey = new CaseHeaderKey();
      //Same case id we got above
      relatedCaseKey.caseID = integratedCaseID;
      System.out.println("relatedCaseKey.caseID :"+relatedCaseKey.caseID );
      UserNameAndFullName supervisor = caseUserRoleObj.readSupervisor(relatedCaseKey);
      if (!StringHelper.isEmpty(supervisor.userName)) {
        serviceDelivery.setSupervisor(supervisor.userName);
      }

      serviceDelivery.insert(recipients);

      //-------------------------Adding Provider to The Beneficiary Service---------------------------------------------


      //Get the provider ID and pass it to the OOTB function

      ProviderKey proKey=new ProviderKey();
      proKey.providerConcernRoleID=trainingDetails.providerID;
      ServiceDeliveryVersionKey serviceKey=new ServiceDeliveryVersionKey();			
      serviceKey.key.serviceDeliveryID = serviceDelivery.getID();
      addProvider(proKey,serviceKey);

      //Inserting ServiceDelivery ID ,Training ID and concernRoleID to the new Mapping Table

      MOLSASerDelTraininingMappingDtls detailsObj= new MOLSASerDelTraininingMappingDtls();
      detailsObj.serviceDeliveryID=serviceDelivery.getID();
      detailsObj.trainingID=trainingKey.trainingID;		
      detailsObj.concernRoleID=concernRoleIDListValue;   
      MOLSASerDelTraininingMapping mappingObj=MOLSASerDelTraininingMappingFactory.newInstance();
      mappingObj.insert(detailsObj);


    }
    //-------------------------Sending SMS To the Beneficiaries---------------------------------------------


    MOLSAConcernRoleListAndMessageTextDetails key=new MOLSAConcernRoleListAndMessageTextDetails(); 
    MOLSASMSUtil molsasmsUtilObj=MOLSASMSUtilFactory.newInstance();
    key.dtls.concernRoleTabbedList=trainingDetails.concernRoleList;
    key.dtls.smsMessageText=trainingDetails.trainingSMSMessage+"Training Name:"+trainingDetails.serviceOfferingID +" "+ "Start Date:"+trainingDetails.trainingStartDate
    +" "+"End Date:"+trainingDetails.trainingEndDate+" "+"Training Location:"+trainingDetails.trainingLocation;
    key.dtls.smsMessageType=curam.molsa.codetable.MOLSASMSMESSAGETEMPLATE.TRAININGMESSAGETEXT;
    //	key.dtls.caseID=instanceDtls.caseID;
    //molsasmsUtilObj.sendSMSDPMode(key);



  }


  public void addProvider(final ProviderKey providerKey,
      final ServiceDeliveryVersionKey serviceDeliveryVersionNoKey)
  throws AppException, InformationalException {

    curam.servicedelivery.impl.ServiceDelivery serviceDelivery = serviceDeliveryDAO.get(
        serviceDeliveryVersionNoKey.key.serviceDeliveryID);

    serviceDelivery.updateProvider(
        providerDAO.get(providerKey.providerConcernRoleID),
        serviceDelivery.getVersionNo());
  }

  public long getCaseIDFromConcernRole(long concernRoleIDListValue) throws AppException, InformationalException{

    long caseid=0L;
    System.out.println("concernRoleIDListValue:"+concernRoleIDListValue);
    CaseHeaderByConcernRoleIDKey key=new CaseHeaderByConcernRoleIDKey();
    key.concernRoleID=concernRoleIDListValue;
    key.statusCode="CS4";
    curam.core.intf.CaseHeader caseObj=CaseHeaderFactory.newInstance();
    curam.core.struct.CaseHeaderDtlsList caseheaderDtlsList=caseObj.searchByConcernRoleID(key);
    Iterator itr=caseheaderDtlsList.dtls.listIterator();
    int i=0;

    while (itr.hasNext()){
      System.out.println("CaseType:"+caseheaderDtlsList.dtls.get(i).caseTypeCode);
      if(caseheaderDtlsList.dtls.get(i).caseTypeCode.equals("CT5")){
        caseid=caseheaderDtlsList.dtls.get(i).caseID;
        System.out.println("CaseID:"+caseid);
        break;
      }else{
        i++;
      }
    }
    return caseid;

  }

  @Override
  public MOLSATrainingDtlsList searchByServiceOfferingID(
      ServiceOfferingKey soID) throws AppException,
      InformationalException {
    // TODO Auto-generated method stub

    MOLSATrainingKey key =new MOLSATrainingKey() ;
    curam.molsa.training.entity.intf.MOLSATraining trainingObj=MOLSATrainingFactory.newInstance();
    MOLSATrainingKeyStruct1 soidKey=new MOLSATrainingKeyStruct1();
    MOLSATrainingDtlsList dtlList= new MOLSATrainingDtlsList();
    soidKey.serviceOfferingID=soID.serviceOfferingID;
    dtlList=trainingObj.searchbyServiceOfferingID(soidKey);
    return dtlList;
  }

  @Override
  public MOLSATrainingDtls readByTrainingID(MOLSATrainingKey arg1) throws AppException, InformationalException {
    // TODO Auto-generated method stub
    MOLSATrainingDtls trainingDtls=new MOLSATrainingDtls();
    curam.molsa.training.entity.intf.MOLSATraining trainingObj=MOLSATrainingFactory.newInstance();
    trainingObj.read(arg1);
    trainingDtls=trainingObj.read(arg1);
    return trainingDtls;
  }

  @Override
  public void modifyTrainingDetails(MOLSATrainingDtls trainingDetails) throws AppException, InformationalException {
    // TODO Auto-generated method stub
    curam.molsa.training.entity.intf.MOLSATraining trainingObj=MOLSATrainingFactory.newInstance();
    MOLSATrainingKey readKey =new MOLSATrainingKey();
    readKey.trainingID=trainingDetails.trainingID;

    MOLSATrainingDtls readDetails=readByTrainingID(readKey);

    readDetails.providerName=trainingDetails.providerName;
    readDetails.serviceOfferingID=trainingDetails.serviceOfferingID;   
    readDetails.tableOfContents=trainingDetails.tableOfContents;
    readDetails.targetAudience=trainingDetails.targetAudience;
    readDetails.trainingGoal=trainingDetails.trainingGoal;
    readDetails.trainingSubject=trainingDetails.trainingSubject;
    readDetails.trainingTopic=trainingDetails.trainingTopic;
    readDetails.trainingType=trainingDetails.trainingType;

    trainingObj.modify(readKey, readDetails);
  }

  @Override
  public void rescheduleTrainingDetails(MOLSATrainingDetails trainingDetails) throws AppException, InformationalException {
    // TODO Auto-generated method stub

    //--------------------------Inserting into MOLSA Training

    //Call reschedule and pass three attributes/all others are set to be same

    curam.molsa.training.entity.intf.MOLSATraining trainingObj=MOLSATrainingFactory.newInstance();
    MOLSATrainingKey readKey =new MOLSATrainingKey();
    readKey.trainingID=trainingDetails.trainingID;
    MOLSATrainingDtls readDetails=readByTrainingID(readKey);

    readDetails.trainingStartDate=trainingDetails.trainingStartDate;
    readDetails.trainingEndDate=trainingDetails.trainingEndDate;   
    readDetails.trainingLocation=trainingDetails.trainingLocation;

    trainingObj.modify(readKey, readDetails);


    //Changing the Training Start Date/End Date in each Service Delivery Row based on the training ID /Service Delivery ID retrieved from mapping table

    //Note:Give Validations before inserting for existing data -- >


    //Get the list of concern role id to send in a tabbed format from mapping table

    MOLSASerDelTraininingMapping mapObj=MOLSASerDelTraininingMappingFactory.newInstance();
    MOLSASerDelTraininingMappingKeyStruct1 mapKey= new MOLSASerDelTraininingMappingKeyStruct1();
    mapKey.trainingID=readKey.trainingID;
    MOLSASerDelTraininingMappingDtlsStruct1List dtlList= mapObj.readBytrainingID(mapKey);
    String concernRoleTabbedValue="";
    for(MOLSASerDelTraininingMappingDtlsStruct1 dtls: dtlList.dtls.items()) {
      long concernRole=dtls.concernRoleID;
      long serviceDeliveryID=dtls.serviceDeliveryID;
      concernRoleTabbedValue=concernRoleTabbedValue+"/t"+concernRole;
      ServiceDelivery serviceDelivery=serviceDeliveryDAO.get(serviceDeliveryID);

      String status=serviceDelivery.getLifecycleState().toString();
      System.out.println("Status:"+status);
      //Only Open and Not Started are allowed to modify 
      if(status.equals("SDST3000")||status.equals("SDST3002") ){
        serviceDelivery.setCoverPeriodStartDate(trainingDetails.trainingStartDate);
        serviceDelivery.setCoverPeriodEndDate(trainingDetails.trainingEndDate);
        // serviceDelivery.submit(serviceDeliveryID);
      }
    }   


    //Send SMS to the concerned people with open and Not Started 


    MOLSAConcernRoleListAndMessageTextDetails key=new MOLSAConcernRoleListAndMessageTextDetails(); 
    MOLSASMSUtil molsasmsUtilObj=MOLSASMSUtilFactory.newInstance();
    key.dtls.concernRoleTabbedList=concernRoleTabbedValue;
    key.dtls.smsMessageText=trainingDetails.trainingSMSMessage+"Training Name:"+trainingDetails.serviceOfferingID +" "+ "Start Date:"+trainingDetails.trainingStartDate
    +" "+"End Date:"+trainingDetails.trainingEndDate+" "+"Training Location:"+trainingDetails.trainingLocation;
    key.dtls.smsMessageType=curam.molsa.codetable.MOLSASMSMESSAGETEMPLATE.TRAININGMESSAGETEXT;
    //  key.dtls.caseID=instanceDtls.caseID;
    //molsasmsUtilObj.sendSMSDPMode(key);
  }

  @Override
  public void reminderSMS(MOLSATrainingKey trainingID) throws AppException, InformationalException {
    // TODO Auto-generated method stub

    //Get all the Training Details based on trainingID

    MOLSATrainingKey readKey =new MOLSATrainingKey();
    readKey.trainingID=trainingID.trainingID;
    MOLSATrainingDtls readDetails=readByTrainingID(readKey);

    //Get all the concernroleIDs and serviceDeliveryID based on the trainingID from mapping table


    MOLSASerDelTraininingMapping mapObj=MOLSASerDelTraininingMappingFactory.newInstance();
    MOLSASerDelTraininingMappingKeyStruct1 mapKey= new MOLSASerDelTraininingMappingKeyStruct1();
    mapKey.trainingID=trainingID.trainingID;
    MOLSASerDelTraininingMappingDtlsStruct1List dtlList= mapObj.readBytrainingID(mapKey);
    Map<Long, Long> mapDetails = new HashMap<Long, Long>(); 
    String concernRoletabbedList="";
    for(MOLSASerDelTraininingMappingDtlsStruct1 dtls: dtlList.dtls.items()) {
      long concernRole=dtls.concernRoleID;
      long serviceDeliveryID=dtls.serviceDeliveryID;

      //Add concernRoleID from the map whose ServiceDelivery status is  "NOT STARTED"(Reminder has to be send to the Acknowledged concern RoleId only)

      ServiceDelivery serviceDelivery=serviceDeliveryDAO.get(serviceDeliveryID);

      String status=serviceDelivery.getLifecycleState().toString();
      System.out.println("Status:"+status);
      if(status.equals("SDST3002")){
        mapDetails.put(concernRole,serviceDeliveryID);
        concernRoletabbedList=concernRoletabbedList+"/t"+concernRole;
      }
      System.out.println("The ReminderSMS is send to "+mapDetails.size()+" Beneficiaries");

      //Send SMS to the concerned people with open and Not Started 


      MOLSAConcernRoleListAndMessageTextDetails key=new MOLSAConcernRoleListAndMessageTextDetails(); 
      MOLSASMSUtil molsasmsUtilObj=MOLSASMSUtilFactory.newInstance();
      key.dtls.concernRoleTabbedList=concernRoletabbedList;
      key.dtls.smsMessageText="Training Name:"+readDetails.serviceOfferingID +" "+ "Start Date:"+readDetails.trainingStartDate
      +" "+"End Date:"+readDetails.trainingEndDate+" "+"Training Location:"+readDetails.trainingLocation;
      key.dtls.smsMessageType=curam.molsa.codetable.MOLSASMSMESSAGETEMPLATE.TRAININGMESSAGETEXT;
      //  key.dtls.caseID=instanceDtls.caseID;
      molsasmsUtilObj.sendSMSDPMode(key);

    }


  }

  @Override
  public MOLSATrainingAtttachmentLinkDtls createTrainingAttachment(MOLSATrainingAttachmentDetails materialDetails) throws AppException, InformationalException {

    curam.core.sl.intf.Attachment attachmentObj = AttachmentFactory.newInstance();
    AttachmentKey attachmentKey = new AttachmentKey();
    AttachmentNameStruct attachmentName = new AttachmentNameStruct();
    MOLSATrainingAtttachmentLink  molsaTrainingAttachmentLinkObj= MOLSATrainingAtttachmentLinkFactory.newInstance();
    attachmentName.attachmentName = materialDetails.attDtls.attachmentName;
    materialDetails.attDtls.attachmentName = attachmentName.attachmentName;
    Date dateReceived = new Date(DateTime.getCurrentDateTime());
    GuiceWrapper.getInjector().injectMembers(this); 
    attachmentKey = attachmentObj.createAttachment(materialDetails.attDtls);
    materialDetails.linkDtls.attachmentID = attachmentKey.attachmentID;
    materialDetails.linkDtls.statusCode = RECORDSTATUS.NORMAL;
    materialDetails.linkDtls.dateReceived = dateReceived;
    materialDetails.linkDtls.attachmentLinkID = UniqueIDFactory.newInstance().getNextID();
    molsaTrainingAttachmentLinkObj.insert(materialDetails.linkDtls);
    return materialDetails.linkDtls;
  }

  @Override
  public MOLSAAttachmentDetailsList serachAttachmentByTrainingID(MOLSATrainingKey arg1) throws AppException, InformationalException {


    // TODO Auto-generated method stub

    //Based on the trainingID , attachmentlinktable details are retrieving  and based on the retrieved attachementid all the attachments are retrieved
    curam.core.sl.intf.Attachment attachmentObj = AttachmentFactory.newInstance();
    MOLSATrainingAtttachmentLink trainingAttachmentLinkObj=MOLSATrainingAtttachmentLinkFactory.newInstance();
    MOLSAAttachmentDetailsList attDetailsList= new MOLSAAttachmentDetailsList();
    MOLSASerDelTraininingMappingKeyStruct1 key=new MOLSASerDelTraininingMappingKeyStruct1();
    key.trainingID=arg1.trainingID;
    MOLSATrainingAtttachmentLinkDtlsStruct1List linkDtlsList = trainingAttachmentLinkObj.searchByTrainingID(key);
    //Iterate through each link from the list of linkitems
    
    for(MOLSATrainingAtttachmentLinkDtlsStruct1 dtls: linkDtlsList.dtls.items()) {

      MOLSATrainingAttachmentDetails attchDetails= new MOLSATrainingAttachmentDetails();

      //Assigning the retrieved attachement details into the MOLSATrainingAttachmentDetails struct

      attchDetails.linkDtls.assign(dtls);

      //Get the attachmentids from this linkDtls which we got by trainingIDs

      AttachmentKey attachmentKey = new AttachmentKey();
      AttachmentDtls attachdtls=new AttachmentDtls();
      attachmentKey.attachmentID=dtls.attachmentID;

      //Retrieving attachmentDtls from Attachment table based on the attachment id retrieved above

      attachdtls=attachmentObj.readAttachment(attachmentKey);

      //Assigning the retrieved attachment details into the MOLSATrainingAttachmentDetails struct
      attchDetails.attDtls.assign(attachdtls);

      //Adding the MOLSATrainingAttachmentDetails struct to the List
      attDetailsList.dtls.add(attchDetails);
    }
    return attDetailsList;
  }

  @Override
  public void cancelTrainingAttachment(MOLSATrainingAtttachmentLinkKey key) throws AppException, InformationalException {
    // TODO Auto-generated method stub
    
   
    MOLSATrainingAtttachmentLink trainingAttachmentLink= MOLSATrainingAtttachmentLinkFactory.newInstance();
    MOLSATrainingAtttachmentLinkDtls linkDtls = trainingAttachmentLink.read(key);
   
    linkDtls.statusCode = RECORDSTATUS.CANCELLED;
    trainingAttachmentLink.modify(key, linkDtls);

    // Read and modify the status of the Attachment
    curam.core.sl.intf.Attachment attachmentObj = AttachmentFactory.newInstance();
    AttachmentKey attachmentKey = new AttachmentKey();

    attachmentKey.attachmentID = linkDtls.attachmentID;

    attachmentObj.cancelAttachment(attachmentKey);
  }







}
