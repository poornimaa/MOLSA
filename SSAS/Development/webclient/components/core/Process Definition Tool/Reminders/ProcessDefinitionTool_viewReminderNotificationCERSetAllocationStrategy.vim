<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<VIEW
  PAGE_ID="ProcessDefinitionTool_viewReminderNotificationCERSetAllocationStrategy"
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
    <CONNECT>
      <SOURCE
        NAME="DISPLAY"
        PROPERTY="activityName"
      />
    </CONNECT>
  </PAGE_TITLE>
  <INFORMATIONAL>
    <CONNECT>
      <SOURCE
        NAME="DISPLAY"
        PROPERTY="result$informational$dtls$message"
      />
    </CONNECT>
  </INFORMATIONAL>
  <PAGE_PARAMETER NAME="activityID"/>
  <PAGE_PARAMETER NAME="processID"/>
  <PAGE_PARAMETER NAME="processVersionNo"/>
  <PAGE_PARAMETER NAME="activityType"/>
  <PAGE_PARAMETER NAME="strategyParent"/>
  <PAGE_PARAMETER NAME="reminderID"/>
  <SERVER_INTERFACE
    CLASS="AllocationStrategyAdmin"
    NAME="DISPLAY"
    OPERATION="readCERSetAllocationStrategy"
    PHASE="DISPLAY"
  />  
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="processID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processVersionNo"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="processVersionNo"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="activityID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="activityID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="strategyParent"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="strategyParent"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="reminderID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="allocationRuleKey$reminderID"
    />
  </CONNECT>  
  <MENU MODE="IN_PAGE_NAVIGATION">
    <ACTION_CONTROL LABEL="Control.Label.Summary">
      <LINK PAGE_ID="ProcessDefinitionTool_viewManualActivityReminderNotification">
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
            NAME="PAGE"
            PROPERTY="activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
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
    </ACTION_CONTROL>
    <ACTION_CONTROL LABEL="Control.Label.NotificationSubject">
      <LINK PAGE_ID="ProcessDefinitionTool_viewManualActivityReminderNotificationSubject">
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
            NAME="PAGE"
            PROPERTY="activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
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
    </ACTION_CONTROL>
    <ACTION_CONTROL LABEL="Control.Label.NotificationBody">
      <LINK PAGE_ID="ProcessDefinitionTool_viewManualActivityReminderNotificationBody">
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
            NAME="PAGE"
            PROPERTY="activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
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
    </ACTION_CONTROL>
    <ACTION_CONTROL LABEL="Control.Label.NotificationActions">
      <LINK PAGE_ID="ProcessDefinitionTool_listManualActivityReminderNotificationActions">
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
            NAME="PAGE"
            PROPERTY="activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
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
    </ACTION_CONTROL>
    <ACTION_CONTROL LABEL="Control.Label.NotificationAllocationStrategy">
      <LINK PAGE_ID="ProcessDefinitionTool_viewManualActivityReminderNotificationAllocationStrategyRedirect">
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
            NAME="PAGE"
            PROPERTY="activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
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
    </ACTION_CONTROL>
  </MENU>
  <CLUSTER
    NUM_COLS="3"
    SHOW_LABELS="false"
  >
    <CONTAINER>
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="TEXT"
            PROPERTY="Link.Label.Select"
          />
        </CONNECT>
        <LINK
        OPEN_MODAL="true"
        PAGE_ID="ProcessDefinitionTool_selectRuleClasses"
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
            NAME="PAGE"
            PROPERTY="strategyParent"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="strategyParent"
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
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="cerSetName"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="cerSetName"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="versionNo"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="versionNo"
          />
        </CONNECT>
      </LINK>
      </FIELD>      
    </CONTAINER>
    <CONTAINER>
      <FIELD>
        <CONNECT>
          <SOURCE
            NAME="TEXT"
            PROPERTY="Link.RefreshInputMappings"
          />
        </CONNECT>
         <LINK
          OPEN_MODAL="true"
          PAGE_ID="ProcessDefinitionTool_refreshAllocationCERSetInputMappings"
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
              PROPERTY="cerSetName"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="cerSetName"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="strategyParent"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="strategyParent"
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
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="versionNo"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="versionNo"
            />
          </CONNECT>
        </LINK>
      </FIELD>
    </CONTAINER>   
  </CLUSTER>
  <CLUSTER LABEL_WIDTH="30">
    <FIELD LABEL="Field.Label.AllocationStrategyType">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$allocationStrategyType"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.CERSetName">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$cerSetName"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.CERPrimaryClassName">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$cerPrimaryClassName"
        />
      </CONNECT>
    </FIELD>    
  </CLUSTER>
  <LIST TITLE="List.Title.InputMappings">
    <ACTION_SET TYPE="LIST_ROW_MENU">
      <ACTION_CONTROL LABEL="Action.Label.Edit.InputMapping">
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="ProcessDefinitionTool_editCERRuleSetAllocationInputMapping"
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
              PROPERTY="result$cerSetName"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="cerSetName"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$mapping$dtls$cerClassAttribute"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="cerClassAttribute"
            />
          </CONNECT>          
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="result$filterType"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="filterType"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="strategyParent"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="strategyParent"
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
      </ACTION_CONTROL>    
    </ACTION_SET>
    <FIELD LABEL="Field.Label.CERClassAttributeToSet" WIDTH="40">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$mapping$dtls$cerClassAttribute"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.CERClassAttributeType" WIDTH="10">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$mapping$dtls$type"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.WDOAttributeToSet" WIDTH="40">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$mapping$dtls$wdoAttribute"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Valid" WIDTH="10">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$mapping$dtls$valid"
        />
      </CONNECT>
    </FIELD>
  </LIST>
</VIEW>
