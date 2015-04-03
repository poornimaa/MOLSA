<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright 2008-2010 Curam Software Ltd.                                -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description                                                            -->
<!-- ===========                                                            -->
<!-- The included view to list weekly client participation for              -->
<!-- a plan item of the service plan                                        -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>
  <PAGE_TITLE>
    <CONNECT>
      <SOURCE
        NAME="TEXT"
        PROPERTY="PageTitle.Title"
      />
    </CONNECT>
  </PAGE_TITLE>


  <SERVER_INTERFACE
    CLASS="ServicePlanDelivery"
    NAME="DISPLAY"
    OPERATION="planItemClienParticipationWeeklyList"
  />


  <PAGE_PARAMETER NAME="plannedItemID"/>
  <PAGE_PARAMETER NAME="description"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="plannedItemID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="plannedItemID"
    />
  </CONNECT>


  <ACTION_SET
    BOTTOM="false"
    TOP="true"
  >
    <ACTION_CONTROL
      IMAGE="NewButton"
      LABEL="ActionControl.Label.New"
    >
      <LINK
        OPEN_MODAL="true"
        PAGE_ID="ServicePlanDelivery_addClientParticipationDefaultPlanItem"
      >
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="plannedItemID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="plannedItemID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="name"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="name"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="description"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="description"
          />
        </CONNECT>
      </LINK>
    </ACTION_CONTROL>
  </ACTION_SET>


  <LIST>


    <DETAILS_ROW>
      <INLINE_PAGE PAGE_ID="ServicePlanDelivery_plannedItemClientParticipationForWeekList">
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="plannedItemID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="plannedItemID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="name"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="name"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="fromDate"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="fromDate"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="toDate"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="toDate"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="description"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="description"
          />
        </CONNECT>
      </INLINE_PAGE>
    </DETAILS_ROW>


    <ACTION_SET TYPE="LIST_ROW_MENU">
      <ACTION_CONTROL
        IMAGE="NewButton"
        LABEL="ActionControl.Label.New"
      >
        <LINK
          OPEN_MODAL="true"
          PAGE_ID="ServicePlanDelivery_addClientParticipationDefaultPlanItem"
        >
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="plannedItemID"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="plannedItemID"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="DISPLAY"
              PROPERTY="name"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="name"
            />
          </CONNECT>
          <CONNECT>
            <SOURCE
              NAME="PAGE"
              PROPERTY="description"
            />
            <TARGET
              NAME="PAGE"
              PROPERTY="description"
            />
          </CONNECT>
        </LINK>
      </ACTION_CONTROL>
    </ACTION_SET>
    <!-- BEGIN, CR00234632, SS -->
    <FIELD
      LABEL="Field.Label.FromDate"
      WIDTH="34"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="fromDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.ToDate"
      WIDTH="34"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="toDate"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Time"
      WIDTH="32"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="totalTimeForWeek"
        />
      </CONNECT>
    </FIELD>
    <!-- END, CR00234632 -->


  </LIST>


</VIEW>