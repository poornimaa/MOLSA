/**
 * 
 */
package curam.molsa.test.application;

import java.util.List;

import curam.codetable.impl.APPLICATIONTYPEEntry;
import curam.codetable.impl.PROGRAMSTATUSEntry;
import curam.codetable.impl.PROGRAMTYPEEntry;
import curam.core.sl.struct.ConcernRoleIDKey;
import curam.datastore.impl.Datastore;
import curam.datastore.impl.Entity;
import curam.molsa.application.impl.MOLSAApplicationImpl;
import curam.participant.impl.ConcernRole;
import curam.util.exception.AppException;
import curam.util.exception.InformationalException;

/**
 * @author rajesh
 * 
 */
public class TestMOLSAApplicationImpl extends MOLSAApplicationImpl {

	private static final long datastoreID = 0;

	/**
	 * 
	 */
	public TestMOLSAApplicationImpl() {
		super();
	}

	public void testCreateAndStoreApplicationPDF() throws AppException,
			InformationalException {
		super.createAndStoreApplicationPDF();
	}
	
	public void testCreateDatastorePersonEntity(Datastore dataStore,
			Entity rootEntity, ConcernRoleIDKey concernRoleKey)
			throws AppException, InformationalException {
		super.createMOLSADatastorePersonEntity(dataStore, rootEntity,
				concernRoleKey);
	}

	public void testGetProgramApplication(PROGRAMTYPEEntry programType)
			throws AppException, InformationalException {
		super.getProgramApplication(programType);
	}

	public void testGetProgramApplication2(PROGRAMTYPEEntry programType,
			PROGRAMSTATUSEntry programStatus) throws AppException,
			InformationalException {
		super.getProgramApplication(programType, programStatus);
	}

	public void testGetProgramApplication3(PROGRAMTYPEEntry programType,
			PROGRAMSTATUSEntry programStatus) throws AppException,
			InformationalException {
		super.getProgramApplication(programType, programStatus);
	}
	
	public void testStart(APPLICATIONTYPEEntry applicationType,
			List<PROGRAMTYPEEntry> programs, ConcernRole concernRole)
			throws InformationalException, AppException{
		super.start(applicationType, programs, concernRole);
		
	}
	
}