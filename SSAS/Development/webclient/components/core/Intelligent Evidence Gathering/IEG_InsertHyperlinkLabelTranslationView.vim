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
   </PAGE_TITLE>


   <PAGE_PARAMETER NAME="questionScriptIDParam"/>
   <PAGE_PARAMETER NAME="questionPageIDParam"/>
   <PAGE_PARAMETER NAME="questionGroupIDParam"/>
   <PAGE_PARAMETER NAME="hyperlinkLabelIDParam"/>
   
   <SERVER_INTERFACE
     CLASS="MaintainIEG"
     NAME="getQuestionGroupBean"
     OPERATION="getQuestionGroupByID"
     PHASE="DISPLAY"
   />
   <SERVER_INTERFACE
     CLASS="MaintainIEG"
     NAME="insertHyperlinkLabelTranslationBean"
     OPERATION="insertHyperlinkLabelTranslation"
     PHASE="ACTION"
   />

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
       NAME="insertHyperlinkLabelTranslationBean"
       PROPERTY="groupId"
     />
   </CONNECT>
   <CONNECT>
     <SOURCE
       NAME="PAGE"
       PROPERTY="hyperlinkLabelIDParam"
     />
     <TARGET
       NAME="insertHyperlinkLabelTranslationBean"
       PROPERTY="id"
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
    TITLE="Cluster.Title.HyperlinkLabelDetails"
    LABEL_WIDTH="20"
    WIDTH="80">
    <FIELD LABEL="Field.Label.Language">
      <CONNECT>
        <TARGET
          NAME="insertHyperlinkLabelTranslationBean"
          PROPERTY="locale"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>

  <CLUSTER
    TITLE="Cluster.Title.Text"
    SHOW_LABELS="false"
    WIDTH="80">
    <FIELD
      HEIGHT="8"
      LABEL="Field.Label.Text">
      <CONNECT>
        <TARGET
          NAME="insertHyperlinkLabelTranslationBean"
          PROPERTY="text"
        />
      </CONNECT>
    </FIELD>
  </CLUSTER>




</VIEW>