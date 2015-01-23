<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
  
  Copyright IBM Corporation 2007, 2013. All Rights Reserved.
  
  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2007, 2010 Curam Software Ltd.                           -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description -->
<!-- =========== -->
<!-- Views an Employer Snapshot.                                            -->
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
    CLASS="Employer"
    NAME="DISPLAY"
    OPERATION="readEmployerDetails"
  />


  <PAGE_PARAMETER NAME="concernRoleID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="concernRoleID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="maintainConcernRoleKey$concernRoleID"
    />
  </CONNECT>


  <CLUSTER
    NUM_COLS="2"
    TITLE="Cluster.Title.Details"
  >


    <!-- BEGIN, CR00358775, SS -->
    <FIELD LABEL="Field.Label.PermStaff">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="numberPermanentStaff"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.CasualStaff">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="numberCasualStaff"
        />
      </CONNECT>
    </FIELD>
    <!-- END, CR00358775 -->


    <FIELD LABEL="Field.Label.BusinessDesc">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="businessDesc"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.PreferredLanguage">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="preferredLanguage"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.SpecialInterest">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="specialInterestCode"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.PaymentFrequency">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="paymentFrequency"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.NextPaymentDate">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="nextPaymentDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.StatusCode">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="statusCode"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.EmployerType">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="companyType"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.PublicOfficeName">
      <CONNECT>
        <INITIAL
          NAME="DISPLAY"
          PROPERTY="publicOfficeName"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.PrefCommMethod">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="prefCommMethod"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.RegistrationDate">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="registrationDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Sensitivity">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="sensitivity"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Currency">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="currencyType"
        />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.MethodOfPayment">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="methodOfPmtCode"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


  <CLUSTER
    SHOW_LABELS="false"
    TITLE="Cluster.Title.Comments"
  >


    <FIELD>
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="comments"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


</VIEW>