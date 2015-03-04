<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<VIEW
  PAGE_ID="ProcessDefinitionTool_viewManualActivityEventWait"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>
  <PAGE_TITLE>
    <CONNECT>
      <SOURCE
        NAME="TEXT"
        PROPERTY="PageTitle.StaticText1"
      />
    </CONNECT>
  </PAGE_TITLE>
  <INFORMATIONAL>
    <CONNECT>
      <SOURCE
        NAME="DISPLAY"
        PROPERTY="result$message$dtls$message"
      />
    </CONNECT>
  </INFORMATIONAL>
  <SERVER_INTERFACE
    CLASS="EventWaitActivityAdmin"
    NAME="DISPLAY"
    OPERATION="readEventWait"
    PHASE="DISPLAY"
  />
  <PAGE_PARAMETER NAME="processID"/>
  <PAGE_PARAMETER NAME="processVersionNo"/>
  <PAGE_PARAMETER NAME="activityID"/>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="activityKey$processID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processVersionNo"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="activityKey$processVersionNo"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="activityID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="activityKey$activityID"
    />
  </CONNECT>
  <LIST TITLE="Cluster.Events">
    <DETAILS_ROW>
      <INLINE_PAGE PAGE_ID="ProcessDefinitionTool_viewManualActivityEvent">
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="activityID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$eventWaitDtls$dtls$identifier"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="eventID"
          />
        </CONNECT>
        <!-- TODO: find out what this is for and see if we still need it -->
        <!-- <CONNECT>
            <SOURCE
              NAME="CONSTANT"
              PROPERTY="Filter.Type.ProcessEngineTaskList"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="wdoFilterType"
            />
          </CONNECT> -->
      </INLINE_PAGE>
    </DETAILS_ROW>
    <ACTION_SET TYPE="LIST_ROW_MENU">
      <ACTION_CONTROL LABEL="Action.Label.EditEvent">
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="ProcessDefinitionTool_editEvent"
        >
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="processID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="processID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="processVersionNo"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="processVersionNo"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="activityID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="activityID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$eventWaitDtls$dtls$identifier"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="eventID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="CONSTANT"
              PROPERTY="Filter.Type.ProcessEngineTaskList"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="wdoFilterType"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$versionNo"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="versionNo"
            />
          </CONNECT>
        </LINK>
      </ACTION_CONTROL>
      <ACTION_CONTROL LABEL="ActionControl.Label.Delete">
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="ProcessDefinitionTool_deleteManualActivityEvent"
        >
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="processID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="processID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="processVersionNo"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="processVersionNo"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="activityID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="activityID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$eventWaitDtls$dtls$identifier"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="eventID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$eventWaitDtls$dtls$eventType"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="eventType"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$eventWaitDtls$dtls$eventClass"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="eventClass"
            />
          </CONNECT>
          <!-- TODO: remove this if its not really required -->
          <!-- <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="fullyQualifiedEventTypeName"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="fullyQualifiedEventTypeName"
          />
        </CONNECT> -->
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$versionNo"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="versionNo"
            />
          </CONNECT>
        </LINK>
      </ACTION_CONTROL>
    </ACTION_SET>
    <FIELD
      LABEL="Field.Label.EventClass"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$eventWaitDtls$dtls$eventClass"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.EventType"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$eventWaitDtls$dtls$eventType"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.EventMatchData"
      WIDTH="35"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$eventWaitDtls$dtls$eventMatchData"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.MultipleOccurringEvent"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$eventWaitDtls$dtls$multipleOccurringEvent"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      ALIGNMENT="CENTER"
      LABEL="Field.Label.EventValid"
      WIDTH="10"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$eventWaitDtls$dtls$valid"
        />
      </CONNECT>
    </FIELD>
  </LIST>
  <CLUSTER
    LABEL_WIDTH="30%"
    NUM_COLS="1"
    TITLE="Cluster.AdditionalEventDetails"
  >
    <FIELD LABEL="Field.Label.WaitOnAllEvents">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$waitOnAllEvents"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
  <CLUSTER
    LABEL_WIDTH="30%"
    NUM_COLS="1"
    TITLE="Cluster.OutputMappings"
  >
    <CONTAINER LABEL="Container.Label.RaisedBy">
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$raisedBy"
          />
        </CONNECT>
      </FIELD>
      <FIELD LABEL="Field.Label.RaisedByUserMappingValid">
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="raisedByUserMappingIsValid"
          />
        </CONNECT>
      </FIELD>
    </CONTAINER>
    <CONTAINER LABEL="Container.Label.EventTypeOutputMapping">
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$eventType"
          />
        </CONNECT>
      </FIELD>
      <FIELD LABEL="Field.Label.EventTypeOutputMappingValid">
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="eventTypeMappingIsValid"
          />
        </CONNECT>
      </FIELD>
    </CONTAINER>
    <CONTAINER LABEL="Container.Label.EventOutputMappingData">
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$eventOutputData"
          />
        </CONNECT>
      </FIELD>
      <FIELD LABEL="Field.Label.EventOutputMappingDataValid">
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="eventOutputDataMappingIsValid"
          />
        </CONNECT>
      </FIELD>
    </CONTAINER>
    <CONTAINER LABEL="Container.Label.EventTimeRaised">
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$timeRaised"
          />
        </CONNECT>
      </FIELD>
      <FIELD LABEL="Field.Label.EventTimeRaisedValid">
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="timeRaisedMappingIsValid"
          />
        </CONNECT>
      </FIELD>
    </CONTAINER>
  </CLUSTER>
  <ACTION_SET>
    <ACTION_CONTROL LABEL="ActionControl.Label.Edit">
      <LINK
        OPEN_MODAL="true"
        PAGE_ID="ProcessDefinitionTool_editEventWait"
      >
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="activityID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityID"
          />
        </CONNECT>
      </LINK>
    </ACTION_CONTROL>
    <ACTION_CONTROL LABEL="Link.AddEvent">
      <LINK
        OPEN_MODAL="true"
        PAGE_ID="ProcessDefinitionTool_createEvent"
      >
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="activityID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$activityName"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityName"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="CONSTANT"
            PROPERTY="Filter.Type.ProcessEngineTaskList"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="wdoFilterType"
          />
        </CONNECT>
      </LINK>
    </ACTION_CONTROL>
  </ACTION_SET>
</VIEW>