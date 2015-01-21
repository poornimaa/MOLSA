<?xml version="1.0" encoding="UTF-8"?>
<!-- BEGIN, CR00357205, PB -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:foa="http://fabio" version="1.0">
  <!-- END, CR00357205 -->
  <!-- BEGIN, CR00352142, PB -->
  <xsl:attribute-set name="Normal_1" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">5mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-align">right</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_2" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">5mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">110mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-align">right</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_3" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">5mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_4" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">7mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="white-space-collapse">false</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_5" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">15mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_6" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">7mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_7" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="line-height">5mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0mm</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <!-- END, CR00352142 -->
  <xsl:template match="DOCUMENT">
    <!--Explicitly select DATA to ensure META element is ignored.-->
    <xsl:apply-templates select="DATA" />
  </xsl:template>
  <xsl:template match="DATA">
    <!--Explicitly select the STRUCT to avoid processing anything else.-->
    <!-- to do: change SNAME name -->
    <xsl:apply-templates select="STRUCT[SNAME='ProFormaDocumentData']" />
  </xsl:template>
  <xsl:template match="STRUCT">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="only" page-height="297mm" page-width="210mm" margin-top="30mm" margin-bottom="30mm" margin-left="30mm" margin-right="30mm">
          <fo:region-body />
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="only">
        <!-- START NON-TRANSLATABLE -->
        <fo:flow flow-name="xsl-region-body" font-family="WT Sans ME">
          <!-- END NON-TRANSLATABLE -->
          <!-- BEGIN, CR00352142, PB -->
          <fo:block xsl:use-attribute-sets="Normal_1">
            <xsl:apply-templates select="FIELD[FNAME='organisationName']" />
          </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_2">
            <xsl:apply-templates select="FIELD[FNAME='userAddress']" />
          </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_3"> </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_3"> </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_4">
            <xsl:apply-templates select="FIELD[FNAME='concernRoleAddress']" />
          </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_5"> </fo:block>
          <!-- BEGIN, CR00357029, PB -->
          <fo:block xsl:use-attribute-sets="Normal_6">
            عزيزي <xsl:apply-templates select="FIELD[FNAME='concernRoleName']" />
          </fo:block>
          <!-- END, CR00357029 -->
          <fo:block xsl:use-attribute-sets="Normal_7"> </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_6">
            نريد اعلامك بأن
            <xsl:apply-templates select="FIELD[FNAME='productType']" />
            حالتك برقم المرجع،
            <xsl:apply-templates select="FIELD[FNAME='caseReference']" />,
            تم اغلاقها في
            <xsl:apply-templates select="FIELD[FNAME='caseClosureDate']" />
            للسبب التالي -
            <xsl:apply-templates select="FIELD[FNAME='caseClosureReason']" />.
          </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_7"> </fo:block>
          <fo:block xsl:use-attribute-sets="Normal_6">مع خالص التقدير،</fo:block>
          <fo:block xsl:use-attribute-sets="Normal_7"> </fo:block>
          <!-- BEGIN, CR00357029, PB -->
          <fo:block xsl:use-attribute-sets="Normal_6">
            <xsl:apply-templates select="FIELD[FNAME='userFullName']" />
          </fo:block>
          <!-- END, CR00357029 -->
          <!-- END, CR00352142 -->
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="FIELD">
    <xsl:choose>
      <xsl:when test="TYPE='SVR_BOOLEAN'">
        <xsl:choose>
          <xsl:when test="VALUE='false'">لا</xsl:when>
          <xsl:otherwise>نعم</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="VALUE" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="NewTemplate">
    <xsl:apply-templates />
  </xsl:template>
</xsl:stylesheet>


