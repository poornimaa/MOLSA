<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
  
  PID 5725-H26
  
  Copyright IBM Corporation 2008, 2014. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2008, 2010 Curam Software Ltd.                           -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- This method allows an administrator to modify an Investigation         -->
<!--  Resolution Approval Check for a particular investigation.             -->
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
    CLASS="Product"
    NAME="DISPLAY"
    OPERATION="readApprovalCheckForInvestigation"
    PHASE="DISPLAY"
  />


  <SERVER_INTERFACE
    CLASS="Product"
    NAME="ACTION"
    OPERATION="modifyApprovalCheckForInvestigation"
    PHASE="ACTION"
  />


  <PAGE_PARAMETER NAME="investigationApprovalCheckID"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="investigationApprovalCheckID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="key$investigationApprovalCheckID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="investigationApprovalCheckID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="investigationApprovalCheckID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="investigationConfigID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="investigationConfigID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="recordStatus"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="recordStatus"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="versionNo"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="versionNo"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="typeCode"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="typeCode"
    />
  </CONNECT>


  <CLUSTER LABEL_WIDTH="28">
    <FIELD
      LABEL="Field.Title.Percentage"
      WIDTH="4"
      WIDTH_UNITS="CHARS"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="percentage"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="percentage"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


  <CLUSTER
    SHOW_LABELS="false"
    TITLE="Cluster.Title.Comments"
  >


    <!-- BEGIN, CR00406866, VT -->
    <FIELD
      HEIGHT="4"
      LABEL="Field.Label.Comments"
    >
      <!-- END, CR00406866 -->
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="comments"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="comments"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


</VIEW>
