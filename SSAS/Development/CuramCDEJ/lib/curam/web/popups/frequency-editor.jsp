<?xml version="1.0" encoding="UTF-8"?> <jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:curam="http://www.curamsoftware.com/curam" version="2.0"> <jsp:directive.page import="curam.omega3.util.CDEJResources"/> <jsp:directive.page contentType="text/html; charset=UTF-8" errorPage="/en/CuramErrorPage.do" isErrorPage="false" language="java" pageEncoding="UTF-8"/> <jsp:directive.page import="curam.omega3.user.InfrastructureUserPreferences"/> <jsp:directive.page import="curam.omega3.user.UserPreferencesFactory"/> <jsp:directive.page import="curam.omega3.user.UserPreferences"/> <jsp:directive.page import="curam.util.common.util.JavaScriptEscaper"/> <jsp:directive.page import="curam.util.client.jsp.JspUtil"/> <jsp:output omit-xml-declaration="yes"/> <jsp:text><![CDATA[<!DOCTYPE html>]]></jsp:text> <jsp:scriptlet> pageContext.setAttribute("pageLocale", UserPreferencesFactory.getUserPreferences(session).getLocale().toString()); </jsp:scriptlet> <curam:userPreferences localeCode="${pageLocale}"/> <jsp:scriptlet> <![CDATA[ UserPreferences prefs=UserPreferencesFactory.getUserPreferences(session); java.util.Locale locale=prefs.getLocale(); try { pageContext.setAttribute("highContrastMode", prefs.getUserPreference(InfrastructureUserPreferences.HIGH_CONTRAST_MODE)); } catch (final curam.util.common.JDEException e) { pageContext.setAttribute("highContrastMode", "false"); } pageContext.setAttribute("o3__serverURL", JspUtil.getServerRootURL(1)); String frequencyPatternData=""; String frequencyPatternText=""; String formActivated="false"; if(request.getParameter("formActivated") != null) { curam.omega3.util.FrequencySummary freq=new curam.omega3.util.FrequencySummary(locale); String patternStringFromRequest=request.getParameter("patternString"); /* Check if the patternString from the request is valid or not * to resolve its security vulnerabilities, e.g. XSS attack. * * The pattern string can only be in a 9 digit string representation, so * here we use a regular expression of it to check the pattern string * coming from the request. */ boolean isValid=patternStringFromRequest.matches("[0-9]{9}"); if (isValid) { freq.setPattern(patternStringFromRequest); frequencyPatternData=patternStringFromRequest; frequencyPatternText=freq.getText(); formActivated="true"; } } java.text.DateFormatSymbols symbols; String [] daysOfWeek; int [] dayConstants={java.util.Calendar.MONDAY, java.util.Calendar.TUESDAY, java.util.Calendar.WEDNESDAY, java.util.Calendar.THURSDAY, java.util.Calendar.FRIDAY, java.util.Calendar.SATURDAY, java.util.Calendar.SUNDAY}; String [] months; int [] monthConstants={java.util.Calendar.JANUARY, java.util.Calendar.FEBRUARY, java.util.Calendar.MARCH, java.util.Calendar.APRIL, java.util.Calendar.MAY, java.util.Calendar.JUNE, java.util.Calendar.JULY, java.util.Calendar.AUGUST, java.util.Calendar.SEPTEMBER, java.util.Calendar.OCTOBER, java.util.Calendar.NOVEMBER, java.util.Calendar.DECEMBER}; symbols=new java.text.DateFormatSymbols(locale); daysOfWeek=symbols.getWeekdays(); months=symbols.getMonths(); pageContext.setAttribute("daysOfWeek", daysOfWeek); pageContext.setAttribute("dayConstants", dayConstants); pageContext.setAttribute("months", months); pageContext.setAttribute("monthConstants", monthConstants); pageContext.setAttribute("landmarkLabel", curam.omega3.util.CDEJResources.getProperty("modal.panel.frame.title")); ]]> </jsp:scriptlet> <jsp:scriptlet> if(pageContext.getAttribute("htmlDirection").equals("rtl")) { pageContext.setAttribute("classDirection", "rtl"); } else { pageContext.setAttribute("classDirection", ""); } </jsp:scriptlet> <html lang="${htmlLanguage}" dir="${htmlDirection}" class="${classDirection}"> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> <title>${FrequencySelectorTitle}</title> <link rel="stylesheet" type="text/css" media="screen, print" href="${pageScope.o3__serverURL}themes/v6/css/v6_main.css"/> <link rel="stylesheet" href="${pageScope.o3__serverURL}CDEJ/jscript/dojotk/dijit/themes/soria/soria.css"/> <link rel="stylesheet" type="text/css" media="screen, print" href="${pageScope.o3__serverURL}themes/soria/css/soria_main.css"/> <jsp:scriptlet> if(pageContext.getAttribute("htmlDirection").equals("rtl")) { </jsp:scriptlet><link rel="stylesheet" type="text/css" media="all" href="../themes/v6_rtl/css/v6_rtl_main.css"/><jsp:scriptlet> } </jsp:scriptlet> <jsp:scriptlet> if(pageContext.getAttribute("htmlDirection").equals("rtl")) { </jsp:scriptlet><link rel="stylesheet" type="text/css" media="all" href="../themes/soria_rtl/css/soria_rtl_main.css"/><jsp:scriptlet> } </jsp:scriptlet> <jsp:text><![CDATA[<!--[if IE 8]>]]></jsp:text> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/v6/css/v6_cc_IE8.css"/> <jsp:text><![CDATA[<![endif]-->]]></jsp:text> <jsp:text><![CDATA[<!--[if IE 9]>]]></jsp:text> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/v6/css/v6_cc_IE9.css"/> <jsp:text><![CDATA[<![endif]-->]]></jsp:text> <jsp:text><![CDATA[<!--[if !IE]>-->]]></jsp:text> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/v6/css/v6_cc_notIE.css"/> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/v6/css/v6_cc_IE10.css"/> <jsp:text><![CDATA[<![endif]-->]]></jsp:text> <jsp:scriptlet> if ("true".equals(pageContext.getAttribute("highContrastMode"))){ pageContext.setAttribute("highContrastClassName", "high-contrast"); </jsp:scriptlet> <jsp:scriptlet> if ("true".equals(pageContext.getAttribute("mobileUserAgent"))){ </jsp:scriptlet> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/mobile/css/mobile_main.css"/> <jsp:scriptlet>}</jsp:scriptlet> <link rel="stylesheet" href="${pageScope.o3__serverURL}themes/v6/css/v6_high_contrast.css"/> <jsp:scriptlet>}</jsp:scriptlet> <script type="text/javascript">
            var djConfig = {
                parseOnLoad: false,
                isDebug: false
            };
      </script> <jsp:scriptlet> String weekend = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.weekend")); String dayNum = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayNum")); String dayDiff = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayDiff")); String freqPattern = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.freqPattern")); String monthNum = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.monthNum")); String dayNumAnd = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayNumAnd")); String everyDay = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.everyDay")); String everyWeek = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.everyWeek")); String noDaySelected = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.noDaySelected")); String dayString = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayString")); String dayOfWeekMask = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayOfWeekMask")); String firstDayString = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.firstDayString")); String secondDayString = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.secondDayString")); String weekdayString = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.weekend")); String monthString = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.monthString")); String dayStringForMonthly = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayStringForMonthly")); String dayStringForYearly = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayStringForYearly")); String dayOfWeekMaskForMonthly = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayOfWeekMaskForMonthly")); String dayOfWeekMaskForYearly = JavaScriptEscaper.escapeText(CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Error.dayOfWeekMaskForYearly")); pageContext.setAttribute("FrequencySelectorTitle", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","FrequencySelector.title")); pageContext.setAttribute("TextDaily", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.daily")); pageContext.setAttribute("TextDailyFreqTypeOne", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.daily.freq.type.one")); pageContext.setAttribute("TextDailyRadio", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.daily.radio")); pageContext.setAttribute("TextDailyFreqTypeTwo", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.daily.freq.type.two")); pageContext.setAttribute("TextWeekly", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.weekly")); pageContext.setAttribute("TextWeeklyFreqType", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.weekly.freq.type")); pageContext.setAttribute("TextMonthly", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly")); pageContext.setAttribute("TextMonth", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.month")); pageContext.setAttribute("TextMonthlyRadio2", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly.radio.2")); pageContext.setAttribute("TextYearly", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.yearly")); pageContext.setAttribute("TextYearlyFreqTypeOne", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.yearly.freq.type.one")); pageContext.setAttribute("TextYearlyFreqTypeTwo", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.yearly.freq.type.two")); pageContext.setAttribute("TextYearlyRadio1", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.yearly.radio.1")); pageContext.setAttribute("TextYearlyRadio2", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.yearly.radio.2")); pageContext.setAttribute("TextMonthlyRadio1", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly.radio.1")); pageContext.setAttribute("TextBimonthlyRadio1", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.bimonthly.radio.1")); pageContext.setAttribute("TextBimonthlyRadio2", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.bimonthly.radio.2")); pageContext.setAttribute("TextBimonthlyFreqTypeOne", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.bimonthly.freq.type.one")); pageContext.setAttribute("TextBimonthlyFreqTypeTwo", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.bimonthly.freq.type.two")); pageContext.setAttribute("TextMonthlyFreqTypeStartDate", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly.freq.type.startDate")); pageContext.setAttribute("TextNth", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.nth")); pageContext.setAttribute("TextDays", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.days")); pageContext.setAttribute("TextEveryWeekDay", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.everyWeekDay")); pageContext.setAttribute("TextWeeks", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.weeks")); pageContext.setAttribute("TextMonthlyFreqTypeOne", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly.freq.type.one")); pageContext.setAttribute("TextMonthlyFreqTypeTwo", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.monthly.freq.type.two")); pageContext.setAttribute("OrdinalFirst", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.first")); pageContext.setAttribute("OrdinalSecond", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.second")); pageContext.setAttribute("OrdinalThird", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.third")); pageContext.setAttribute("OrdinalThird", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.third")); pageContext.setAttribute("OrdinalFourth", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.fourth")); pageContext.setAttribute("OrdinalLast", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","ordinal.last")); pageContext.setAttribute("TextDay", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.day")); pageContext.setAttribute("TextWeekDay", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.weekDay")); pageContext.setAttribute("TextWeekendDay", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.weekendDay")); pageContext.setAttribute("TextBimonthly", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Text.bimonthly")); pageContext.setAttribute("ButtonOk", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Button.ok")); pageContext.setAttribute("ButtonCancel", CDEJResources.getProperty("curam.omega3.i18n.FrequencyPatternSelector","Button.cancel")); </jsp:scriptlet> <script type="text/javascript">
          <jsp:scriptlet>
            <![CDATA[
              out.print("var formActivated = " + formActivated + ";");
              out.print("var patternString = '" + frequencyPatternData + "';");
              out.print("var translatedPatternString = '" + frequencyPatternText + "';");
              out.print("var errorMsgs = {};");
              out.print("errorMsgs.weekend = '" + weekend + "';");
              out.print("errorMsgs.dayNum = '" + dayNum + "';");
              out.print("errorMsgs.dayDiff = '" + dayDiff + "';");
              out.print("errorMsgs.freqPattern = '" + freqPattern + "';");
              out.print("errorMsgs.monthNum = '" + monthNum + "';");
              out.print("errorMsgs.dayNumAnd = '" + dayNumAnd + "';");
              out.print("errorMsgs.everyDay = '" + everyDay + "';");
              out.print("errorMsgs.everyWeek = '" + everyWeek + "';");
              out.print("errorMsgs.noDaySelected = '" + noDaySelected + "';");
              out.print("errorMsgs.dayString = '" + dayString + "';");
              out.print("errorMsgs.dayOfWeekMask = '" + dayOfWeekMask + "';");
              out.print("errorMsgs.firstDayString = '" + firstDayString + "';");
              out.print("errorMsgs.secondDayString = '" + secondDayString + "';");
              out.print("errorMsgs.weekdayString = '" + weekdayString + "';");
              out.print("errorMsgs.monthString = '" + monthString + "';");
              out.print("errorMsgs.dayStringForMonthly = '" + dayStringForMonthly + "';");
              out.print("errorMsgs.dayStringForYearly = '" + dayStringForYearly + "';");
              out.print("errorMsgs.dayOfWeekMaskForMonthly = '" + dayOfWeekMaskForMonthly + "';");
              out.print("errorMsgs.dayOfWeekMaskForYearly = '" + dayOfWeekMaskForYearly + "';");
            ]]>
          </jsp:scriptlet>
        </script> <script src="${pageScope.o3__serverURL}CDEJ/jscript/dojotk/dojo/dojo.js" data-dojo-config="async:0,parseOnLoad:false,isDebug:false" type="text/javascript">// script content</script> <script type="text/javascript">
	        <jsp:scriptlet>curam.util.client.jsp.JspUtil.outputJSModulePaths(pageContext);</jsp:scriptlet>
          var jsPageID="frequency-editor";
        </script> <script type="text/javascript" src="${pageScope.o3__serverURL}CDEJ/jscript/cdej.js">// script content</script> <script type="text/javascript" src="${pageScope.o3__serverURL}CDEJ/jscript/cdej-cm.js">// script content</script> <script type="text/javascript">
        	require(["curam/core-uim", "curam/dialog", "curam/util/FrequencyEditor", "dijit/form/FilteringSelect"]);
          cfe = curam.util.FrequencyEditor;

          <jsp:text>var jsBaseURL = curam.util.retrieveBaseURL();</jsp:text> 
          <jsp:text>var jsScreenContext = new curam.util.ScreenContext();</jsp:text>
          jsScreenContext.setContext('POPUP|MODAL');
          cfe.addInputListener();
          curam.dialog.initModal('frequency-editor');

          // register publisher for the page height information
          curam.util.onLoad.addPublisher(function(context) {
            context.height = curam.util.getPageHeight();
            context.title = window.document.title;
          });

          require(["dojo/parser"]);
          dojo.addOnLoad(function() {
            cfe.replacePlaceholderWithDomNode();
            dojo.parser.parse();
            if (cfe.initPage()) {
              curam.util.onLoad.execute();
              dojo.removeClass(dojo.body(), "hidden");
            }
          });

          curam.util.setupGenericKeyHandler();
        </script> </head> <body id="Curam_frequency-editor" class="${classDirection} DefaultApp basic modal ${htmlLanguage} soria ${highContrastClassName} ${mobileClassName} hidden" dir="${htmlDirection}" role="region" aria-label="${landmarkLabel}"> <div id="content" class="title-exists"> <form name="theForm" id="mainForm" method="post" action="frequency-editor.jsp"> <input type="hidden" name="formActivated" value="true"/> <input type="hidden" name="patternString" value="000000000"/> <input type="hidden" id="o3ctx" name="o3ctx" value="515|256"/> <div class="action-set hidden-action-set center"> <a class="ac" href="#">Save</a> <span class="filler">&amp;nbsp;</span> <input type="submit" name="__o3btn.submit" value="Save" onclick="return cfe.createPatternString()" id="__o3btn.submit" title="Save" class="hidden-button" tabindex="-1"/> <a class="ac" href="#">Cancel</a> <span class="filler">&amp;nbsp;</span> <input type="button" name="__o3btn.cancel" value="Cancel" onclick="curam.dialog.closeModalDialog();" id="__o3btn.cancel" title="Cancel" class="hidden-button" tabindex="-1"/> </div> <table cellspacing="0" summary="${FrequencySelectorTitle}"> <tr class="white"> <th class="type" rowspan="2"> <input onclick="cfe.setDefaultOption(cfe.DAILY_FREQUENCY)" id="dailyFreq" type="radio" name="freqType" value="daily" title="${TextDaily}"/> <label for="dailyFreq">${TextDaily}</label> </th> <td class="top frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.DAILY_FREQUENCY, this)" type="radio" name="daily_select_type" value="every_n_days" title="${TextDailyRadio}"/> <span>${TextDailyFreqTypeOne}</span> <input class="text node-needs-replacement %dayInterval%" onclick="cfe.setSelectedFreqType(cfe.DAILY_FREQUENCY, this)" type="text" name="daily_num" size="2" maxlength="2" value="1" title="${TextNth} ${TextDays}"/> </td> </tr> <tr class="white"> <td class="bottom frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.DAILY_FREQUENCY, this)" type="radio" name="daily_select_type" value="every_weekday" title="${TextEveryWeekDay}"/> <span>${TextDailyFreqTypeTwo}</span> </td> </tr> <tr class="blue"> <th class="type" rowspan="3"> <input onclick="cfe.setDefaultOption(cfe.WEEKLY_FREQUENCY)" type="radio" id="weeklyFreq" name="freqType" value="weekly" title="${TextWeekly}"/> <label for="weeklyFreq">${TextWeekly}</label> </th> <td class="top recur frequency weekly-frequency" colspan="4"> <span>${TextWeeklyFreqType}</span> <input class="text node-needs-replacement %weekInterval%" onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="text" name="weekly_num" size="2" maxlength="2" value="1" title="${TextNth} ${TextWeeks}"/> </td> </tr> <tr class ="blue"> <td class="day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_mon" value="1" title="${daysOfWeek[dayConstants[0]]}"/> <jsp:text>${daysOfWeek[dayConstants[0]]}</jsp:text> </td> <td class="day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_tue" value="2" title="${daysOfWeek[dayConstants[1]]}"/> <jsp:text>${daysOfWeek[dayConstants[1]]}</jsp:text> </td> <td class="day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_wed" value="4" title="${daysOfWeek[dayConstants[2]]}"/> <jsp:text>${daysOfWeek[dayConstants[2]]}</jsp:text> </td> <td class="day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_thur" value="8" title="${daysOfWeek[dayConstants[3]]}"/> <jsp:text>${daysOfWeek[dayConstants[3]]}</jsp:text> </td> </tr> <tr class="blue"> <td class="bottom day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_fri" value="16" title="${daysOfWeek[dayConstants[4]]}"/> <jsp:text>${daysOfWeek[dayConstants[4]]}</jsp:text> </td> <td class="bottom day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_sat" value="32" title="${daysOfWeek[dayConstants[5]]}"/> <jsp:text>${daysOfWeek[dayConstants[5]]}</jsp:text> </td> <td class="bottom day"> <input onclick="cfe.setSelectedFreqType(cfe.WEEKLY_FREQUENCY)" type="checkbox" name="weekly_select_sun" value="64" title="${daysOfWeek[dayConstants[6]]}"/> <jsp:text>${daysOfWeek[dayConstants[6]]}</jsp:text> </td> <td class="bottom day"><jsp:scriptlet> <![CDATA[ out.print("&nbsp;"); ]]> </jsp:scriptlet></td> </tr> <tr class="white"> <th class="type" rowspan="3"> <input onclick="cfe.setDefaultOption(cfe.MONTHLY_FREQUENCY)" id="monthlyFreq" type="radio" name="freqType" value="monthly" title="${TextMonthly}"/> <label for="monthlyFreq">${TextMonthly}</label> </th> <td class="top frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="radio" name="monthlyFreqType" value="start_date" title="${TextMonthlyRadio1}"/> <span>${TextMonthlyFreqTypeStartDate}</span> <input class="text node-needs-replacement %monthInterval%" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="text" name="monthly0_month_interval" size="2" maxlength="2" value="1" title="${TextNth} ${TextMonth}"/> </td> </tr> <tr class="white"> <td class="middle frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="radio" name="monthlyFreqType" value="numbered_day" title="${TextMonthlyRadio1}"/> <span>${TextMonthlyFreqTypeOne}</span> <input class="text node-needs-replacement %dayInterval%" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="text" name="monthly1_day_num" size="2" maxlength="2" value="1" title="${TextNth} ${TextDays}"/> <input class="text node-needs-replacement %monthInterval%" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="text" name="monthly1_month_interval" size="2" maxlength="2" value="1" title="${TextNth} ${TextMonth}"/> </td> </tr> <tr class="white"> <td class="bottom frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="radio" name="monthlyFreqType" value="select_day" title="${TextMonthlyRadio2}"/> <span>${TextMonthlyFreqTypeTwo}</span> <select class="codetable node-needs-replacement %ordinal%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" title="${TextNth}" name="monthly2_select_day_num" id="monthly2_select_day_num"> <option value="32">${OrdinalFirst}</option> <option value="33">${OrdinalSecond}</option> <option value="34">${OrdinalThird}</option> <option value="35">${OrdinalFourth}</option> <option value="36">${OrdinalLast}</option> </select> <select class="codetable node-needs-replacement %dayOfWeekExtended%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" title="${TextDays}" name="monthly2_select_day" id="monthly2_select_day"> <option value="201">${TextDay}</option> <option value="202">${TextWeekDay}</option> <option value="203">${TextWeekendDay}</option> <option value="1">${daysOfWeek[dayConstants[0]]}</option> <option value="2">${daysOfWeek[dayConstants[1]]}</option> <option value="4">${daysOfWeek[dayConstants[2]]}</option> <option value="8">${daysOfWeek[dayConstants[3]]}</option> <option value="16">${daysOfWeek[dayConstants[4]]}</option> <option value="32">${daysOfWeek[dayConstants[5]]}</option> <option value="64">${daysOfWeek[dayConstants[6]]}</option> </select> <input class="text node-needs-replacement %monthInterval%" onclick="cfe.setSelectedFreqType(cfe.MONTHLY_FREQUENCY, this)" type="text" name="monthly2_month_interval" size="2" maxlength="2" value="1" title="${TextNth} ${TextMonth}"/> </td> </tr> <tr class="blue"> <th class="type" rowspan="2"> <input onclick="cfe.setDefaultOption(cfe.BIMONTHLY_FREQUENCY)" id="bimonthlyFreq" type="radio" name="freqType" value="bimonthly" title="${TextBimonthly}"/> <label for="bimonthlyFreq">${TextBimonthly}</label> </th> <td class="top frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" type="radio" name="bimonthlyFreqType" value="numbered_day" title="${TextBimonthlyRadio1}"/> <span>${TextBimonthlyFreqTypeOne}</span> <input class="text node-needs-replacement %dayIntervalOne%" onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" type="text" name="bimonthly1_day1_num" size="2" maxlength="2" value="1" title="${TextNth} ${TextDays}"/> <input class="text node-needs-replacement %dayIntervalTwo%" onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" type="text" name="bimonthly1_day2_num" size="2" maxlength="2" value="1" title="${TextNth} ${TextDays}"/> </td> </tr> <tr class="blue"> <td class="bottom frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" type="radio" name="bimonthlyFreqType" value="select_day" title="${TextBimonthlyRadio2}"/> <span>${TextBimonthlyFreqTypeTwo}</span> <select class="codetable node-needs-replacement %ordinalOne%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" title="${TextNth}" name="bimonthly2_select_day1_num" id="bimonthly2_select_day1_num"> <option value="32">${OrdinalFirst}</option> <option value="33">${OrdinalSecond}</option> <option value="34">${OrdinalThird}</option> <option value="35">${OrdinalFourth}</option> </select> <select class="codetable node-needs-replacement %ordinalTwo%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" title="${TextNth}" name="bimonthly2_select_day2_num" id="bimonthly2_select_day2_num"> <option value="33">${OrdinalSecond}</option> <option value="34">${OrdinalThird}</option> <option value="35">${OrdinalFourth}</option> <option value="36">${OrdinalLast}</option> </select> <select class="codetable node-needs-replacement %dayOfWeek%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.BIMONTHLY_FREQUENCY - cfe.CORRECTOR, this)" title="${TextDays}" name="bimonthly2_select_weekday" id="bimonthly2_select_weekday"> <option value="1">${daysOfWeek[dayConstants[0]]}</option> <option value="2">${daysOfWeek[dayConstants[1]]}</option> <option value="4">${daysOfWeek[dayConstants[2]]}</option> <option value="8">${daysOfWeek[dayConstants[3]]}</option> <option value="16">${daysOfWeek[dayConstants[4]]}</option> <option value="32">${daysOfWeek[dayConstants[5]]}</option> <option value="64">${daysOfWeek[dayConstants[6]]}</option> </select> </td> </tr> <tr class="white"> <th class="type last" rowspan="2"> <input onclick="cfe.setDefaultOption(cfe.YEARLY_FREQUENCY)" id="yearlyFreq" type="radio" name="freqType" value="yearly" title="${TextYearly}"/> <label for="yearlyFreq">${TextYearly}</label> </th> <td class="top frequency" colspan="4"> <input onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)" type="radio" name="yearlyFreqType" value="select_month_day_num" title="${TextYearlyRadio1}"/> <span>${TextYearlyFreqTypeOne}</span> <select class="codetable node-needs-replacement %monthOfYear%" dojoType="dijit.form.FilteringSelect" invalidMessage="" title="${TextMonth}" name="yearly1_select_month" id="yearly1_select_month" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)"> <option value="1">${months[monthConstants[0]]}</option> <option value="2">${months[monthConstants[1]]}</option> <option value="3">${months[monthConstants[2]]}</option> <option value="4">${months[monthConstants[3]]}</option> <option value="5">${months[monthConstants[4]]}</option> <option value="6">${months[monthConstants[5]]}</option> <option value="7">${months[monthConstants[6]]}</option> <option value="8">${months[monthConstants[7]]}</option> <option value="9">${months[monthConstants[8]]}</option> <option value="10">${months[monthConstants[9]]}</option> <option value="11">${months[monthConstants[10]]}</option> <option value="12">${months[monthConstants[11]]}</option> </select> <input class="text node-needs-replacement %dayInterval%" type="text" name="yearly1_day_num" size="2" maxlength="2" value="1" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)" title="${TextNth} ${TextDays}"/> </td> </tr> <tr class="white"> <td class="bottom last frequency" colspan="4"> <input type="radio" name="yearlyFreqType" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)" value="select_month_day" title="${TextYearlyRadio2}"/> <span>${TextYearlyFreqTypeTwo}</span> <select class="codetable node-needs-replacement %ordinal%" dojoType="dijit.form.FilteringSelect" invalidMessage="" title="${TextNth}" name="yearly2_select_day_num" id="yearly2_select_day_num" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)"> <option value="32">${OrdinalFirst}</option> <option value="33">${OrdinalSecond}</option> <option value="34">${OrdinalThird}</option> <option value="35">${OrdinalFourth}</option> <option value="36">${OrdinalLast}</option> </select> <select class="codetable node-needs-replacement %dayOfWeekExtended%" dojoType="dijit.form.FilteringSelect" invalidMessage="" title="${TextDays}" name="yearly2_select_day" id="yearly2_select_day" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)"> <option value="201">${TextDay}</option> <option value="202">${TextWeekDay}</option> <option value="203">${TextWeekendDay}</option> <option value="1">${daysOfWeek[dayConstants[0]]}</option> <option value="2">${daysOfWeek[dayConstants[1]]}</option> <option value="4">${daysOfWeek[dayConstants[2]]}</option> <option value="8">${daysOfWeek[dayConstants[3]]}</option> <option value="16">${daysOfWeek[dayConstants[4]]}</option> <option value="32">${daysOfWeek[dayConstants[5]]}</option> <option value="64">${daysOfWeek[dayConstants[6]]}</option> </select> <select class="codetable node-needs-replacement %monthOfYear%" dojoType="dijit.form.FilteringSelect" invalidMessage="" onclick="cfe.setSelectedFreqType(cfe.YEARLY_FREQUENCY + cfe.CORRECTOR, this)" title="${TextMonth}" name="yearly2_select_month" id="yearly2_select_month"> <option value="1">${months[monthConstants[0]]}</option> <option value="2">${months[monthConstants[1]]}</option> <option value="3">${months[monthConstants[2]]}</option> <option value="4">${months[monthConstants[3]]}</option> <option value="5">${months[monthConstants[4]]}</option> <option value="6">${months[monthConstants[5]]}</option> <option value="7">${months[monthConstants[6]]}</option> <option value="8">${months[monthConstants[7]]}</option> <option value="9">${months[monthConstants[8]]}</option> <option value="10">${months[monthConstants[9]]}</option> <option value="11">${months[monthConstants[10]]}</option> <option value="12">${months[monthConstants[11]]}</option> </select> </td> </tr> </table> </form> </div> <div id="actions-panel" class="actions-panel" title="" style="bottom: 0px; left: 0px; right: 0px;"> <div class="action-set buttons"> <curam:button name="submit" cssClass="submit replace" type="submit" onclick="return cfe.createPatternString()"> <jsp:text>${ButtonOk}</jsp:text> </curam:button> <jsp:scriptlet> <![CDATA[ out.print("<script type=\"text/javascript\">");
          out.print("dojo.addOnLoad(function(){curam.util.replaceSubmitButton('submit')});");
          out.print("</script>"); ]]> </jsp:scriptlet> <curam:button name="cancel" cssClass="submit replace" type="button" onclick="curam.dialog.closeModalDialog();"> <jsp:text>${ButtonCancel}</jsp:text> </curam:button> <jsp:scriptlet> <![CDATA[ out.print("<script type=\"text/javascript\">");
        out.print("dojo.addOnLoad(function(){curam.util.replaceSubmitButton('cancel')});");
        out.print("</script>"); ]]> </jsp:scriptlet> </div> </div> </body> </html> </jsp:root>