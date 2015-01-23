<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM

  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->

<!-- Copyright (c) 2002-2011 Curam Software Ltd.                            -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description -->
<!-- =========== -->
<!-- The included view to display a list of events for a product delivery   -->
<!-- on an integrated case.                                                 -->
<VIEW xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd">
  <PAGE_TITLE>
    <CONNECT>
      <SOURCE NAME="TEXT" PROPERTY="PageTitle.StaticText1"/>
    </CONNECT>
  </PAGE_TITLE>

  <SERVER_INTERFACE CLASS="ApplicationCase" NAME="DISPLAY" OPERATION="listMeetings"/>
  <PAGE_PARAMETER NAME="caseID"/>

  <CONNECT>
    <SOURCE NAME="PAGE" PROPERTY="caseID"/>
    <TARGET NAME="DISPLAY" PROPERTY="caseID"/>
  </CONNECT>

  <LIST>

    <INCLUDE FILE_NAME="ApplicationCase_listEventsListRowMenuView.vim"/>

    <DETAILS_ROW>
      <INLINE_PAGE PAGE_ID="ApplicationCase_viewMeetingInline">
        <CONNECT>
          <SOURCE NAME="DISPLAY" PROPERTY="relatedID"/>
          <TARGET NAME="PAGE" PROPERTY="activityID"/>
        </CONNECT>
      </INLINE_PAGE>
    </DETAILS_ROW>

    <FIELD LABEL="Field.Label.Event" WIDTH="58">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="subject"/>
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.StartDate" WIDTH="22">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="startDate"/>
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.EndDate" WIDTH="20">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="endDate"/>
      </CONNECT>
    </FIELD>
  </LIST>
</VIEW>