<?xml version="1.0" encoding="UTF-8"?>
<!-- BEGIN, CR00357205, PB -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:foa="http://fabio" version="1.0">
  <!-- END, CR00357205 -->
  <!--BEGIN, CR00352142, PB -->
  <xsl:attribute-set name="Normal_1" foa:class="block">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="margin-left">0.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="space-after">0.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="space-before">0.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-align">center</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="text-indent">0.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_2" foa:class="inline">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">12.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_3" foa:class="inline">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">8.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_4" foa:class="inline">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">8.0pt</xsl:attribute>
    <!-- END NON-TRANSLATABLE -->
  </xsl:attribute-set>
  <xsl:attribute-set name="Normal_5" foa:class="inline">
    <!-- START NON-TRANSLATABLE -->
    <xsl:attribute name="font-size">8.0pt</xsl:attribute>
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
    <xsl:apply-templates select="STRUCT[SNAME='PrintPreviewContactLogDetails']" />
  </xsl:template>
  <xsl:template match="STRUCT[SNAME='PrintPreviewContactLogDetails']">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="only" page-height="297mm" page-width="210mm" margin-top="20mm" margin-bottom="20mm" margin-left="20mm" margin-right="20mm">
          <fo:region-body />
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="only">
        <!-- START NON-TRANSLATABLE -->
        <fo:flow flow-name="xsl-region-body" font-family="WT Sans ME">
          <!-- END NON-TRANSLATABLE -->
          <!-- BEGIN, CR00352142, PB -->
          <fo:block xsl:use-attribute-sets="Normal_1">
            <fo:inline xsl:use-attribute-sets="Normal_2">
              معاينة تفاصيل سجل جهة الاتصال -
              <xsl:apply-templates select="FIELD[FNAME='context']" />
            </fo:inline>
          </fo:block>
          <fo:block font-size="20.0pt" margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt"> </fo:block>
          <!-- BEGIN, CR00417345,AC-->
          <xsl:apply-templates select="FIELD[FNAME='preview']/STRUCT[SNAME='PreviewContactLogFileDetailsList']/FIELD[FNAME='dtlsList']" />
          <!-- END, CR00417345-->
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="FIELD[FNAME='dtlsList']">
    <xsl:if test="count(STRUCT_LIST/STRUCT) &gt; 0">
      <fo:block font-size="12pt">
        <fo:table>
          <fo:table-column column-width="110pt" />
          <fo:table-column column-width="400pt" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">تاريخ/وقت الاتصال</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">تفاصيل سجل الاتصال</fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <!-- BEGIN, CR00417345,AC-->
            <xsl:apply-templates select="STRUCT_LIST/STRUCT[SNAME='PreviewContactLogFileDetails']" />
            <!-- END, CR00417345-->
          </fo:table-body>
        </fo:table>
      </fo:block>
    </xsl:if>
    <fo:block font-size="10.0pt" margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt"> </fo:block>
  </xsl:template>
  <!-- BEGIN, CR00417345, AC-->
  <xsl:template match="STRUCT[SNAME='PreviewContactLogFileDetails']">
    <!-- END, CR00417345-->
    <fo:table-row>
      <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="2.4pt" padding-right="2.4pt">
        <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
          <fo:inline xsl:use-attribute-sets="Normal_4">
            <xsl:apply-templates select="FIELD[FNAME='startDateTime']" />
          </fo:inline>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="0.0pt" padding-right="0.0pt">
        <fo:table>
          <fo:table-column column-width="25%" />
          <fo:table-column column-width="44%" />
          <fo:table-column column-width="12%" />
          <fo:table-column column-width="19%" />
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">نوع جهة الاتصال</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">الغرض</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">المكان</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="center" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">الطريقة</fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='contactLogType']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='purpose']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='location']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='method']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <!-- BEGIN, CR00417345, AC-->
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">المؤلف</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell number-columns-spanned="3" border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='author']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <!-- END, CR00417345-->
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">المشاركين</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell number-columns-spanned="3" border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='participantList']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_3">الاعتبارات</fo:inline>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell number-columns-spanned="3" border-bottom-style="solid" border-bottom-width="0.5pt" border-top-style="solid" border-top-width="0.5pt" border-start-style="solid" border-start-width="0.5pt" border-end-style="solid" border-end-width="0.5pt" padding-left="5.4pt" padding-right="5.4pt">
                <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
                  <fo:inline xsl:use-attribute-sets="Normal_4">
                    <xsl:apply-templates select="FIELD[FNAME='concernList']" />
                  </fo:inline>
                </fo:block>
              </fo:table-cell>
            </fo:table-row>
            <!-- BEGIN, CR00417345,AC-->
            <xsl:apply-templates select="STRUCT_LIST/STRUCT[SNAME='PreviewContactLogFileDetails']" />
            <!-- END, CR00417345-->
          </fo:table-body>
        </fo:table>
        <fo:block margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
          <fo:inline xsl:use-attribute-sets="Normal_2">عرض الأخبار</fo:inline>
        </fo:block>
        <fo:block wrap-option="wrap" break-after="auto" margin-left="0.0pt" space-after="0.0pt" space-before="0.0pt" text-align="start" text-indent="0.0pt">
          <!-- BEGIN, CR00438013, RCB -->
          <fo:inline xsl:use-attribute-sets="Normal_3">
            <!-- END, CR00438013 -->
            <xsl:apply-templates select="FIELD[FNAME='noteDetails']" />
          </fo:inline>
        </fo:block>
        <!-- END, CR00352142 -->
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="FIELD[FNAME='noteDetails']">
    <xsl:apply-templates select="STRUCT[SNAME='NoteTextList']" />
  </xsl:template>
  <xsl:template match="STRUCT[SNAME='NoteTextList']">
    <xsl:apply-templates select="FIELD[FNAME='noteList']" />
  </xsl:template>
  <xsl:template match="FIELD[FNAME='noteList']">
    <xsl:apply-templates select="STRUCT_LIST/STRUCT[SNAME='NoteText']" />
  </xsl:template>
  <xsl:template match="STRUCT[SNAME='NoteText']">
    <!-- BEGIN, CR00438013, RCB -->
    <fo:inline xsl:use-attribute-sets="Normal_4">
      <xsl:apply-templates select="FIELD[FNAME='notesText']" />
      <xsl:if test="position()!=last()">
        <fo:block xsl:use-attribute-sets="Normal_5">
          <!-- END, CR00438013 -->
          <!-- BEGIN, CR00376659, SD -->
          <xsl:text />
          <!-- END, CR00376659, SD -->
        </fo:block>
      </xsl:if>
    </fo:inline>
  </xsl:template>
  <xsl:template match="FIELD">
    <xsl:value-of select="VALUE" />
  </xsl:template>
  <!-- BEGIN, CR00404450, CD/JAF -->
  <xsl:template match="FIELD[FNAME='notesText']">
    <fo:block linefeed-treatment="preserve" white-space-collapse="false" white-space-treatment="preserve">
      <xsl:value-of select="VALUE" />
    </fo:block>
  </xsl:template>
  <!-- END, CR00404450, CD/JAF -->
</xsl:stylesheet>


