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
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- This page allows the user to view questions and answers details record. -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>
  <PAGE_PARAMETER NAME="caseID"/>
  <SERVER_INTERFACE
    CLASS="QuestionAnswer"
    NAME="VIEW_ANSWER"
    OPERATION="viewAssessmentAnswers"
    PHASE="DISPLAY"
  />
  <SERVER_INTERFACE
    CLASS="DAAssessment"
    NAME="ASSESSMENTCONTEXT"
    OPERATION="viewAssessmentContextDescription"
    PHASE="DISPLAY"
  />
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="caseID"
    />
    <TARGET
      NAME="VIEW_ANSWER"
      PROPERTY="key$dtls$dtls$assessmentCaseID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="caseID"
    />
    <TARGET
      NAME="ASSESSMENTCONTEXT"
      PROPERTY="key$dtls$dtls$assessmentCaseID"
    />
  </CONNECT>
  <PAGE_TITLE>
    <CONNECT>
      <SOURCE
        NAME="TEXT"
        PROPERTY="PageTitle.StaticText1"
      />
    </CONNECT>
  </PAGE_TITLE>


</VIEW>