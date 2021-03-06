﻿/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license


Portions Copyright IBM Corp., 2010-2013.
*/

/**
 * @fileOverview Defines the {@link CKEDITOR.lang} object, for the English
 *		language. This is the base file for all translations.
 */

/**#@+
   @type String
   @example
*/

/**
 * Constains the dictionary of language entries.
 * @namespace
 */
// NLS_ENCODING=UTF-8
// NLS_MESSAGEFORMAT_NONE
// G11N GA UI

CKEDITOR.lang["no"] =
{
	/**
	 * The language reading direction. Possible values are "rtl" for
	 * Right-To-Left languages (like Arabic) and "ltr" for Left-To-Right
	 * languages (like English).
	 * @default "ltr"
	 */
	dir : "ltr",

	/*
	 * Screenreader titles. Please note that screenreaders are not always capable
	 * of reading non-English words. So be careful while translating it.
	 */
	editorTitle : "Redigeringsprogram for rik tekst, %1, trykk på ALT 0 for hjelp.",
	editorHelp : "",

	// ARIA descriptions.
	toolbars	: "Verktøylinjer for redigeringsprogram",
	editor	: "Rich Text Editor",

	// Toolbar buttons without dialogs.
	source			: "Kilde",
	newPage			: "Ny side",
	save			: "Lagre",
	preview			: "Forhåndsvisning:",
	cut				: "Klipp ut",
	copy			: "Kopier",
	paste			: "Lim inn",
	print			: "Skriv ut",
	underline		: "Understreking",
	bold			: "Halvfet",
	italic			: "Kursiv",
	selectAll		: "Velg alle",
	removeFormat	: "Fjern format",
	strike			: "Gjennomstreking",
	subscript		: "Senket skrift",
	superscript		: "Hevet skrift",
	horizontalrule	: "Sett inn vannrett linje",
	pagebreak		: "Sett inn sideskift",
	pagebreakAlt		: "Sideskift",
	unlink			: "Fjern link",
	undo			: "Angre",
	redo			: "Gjør om",

	// Common messages and labels.
	common :
	{
		browseServer	: "Nettleserserver:",
		url				: "URL:",
		protocol		: "Protokoll:",
		upload			: "Last opp:",
		uploadSubmit	: "Send til serveren",
		image			: "Sett inn bilde",
		flash			: "Sett inn Flash-film",
		form			: "Sett inn skjema",
		checkbox		: "Sett inn avmerkingsboks",
		radio			: "Sett inn valgknapp",
		textField		: "Sett inn tekstfelt",
		textarea		: "Sett inn tekstområde",
		hiddenField		: "Sett inn skjult felt",
		button			: "Sett inn knapp",
		select			: "Sett inn valgfelt",
		imageButton		: "Sett inn bildeknapp",
		notSet			: "<ikke definert>",
		id				: "ID:",
		name			: "Navn:",
		langDir			: "Språkretning:",
		langDirLtr		: "Venstre til høyre",
		langDirRtl		: "Høyre til venstre",
		langCode		: "Språkkode:",
		longDescr		: "URL til lang beskrivelse:",
		cssClass		: "Stilarkklasser:",
		advisoryTitle	: "Rådgivende tittel:",
		cssStyle		: "Stil:",
		ok				: "OK",
		cancel			: "Avbryt",
		close : "Lukk",
		preview			: "Forhåndsvisning:",
		generalTab		: "Generelt",
		advancedTab		: "Avansert",
		validateNumberFailed	: "Denne verdien er ikke et tall.",
		confirmNewPage	: "Du vil miste alle ulagrede endringer i dette innholdet. Er du sikker på at du vil laste inn en ny side?",
		confirmCancel	: "Noen av alternativene er endret. Er du sikker på at du vil lukke dialogboksen?",
		options : "Alternativer",
		target			: "Mål:",
		targetNew		: "Nytt vindu (_blank)",
		targetTop		: "Øverste vindu (_top)",
		targetSelf		: "Samme vindu (_self)",
		targetParent	: "Overordnet vindu (_parent)",
		langDirLTR		: "Venstre til høyre",
		langDirRTL		: "Høyre til venstre",
		styles			: "Stil:",
		cssClasses		: "Stilarkklasser:",
		width			: "Bredde:",
		height			: "Høyde:",
		align			: "Juster:",
		alignLeft		: "Venstre",
		alignRight		: "Høyre",
		alignCenter		: "Midtstill",
		alignTop		: "Øverst",
		alignMiddle		: "Midt",
		alignBottom		: "Nederst",
		invalidHeight	: "Høyden må være et positivt heltall.",
		invalidWidth	: "Bredden må være et positivt heltall.",
		invalidCssLength	: "Verdien som blir oppgitt for feltet '%1', må være et positivt tall med eller uten en gyldig CSS-målenhet (px, %, in, cm, mm, em, ex, pt eller pc).",
		invalidHtmlLength	: "Verdien som blir oppgitt for feltet '%1', må være et positivt tall med eller uten en gyldig HTML-målenhet (px eller %).",
		invalidInlineStyle	: "Verdi som blir oppgitt for den innebygde stilen, må bestå av en eller flere tupler med formatet \"navn : verdi\", atskilt av semikolon.",
		cssLengthTooltip	: "Skriv et tall for en verdi i antall piksler eller et tall med en gyldig CSS-enhet (px, %, in, cm, mm, em, ex, pt eller pc).",

		// Put the voice-only part of the label in the span.
		unavailable		: "%1<span class=\"cke_accessibility\">, ikke tilgjengelig</span>"
	},

	contextmenu :
	{
		options : "Alternativer for hurtigmeny"
	},

	// Special char dialog.
	specialChar		:
	{
		toolbar		: "Sett inn spesialtegn",
		title		: "Spesialtegn",
		options : "Alternativer for spesialtegn"
	},

	// Link dialog.
	link :
	{
		toolbar		: "URL-link",
		other 		: "<annet>",
		menu		: "Rediger kobling",
		title		: "Kobling",
		info		: "Linkinformasjon",
		target		: "Mål",
		upload		: "Last opp:",
		advanced	: "Avansert",
		type		: "Linktype:",
		toUrl		: "URL",
		toAnchor	: "Link til anker i teksten",
		toEmail		: "E-post",
		targetFrame	: "<ramme>",
		targetPopup	: "<tilleggsvindu>",
		targetFrameName	: "Navn på målramme:",
		targetPopupName	: "Navn på tilleggsvindu:",
		popupFeatures	: "Funksjoner i tilleggsvindu:",
		popupResizable	: "Størrelse kan endres",
		popupStatusBar	: "Statuslinje",
		popupLocationBar	: "Stedslinje",
		popupToolbar	: "Verktøylinje",
		popupMenuBar	: "Menylinje",
		popupFullScreen	: "Full skjerm (IE)",
		popupScrollBars	: "Rullefelt",
		popupDependent	: "Avhengig (Netscape)",
		popupLeft		: "Venstreposisjon",
		popupTop		: "Topposisjon",
		id				: "ID:",
		langDir			: "Språkretning:",
		langDirLTR		: "Venstre til høyre",
		langDirRTL		: "Høyre til venstre",
		acccessKey		: "Tilgangsnøkkel:",
		name			: "Navn:",
		langCode		: "Språkkode:",
		tabIndex		: "Tabulatorindeks:",
		advisoryTitle	: "Rådgivende tittel:",
		advisoryContentType	: "Rådgivende innholdstype:",
		cssClasses		: "Stilarkklasser:",
		charset			: "Tegnsett for linket ressurs:",
		styles			: "Stil:",
		rel			: "Relasjon",
		selectAnchor	: "Velg et anker",
		anchorName		: "Etter ankernavn",
		anchorId		: "Etter element-ID",
		emailAddress	: "E-postadresse",
		emailSubject	: "Meldingsemne",
		emailBody		: "Meldingstekst",
		noAnchors		: "Ingen bokmerker tilgjengelig i dokumentet. Klikk på ikonet 'Sett inn dokumentbokmerke' på verktøylinjen for å legge til et.",
		noUrl			: "Oppgi link-URL",
		noEmail			: "Oppgi e-postadresse"
	},

	// Anchor dialog
	anchor :
	{
		toolbar		: "Sett inn dokumentbokmerke",
		menu		: "Rediger dokumentbokmerke",
		title		: "Dokumentbokmerke",
		name		: "Navn:",
		errorName	: "Angi et navn for dokumentbokmerket",
		remove		: "Fjern dokumentbokmerke"
	},

	// List style dialog
	list:
	{
		numberedTitle		: "Egenskaper for nummerert liste",
		bulletedTitle		: "Egenskaper for punktliste",
		type				: "Listestil:",
		start				: "Start:",
		validateStartNumber				:"Startnummer for liste må være et heltall.",
		circle				: "Sirkel",
		disc				: "Plate",
		square				: "Kvadrat",
		none				: "Ingen",
		notset				: "<ikke definert>",
		armenian			: "Armensk nummerering",
		georgian			: "Georgisk nummerering (an, ban, gan, osv.)",
		lowerRoman			: "Små romertall (i, ii, iii, iv, v, osv.)",
		upperRoman			: "Store romertall (I, II, III, IV, V, osv.)",
		lowerAlpha			: "Små bokstaver (a, b, c, d, e, osv.)",
		upperAlpha			: "Store bokstaver (A, B, C, D, E, osv.)",
		lowerGreek			: "Små greske bokstaver (alpha, beta, gamma, osv.)",
		decimal				: "Desimal (1, 2, 3, osv.)",
		decimalLeadingZero	: "Desimal med foranstilt null (01, 02, 03, osv.)"
	},

	// Find And Replace Dialog
	findAndReplace :
	{
		title				: "Søk og erstatt",
		find				: "Søk",
		replace				: "Erstatt",
		findWhat			: "Søk:",
		replaceWith			: "Erstatt med:",
		notFoundMsg			: "Den oppgitte teksten ble ikke funnet.",
		findOptions			: "Søkealternativer",
		matchCase			: "Samsvar store/små bokstaver",
		matchWord			: "Bare hele ord",
		matchCyclic			: "Syklisk gjennomgang av samsvar",
		replaceAll			: "Erstatt alle",
		replaceSuccessMsg	: "%1 forekomst(er) erstattet."
	},

	// Table Dialog
	table :
	{
		toolbar		: "Sett inn tabell",
		title		: "Tabell",
		menu		: "Tabellegenskaper",
		deleteTable	: "Slett tabell",
		rows		: "Rader:",
		columns		: "Kolonner:",
		border		: "Kantlinjestørrelse:",
		widthPx		: "piksler",
		widthPc		: "prosent",
		widthUnit	: "Breddeenhet:",
		cellSpace	: "Celleavstand:",
		cellPad		: "Celleutfylling:",
		caption		: "Bildetekst:",
		summary		: "Sammendrag:",
		headers		: "Topptekster:",
		headersNone		: "Ingen",
		headersColumn	: "Første kolonne",
		headersRow		: "Første rad",
		headersBoth		: "Begge",
		invalidRows		: "Antall rader må være et heltall som er større enn null.",
		invalidCols		: "Antall kolonner må være et heltall som er større enn null.",
		invalidBorder	: "Rammestørrelse må være et positivt tall.",
		invalidWidth	: "Tabellbredde må være et positivt tall.",
		invalidHeight	: "Tabellhøyde må være et positivt tall.",
		invalidCellSpacing	: "Celleavstand må være et positivt tall.",
		invalidCellPadding	: "Celleutfylling må være et positivt tall.",

		cell :
		{
			menu			: "Celle",
			insertBefore	: "Sett inn celle før",
			insertAfter		: "Sett inn celle etter",
			deleteCell		: "Slett celler",
			merge			: "Slå sammen celler",
			mergeRight		: "Slå sammen til høyre",
			mergeDown		: "Slå sammen nedover",
			splitHorizontal	: "Del celle vannrett",
			splitVertical	: "Del celle loddrett",
			title			: "Celleegenskaper",
			cellType		: "Celletype:",
			rowSpan			: "Radområde:",
			colSpan			: "Kolonneområde:",
			wordWrap		: "Tekstbryting:",
			hAlign			: "Vannrett justering:",
			vAlign			: "Loddrett justering:",
			alignBaseline	: "Grunnlinje",
			bgColor			: "Bakgrunnsfarge:",
			borderColor		: "Kantfarge:",
			data			: "Data",
			header			: "Topptekst",
			yes				: "Ja",
			no				: "Nei",
			invalidWidth	: "Cellebredde må være et positivt tall.",
			invalidHeight	: "Cellehøyde må være et positivt tall.",
			invalidRowSpan	: "Radområde må være et positivt heltall.",
			invalidColSpan	: "Kolonneområde må være et positivt heltall.",
			chooseColor 	: "Flere farger..."
		},

		row :
		{
			menu			: "Rad",
			insertBefore	: "Sett inn rad før",
			insertAfter		: "Sett inn rad etter",
			deleteRow		: "Slett rader"
		},

		column :
		{
			menu			: "Kolonne",
			insertBefore	: "Sett inn kolonne foran",
			insertAfter		: "Sett inn kolonne bak",
			deleteColumn	: "Slett kolonner"
		}
	},

	// Button Dialog.
	button :
	{
		title		: "Egenskaper for knapp",
		text		: "Tekst (verdi):",
		type		: "Type:",
		typeBtn		: "Knapp",
		typeSbm		: "Send",
		typeRst		: "Tilbakestill"
	},

	// Checkbox and Radio Button Dialogs.
	checkboxAndRadio :
	{
		checkboxTitle : "Egenskaper for avmerkingsboks",
		radioTitle	: "Egenskaper for valgknapp",
		value		: "Verdi:",
		selected	: "Valgt"
	},

	// Form Dialog.
	form :
	{
		title		: "Sett inn skjema",
		menu		: "Skjemaegenskaper",
		action		: "Handling:",
		method		: "Metode:",
		encoding	: "Koding:"
	},

	// Select Field Dialog.
	select :
	{
		title		: "Egenskaper for valgt felt",
		selectInfo	: "Valginfo",
		opAvail		: "Tilgjengelige alternativer",
		value		: "Verdi:",
		size		: "Størrelse:",
		lines		: "linjer",
		chkMulti	: "Tillat flere valg",
		opText		: "Tekst:",
		opValue		: "Verdi:",
		btnAdd		: "Legg til",
		btnModify	: "Endre",
		btnUp		: "Opp",
		btnDown		: "Ned",
		btnSetValue : "Angi som valgt verdi",
		btnDelete	: "Slett"
	},

	// Textarea Dialog.
	textarea :
	{
		title		: "Egenskaper for tekstområde",
		cols		: "Kolonner:",
		rows		: "Rader:"
	},

	// Text Field Dialog.
	textfield :
	{
		title		: "Egenskaper for tekstfelt",
		name		: "Navn:",
		value		: "Verdi:",
		charWidth	: "Tegnbredde:",
		maxChars	: "Maksimalt antall tegn:",
		type		: "Type:",
		typeText	: "Tekst",
		typePass	: "Passord"
	},

	// Hidden Field Dialog.
	hidden :
	{
		title	: "Egenskaper for skjult felt",
		name	: "Navn:",
		value	: "Verdi:"
	},

	// Image Dialog.
	image :
	{
		title		: "Bilde",
		titleButton	: "Egenskaper for bildeknapp",
		menu		: "Bildeegenskaper",
		infoTab	: "Bildeinformasjon",
		btnUpload	: "Last opp bilde",
		upload	: "Last opp",
		alt		: "Alternativ tekst:",
		lockRatio	: "Lås forhold",
		resetSize	: "Tilbakestill størrelse",
		border	: "Ramme:",
		hSpace	: "Vannrett mellomrom:",
		vSpace	: "Loddrett mellomrom:",
		alertUrl	: "Oppgi bilde-URL",
		linkTab	: "Kobling",
		button2Img	: "Vil du transformere den valgte bildeknappen til et enkelt bilde?",
		img2Button	: "Vil du transformere det valgte bildet til en bildeknapp?",
		urlMissing : "Kilde-URL for bilde mangler.",
		validateBorder : "Kantlinjen må være et positivt heltall.",
		validateHSpace : "Vannrett mellomrom må være et positivt heltall.",
		validateVSpace : "Loddrett mellomrom må være et positivt heltall."
	},

	// Flash Dialog
	flash :
	{
		properties		: "Flash-egenskaper",
		propertiesTab	: "Egenskaper",
		title		: "Flash",
		chkPlay		: "Autokjør",
		chkLoop		: "Sløyfe",
		chkMenu		: "Aktiver Flash-meny",
		chkFull		: "Tillat full skjerm",
 		scale		: "Skala:",
		scaleAll		: "Vis alle",
		scaleNoBorder	: "Ingen kantlinje",
		scaleFit		: "Nøyaktig tilpasset",
		access			: "Skripttilgang:",
		accessAlways	: "Alltid",
		accessSameDomain	: "Samme domene",
		accessNever	: "Aldri",
		alignAbsBottom: "Abs bunn",
		alignAbsMiddle: "Abs midt",
		alignBaseline	: "Grunnlinje",
		alignTextTop	: "Teksttopp",
		quality		: "Kvalitet:",
		qualityBest	: "Best",
		qualityHigh	: "Høy",
		qualityAutoHigh	: "Auto høy",
		qualityMedium	: "Middels",
		qualityAutoLow	: "Auto lav",
		qualityLow	: "Lav",
		windowModeWindow	: "Vindu",
		windowModeOpaque	: "Ugjennomsiktig",
		windowModeTransparent	: "Gjennomsiktig",
		windowMode	: "Windows-modus:",
		flashvars	: "Variabler:",
		bgcolor	: "Bakgrunnsfarge:",
		hSpace	: "Vannrett mellomrom:",
		vSpace	: "Loddrett mellomrom:",
		validateSrc : "URL kan ikke være tom.",
		validateHSpace : "Vannrett mellomrom må være et positivt heltall.",
		validateVSpace : "Loddrett mellomrom må være et positivt heltall."
	},

	// Speller Pages Dialog
	spellCheck :
	{
		toolbar			: "Stavekontroll",
		title			: "Stavekontroll",
		notAvailable	: "Beklager, tjenesten er ikke tilgjengelig nå.",
		errorLoading	: "Feil ved innlasting av vert for applikasjonstjeneste: %s.",
		notInDic		: "Ikke i ordliste",
		changeTo		: "Bytt til",
		btnIgnore		: "Ignorer",
		btnIgnoreAll	: "Ignorer alle",
		btnReplace		: "Erstatt",
		btnReplaceAll	: "Erstatt alle",
		btnUndo			: "Angre",
		noSuggestions	: "- Ingen forslag -",
		progress		: "Stavekontroll pågår...",
		noMispell		: "Stavekontroll fullført: Ingen feilstavinger funnet",
		noChanges		: "Stavekontroll fullført: Ingen ord endret",
		oneChange		: "Stavekontroll fullført: Ett ord endret",
		manyChanges		: "Stavekontroll fullført: %1 ord endret",
		ieSpellDownload	: "Stavekontroll er ikke installert. Vil du laste ned nå?"
	},

	smiley :
	{
		toolbar	: "Sett inn uttrykksikon",
		title	: "Uttrykksikoner",
		options : "Alternativer for uttrykksikoner"
	},

	elementsPath :
	{
		eleLabel : "Elementbane",
		eleTitle : "%1-element"
	},

	numberedlist : "Nummerert liste",
	bulletedlist : "Punktliste",
	indent : "Øk innrykk",
	outdent : "Reduser innrykk",

	justify :
	{
		left : "Venstrejuster",
		center : "Midtstill",
		right : "Høyrejuster",
		block : "Juster blokkjustert"
	},

	blockquote : "Blokksitat",

	clipboard :
	{
		title		: "Lim inn",
		cutError	: "Nettleserens sikkerhetsinnstillinger hindrer automatisk klipping. Bruk Ctrl+X på tastaturet i stedet.",
		copyError	: "Nettleserens sikkerhetsinnstillinger hindrer automatisk kopiering. Bruk Ctrl+C på tastaturet i stedet.",
		pasteMsg	: "Trykk på Ctrl+V (Cmd+V på MAC) for å lime inn nedenfor.",
		securityMsg	: "Nettleserens sikkerhet blokkerer innliming direkte fra utklippstavlen.",
		pasteArea	: "Innlimingsområde"
	},

	pastefromword :
	{
		confirmCleanup	: "Teksten du vil lime inn, ser ut til å være kopiert fra Word. Vil du rense den før du limer inn?",
		toolbar			: "Lim inn utvalg",
		title			: "Lim inn utvalg",
		error			: "Det var ikke mulig å rense de innlimte dataene på grunn av en intern feil"
	},

	pasteText :
	{
		button	: "Lim inn som ren tekst",
		title	: "Lim inn som ren tekst"
	},

	templates :
	{
		button 			: "Maler",
		title : "Innholdsmaler",
		options : "Malalternativer",
		insertOption: "Erstatt faktisk innhold",
		selectPromptMsg: "Velg mal som skal åpnes i redigeringsprogrammet",
		emptyListMsg : "(Ingen maler definert)"
	},

	showBlocks : "Vis blokker",

	stylesCombo :
	{
		label		: "Stiler",
		panelTitle 	: "Stiler",
		panelTitle1	: "Blokkstiler",
		panelTitle2	: "Innebygde stiler",
		panelTitle3	: "Objektstiler"
	},

	format :
	{
		label		: "Format",
		panelTitle	: "Avsnittsformat",

		tag_p		: "Normal",
		tag_pre		: "Formatert",
		tag_address	: "Adresse",
		tag_h1		: "Overskrift 1",
		tag_h2		: "Overskrift 2",
		tag_h3		: "Overskrift 3",
		tag_h4		: "Overskrift 4",
		tag_h5		: "Overskrift 5",
		tag_h6		: "Overskrift 6",
		tag_div		: "Normal (DIV)"
	},

	div :
	{
		title				: "Opprett Div-container",
		toolbar				: "Opprett Div-container",
		cssClassInputLabel	: "Stilarkklasser",
		styleSelectLabel	: "Stil",
		IdInputLabel		: "Id",
		languageCodeInputLabel	: "  Språkkode",
		inlineStyleInputLabel	: "Innebygd stil",
		advisoryTitleInputLabel	: "Rådgivende tittel",
		langDirLabel		: "Språkretning",
		langDirLTRLabel		: "Venstre til høyre (LTR)",
		langDirRTLLabel		: "Høyre til venstre (RTL)",
		edit				: "Rediger Div",
		remove				: "Fjern Div"
  	},

	iframe :
	{
		title		: "IFrame-egenskaper",
		toolbar		: "Sett inn IFrame",
		noUrl		: "Angi iframe-URLen",
		scrolling	: "Aktiver rullefelt",
		border		: "Vis rammekant"
	},

	font :
	{
		label		: "Skrift",
		voiceLabel	: "Skrift",
		panelTitle	: "Skriftnavn"
	},

	fontSize :
	{
		label		: "Størrelse",
		voiceLabel	: "Skriftstørrelse",
		panelTitle	: "Skriftstørrelse"
	},

	colorButton :
	{
		textColorTitle	: "Tekstfarge",
		bgColorTitle	: "Bakgrunnsfarge",
		panelTitle		: "Farger",
		auto			: "Automatisk",
		more			: "Flere farger..."
	},

	colors :
	{
		"000" : "Svart",
		"800000" : "Rødbrun",
		"8B4513" : "Lærbrun",
		"2F4F4F" : "Mørk skifergrå",
		"008080" : "Mørk blågrønn",
		"000080" : "Marineblå",
		"4B0082" : "Indigo",
		"696969" : "Mørk grå",
		"B22222" : "Mursteinsrød",
		"A52A2A" : "Brun",
		"DAA520" : "Gyllen stav",
		"006400" : "Mørk grønn",
		"40E0D0" : "Turkis",
		"0000CD" : "Mellomblå",
		"800080" : "Purpur",
		"808080" : "Grå",
		"F00" : "Rød",
		"FF8C00" : "Mørk oransje",
		"FFD700" : "Gull",
		"008000" : "Grønn",
		"0FF" : "Cyan",
		"00F" : "Blå",
		"EE82EE" : "Fiolett",
		"A9A9A9" : "Mørk mørkegrå",
		"FFA07A" : "Lys lakserosa",
		"FFA500" : "Oransje",
		"FFFF00" : "Gul",
		"00FF00" : "Limegrønn",
		"AFEEEE" : "Svak turkis",
		"ADD8E6" : "Lys blå",
		"DDA0DD" : "Plomme",
		"D3D3D3" : "Lys grå",
		"FFF0F5" : "Lillahvit",
		"FAEBD7" : "Antikkhvit",
		"FFFFE0" : "Lys gul",
		"F0FFF0" : "Honningdugg",
		"F0FFFF" : "Asurblå",
		"F0F8FF" : "Blåhvit",
		"E6E6FA" : "Lavendel",
		"FFF" : "Hvit"
	},

	scayt :
	{
		title			: "Stavekontroll mens du skriver",
		opera_title		: "Ikke støttet av Opera",
		enable			: "Aktiver SCAYT",
		disable			: "Deaktiver SCAYT",
		about			: "Om SCAYT",
		toggle			: "Aktiver/deaktiver SCAYT",
		options			: "Alternativer",
		langs			: "Språk",
		moreSuggestions	: "Flere forslag",
		ignore			: "Ignorer",
		ignoreAll		: "Ignorer alle",
		addWord			: "Legg til ord",
		emptyDic		: "Ordlistenavn kan ikke være tomt.",

		optionsTab		: "Alternativer",
		allCaps			: "Ignorer alle ord med bare store bokstaver",
		ignoreDomainNames : "Ignorer domenenavn",
		mixedCase		: "Ignorer ord med blanding av store og små bokstaver",
		mixedWithDigits	: "Ignorer ord med tall",

		languagesTab	: "Språk",

		dictionariesTab	: "Ordlister",
		dic_field_name	: "Ordlistenavn",
		dic_create		: "Opprett",
		dic_restore		: "Gjenopprett",
		dic_delete		: "Slett",
		dic_rename		: "Endre navn",
		dic_info		: "I utgangspunktet er brukerordlisten lagret i en informasjonskapsel (cookie). Informasjonskapsler kan imidlertid ha en begrenset størrelse. Når brukerordlisten blir for stor til å kunne lagres i en informasjonskapsel, kan ordlisten lagres på serveren vår. Hvis du vil lagre din personlige ordliste på serveren vår, må du angi et navn for ordlisten. Hvis du allerede har en lagres ordliste, skriver du navnet på den og klikker på knappen Gjenopprett.",

		aboutTab		: "Om"
	},

	about :
	{
		title		: "Om CKEditor",
		dlgTitle	: "Om CKEditor",
		help	: "Se etter hjelp i $1.",
		userGuide : "Brukerhåndbok for CKEditor",
		moreInfo	: "Du finner lisensopplysninger på vårt nettsted:",
		copy		: "Copyright &copy; $1. All rights reserved."
	},

	maximize : "Maksimer",
	minimize : "Minimer",

	fakeobjects :
	{
		anchor	: "Anker",
		flash	: "Blinkeanimasjon",
		iframe		: "IFrame",
		hiddenfield	: "Skjult felt",
		unknown	: "Ukjent objekt"
	},

	resize : "Dra for å endre størrelse",

	colordialog :
	{
		title		: "Velg farge",
		options	:	"Fargealternativer",
		highlight	: "Uthev",
		selected	: "Valgt farge",
		clear		: "Tøm"
	},

	toolbarCollapse	: "Komprimer verktøylinje",
	toolbarExpand	: "Utvid verktøylinje",

	toolbarGroups :
	{
		document : "Dokument",
		clipboard : "Utklippstavle/Angre",
		editing : "Redigering",
		forms : "Skjemaer",
		basicstyles : "Basisstiler",
		paragraph : "Avsnitt",
		links : "Koblinger",
		insert : "Sett inn",
		styles : "Stiler",
		colors : "Farger",
		tools : "Verktøy"
	},

	bidi :
	{
		ltr : "Tekstretning fra venstre mot høyre",
		rtl : "Tekstretning fra høyre mot venstre"
	},

	docprops :
	{
		label : "Dokumentegenskaper",
		title : "Dokumentegenskaper",
		design : "Design",
		meta : "Metakoder",
		chooseColor : "Velg",
		other : "Andre...",
		docTitle :	"Sidetittel",
		charset : 	"Tegnsettkoding",
		charsetOther : "Annen tegnsettkoding",
		charsetASCII : "ASCII",
		charsetCE : "Sentraleuropeisk",
		charsetCT : "Tradisjonell kinesisk (Big5)",
		charsetCR : "Kyrillisk",
		charsetGR : "Gresk",
		charsetJP : "Japansk",
		charsetKR : "Koreansk",
		charsetTR : "Tyrkisk",
		charsetUN : "Unicode (UTF-8)",
		charsetWE : "Vesteuropeisk",
		docType : "Dokumenttypeoverskrift",
		docTypeOther : "Annen dokumenttypeoverskrift",
		xhtmlDec : "Inkluder XHTML-deklarasjoner",
		bgColor : "Bakgrunnsfarge",
		bgImage : "URL for bakgrunnsbilde",
		bgFixed : "Fast bakgrunn (ikke rulling)",
		txtColor : "Tekstfarge",
		margin : "Sidemarger",
		marginTop : "Øverst",
		marginLeft : "Venstre",
		marginRight : "Høyre",
		marginBottom : "Nederst",
		metaKeywords : "Nøkkelord for dokumentindeksering (kommadelt)",
		metaDescription : "Dokumentbeskrivelse",
		metaAuthor : "Forfatter",
		metaCopyright : "Copyright",
		previewHtml : "<p>Dette er litt <strong>eksempeltekst</strong>. Du bruker <a href=\"javascript:void(0)\">CKEditor</a>.</p>"
	},

	ibm :
	{

		common :
		{
			widthIn	: "tommer",
			widthCm	: "centimeter",
			widthMm	: "millimeter",
			widthEm	: "em",
			widthEx	: "ex",
			widthPt	: "punkter",
			widthPc	: "pica",
			required : "Obligatorisk"
		},
		table :
		{
			createTable : 'Sett inn tabell',
			heightUnit	: "Høydeenhet:",
			insertMultipleRows : "Sett inn rader",
			insertMultipleCols : "Sett inn kolonner",
			noOfRows : "Antall rader:",
			noOfCols : "Antall kolonner:",
			insertPosition : "Posisjon:",
			insertBefore : "Før",
			insertAfter : "Etter",
			selectTable : "Velg tabell",
			selectRow : "Velg rad",
			columnTitle : "Kolonnebredde",
			colProps : "Kolonneegenskaper",
			invalidColumnWidth	: "Kolonnebredde må være et positivt tall.",
			fixedColWidths : "Faste kolonnebredder"
		},
		cell :
		{
			title : "Celle"
		},
		colordialog :
		{
			currentColor	: "Gjeldende farge"
		},
		emoticon :
		{
			angel		: "Engel",
			angry		: "Sint",
			cool		: "Kul",
			crying		: "Gråt",
			eyebrow		: "Hevet øyebryn",
			frown		: "Streng",
			goofy		: "Tåpelig",
			grin		: "Glis",
			half		: "Halv",
			idea		: "Idé",
			laughing	: "Latter",
			laughroll	: "Rullelatter",
			no			: "Nei",
			oops		: "Ops",
			shy			: "Sjenert",
			smile		: "Smil",
			tongue		: "Tunge",
			wink		: "Blunk",
			yes			: "Ja"
		},

		menu :
		{
			link	: "Sett inn kobling",
			list	: "Liste",
			paste	: "Lim inn",
			action	: "Gjør slik",
			align	: "Juster",
			emoticon: "Uttrykksikon"
		},

		iframe :
		{
			title	: "IFrame"
		},

		list:
		{
			numberedTitle		: "Nummerert liste",
			bulletedTitle		: "Punktliste",
			description			: "Innstillingene vil bli brukt på det gjeldende listenivået",
			fontsize			: "Skriftstørrelse:"
		},

		// Anchor dialog
		anchor :
		{
			description	: "Angi et beskrivende bokmerkenavn, for eksempel 'Seksjon 1.2'. Etter at du har satt inn bokmerket, klikker du på ikonet 'Kobling' eller 'Dokumentbokmerkekobling' for å koble det.",
			title		: "Dokumentbokmerkekobling",
			linkTo		: "Kobling til:"
		},

		urllink :
		{
			title : "URL-link",
			linkText : "Koblingstekst:",
			selectAnchor: "Velg et anker:",
			nourl: "Oppgi en URL i tekstfeltet.",
			urlhelp: "Skriv eller lim inn en URL som åpnes når brukerne klikker på koblingen, f.eks. http://www.eksempel.com.",
			displaytxthelp: "Skriv tekst som skal vises for linken.",
			openinnew : "Åpne link i nytt vindu"
		},

		spellchecker :
		{
			title : "Stavekontroll",
			replace : "Erstatt:",
			suggesstion : "Forslag:",
			withLabel : "Med:",
			replaceButton : "Erstatt",
			replaceallButton:"Erstatt alle",
			skipButton:"Hopp over",
			skipallButton: "Hopp over alle",
			undochanges: "Angre endringer",
			complete: "Stavekontrollen er fullført",
			problem: "Problem ved henting av XML-data",
			addDictionary: "Legg til i ordliste",
			editDictionary: "Rediger ordliste"
		},

		status :
		{
			keystrokeForHelp: "Trykk på ALT 0 for å få hjelp"
		},

		linkdialog :
		{
			label : "Linkdialog"
		},

		imagedatauri :
		{
			error : "Innliming av bilder støttes ikke i denne versjonen. Bruk verktøylinjealternativet \'Sett inn bilde\' i stedet."
		},

		image :
		{
			previewText : "Teksten vil flyte rundt bildet du legger til, som i dette eksempelet.",
			fileUpload : "Velg en bildefil fra datamaskinen din:"
		}
	}

};
