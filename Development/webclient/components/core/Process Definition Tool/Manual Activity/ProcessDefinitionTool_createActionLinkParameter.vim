<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<VIEW
  PAGE_ID="ProcessDefinitionTool_createActionLinkParameter"
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
  <PAGE_PARAMETER NAME="versionNo"/>
  <PAGE_PARAMETER NAME="actionText"/>
  <PAGE_PARAMETER NAME="actionType"/>
  <PAGE_PARAMETER NAME="activityType"/>
  <PAGE_PARAMETER NAME="filterType"/>
  <PAGE_PARAMETER NAME="reminderID"/>


  <SERVER_INTERFACE
    CLASS="ActivityActionAdmin"
    NAME="ACTION"
    OPERATION="createActionLinkParameter"
    PHASE="ACTION"
  />
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="actionID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="actionID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="activityID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="activityID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="processID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processVersionNo"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="processVersionNo"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="actionType"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="actionType"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="versionNo"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="actionLinkParameterCreateDetails$versionNo"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="reminderID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="reminderID"
    />
  </CONNECT>
  <ACTION_SET>
    <ACTION_CONTROL
      LABEL="ActionControl.Label.SaveAndNew"
      TYPE="SUBMIT"
    >
      <LINK PAGE_ID="ProcessDefinitionTool_createActionLinkParameter">
      </LINK>
    </ACTION_CONTROL>
    <ACTION_CONTROL
      LABEL="ActionControl.Label.Save"
      TYPE="SUBMIT"
    />
    <ACTION_CONTROL LABEL="ActionControl.Label.Cancel"/>
  </ACTION_SET>
  <CLUSTER LABEL_WIDTH="40%">
    <FIELD LABEL="Field.Label.ParameterName">
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="parameterName"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
  <CLUSTER LABEL_WIDTH="40%">
    <FIELD LABEL="Field.Label.WorkflowDataObjectAttribute">
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="workflowDataObjectAttributeID"
        />
      </CONNECT>
      <LINK>
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
            PROPERTY="actionType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="parameterType"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="filterType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="filterType"
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
            NAME="PAGE"
            PROPERTY="actionID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="actionID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="reminderID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="reminderID"
          />
        </CONNECT>
      </LINK>
    </FIELD>
  </CLUSTER>
</VIEW>