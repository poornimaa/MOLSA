<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:strip-space elements="*"/>
  <xsl:output indent="no" omit-xml-declaration="yes"/>
  <xsl:param name="rules-config" />
  <xsl:param name="config-id"/>
  <xsl:variable name="ruleset-id" select="/RuleSet/*[1]/@id"/>
  <xsl:param name="locale-code" select="'en'"/>
  <xsl:param name="static-content-server-url"/>
  <xsl:param name="o3rpu"/>
  <xsl:key name="TYPE" match="TYPE[parent::node()/@ID = $config-id]" use="@NAME"/>
  <xsl:template match="RuleSet">
    <div class="rules-edit">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="Product | Assessment | SubRuleSet | ObjectiveGroup | ObjectiveListGroup | Objective | RuleGroup | RuleListGroup | Rule">
    <xsl:variable name="text-value">
      <xsl:choose>
        <xsl:when test="Label/RuleName/Text[@locale=$locale-code]/@value">
          <xsl:value-of select="Label/RuleName/Text[@locale=$locale-code]/@value"/>
        </xsl:when>
        <xsl:otherwise>          
          <xsl:value-of select="Label/RuleName/Text[position()=1]/@value"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="output-rule">
      <xsl:with-param name="rule-type" select="name()"/>
      <xsl:with-param name="text" select="$text-value"/>
      <xsl:with-param name="id" select="@id"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="SubRuleSetLink">
    <xsl:call-template name="output-rule">
      <xsl:with-param name="rule-type" select="name()"/>
      <xsl:with-param name="text" select="@name"/>
      <xsl:with-param name="id" select="@id"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="DataItemAssignment">
    <xsl:call-template name="output-rule">
      <xsl:with-param name="rule-type" select="name()"/>
      <xsl:with-param name="text" select="@dataitem"/>
      <xsl:with-param name="id" select="@id"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="output-rule">
    <xsl:param name="rule-type"/>
    <xsl:param name="text"/>
    <xsl:param name="id"/>
    <div class="rule">
      <xsl:for-each select="$rules-config">
        <div class="icon">
          <img alt="{$text}">
            <xsl:attribute name="src">
              <xsl:value-of select="$static-content-server-url"/>
              <xsl:text>/</xsl:text>
              <xsl:choose>
                <xsl:when test="@result = 'F'"><xsl:value-of select="key('TYPE', $rule-type)/@FAILURE-ICON"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="key('TYPE', $rule-type)/@SUCCESS-ICON"/></xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </img>
        </div>
        <div class="text">
        <xsl:choose>
          <xsl:when test="key('TYPE', $rule-type)/@EDIT-PAGE">
          <a href="{concat(key('TYPE', $rule-type)/@EDIT-PAGE,
                           'Page.do?id=',
                           $id,
                           '&amp;rulesetId=',
                           $ruleset-id,
                           '&amp;',
                           $o3rpu)}"><xsl:value-of select="$text"/></a>
          </xsl:when>
          <xsl:otherwise>
          <xsl:value-of select="$text"/>
          </xsl:otherwise>
        </xsl:choose>
        </div>
      </xsl:for-each>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
</xsl:stylesheet>
