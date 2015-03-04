<?xml version="1.0" encoding="UTF-8"?>
<!--
  IBM Confidential
  
  OCO Source Materials
  
  PID 5725-H26
  
  Copyright IBM Corporation 2009, 2014
  
  The source code for this program is not published or otherwise divested
  of its trade secrets, irrespective of what has been deposited with the US Copyright Office
  
-->
<!-- Copyright 2009-2011 Curam Software Ltd.                                    -->
<!-- All rights reserved.                                                       -->
<!-- This software is the confidential and proprietary information of Curam     -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose        -->
<!-- such Confidential Information and shall use it only in accordance with     -->
<!-- the terms of the license agreement you entered into with Curam             -->
<!-- Software.                                                                  -->
<!-- Description                                                                -->
<!-- ===========                                                                -->
<!-- The included view to modify a contact log details.                         -->
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
    CLASS="ContactLog"
    NAME="DISPLAY"
    OPERATION="readContactLogForModify"
    PHASE="DISPLAY"
  />
  <SERVER_INTERFACE
    CLASS="ContactLog"
    NAME="ACTION"
    OPERATION="modifyContactLog"
    PHASE="ACTION"
  />
  <!-- BEGIN, CR00140531, CL -->
  <SERVER_INTERFACE
    CLASS="ContactLog"
    NAME="DISPLAYPURPOSE"
    OPERATION="listPurpose"
  />
  <!-- END, CR00140531 -->


  <PAGE_PARAMETER NAME="contactLogID"/>
  <PAGE_PARAMETER NAME="description"/>


  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="contactLogID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="key$contactLogID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="contactLogDetails$contactLogID"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="contactLogID"
    />
  </CONNECT>
  <!--BEGIN, CR00140531, CL-->
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="createdDateTime"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="createdDateTime"
    />
  </CONNECT>
  <!--END, CR00140531 -->
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="createdBy"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="createdBy"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="contactLogDetails$recordStatus"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="recordStatus"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="addendumInd"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="addendumInd"
    />
  </CONNECT>


  <CONNECT>
    <SOURCE
      NAME="DISPLAY"
      PROPERTY="contactLogDetails$versionNo"
    />
    <TARGET
      NAME="ACTION"
      PROPERTY="versionNo"
    />
  </CONNECT>


  <CLUSTER
    LABEL_WIDTH="32"
    NUM_COLS="2"
  >


    <!-- BEGIN, CR00140531, CL -->
    <FIELD
      CONTROL="CHECKBOXED_LIST"
      HEIGHT="3"
      LABEL="Field.Label.Purpose"
      USE_BLANK="false"
    >
      <CONNECT>
        <INITIAL
          HIDDEN_PROPERTY="purposeCode"
          NAME="DISPLAYPURPOSE"
          PROPERTY="purposeName"
        />
      </CONNECT>
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="purpose"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="purpose"
        />
      </CONNECT>
    </FIELD>


    <!-- BEGIN, CR00426798, AC -->
    <FIELD LABEL="Field.Label.Author">
      <CONNECT>
        <INITIAL
          NAME="DISPLAY"
          PROPERTY="authorFullName"
        />
      </CONNECT>
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="author"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="author"
        />
      </CONNECT>
    </FIELD>
    <!-- END, CR00426798-->
    <FIELD
      LABEL="Field.Label.Location"
      WIDTH="77"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="location"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="location"
        />
      </CONNECT>
    </FIELD>
    <!-- END, CR00140531 -->


    <FIELD LABEL="Field.Label.StartDate">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="startDateTime"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="startDateTime"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Type"
      WIDTH="77"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="contactLogType"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="contactLogType"
        />
      </CONNECT>
    </FIELD>


    <FIELD CONTROL="SKIP"/>


    <!-- BEGIN, CR00140531, CL -->
    <FIELD LABEL="Field.Label.LocationDescription">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="locationDescription"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="locationDescription"
        />
      </CONNECT>
    </FIELD>
    <!-- END, CR00140531 -->


    <FIELD LABEL="Field.Label.EndDate">
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="endDateTime"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="endDateTime"
        />
      </CONNECT>
    </FIELD>


    <FIELD
      LABEL="Field.Label.Method"
      WIDTH="57"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="method"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="method"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>


  <CLUSTER
    LABEL_WIDTH="30"
    SHOW_LABELS="false"
    TITLE="Cluster.Label.NarrativeDetails"
  >


    <FIELD>
      <CONNECT>
        <TARGET
          NAME="ACTION"
          PROPERTY="noteDetails$notesText"
        />
      </CONNECT>
    </FIELD>


  </CLUSTER>


</VIEW>