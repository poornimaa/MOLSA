<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
  
  Copyright IBM Corporation 2012. All Rights Reserved.
  
  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright 2010 Curam Software Ltd.                                     -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- in accordance with the terms of the license agreement you entered into -->
<!-- Software.                                                              -->
<!-- Description -->
<!-- =========== -->
<!-- This page displays the list of Expected Outcomes Administration Records.    -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>


  <PAGE_TITLE>
    <CONNECT>
      <SOURCE
        NAME="TEXT"
        PROPERTY="Page.Title"
      />
    </CONNECT>
  </PAGE_TITLE>


  <SERVER_INTERFACE
    CLASS="ServiceEnquiry"
    NAME="DISPLAY"
    OPERATION="viewProviderServiceEnquiriesOverview"
    PHASE="DISPLAY"
  />


  <PAGE_PARAMETER NAME="providerConcernRoleID"/>
  <PAGE_PARAMETER NAME="serviceOfferingID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="providerConcernRoleID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="key$providerConcernRoleID"
    />
  </CONNECT>


  <CLUSTER
    LABEL_WIDTH="45"
    NUM_COLS="2"
  >
    <FIELD LABEL="Field.PreferredEnquiryMethod.Label">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="preferredContact"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.PhoneNumber.Label">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="phoneNumber"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <CLUSTER
    LABEL_WIDTH="40"
    NUM_COLS="2"
    TITLE="Cluster.WebStatistics.Title"
  >
    <CONDITION>
      <IS_TRUE
        NAME="DISPLAY"
        PROPERTY="webStatisticsInd"
      />
    </CONDITION>
    <FIELD LABEL="Field.AverageInitialResponse.Label">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="averageResponseDescription"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Responses.Label">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="percentageResponseDescription"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <LIST TITLE="List.Enquiries.Title">
    <DETAILS_ROW>
      <INLINE_PAGE PAGE_ID="ProviderManagement_viewServiceEnquiry">
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="serviceEnquiryID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="serviceEnquiryID"
          />
        </CONNECT>
      </INLINE_PAGE>
    </DETAILS_ROW>
    <FIELD
      LABEL="Field.Label.EnquiryDate"
      WIDTH="15"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="serviceEnquiryDate"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.Service"
      WIDTH="40"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="serviceName"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.ProviderResponse"
      WIDTH="25"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="providerResponse"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="Field.Label.EnquiryMethod"
      WIDTH="20"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="enquiryMethod"
        />
      </CONNECT>
    </FIELD>
  </LIST>


</VIEW>
