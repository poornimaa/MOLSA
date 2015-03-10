<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright 2008 Curam Software Ltd.                                     -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of Curam -->
<!-- Software, Ltd. ("Confidential Information"). You shall not disclose    -->
<!-- such Confidential Information and shall use it only in accordance with -->
<!-- the terms of the license agreement you entered into with Curam         -->
<!-- Software.                                                              -->
<!-- Description -->
<!-- =========== -->
<!-- Views an Alternate Name Snapshot.                                      -->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>

  <SERVER_INTERFACE
    CLASS="Person"
    NAME="DISPLAY"
    OPERATION="readAlternativeName"
  />
  
  <PAGE_PARAMETER NAME="alternateNameID" />

  <CONNECT>
    <SOURCE NAME="PAGE" PROPERTY="alternateNameID" />
    <TARGET NAME="DISPLAY" PROPERTY="readPersonNameKey$alternateNameID" />
  </CONNECT>


  <CLUSTER NUM_COLS="2" TITLE="Cluster.Label.Details">


    <FIELD LABEL="Field.Label.Title">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="title" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.MiddleName">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="otherForename" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Suffix">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="nameSuffix" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Type">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="nameType" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.FirstName">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="firstForename" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.LastName">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="surname" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Initials">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="initials" />
      </CONNECT>
    </FIELD>


    <FIELD LABEL="Field.Label.Status">
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="nameStatus" />
      </CONNECT>
    </FIELD>


  </CLUSTER>


  <CLUSTER SHOW_LABELS="false" TITLE="Cluster.Label.Comments">


    <FIELD>
      <CONNECT>
        <SOURCE NAME="DISPLAY" PROPERTY="comments" />
      </CONNECT>
    </FIELD>


  </CLUSTER>
  
  
</VIEW>