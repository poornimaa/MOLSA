<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2003 Curam Software Ltd.                                 -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- The include page for the view EFT financial exclusion date page.       -->
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
    CLASS="Organization"
    NAME="DISPLAY"
    OPERATION="readExclusionDate"
  />


  <PAGE_PARAMETER NAME="financialCalendarID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="financialCalendarID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="financialCalendatID"
    />
  </CONNECT>


  <CLUSTER
    NUM_COLS="2"
    TAB_ORDER="ROW"
    TITLE="Cluster.Title.Details"
  >


    <FIELD LABEL="Field.Label.DateFrom">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="fromDate"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.DateTo">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="toDate"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Reason">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="reasonCode"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Prepayment">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="prePaymentInd"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


</VIEW>