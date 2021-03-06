<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
  
  PID 5725-H26
  
  Copyright IBM Corporation 2008, 2014. All Rights Reserved.
  
  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright 2008, 2010 Curam Software Ltd.                               -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- This page allows the user to view certification record.                -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>


  <PAGE_PARAMETER NAME="memberCertificationID"/>


  <PAGE_PARAMETER NAME="contextdescription"/>


  <SERVER_INTERFACE
    CLASS="MaintainMemberCertification"
    NAME="DISPLAY"
    OPERATION="viewMemberCertification"
    PHASE="DISPLAY"
  />
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="memberCertificationID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="key$memberCertificationID"
    />
  </CONNECT>
  <PAGE_TITLE>
    <CONNECT>
      <SOURCE
        NAME="TEXT"
        PROPERTY="PageTitle.StaticText"
      />
    </CONNECT>
  </PAGE_TITLE>
  <CLUSTER
    SHOW_LABELS="false"
    TITLE="Cluster.Title.Comments"
  >
    <!-- BEGIN, CR00199550, SS -->
    <!-- BEGIN, CR00417165, GK -->
    <FIELD
      HEIGHT="4"
      LABEL="Field.Label.Comments"
    >
      <!-- END, CR00417165 -->
      <!-- END, CR00199550 -->
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$comments"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
</VIEW>
