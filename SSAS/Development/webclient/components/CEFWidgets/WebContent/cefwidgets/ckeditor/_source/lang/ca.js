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

CKEDITOR.lang["ca"] =
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
	editorTitle : "Editor de text enriquit, %1, premeu ALT 0 per obtenir ajuda.",
	editorHelp : "",

	// ARIA descriptions.
	toolbars	: "Barres d'eines de l'editor",
	editor	: "Editor de text enriquit",

	// Toolbar buttons without dialogs.
	source			: "Origen",
	newPage			: "Pàgina nova",
	save			: "Desa",
	preview			: "Visualització prèvia:",
	cut				: "Retalla",
	copy			: "Copia",
	paste			: "Enganxa",
	print			: "Imprimeix",
	underline		: "Subratlla",
	bold			: "Negreta",
	italic			: "Cursiva",
	selectAll		: "Selecciona\'ls tots",
	removeFormat	: "Elimina format",
	strike			: "Ratllat",
	subscript		: "Subíndex",
	superscript		: "Superíndex",
	horizontalrule	: "Insereix línia horitzontal",
	pagebreak		: "Insereix un salt de pàgina",
	pagebreakAlt		: "Salt de pàgina",
	unlink			: "Elimina enllaç",
	undo			: "Desfés",
	redo			: "Refés",

	// Common messages and labels.
	common :
	{
		browseServer	: "Servidor del navegador:",
		url				: "URL:",
		protocol		: "Protocol:",
		upload			: "Penja:",
		uploadSubmit	: "Envia\'l a un servidor",
		image			: "Insereix imatge",
		flash			: "Insereix pel·lícula en flaix",
		form			: "Insereix un formulari",
		checkbox		: "Insereix un quadre de selecció",
		radio			: "Insereix un botó d\'opció",
		textField		: "Insereix camp de text",
		textarea		: "Insereix àrea de text",
		hiddenField		: "Insereix un camp ocult",
		button			: "Insereix un botó",
		select			: "Insereix un camp de selecció",
		imageButton		: "Insereix un botó d\'imatge",
		notSet			: "<no establert>",
		id				: "ID:",
		name			: "Nom:",
		langDir			: "Direcció de l\'idioma:",
		langDirLtr		: "D\'esquerra a dreta",
		langDirRtl		: "De dreta a esquerra",
		langCode		: "Codi de l\'idioma:",
		longDescr		: "URL de descripció llarga:",
		cssClass		: "Classes de full d'estil:",
		advisoryTitle	: "Títol informatiu:",
		cssStyle		: "Estil:",
		ok				: "D\'acord",
		cancel			: "Cancel·la",
		close : "Tanca",
		preview			: "Visualització prèvia:",
		generalTab		: "General",
		advancedTab		: "Avançat",
		validateNumberFailed	: "Aquest valor no és un número.",
		confirmNewPage	: "Qualsevol canvi sense desar a aquest contingut es perdrà. Esteu segur que voleu carregar una pàgina nova?",
		confirmCancel	: "Algunes de les opcions han canviat. Esteu segur que voleu tancar el diàleg?",
		options : "Opcions",
		target			: "Destinació:",
		targetNew		: "Finestra nova (_blank)",
		targetTop		: "Finestra a la part superior (_top)",
		targetSelf		: "Mateixa finestra (_self)",
		targetParent	: "Finestra pare (_parent)",
		langDirLTR		: "D\'esquerra a dreta",
		langDirRTL		: "De dreta a esquerra",
		styles			: "Estil:",
		cssClasses		: "Classes de full d'estil:",
		width			: "Amplada:",
		height			: "Alçada:",
		align			: "Alineació:",
		alignLeft		: "Esquerra",
		alignRight		: "Dreta",
		alignCenter		: "Centre",
		alignTop		: "Superior",
		alignMiddle		: "Mig",
		alignBottom		: "Inferior",
		invalidHeight	: "L'alçada ha de ser un número enter positiu.",
		invalidWidth	: "L'amplada ha de ser un número enter positiu.",
		invalidCssLength	: "El valor especificat per al camp '%1' ha de ser un número positiu amb o sense una unitat de mesura CSS vàlida (px, %, in, cm, mm, em, ex, pt, o pc).",
		invalidHtmlLength	: "El valor especificat per al camp '%1' ha de ser un número positiu amb o sense una unitat de mesura HTML vàlida (px o %).",
		invalidInlineStyle	: "El valor especificat per a l'estil en línia ha de constar d'un o més tuples amb el format \"nom : valor\", separat per punts i coma.",
		cssLengthTooltip	: "Introduïu el número d'un valor en píxels amb una unitat CSS vàlida (px, %, in, cm, mm, em, ex, pt, o pc).",

		// Put the voice-only part of the label in the span.
		unavailable		: "%1<span class=\"cke_accessibility\">, no disponible</span>"
	},

	contextmenu :
	{
		options : "Opcions del menú contextual"
	},

	// Special char dialog.
	specialChar		:
	{
		toolbar		: "Insereix caràcters especials",
		title		: "Caràcter especial",
		options : "Opcions de caràcters especials"
	},

	// Link dialog.
	link :
	{
		toolbar		: "Enllaç de l'URL",
		other 		: "<altre>",
		menu		: "Edita enllaç",
		title		: "Enllaç",
		info		: "Informació de l\'enllaç",
		target		: "Destinació",
		upload		: "Penja:",
		advanced	: "Avançat",
		type		: "Tipus d\'enllaç:",
		toUrl		: "URL",
		toAnchor	: "Enllaç amb àncora del text",
		toEmail		: "Correu electrònic",
		targetFrame	: "<marc>",
		targetPopup	: "<finestra emergent>",
		targetFrameName	: "Nom del marc de destinació:",
		targetPopupName	: "Nom de la finestra emergent:",
		popupFeatures	: "Característiques de la finestra emergent:",
		popupResizable	: "Mida ajustable",
		popupStatusBar	: "Barra d\'estat",
		popupLocationBar	: "Barra d\'ubicació",
		popupToolbar	: "Barra d\'eines",
		popupMenuBar	: "Barra de menú",
		popupFullScreen	: "Pantalla completa (IE)",
		popupScrollBars	: "Barres de desplaçament",
		popupDependent	: "Dependent (Netscape)",
		popupLeft		: "Posició esquerra",
		popupTop		: "Posició a la part superior",
		id				: "ID:",
		langDir			: "Direcció de l\'idioma:",
		langDirLTR		: "D\'esquerra a dreta",
		langDirRTL		: "De dreta a esquerra",
		acccessKey		: "Clau d\'accés:",
		name			: "Nom:",
		langCode		: "Codi de l\'idioma:",
		tabIndex		: "Índex de pestanyes:",
		advisoryTitle	: "Títol informatiu:",
		advisoryContentType	: "Tipus de contingut informatiu:",
		cssClasses		: "Classes de full d'estil:",
		charset			: "Codificació de caràcters de recursos enllaçats:",
		styles			: "Estil:",
		rel			: "Relació",
		selectAnchor	: "Selecciona una àncora",
		anchorName		: "Per nom de l\'àncora",
		anchorId		: "Per ID de l\'element",
		emailAddress	: "Adreça de correu electrònic",
		emailSubject	: "Tema del missatge",
		emailBody		: "Cos del missatge",
		noAnchors		: "No hi ha adreces d'interès disponibles al document. Feu clic a la icona 'Insereix adreça d'interès de document' de la barra d'eines per afegir-ne una.",
		noUrl			: "Escriviu l\'URL de l\'enllaç",
		noEmail			: "Escriviu l\'adreça de correu electrònic"
	},

	// Anchor dialog
	anchor :
	{
		toolbar		: "Insereix adreça d'interès de document",
		menu		: "Edita adreça d'interès de document",
		title		: "Adreça d'interès de document",
		name		: "Nom:",
		errorName	: "Introduïu un nom per a l'adreça d'interès de document",
		remove		: "Elimina l'adreça d'interès de document"
	},

	// List style dialog
	list:
	{
		numberedTitle		: "Propietats de la llista numerada",
		bulletedTitle		: "Propietats de la llista amb vinyetes",
		type				: "Estil de llista",
		start				: "Inici:",
		validateStartNumber				:"El nombre d'inici de la llista ha de ser un nombre enter.",
		circle				: "Cercle",
		disc				: "Disc",
		square				: "Quadrat",
		none				: "Cap",
		notset				: "<no establert>",
		armenian			: "Numeració armènia",
		georgian			: "Numeració georgiana (an, ban, gan, etc.)",
		lowerRoman			: "Números romans en minúscules (i, ii, iii, iv, v, etc.)",
		upperRoman			: "Números romans en majúscules (I, II, III, IV, V, etc.)",
		lowerAlpha			: "Alfabètic en minúscules (a, b, c, d, e, etc.)",
		upperAlpha			: "Alfabètic en majúscules (A, B, C, D, E, etc.)",
		lowerGreek			: "Grec en minúscules (alfa, beta, gamma, etc.)",
		decimal				: "Decimal (1, 2, 3, etc.)",
		decimalLeadingZero	: "Decimal amb zero inicial (01, 02, 03, etc.)"
	},

	// Find And Replace Dialog
	findAndReplace :
	{
		title				: "Cerca i substitueix",
		find				: "Cerca",
		replace				: "Substitueix",
		findWhat			: "Cerca:",
		replaceWith			: "Substitueix per:",
		notFoundMsg			: "El text especificat no s\'ha trobat.",
		findOptions			: "Cerca Opcions",
		matchCase			: "Coincidència de majúscules i minúscules",
		matchWord			: "Coincidència de tota la paraula",
		matchCyclic			: "Coincidència cíclica",
		replaceAll			: "Substitueix tot",
		replaceSuccessMsg	: "%1 aparició(ns) substituïda."
	},

	// Table Dialog
	table :
	{
		toolbar		: "Insereix una taula",
		title		: "Taula",
		menu		: "Propietats de la taula",
		deleteTable	: "Suprimeix la taula",
		rows		: "Files:",
		columns		: "Columnes:",
		border		: "Mida del contorn:",
		widthPx		: "píxels",
		widthPc		: "percentatge",
		widthUnit	: "Unitat d\'amplada:",
		cellSpace	: "Espaiat entre cel·les:",
		cellPad		: "Marge de cel·les:",
		caption		: "Llegenda:",
		summary		: "Resum:",
		headers		: "Capçaleres:",
		headersNone		: "Cap",
		headersColumn	: "Primera columna",
		headersRow		: "Primera fila",
		headersBoth		: "Ambdós",
		invalidRows		: "El nombre de files ha de ser un número enter superior a zero.",
		invalidCols		: "El nombre de columnes ha de ser un número enter superior a zero.",
		invalidBorder	: "La mida del contorn ha de ser un número positiu",
		invalidWidth	: "L'amplada de la taula ha de ser un número positiu.",
		invalidHeight	: "L'alçada de la taula ha de ser un número positiu.",
		invalidCellSpacing	: "L'espaiat entre cel·les ha de ser un número positiu.",
		invalidCellPadding	: "La separació entre cel·les ha de ser un número positiu.",

		cell :
		{
			menu			: "Cel·la",
			insertBefore	: "Insereix una cel·la abans",
			insertAfter		: "Insereix una cel·la després",
			deleteCell		: "Suprimeix cel·les",
			merge			: "Combina cel·les",
			mergeRight		: "Combina a la dreta",
			mergeDown		: "Combina cap avall",
			splitHorizontal	: "Divideix la cel·la horitzontalment",
			splitVertical	: "Divideix la cel·la verticalment",
			title			: "Propietats de la cel·la",
			cellType		: "Tipus de cel·la:",
			rowSpan			: "Lapse de files:",
			colSpan			: "Lapse de columnes:",
			wordWrap		: "Ajustament automàtic del text:",
			hAlign			: "Alineació horitzontal:",
			vAlign			: "Alineació vertical:",
			alignBaseline	: "Línia de base",
			bgColor			: "Color de fons",
			borderColor		: "Color del contorn:",
			data			: "Dades",
			header			: "Capçalera",
			yes				: "Sí",
			no				: "No",
			invalidWidth	: "L'amplada entre cel·les ha de ser un número positiu.",
			invalidHeight	: "L'alçada entre cel·les ha de ser un número positiu.",
			invalidRowSpan	: "El lapse de files ha de ser un número enter positiu.",
			invalidColSpan	: "El lapse de columnes ha de ser un número enter positiu.",
			chooseColor 	: "Més colors..."
		},

		row :
		{
			menu			: "Fila",
			insertBefore	: "Insereix una fila abans",
			insertAfter		: "Insereix una fila després",
			deleteRow		: "Suprimeix files"
		},

		column :
		{
			menu			: "Columna",
			insertBefore	: "Insereix una columna abans",
			insertAfter		: "Insereix una columna després",
			deleteColumn	: "Suprimeix columnes"
		}
	},

	// Button Dialog.
	button :
	{
		title		: "Propietats del botó",
		text		: "Text (Valor):",
		type		: "Tipus:",
		typeBtn		: "Botó",
		typeSbm		: "Tramet",
		typeRst		: "Restableix"
	},

	// Checkbox and Radio Button Dialogs.
	checkboxAndRadio :
	{
		checkboxTitle : "Propietats del quadre de selecció",
		radioTitle	: "Propietats del botó d\'opció",
		value		: "Valor:",
		selected	: "Seleccionat"
	},

	// Form Dialog.
	form :
	{
		title		: "Insereix un formulari",
		menu		: "Propietats del formulari",
		action		: "Acció:",
		method		: "Mètode:",
		encoding	: "Codificació:"
	},

	// Select Field Dialog.
	select :
	{
		title		: "Selecciona les propietats del camp",
		selectInfo	: "Selecciona la informació",
		opAvail		: "Opcions disponibles",
		value		: "Valor:",
		size		: "Mida:",
		lines		: "línies",
		chkMulti	: "Permet diverses seleccions",
		opText		: "Text:",
		opValue		: "Valor:",
		btnAdd		: "Afegeix",
		btnModify	: "Modifica",
		btnUp		: "Amunt",
		btnDown		: "Cap avall",
		btnSetValue : "Defineix com a valor seleccionat",
		btnDelete	: "Suprimeix"
	},

	// Textarea Dialog.
	textarea :
	{
		title		: "Propietats de l\'àrea de text",
		cols		: "Columnes:",
		rows		: "Files:"
	},

	// Text Field Dialog.
	textfield :
	{
		title		: "Propietats del camp de text",
		name		: "Nom:",
		value		: "Valor:",
		charWidth	: "Amplada del caràcter:",
		maxChars	: "Nombre màxim de caràcters:",
		type		: "Tipus:",
		typeText	: "Text",
		typePass	: "Contrasenya"
	},

	// Hidden Field Dialog.
	hidden :
	{
		title	: "Propietats del camp ocult",
		name	: "Nom:",
		value	: "Valor:"
	},

	// Image Dialog.
	image :
	{
		title		: "Imatge",
		titleButton	: "Propietats del botó de imatge",
		menu		: "Propietats de la imatge",
		infoTab	: "Informació de la imatge",
		btnUpload	: "Carrega imatge",
		upload	: "Carrega",
		alt		: "Text alternatiu:",
		lockRatio	: "Bloca la relació",
		resetSize	: "Restableix la mida",
		border	: "Contorn:",
		hSpace	: "Espaiat horitzontal:",
		vSpace	: "Espaiat vertical:",
		alertUrl	: "Escriviu l\'URL de la imatge",
		linkTab	: "Enllaç",
		button2Img	: "Voleu transformar el botó de imatge seleccionat en una simple imatge?",
		img2Button	: "Voleu transformar el botó seleccionat en un botó de imatge?",
		urlMissing : "Falta l\'URL d\'origen de la imatge.",
		validateBorder : "El contorn ha de ser un número enter positiu.",
		validateHSpace : "L'espai horitzontal ha de ser un número enter positiu.",
		validateVSpace : "L'espai vertical ha de ser un número enter positiu."
	},

	// Flash Dialog
	flash :
	{
		properties		: "Propietats de Flash",
		propertiesTab	: "Propietats",
		title		: "Flash",
		chkPlay		: "Reproducció automàtica",
		chkLoop		: "Bucle",
		chkMenu		: "Habilita menú de flaix",
		chkFull		: "Permetre pantalla completo",
 		scale		: "Escala:",
		scaleAll		: "Mostra-ho tot",
		scaleNoBorder	: "Sense contorns",
		scaleFit		: "Ajustament exacte",
		access			: "Accés d'script:",
		accessAlways	: "Sempre",
		accessSameDomain	: "Mateix domini",
		accessNever	: "Mai",
		alignAbsBottom: "Part més inferior",
		alignAbsMiddle: "Just al mig",
		alignBaseline	: "Línia de base",
		alignTextTop	: "Text a la part superior",
		quality		: "Qualitat:",
		qualityBest	: "Millor",
		qualityHigh	: "Alta",
		qualityAutoHigh	: "Alta automàtica",
		qualityMedium	: "Mitjà",
		qualityAutoLow	: "Baixa automàtica",
		qualityLow	: "Baixa",
		windowModeWindow	: "Finestra",
		windowModeOpaque	: "Opaca",
		windowModeTransparent	: "Transparent",
		windowMode	: "Mode de finestra:",
		flashvars	: "Variables:",
		bgcolor	: "Color de fons",
		hSpace	: "Espaiat horitzontal:",
		vSpace	: "Espaiat vertical:",
		validateSrc : "L\'URL no pot ser buit.",
		validateHSpace : "L'espai horitzontal ha de ser un número enter positiu.",
		validateVSpace : "L'espai vertical ha de ser un número enter positiu."
	},

	// Speller Pages Dialog
	spellCheck :
	{
		toolbar			: "Correcció ortogràfica",
		title			: "Correcció ortogràfica",
		notAvailable	: "Ho sentim, aquest servei no està disponible ara.",
		errorLoading	: "S\'ha produït un error en carregar l\'amfitrió del servei d\'aplicació: %s.",
		notInDic		: "No es troba al diccionari",
		changeTo		: "Canvia a",
		btnIgnore		: "Ignora",
		btnIgnoreAll	: "Ignora tot",
		btnReplace		: "Substitueix",
		btnReplaceAll	: "Substitueix tot",
		btnUndo			: "Desfés",
		noSuggestions	: "- Sense suggeriments -",
		progress		: "Correcció ortogràfica en curs...",
		noMispell		: "Correcció ortogràfica completa: no s\'ha trobat cap error ortogràfic",
		noChanges		: "Correcció ortogràfica completa: no s\'ha canviat cap paraula",
		oneChange		: "Correcció ortogràfica completa: s\'ha canviat una paraula",
		manyChanges		: "Correcció ortogràfica completa: %1 paraules canviades",
		ieSpellDownload	: "El corrector ortogràfic no està instal·lat. Voleu baixar-lo ara?"
	},

	smiley :
	{
		toolbar	: "Insereix emoticona",
		title	: "Emoticones",
		options : "Opcions d\'emoticones"
	},

	elementsPath :
	{
		eleLabel : "Camí d\'accés dels elements",
		eleTitle : "%1 element"
	},

	numberedlist : "Llista numerada",
	bulletedlist : "Llista amb vinyetes",
	indent : "Augmenta sagnat",
	outdent : "Disminueix sagnat",

	justify :
	{
		left : "Alineació esquerra",
		center : "Alineació centre",
		right : "Alineació dreta",
		block : "Alineació justificada"
	},

	blockquote : "DelimitacióBloc",

	clipboard :
	{
		title		: "Enganxa",
		cutError	: "Els paràmetres de seguretat del navegador eviten el tall automàtic. Utilitzeu Ctrl+X del teclat.",
		copyError	: "Els paràmetres de seguretat del navegador eviten la còpia automàtica. Utilitzeu Ctrl+C del teclat.",
		pasteMsg	: "Utilitzeu Ctrl+V (Cmd+V en el MAC) per enganxar a continuació.",
		securityMsg	: "La seguretat del vostre navegador evita l\'enganxament directe des del porta-retalls.",
		pasteArea	: "Àrea en la qual s\'enganxa"
	},

	pastefromword :
	{
		confirmCleanup	: "El text que voleu enganxar sembla que està copiat del Word. Voleu netejar-lo abans d\'enganxar?",
		toolbar			: "Enganxament especial",
		title			: "Enganxament especial",
		error			: "No s\'han pogut netejar les dades enganxades a causa d\'un error intern"
	},

	pasteText :
	{
		button	: "Enganxa com a text sense format",
		title	: "Enganxa com a text sense format"
	},

	templates :
	{
		button 			: "Plantilles",
		title : "Plantilles de contingut",
		options : "Opcions de plantilla",
		insertOption: "Substitueix el contingut actual",
		selectPromptMsg: "Selecciona la plantilla per obrir a l\'editor",
		emptyListMsg : "(No hi ha plantilles definides)"
	},

	showBlocks : "Mostra els blocs",

	stylesCombo :
	{
		label		: "Estils",
		panelTitle 	: "Estils",
		panelTitle1	: "Estils de blocs",
		panelTitle2	: "Estils en línia",
		panelTitle3	: "Estils d\'objectes"
	},

	format :
	{
		label		: "Format",
		panelTitle	: "Format de paràgraf",

		tag_p		: "Normal",
		tag_pre		: "Formatat",
		tag_address	: "Adreça",
		tag_h1		: "Encapçalament 1",
		tag_h2		: "Encapçalament 2",
		tag_h3		: "Encapçalament 3",
		tag_h4		: "Encapçalament 4",
		tag_h5		: "Encapçalament 5",
		tag_h6		: "Encapçalament 6",
		tag_div		: "Normal (DIV)"
	},

	div :
	{
		title				: "Crea un contenidor Div",
		toolbar				: "Crea un contenidor Div",
		cssClassInputLabel	: "Classes de full d'estil",
		styleSelectLabel	: "Estil",
		IdInputLabel		: "ID",
		languageCodeInputLabel	: " Codi de l\'idioma",
		inlineStyleInputLabel	: "Estil en línia",
		advisoryTitleInputLabel	: "Títol informatiu",
		langDirLabel		: "Direcció de l\'idioma",
		langDirLTRLabel		: "D\'esquerra a dreta (LTR)",
		langDirRTLLabel		: "De dreta a esquerra (RTL)",
		edit				: "Edita Div",
		remove				: "Elimina Div"
  	},

	iframe :
	{
		title		: "Propietats d'IFrame",
		toolbar		: "Insereix IFrame",
		noUrl		: "Escriviu l'URL d'iframe",
		scrolling	: "Habilita les barres de desplaçament",
		border		: "Mostra el contorn del marc"
	},

	font :
	{
		label		: "Tipus de lletra",
		voiceLabel	: "Tipus de lletra",
		panelTitle	: "Nom del tipus de lletra"
	},

	fontSize :
	{
		label		: "Mida",
		voiceLabel	: "Mida del tipus de lletra",
		panelTitle	: "Mida del tipus de lletra"
	},

	colorButton :
	{
		textColorTitle	: "Color del text",
		bgColorTitle	: "Color de fons",
		panelTitle		: "Colors",
		auto			: "Automàtic",
		more			: "Més colors..."
	},

	colors :
	{
		"000" : "Negre",
		"800000" : "Marró fosc",
		"8B4513" : "Marró cuir",
		"2F4F4F" : "Gris pissarra fosc",
		"008080" : "Xarxet",
		"000080" : "Blau marí",
		"4B0082" : "Indi",
		"696969" : "Gris fosc",
		"B22222" : "Maó refractari",
		"A52A2A" : "Marró",
		"DAA520" : "Crema",
		"006400" : "Verd fosc",
		"40E0D0" : "Turquesa",
		"0000CD" : "Blau mitjà",
		"800080" : "Porpra",
		"808080" : "Gris",
		"F00" : "Vermell",
		"FF8C00" : "Taronja fosc",
		"FFD700" : "Daurat",
		"008000" : "Verd",
		"0FF" : "Cian",
		"00F" : "Blau",
		"EE82EE" : "Violat",
		"A9A9A9" : "Gris fosc",
		"FFA07A" : "Salmó clar",
		"FFA500" : "Taronja",
		"FFFF00" : "Groc",
		"00FF00" : "Llima",
		"AFEEEE" : "Turquesa pàl·lid",
		"ADD8E6" : "Blau clar",
		"DDA0DD" : "Pruna",
		"D3D3D3" : "Gris clar",
		"FFF0F5" : "Lavanda clar",
		"FAEBD7" : "Blanc trencat",
		"FFFFE0" : "Groc clar",
		"F0FFF0" : "Mel",
		"F0FFFF" : "Blau cel",
		"F0F8FF" : "Blau de cobalt",
		"E6E6FA" : "Lavanda",
		"FFF" : "Blanc"
	},

	scayt :
	{
		title			: "Fer correcció ortogràfica mentre escriu",
		opera_title		: "No admès per l\'Opera",
		enable			: "Habilita SCAYT",
		disable			: "Inhabilita SCAYT",
		about			: "Quant a SCAYT",
		toggle			: "Commuta SCAYT",
		options			: "Opcions",
		langs			: "Idiomes",
		moreSuggestions	: "Més suggeriments",
		ignore			: "Ignora",
		ignoreAll		: "Ignora tot",
		addWord			: "Afegeix paraula",
		emptyDic		: "El nom del diccionari no pot ser buit.",

		optionsTab		: "Opcions",
		allCaps			: "Ignora les paraules amb totes les lletres en majúscules",
		ignoreDomainNames : "Ignora els noms de domini",
		mixedCase		: "Ignora les paraules amb majúscules i minúscules mesclades",
		mixedWithDigits	: "Ignora les paraules amb números",

		languagesTab	: "Idiomes",

		dictionariesTab	: "Diccionaris",
		dic_field_name	: "Nom de diccionari",
		dic_create		: "Crea",
		dic_restore		: "Restaura",
		dic_delete		: "Suprimeix",
		dic_rename		: "Reanomena",
		dic_info		: "Inicialment, el Diccionari d'usuari s'emmagatzema en una galeta. Tanmateix, les galetes tenen una mida limitada. Quan el Diccionari d'usuari creix fins a un punt en què no es pot emmagatzemar en una galeta, es pot emmagatzemar al nostre servidor. Per emmagatzemar el vostre diccionari personal en el nostre servidor, heu d'especificar un nom per al diccionari. Si ja teniu un diccionari emmagatzemat, escriviu el seu nom i feu clic al botó Restaura.",

		aboutTab		: "Quant a"
	},

	about :
	{
		title		: "Quant a CKEditor",
		dlgTitle	: "Quant a CKEditor",
		help	: "Marqueu $1 per obtenir ajuda.",
		userGuide : "Guia de l'usuari del CKEditor",
		moreInfo	: "Per obtenir informació sobre la llicència, visiteu el lloc web:",
		copy		: "Copyright &copy; $1. Tots els drets reservats."
	},

	maximize : "Maximitza",
	minimize : "Minimitza",

	fakeobjects :
	{
		anchor	: "Àncora",
		flash	: "Animació Flash",
		iframe		: "IFrame",
		hiddenfield	: "Camp ocult",
		unknown	: "Objecte desconegut"
	},

	resize : "Arrossegueu per canviar la mida",

	colordialog :
	{
		title		: "Seleccioneu Color",
		options	:	"Opcions de color",
		highlight	: "Ressalta",
		selected	: "Color seleccionat",
		clear		: "Esborra"
	},

	toolbarCollapse	: "Redueix la barra d\'eines",
	toolbarExpand	: "Expandeix la barra d\'eines",

	toolbarGroups :
	{
		document : "Document",
		clipboard : "Porta-retalls/Desfés",
		editing : "Edició",
		forms : "Formularis",
		basicstyles : "Estils bàsics",
		paragraph : "Paràgraf",
		links : "Enllaços",
		insert : "Insereix",
		styles : "Estils",
		colors : "Colors",
		tools : "Eines"
	},

	bidi :
	{
		ltr : "Direcció de text d'esquerra a dreta",
		rtl : "Direcció de text de dreta a esquerra"
	},

	docprops :
	{
		label : "Propietats del document",
		title : "Propietats del document",
		design : "Disseny",
		meta : "Metaetiquetes",
		chooseColor : "Tria",
		other : "Altres...",
		docTitle :	"Títol de la pàgina",
		charset : 	"Codificació de joc de caràcters",
		charsetOther : "Altres codificacions de joc de caràcters",
		charsetASCII : "ASCII",
		charsetCE : "Centreeuropeu",
		charsetCT : "Xinès tradicional (Big5)",
		charsetCR : "Ciríl·lic",
		charsetGR : "Grec",
		charsetJP : "Japonès",
		charsetKR : "Coreà",
		charsetTR : "Turc",
		charsetUN : "Unicode (UTF-8)",
		charsetWE : "Europa Occidental",
		docType : "Encapçalament de tipus de document",
		docTypeOther : "Altre encapçalament de tipus de document",
		xhtmlDec : "Inclou declaracions XHTML",
		bgColor : "Color de fons",
		bgImage : "URL d'imatge de fons",
		bgFixed : "Fons sense desplaçament (fix)",
		txtColor : "Color del text",
		margin : "Marges de pàgina",
		marginTop : "Superior",
		marginLeft : "Esquerra",
		marginRight : "Dreta",
		marginBottom : "Inferior",
		metaKeywords : "Paraules clau d'indexat de document (separats per comes)",
		metaDescription : "Descripció del document",
		metaAuthor : "Autor",
		metaCopyright : "Copyright",
		previewHtml : "<p>Aquest és un <strong>text de mostra</strong>. Esteu utilitzant <a href=\"javascript:void(0)\">CKEditor</a>.</p>"
	},

	ibm :
	{

		common :
		{
			widthIn	: "polzades",
			widthCm	: "centímetres",
			widthMm	: "mil·límetres",
			widthEm	: "quadratí",
			widthEx	: "ex",
			widthPt	: "punts",
			widthPc	: "picas",
			required : "Obligatori"
		},
		table :
		{
			createTable : 'Insereix una taula',
			heightUnit	: "Unitat d'alçada:",
			insertMultipleRows : "Insereix files",
			insertMultipleCols : "Insereix columnes",
			noOfRows : "Número de files:",
			noOfCols : "Número de columnes:",
			insertPosition : "Posició:",
			insertBefore : "Abans de",
			insertAfter : "Després de",
			selectTable : "Selecciona taula",
			selectRow : "Selecciona fila",
			columnTitle : "Amplada de columna",
			colProps : "Propietats de columna",
			invalidColumnWidth	: "L'amplada de columna ha de ser un número positiu.",
			fixedColWidths : "Amplades de columna fixes"
		},
		cell :
		{
			title : "Cel·la"
		},
		colordialog :
		{
			currentColor	: "Color actual"
		},
		emoticon :
		{
			angel		: "Àngel",
			angry		: "Enfadat",
			cool		: "Xulo",
			crying		: "Ploraner",
			eyebrow		: "Cella",
			frown		: "Celles arrufades",
			goofy		: "Estúpid",
			grin		: "Ganyota",
			half		: "Mig",
			idea		: "Idea",
			laughing	: "Riure",
			laughroll	: "Riure molt",
			no			: "No",
			oops		: "Ui",
			shy			: "Tímid",
			smile		: "Somriure",
			tongue		: "Llengua",
			wink		: "Picar l\'ull",
			yes			: "Sí"
		},

		menu :
		{
			link	: "Insereix un enllaç",
			list	: "Llista",
			paste	: "Enganxa",
			action	: "Acció",
			align	: "Alineació",
			emoticon: "Emoticona"
		},

		iframe :
		{
			title	: "IFrame"
		},

		list:
		{
			numberedTitle		: "Llista numerada",
			bulletedTitle		: "Llista amb vinyetes",
			description			: "Els paràmetres s'aplicaran al nivell de llista actual",
			fontsize			: "Mida de tipus de lletra:"
		},

		// Anchor dialog
		anchor :
		{
			description	: "Escriviu un nom d'adreça d'interès descriptiu, com ara 'Secció 1.2'. Després d'inserir l'adreça d'interès, feu clic a la icona 'Enllaç' o 'Enllaç d'adreça d'interès de document' per enllaçar-la.",
			title		: "Enllaç d'adreça d'interès de document",
			linkTo		: "Enllaça a:"
		},

		urllink :
		{
			title : "Enllaç de l'URL",
			linkText : "Text de l'enllaç:",
			selectAnchor: "Seleccioneu una àncora:",
			nourl: "Escriviu l\'URL a un camp de text.",
			urlhelp: "Escriviu o enganxeu un URL per obrir quan els usuaris facin clic a aquest enllaç, per exemple http://www.exemple.com.",
			displaytxthelp: "Escriviu el text que es mostrarà per l\'enllaç.",
			openinnew : "Obra l\'enllaç a una nova finestra"
		},

		spellchecker :
		{
			title : "Comprovació ortogràfica",
			replace : "Substitueix:",
			suggesstion : "Suggeriments:",
			withLabel : "Amb:",
			replaceButton : "Substitueix",
			replaceallButton:"Substitueix tot",
			skipButton:"Salta",
			skipallButton: "Salta tot",
			undochanges: "Desfés els canvis",
			complete: "Correcció ortogràfica completa",
			problem: "Hi ha un problema en recuperar dades XML",
			addDictionary: "Afegeix al diccionari...",
			editDictionary: "Edita el diccionari"
		},

		status :
		{
			keystrokeForHelp: "Premeu ALT 0 per obtenir ajuda"
		},

		linkdialog :
		{
			label : "Diàleg de l\'enllaç"
		},

		imagedatauri :
		{
			error : "L'enganxament d'imatges no se suporta actualment. En el seu lloc, utilitzeu l'opció de la barra d'eines \'Insereix imatge\'."
		},

		image :
		{
			previewText : "El text fluirà al voltant de la imatge que esteu afegint, igual que en aquest exemple.",
			fileUpload : "Seleccioneu un fitxer d'imatge del vostre ordinador:"
		}
	}

};
