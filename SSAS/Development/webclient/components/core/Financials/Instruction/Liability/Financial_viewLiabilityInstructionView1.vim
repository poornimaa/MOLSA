<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
  
  Copyright IBM Corporation 2012. All Rights Reserved.
  
  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2010 Curam Software Ltd.                                 -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description -->
<!-- =========== -->
<!-- The included view to display the details of a reversed financial       -->
<!-- instruction.                                                           -->
<VIEW
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


  <SERVER_INTERFACE
    CLASS="Financial"
    NAME="DISPLAY"
    OPERATION="readLiabilityInstruction1"
  />


  <PAGE_PARAMETER NAME="contextDescription"/>
  <PAGE_PARAMETER NAME="finInstructionID"/>
  <PAGE_PARAMETER NAME="lineItemID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="finInstructionID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="key$finInstructionID"
    />
  </CONNECT>


  <CLUSTER
    LABEL_WIDTH="30"
    NUM_COLS="2"
  >
    <FIELD LABEL="Field.Label.TotalOutstanding">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="totalOutstanding"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Issued">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="issuedDate"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Processed">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="liabilityHeaderDetails$datePosted"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.OriginalLiability">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="liabilityHeaderDetails$amount"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.CoversPeriod">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$coversPeriod"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Status">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="liabilityHeaderDetails$statusCode"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
  <CLUSTER
    LABEL_WIDTH="30"
    NUM_COLS="2"
    TITLE="Cluster.Title.DeliveryDetails"
  >
    <FIELD LABEL="Field.Label.NomineeName">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="liabilityHeaderDetails$nomineeName"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Method">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="deliveryMethod"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.NomineeAddress">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="formattedNomineeAddress"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <!-- Conditionally Display the reversal details. -->
  <CLUSTER
    LABEL_WIDTH="15"
    NUM_COLS="1"
    TITLE="Cluster.Title.ReversalDetails"
  >
    <CONDITION>
      <IS_TRUE
        NAME="DISPLAY"
        PROPERTY="reversalInd"
      />
    </CONDITION>


    <INCLUDE FILE_NAME="Financial_reversalDetailsView.vim"/>
  </CLUSTER>


  <LIST TITLE="Cluster.Title.LiabilityItems">
    <ACTION_SET TYPE="LIST_ROW_MENU">
      <ACTION_CONTROL LABEL="ActionControl.Label.Cancel">
        <CONDITION>
          <IS_TRUE
            NAME="DISPLAY"
            PROPERTY="reverseIndicator"
          />
        </CONDITION>
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="Financial_createLineItemReversal"
        >
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="instructionLineItemID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="lineItemID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="contextDescription"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="description"
            />
          </CONNECT>
        </LINK>
      </ACTION_CONTROL>
      <ACTION_CONTROL LABEL="ActionControl.Label.WriteOff">
        <CONDITION>
          <IS_TRUE
            NAME="DISPLAY"
            PROPERTY="writeOffIndicator"
          />
        </CONDITION>
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="Financial_createWriteOff"
        >
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="instructionLineItemID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="lineItemID"
            />
          </CONNECT>
        </LINK>
      </ACTION_CONTROL>
    </ACTION_SET>


    <FIELD
      LABEL="Field.Label.Case"
      WIDTH="24"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="caseReference"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.Component"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="liabilityType"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.CoversPeriod"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="dtls$coversPeriod"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.Status"
      WIDTH="14"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="dtls$statusCode"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      ALIGNMENT="RIGHT"
      LABEL="Field.Label.Debit"
      WIDTH="8"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="dtls$amount"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      ALIGNMENT="RIGHT"
      LABEL="Field.Label.OutstandingAmount"
      WIDTH="14"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="outstandingAmount"
        />
      </CONNECT>
    </FIELD>


  </LIST>


</VIEW>
