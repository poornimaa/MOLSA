<?xml version="1.0" encoding="ISO-8859-1"?>

<ac:application xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xmlns:ac="http://www.curamsoftware.com/curam/util/client/application-config"
 id="MOLSAVAPP"
 logo="MOLSAVAPP.logo"
 title="MOLSAVAPP.title"
 subtitle="MOLSAVAPP.subtitle"
 user-message="MOLSAVAPP.UserMessage">

  <ac:application-menu>
    <ac:preferences title="preferences.title" />
    <ac:help title="help.title" />
    <ac:logout title="logout.title"/>
  </ac:application-menu>

 <ac:application-search default-search-page="Intake_resolveQuickSearch" initial-text="Application.Search.InitialText"/>

  <ac:section-ref id="MOLSAVAPPHomeSection"/>
  <ac:section-ref id="MOLSAVAPPWorkspaceSection"/>
  <ac:section-ref id="DefaultAppInboxSection"/>
  <ac:section-ref id="DefaultAppCalendarSection"/>
  
</ac:application>