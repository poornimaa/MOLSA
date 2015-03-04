<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2008, 2012. All Rights Reserved.

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
<!-- Description -->
<!-- =========== -->
<!-- Create an action for the meeting -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>


  <SERVER_INTERFACE
    CLASS="MeetingMinutesManagement"
    NAME="DISPLAY_ATTENDEES"
    OPERATION="listPotentialActionAssignees"
    PHASE="DISPLAY"
  />


  <SERVER_INTERFACE
    CLASS="MeetingMinutesManagement"
    NAME="ACTION"
    OPERATION="createMeetingAction"
    PHASE="ACTION"
  />


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="meetingID"
    />
    <TARGET
      NAME="DISPLAY_ATTENDEES"
      PROPERTY="meetingID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="meetingID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="meetingID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="caseID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="caseID"
    />
  </CONNECT>


  <CLUSTER LABEL_WIDTH="14">
    <FIELD
      ALIGNMENT="LEFT"
      LABEL="Field.Label.Subject"
    >
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="subject"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <CLUSTER LABEL_WIDTH="14">
    <FIELD
      LABEL="Field.Label.DueDate"
      WIDTH="30"
    >
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="deadlineDateTime"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <LIST
    SCROLL_HEIGHT="125"
    TITLE="List.Title.SelectAssignees"
  >
    <CONTAINER
      LABEL="Field.Label.Select"
      WIDTH="10"
    >
      <WIDGET TYPE="MULTISELECT">
        <WIDGET_PARAMETER NAME="MULTI_SELECT_SOURCE">
          <CONNECT>
            <SOURCE
              NAME="DISPLAY_ATTENDEES"
              PROPERTY="userName"
            />
          </CONNECT>
        </WIDGET_PARAMETER>
        <WIDGET_PARAMETER NAME="MULTI_SELECT_TARGET">
          <CONNECT>
            <TARGET
              NAME="ACTION"
              PROPERTY="actionAssigneeList"
            />
          </CONNECT>
        </WIDGET_PARAMETER>
      </WIDGET>
    </CONTAINER>


    <!-- BEGIN, CR00340542, PB  -->
    <FIELD
      LABEL="Field.Label.AssigneeName"
      WIDTH="35"
    >
      <!-- END, CR00340542 -->
      <CONNECT>
        <SOURCE
          NAME="DISPLAY_ATTENDEES"
          PROPERTY="fullName"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Role"
      WIDTH="35"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY_ATTENDEES"
          PROPERTY="role"
        />
      </CONNECT>
    </FIELD>


    <!-- BEGIN, CR00340542, PB  -->
    <FIELD
      LABEL="Field.Label.Attended"
      WIDTH="20"
    >
      <!-- END, CR00340542 -->
      <CONNECT>
        <SOURCE
          NAME="DISPLAY_ATTENDEES"
          PROPERTY="attendedInd"
        />
      </CONNECT>
    </FIELD>
  </LIST>


</VIEW>