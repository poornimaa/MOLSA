<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed Materials - Property of IBM
 
  Copyright IBM Corporation 2012. All Rights Reserved.

  US Government Users Restricted Rights - Use, duplication or disclosure 
  restricted by GSA ADP Schedule Contract with IBM Corp.
-->
<!-- Copyright (c) 2006-2008 Curam Software Ltd.                            -->
<!-- All rights reserved.                                                   -->
<!-- This software is the confidential and proprietary information of       -->
<!-- Curam Software, Ltd. ("Confidential Information"). You                 -->
<!-- shall not disclose such Confidential Information and shall use it only -->
<!-- in accordance with the terms of the license agreement you entered into -->
<!-- with Curam Software.                                                   -->
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
    <CONNECT>
      <SOURCE
        NAME="getQuestionAliasBean"
        PROPERTY="result$question"
      />
    </CONNECT>
  </PAGE_TITLE>
  <SERVER_INTERFACE
    CLASS="MaintainIEG"
    NAME="getQuestionGroupBean"
    OPERATION="getQuestionGroupByID"
    PHASE="DISPLAY"
  />
  <SERVER_INTERFACE
    CLASS="MaintainIEG"
    NAME="getQuestionAliasBean"
    OPERATION="getQuestionAlias"
    PHASE="DISPLAY"
  />
  <SERVER_INTERFACE
    CLASS="MaintainIEG"
    NAME="modifyQuestionAliasBean"
    OPERATION="modifyQuestionAlias"
    PHASE="ACTION"
  />
  <PAGE_PARAMETER NAME="questionIDParam"/>
  <PAGE_PARAMETER NAME="questionGroupIDParam"/>
  <PAGE_PARAMETER NAME="questionScriptIDParam"/>
  <PAGE_PARAMETER NAME="questionPageIDParam"/>
  <PAGE_PARAMETER NAME="aliasTypeParam"/>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionGroupIDParam"
    />
    <TARGET
      NAME="getQuestionAliasBean"
      PROPERTY="questionAliasDetails$groupID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionIDParam"
    />
    <TARGET
      NAME="getQuestionAliasBean"
      PROPERTY="questionAliasDetails$id"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="aliasTypeParam"
    />
    <TARGET
      NAME="getQuestionAliasBean"
      PROPERTY="questionAliasDetails$type"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionGroupIDParam"
    />
    <TARGET
      NAME="getQuestionGroupBean"
      PROPERTY="questionGroupID$questionGroupID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionScriptIDParam"
    />
    <TARGET
      NAME="getQuestionGroupBean"
      PROPERTY="questionGroupID$scriptId"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionGroupIDParam"
    />
    <TARGET
      NAME="modifyQuestionAliasBean"
      PROPERTY="groupID"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="questionIDParam"
    />
    <TARGET
      NAME="modifyQuestionAliasBean"
      PROPERTY="id"
    />
  </CONNECT>
  <CONNECT>
    <SOURCE
      NAME="PAGE"
      PROPERTY="aliasTypeParam"
    />
    <TARGET
      NAME="modifyQuestionAliasBean"
      PROPERTY="type"
    />
  </CONNECT>
  <!-- Only display this cluster if there are dependant scriptRelationships -->
  <JSP_SCRIPTLET>
  <![CDATA[
    curam.omega3.texthelper.TextHelper th =
      (curam.omega3.texthelper.TextHelper)pageContext.findAttribute("getQuestionGroupBean");
    String scriptRelationships = th.getFieldValue("result$scriptRelationships");
    
    if (scriptRelationships.length() > 0) {
  ]]>
  </JSP_SCRIPTLET>
  <CLUSTER SHOW_LABELS="false">
    <FIELD>
      <CONNECT>
        <SOURCE
          NAME="getQuestionGroupBean"
          PROPERTY="scriptRelationships"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
  <JSP_SCRIPTLET>
  <![CDATA[
    }
  ]]>
  </JSP_SCRIPTLET>
  <CLUSTER
    LABEL_WIDTH="20"
    TITLE="Cluster.Title.QuestionDetails"
  >
    <FIELD
      LABEL="Field.Label.QuestionAlias"
      WIDTH="100"
    >
      <CONNECT>
        <SOURCE
          NAME="getQuestionAliasBean"
          PROPERTY="result$question"
        />
      </CONNECT>
      <CONNECT>
        <TARGET
          NAME="modifyQuestionAliasBean"
          PROPERTY="question"
        />
      </CONNECT>
    </FIELD>
    <FIELD LABEL="Field.Label.Type">
      <CONNECT>
        <SOURCE
          NAME="getQuestionAliasBean"
          PROPERTY="result$type"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>
  <CLUSTER
    NUM_COLS="2"
    SHOW_LABELS="false"
    STYLE="outer-cluster-borderless"
  >
    <CLUSTER
      SHOW_LABELS="false"
      TITLE="Cluster.Title.ScriptText"
    >
      <FIELD HEIGHT="3">
        <CONNECT>
          <SOURCE
            NAME="getQuestionAliasBean"
            PROPERTY="result$scriptText"
          />
        </CONNECT>
        <CONNECT>
          <TARGET
            NAME="modifyQuestionAliasBean"
            PROPERTY="scriptText"
          />
        </CONNECT>
      </FIELD>
    </CLUSTER>
    <CLUSTER
      SHOW_LABELS="false"
      TITLE="Cluster.Title.QuestionHelpText"
    >
      <FIELD HEIGHT="3">
        <CONNECT>
          <SOURCE
            NAME="getQuestionAliasBean"
            PROPERTY="result$helpText"
          />
        </CONNECT>
        <CONNECT>
          <TARGET
            NAME="modifyQuestionAliasBean"
            PROPERTY="helpText"
          />
        </CONNECT>
      </FIELD>
    </CLUSTER>
  </CLUSTER>
</VIEW>
