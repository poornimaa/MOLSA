<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2002-2004, 2010 Curam Software Ltd.                      -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- This is the included view used to display a list of financials for an  -->
<!-- integrated case participant.                                           -->
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
    CLASS="IntegratedCase"
    NAME="DISPLAY"
    OPERATION="listMemberFinancial"
  />


  <PAGE_PARAMETER NAME="caseParticipantRoleID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="caseParticipantRoleID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="caseParticipantRoleID"
    />
  </CONNECT>


  <LIST>


    <FIELD
      LABEL="Field.Label.Type"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="typeCode"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Status"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="statusCode"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.CreationDate"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="postingDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.EffectiveDate"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="effectiveDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Currency"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="currencyType"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      ALIGNMENT="RIGHT"
      LABEL="Field.Label.Amount"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="amount"
        />
      </CONNECT>
    </FIELD>


  </LIST>


</VIEW>
