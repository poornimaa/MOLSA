<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<VIEW
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="file://Curam/UIMSchema.xsd"
>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processID"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="processID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="processVersionNo"
    />
    <TARGET
      NAME="DISPLAY"
      PROPERTY="processVersionNo"
    />
  </CONNECT>
  <LIST>
    <FIELD
      USE_BLANK="true"
      WIDTH="5"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$dtls$status"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="List.ValidationErrors.Action"
      WIDTH="10"
    >
      <CONNECT>
        <SOURCE
          NAME="TEXT"
          PROPERTY="Field.Label.Fix"
        />
      </CONNECT>
      <LINK
        OPEN_NEW="true"
        PAGE_ID="ProcessDefinitionTool_fixValidationErrorRedirect"
      >
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$url"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="url"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="processVersionNo"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$componentID"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="componentID"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$componentType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="componentType"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$componentName"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="componentName"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$componentParentName"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="componentParentName"
          />
        </CONNECT>
        <CONNECT>
          <SOURCE
            NAME="DISPLAY"
            PROPERTY="result$dtls$activityType"
          />
          <TARGET
            NAME="PAGE"
            PROPERTY="activityType"
          />
        </CONNECT>
      </LINK>
    </FIELD>
    <FIELD
      LABEL="List.ValidationErrors.ComponentName"
      WIDTH="25"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$dtls$componentName"
        />
      </CONNECT>
    </FIELD>
    <FIELD
      LABEL="List.ValidationErrors.Problem"
      WIDTH="60"
    >
      <CONNECT>
        <SOURCE
          NAME="DISPLAY"
          PROPERTY="result$dtls$errorDescription"
        />
      </CONNECT>
    </FIELD>
  </LIST>
</VIEW>