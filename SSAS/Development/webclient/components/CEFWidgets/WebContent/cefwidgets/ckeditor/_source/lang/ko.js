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

CKEDITOR.lang["ko"] =
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
	editorTitle : "서식있는 텍스트 편집기, %1, 도움말을 보려면 Alt+0을 누르십시오.",
	editorHelp : "",

	// ARIA descriptions.
	toolbars	: "편집기 도구 모음",
	editor	: "서식있는 텍스트 편집기",

	// Toolbar buttons without dialogs.
	source			: "소스",
	newPage			: "새 페이지",
	save			: "저장",
	preview			: "미리보기:",
	cut				: "잘라내기",
	copy			: "복사",
	paste			: "붙여넣기",
	print			: "인쇄",
	underline		: "밑줄",
	bold			: "굵게",
	italic			: "기울임꼴",
	selectAll		: "모두 선택",
	removeFormat	: "형식 제거",
	strike			: "취소선",
	subscript		: "아래첨자",
	superscript		: "윗첨자",
	horizontalrule	: "가로선 삽입",
	pagebreak		: "페이지 구분 삽입",
	pagebreakAlt		: "페이지 구분",
	unlink			: "링크 제거",
	undo			: "실행 취소",
	redo			: "다시 실행",

	// Common messages and labels.
	common :
	{
		browseServer	: "브라우저 서버:",
		url				: "URL:",
		protocol		: "프로토콜:",
		upload			: "업로드:",
		uploadSubmit	: "서버로 보내기",
		image			: "이미지 삽입",
		flash			: "플래시 동영상 삽입",
		form			: "양식 삽입",
		checkbox		: "선택란 삽입",
		radio			: "단일 선택 단추 삽입",
		textField		: "텍스트 필드 삽입",
		textarea		: "텍스트 영역 삽입",
		hiddenField		: "숨겨진 필드 삽입",
		button			: "단추 삽입",
		select			: "선택 필드 삽입",
		imageButton		: "이미지 단추 삽입",
		notSet			: "<설정 안함>",
		id				: "ID:",
		name			: "이름:",
		langDir			: "언어 방향:",
		langDirLtr		: "왼쪽에서 오른쪽",
		langDirRtl		: "오른쪽에서 왼쪽",
		langCode		: "언어 코드:",
		longDescr		: "긴 설명 URL:",
		cssClass		: "스타일시트 클래스:",
		advisoryTitle	: "링크 설명",
		cssStyle		: "스타일:",
		ok				: "확인",
		cancel			: "취소 ",
		close : "닫기",
		preview			: "미리보기:",
		generalTab		: "일반",
		advancedTab		: "고급",
		validateNumberFailed	: "이 값은 숫자가 아닙니다.",
		confirmNewPage	: "이 컨텐츠에 대한 저장되지 않은 변경사항이 손실됩니다. 새 페이지를 로드하시겠습니까?",
		confirmCancel	: "일부 옵션이 변경되었습니다. 대화 상자를 닫으시겠습니까?",
		options : "옵션",
		target			: "대상:",
		targetNew		: "새 창(_blank)",
		targetTop		: "맨 위 창(_top)",
		targetSelf		: "동일한 창(_self)",
		targetParent	: "상위 창(_parent)",
		langDirLTR		: "왼쪽에서 오른쪽",
		langDirRTL		: "오른쪽에서 왼쪽",
		styles			: "스타일:",
		cssClasses		: "스타일시트 클래스:",
		width			: "너비:",
		height			: "높이:",
		align			: "맞춤:",
		alignLeft		: "왼쪽",
		alignRight		: "오른쪽",
		alignCenter		: "가운데",
		alignTop		: "맨 위",
		alignMiddle		: "중간",
		alignBottom		: "아래",
		invalidHeight	: "높이는 양의 정수여야 합니다.",
		invalidWidth	: "너비는 양의 정수여야 합니다.",
		invalidCssLength	: "'%1' 필드에 대해 지정된 값이 유효한 CSS 수치 단위(px, %, in, cm, mm, em, ex, pt 또는 pc)가 있거나 없는 양수여야 합니다.",
		invalidHtmlLength	: "'%1' 필드에 대해 지정된 값이 유효한 HTML 수치 단위(px 또는 %)가 있거나 없는 양수여야 합니다.",
		invalidInlineStyle	: "인라인 스타일에 대해 지정된 값이 세미콜론으로 분리된 \"이름 : 값\"의 형식으로 하나 이상의 튜플로 구성되어야 합니다.",
		cssLengthTooltip	: "유효한 CSS 단위(px, %, in, cm, mm, em, ex, pt 또는 pc)의 숫자나 픽셀 값의 숫자를 입력하십시오.",

		// Put the voice-only part of the label in the span.
		unavailable		: "%1<span class=\"cke_accessibility\">, 사용 불가능</span>"
	},

	contextmenu :
	{
		options : "컨텍스트 메뉴 옵션"
	},

	// Special char dialog.
	specialChar		:
	{
		toolbar		: "특수 문자 삽입",
		title		: "특수 문자",
		options : "특수 문자 옵션"
	},

	// Link dialog.
	link :
	{
		toolbar		: "URL 링크",
		other 		: "<기타>",
		menu		: "링크 편집",
		title		: "링크",
		info		: "링크 정보",
		target		: "대상",
		upload		: "업로드:",
		advanced	: "고급",
		type		: "링크 유형:",
		toUrl		: "URL",
		toAnchor	: "텍스트의 기준 위치에 링크",
		toEmail		: "이메일",
		targetFrame	: "<프레임>",
		targetPopup	: "<팝업 창>",
		targetFrameName	: "대상 프레임 이름:",
		targetPopupName	: "팝업 창 이름:",
		popupFeatures	: "팝업 창 기능:",
		popupResizable	: "크기 조정 가능",
		popupStatusBar	: "상태 표시줄",
		popupLocationBar	: "위치 표시줄",
		popupToolbar	: "도구 모음",
		popupMenuBar	: "메뉴 표시줄",
		popupFullScreen	: "전화면(IE)",
		popupScrollBars	: "스크롤 막대",
		popupDependent	: "종속(Netscape)",
		popupLeft		: "왼쪽 위치",
		popupTop		: "맨 위 위치",
		id				: "ID:",
		langDir			: "언어 방향:",
		langDirLTR		: "왼쪽에서 오른쪽",
		langDirRTL		: "오른쪽에서 왼쪽",
		acccessKey		: "액세스 키:",
		name			: "이름:",
		langCode		: "언어 코드:",
		tabIndex		: "탭 색인:",
		advisoryTitle	: "링크 설명",
		advisoryContentType	: "링크 설명 컨텐츠 유형:",
		cssClasses		: "스타일시트 클래스:",
		charset			: "링크된 자원 문자 집합:",
		styles			: "스타일:",
		rel			: "관계",
		selectAnchor	: "기준 위치 선택",
		anchorName		: "기준 위치 이름별",
		anchorId		: "요소 ID별",
		emailAddress	: "이메일 주소",
		emailSubject	: "메시지 제목",
		emailBody		: "메시지 본문",
		noAnchors		: "문서에 사용 가능한 책갈피가 없습니다. 도구 모음에서 '문서 책갈피 삽입' 아이콘을 클릭하여 추가하십시오.",
		noUrl			: "링크 URL을 입력하십시오.",
		noEmail			: "이메일 주소를 입력하십시오."
	},

	// Anchor dialog
	anchor :
	{
		toolbar		: "문서 책갈피 삽입",
		menu		: "문서 책갈피 편집",
		title		: "문서 책갈피",
		name		: "이름:",
		errorName	: "문서 책갈피의 이름을 입력하십시오.",
		remove		: "문서 책갈피 제거"
	},

	// List style dialog
	list:
	{
		numberedTitle		: "번호 매기기 목록 특성",
		bulletedTitle		: "글머리 기호 목록 특성",
		type				: "스타일 나열:",
		start				: "시작:",
		validateStartNumber				:"목록 시작 번호가 전체 번호여야 합니다.",
		circle				: "일반원",
		disc				: "채운원",
		square				: "사각형",
		none				: "없음",
		notset				: "<설정 안함>",
		armenian			: "아르메니아어 번호 매기기",
		georgian			: "그루지야어 번호 매기기(an, ban, gan 등)",
		lowerRoman			: "로마자 소문자(i, ii, iii, iv, v 등)",
		upperRoman			: "로마자 대문자(I, II, III, IV, V 등)",
		lowerAlpha			: "알파벳 소문자(a, b, c, d, e 등)",
		upperAlpha			: "알파벳 대문자(A, B, C, D, E 등)",
		lowerGreek			: "그리스어 소문자(alpha, beta, gamma 등)",
		decimal				: "10진수(1, 2, 3 등)",
		decimalLeadingZero	: "0으로 시작하는 십진수(01, 02, 03 등)"
	},

	// Find And Replace Dialog
	findAndReplace :
	{
		title				: "찾기 및 바꾸기",
		find				: "찾기",
		replace				: "바꾸기",
		findWhat			: "찾기:",
		replaceWith			: "다음으로 바꾸기",
		notFoundMsg			: "지정된 텍스트를 찾을 수 없습니다.",
		findOptions			: "찾기 옵션",
		matchCase			: "대소문자 일치",
		matchWord			: "전체 단어 일치",
		matchCyclic			: "순환 일치",
		replaceAll			: "모두 바꾸기",
		replaceSuccessMsg	: "바꾸기가 %1번 수행되었습니다."
	},

	// Table Dialog
	table :
	{
		toolbar		: "테이블 삽입",
		title		: "테이블",
		menu		: "테이블 특성",
		deleteTable	: "테이블 삭제",
		rows		: "행:",
		columns		: "열:",
		border		: "테두리 굵기:",
		widthPx		: "픽셀",
		widthPc		: "퍼센트",
		widthUnit	: "너비 단위:",
		cellSpace	: "셀 간격:",
		cellPad		: "셀 채우기:",
		caption		: "캡션:",
		summary		: "요약:",
		headers		: "헤더:",
		headersNone		: "없음",
		headersColumn	: "최초 열",
		headersRow		: "최초 행",
		headersBoth		: "둘 다",
		invalidRows		: "행의 수는 영(0)보다 큰 정수여야 합니다.",
		invalidCols		: "열의 수는 영(0)보다 큰 정수여야 합니다.",
		invalidBorder	: "테두리 굵기는 양수여야 합니다.",
		invalidWidth	: "테이블 너비는 양수여야 합니다.",
		invalidHeight	: "테이블 높이는 양수여야 합니다.",
		invalidCellSpacing	: "셀 간격은 양수여야 합니다.",
		invalidCellPadding	: "셀 채우기는 양수여야 합니다.",

		cell :
		{
			menu			: "셀",
			insertBefore	: "셀을 앞에 삽입",
			insertAfter		: "셀을 뒤에 삽입",
			deleteCell		: "셀 삭제",
			merge			: "셀 병합",
			mergeRight		: "오른쪽으로 병합",
			mergeDown		: "아래쪽으로 병합",
			splitHorizontal	: "수평으로 셀 분할",
			splitVertical	: "수직으로 셀 분할",
			title			: "셀 특성",
			cellType		: "셀 유형:",
			rowSpan			: "행 범위:",
			colSpan			: "열 범위:",
			wordWrap		: "자동 줄 바꾸기:",
			hAlign			: "수평 맞춤:",
			vAlign			: "수직 맞춤:",
			alignBaseline	: "기준선",
			bgColor			: "배경색:",
			borderColor		: "테두리 색상:",
			data			: "데이터",
			header			: "헤더",
			yes				: "예",
			no				: "아니오",
			invalidWidth	: "셀 너비는 양수여야 합니다.",
			invalidHeight	: "셀 높이는 양수여야 합니다.",
			invalidRowSpan	: "행 범위는 양의 정수여야 합니다.",
			invalidColSpan	: "열 범위는 양의 정수여야 합니다.",
			chooseColor 	: "추가 색상..."
		},

		row :
		{
			menu			: "행",
			insertBefore	: "행을 앞에 삽입",
			insertAfter		: "행을 뒤에 삽입",
			deleteRow		: "행 삭제"
		},

		column :
		{
			menu			: "열",
			insertBefore	: "열을 앞에 삽입",
			insertAfter		: "열을 뒤에 삽입",
			deleteColumn	: "열 삭제"
		}
	},

	// Button Dialog.
	button :
	{
		title		: "단추 특성",
		text		: "텍스트(값):",
		type		: "유형:",
		typeBtn		: "단추",
		typeSbm		: "제출",
		typeRst		: "재설정"
	},

	// Checkbox and Radio Button Dialogs.
	checkboxAndRadio :
	{
		checkboxTitle : "선택란 특성",
		radioTitle	: "단일 선택 단추 특성",
		value		: "값:",
		selected	: "선택됨"
	},

	// Form Dialog.
	form :
	{
		title		: "양식 삽입",
		menu		: "양식 특성",
		action		: "조치",
		method		: "메소드:",
		encoding	: "인코딩:"
	},

	// Select Field Dialog.
	select :
	{
		title		: "필드 특성 선택",
		selectInfo	: "정보 선택",
		opAvail		: "사용 가능한 옵션",
		value		: "값:",
		size		: "크기:",
		lines		: "행",
		chkMulti	: "다중 선택 허용",
		opText		: "텍스트:",
		opValue		: "값:",
		btnAdd		: "추가",
		btnModify	: "수정",
		btnUp		: "위로",
		btnDown		: "아래로",
		btnSetValue : "선택한 값으로 설정",
		btnDelete	: "삭제"
	},

	// Textarea Dialog.
	textarea :
	{
		title		: "텍스트 영역 특성",
		cols		: "열:",
		rows		: "행:"
	},

	// Text Field Dialog.
	textfield :
	{
		title		: "텍스트 필드 특성",
		name		: "이름:",
		value		: "값:",
		charWidth	: "문자 너비:",
		maxChars	: "최대 문자:",
		type		: "유형:",
		typeText	: "텍스트",
		typePass	: "비밀번호"
	},

	// Hidden Field Dialog.
	hidden :
	{
		title	: "숨겨진 필드 특성",
		name	: "이름:",
		value	: "값:"
	},

	// Image Dialog.
	image :
	{
		title		: "이미지",
		titleButton	: "이미지 단추 특성",
		menu		: "이미지 특성",
		infoTab	: "이미지 정보",
		btnUpload	: "이미지 업로드",
		upload	: "업로드",
		alt		: "대체 텍스트:",
		lockRatio	: "비율 잠금",
		resetSize	: "크기 재설정",
		border	: "테두리:",
		hSpace	: "수평 간격:",
		vSpace	: "수직 간격:",
		alertUrl	: "이미지 URL을 입력하십시오.",
		linkTab	: "링크",
		button2Img	: "선택한 이미지 단추를 단순 이미지로 변환하시겠습니까?",
		img2Button	: "선택한 이미지를 이미지 단추로 변환하시겠습니까?",
		urlMissing : "이미지 소스 URL이 누락되었습니다.",
		validateBorder : "테두리는 양의 정수여야 합니다.",
		validateHSpace : "수평 간격은 양의 정수여야 합니다.",
		validateVSpace : "수직 간격은 양의 정수여야 합니다."
	},

	// Flash Dialog
	flash :
	{
		properties		: "플래시 특성",
		propertiesTab	: "특성",
		title		: "플래시",
		chkPlay		: "자동 재생",
		chkLoop		: "루프",
		chkMenu		: "플래시 메뉴 사용",
		chkFull		: "전화면 허용",
 		scale		: "배율:",
		scaleAll		: "모두 표시",
		scaleNoBorder	: "테두리 없음",
		scaleFit		: "정확히 맞음",
		access			: "스크립트 액세스",
		accessAlways	: "항상",
		accessSameDomain	: "동일한 도메인",
		accessNever	: "없음",
		alignAbsBottom: "Abs 아래",
		alignAbsMiddle: "Abs 중간",
		alignBaseline	: "기준선",
		alignTextTop	: "텍스트 맨 위",
		quality		: "품질:",
		qualityBest	: "가장 높음",
		qualityHigh	: "높음",
		qualityAutoHigh	: "자동 높음",
		qualityMedium	: "중간",
		qualityAutoLow	: "자동 낮음",
		qualityLow	: "낮음",
		windowModeWindow	: "창",
		windowModeOpaque	: "불투명",
		windowModeTransparent	: "투명",
		windowMode	: "창 모드:",
		flashvars	: "변수:",
		bgcolor	: "배경색:",
		hSpace	: "수평 간격:",
		vSpace	: "수직 간격:",
		validateSrc : "URL은 비어 있을 수 없습니다.",
		validateHSpace : "수평 간격은 양의 정수여야 합니다.",
		validateVSpace : "수직 간격은 양의 정수여야 합니다."
	},

	// Speller Pages Dialog
	spellCheck :
	{
		toolbar			: "맞춤법 검사",
		title			: "맞춤법 검사",
		notAvailable	: "죄송합니다. 현재 서비스가 사용 불가능합니다.",
		errorLoading	: "애플리케이션 서비스 호스트를 로드하는 중에 오류 발생: %s.",
		notInDic		: "사전에 없음",
		changeTo		: "다음으로 변경",
		btnIgnore		: "무시",
		btnIgnoreAll	: "모두 무시",
		btnReplace		: "바꾸기",
		btnReplaceAll	: "모두 바꾸기",
		btnUndo			: "실행 취소",
		noSuggestions	: "- 제안사항 없음 -",
		progress		: "맞춤법 검사 진행 중...",
		noMispell		: "맞춤법 검사 완료: 맞춤법 오류가 없습니다.",
		noChanges		: "맞춤법 검사 완료: 바뀐 단어가 없습니다.",
		oneChange		: "맞춤법 검사 완료: 한 단어가 바뀌었습니다.",
		manyChanges		: "맞춤법 검사 완료: %1 단어가 바뀌었습니다.",
		ieSpellDownload	: "맞춤법 검사기가 설치되어 있지 않습니다. 지금 다운로드하시겠습니까?"
	},

	smiley :
	{
		toolbar	: "이모티콘 삽입",
		title	: "이모티콘",
		options : "이코티콘 옵션"
	},

	elementsPath :
	{
		eleLabel : "요소 경로",
		eleTitle : "%1 요소"
	},

	numberedlist : "번호 매기기 목록",
	bulletedlist : "글머리 기호 목록",
	indent : "들여쓰기 늘리기",
	outdent : "들여쓰기 줄이기",

	justify :
	{
		left : "왼쪽 맞춤",
		center : "가운데 맞춤",
		right : "오른쪽 맞춤",
		block : "양쪽 맞춤"
	},

	blockquote : "인용구",

	clipboard :
	{
		title		: "붙여넣기",
		cutError	: "브라우저 보안 설정에서 자동 잘라내기 기능을 금지하고 있습니다. 대신 키보드에서 Ctrl+X를 사용하십시오.",
		copyError	: "브라우저 보안 설정에서 자동 복사 기능을 금지하고 있습니다. 대신 키보드에서 Ctrl+C를 사용하십시오.",
		pasteMsg	: "아래에 붙여넣으려면 Ctrl+V(MAC인 경우 Cmd+V)를 누르십시오.",
		securityMsg	: "브라우저 보안에서 클립보드에서 직접 붙여넣는 기능을 차단하고 있습니다.",
		pasteArea	: "붙여넣기 영역"
	},

	pastefromword :
	{
		confirmCleanup	: "붙여넣기할 텍스트가 Word에서 복사된 것 같습니다. 붙여넣기 전에 정리하시겠습니까?",
		toolbar			: "선택하여 붙여넣기",
		title			: "선택하여 붙여넣기",
		error			: "내부 오류로 인해 붙여넣은 데이터를 정리하지 못했습니다."
	},

	pasteText :
	{
		button	: "일반 텍스트로 붙여넣기",
		title	: "일반 텍스트로 붙여넣기"
	},

	templates :
	{
		button 			: "템플리트",
		title : "컨텐츠 템플리트",
		options : "템플리트 옵션",
		insertOption: "실제 컨텐츠 바꾸기",
		selectPromptMsg: "편집기에서 열 템플리트 선택",
		emptyListMsg : "(정의된 템플리트가 없음)"
	},

	showBlocks : "블록 표시",

	stylesCombo :
	{
		label		: "스타일",
		panelTitle 	: "스타일",
		panelTitle1	: "블록 스타일",
		panelTitle2	: "인라인 스타일",
		panelTitle3	: "오브젝트 스타일"
	},

	format :
	{
		label		: "형식",
		panelTitle	: "단락 형식",

		tag_p		: "일반",
		tag_pre		: "형식화됨",
		tag_address	: "주소",
		tag_h1		: "표제 1",
		tag_h2		: "표제 2",
		tag_h3		: "표제 3",
		tag_h4		: "표제 4",
		tag_h5		: "표제 5",
		tag_h6		: "표제 6",
		tag_div		: "일반(DIV)"
	},

	div :
	{
		title				: "Div 컨테이너 작성",
		toolbar				: "Div 컨테이너 작성",
		cssClassInputLabel	: "스타일시트 클래스",
		styleSelectLabel	: "스타일",
		IdInputLabel		: "ID",
		languageCodeInputLabel	: " 언어 코드",
		inlineStyleInputLabel	: "인라인 스타일",
		advisoryTitleInputLabel	: "링크 설명",
		langDirLabel		: "언어 방향",
		langDirLTRLabel		: "왼쪽에서 오른쪽(LTR)",
		langDirRTLLabel		: "오른쪽에서 왼쪽(RTL)",
		edit				: "Div 편집",
		remove				: "Div 제거"
  	},

	iframe :
	{
		title		: "IFrame 특성",
		toolbar		: "IFrame 삽입",
		noUrl		: "IFrame URL을 입력하십시오.",
		scrolling	: "스크롤 막대 사용",
		border		: "프레임 테두리 표시"
	},

	font :
	{
		label		: "글꼴",
		voiceLabel	: "글꼴",
		panelTitle	: "글꼴 이름"
	},

	fontSize :
	{
		label		: "크기",
		voiceLabel	: "글꼴 크기",
		panelTitle	: "글꼴 크기"
	},

	colorButton :
	{
		textColorTitle	: "텍스트 색상",
		bgColorTitle	: "배경색",
		panelTitle		: "색상",
		auto			: "자동",
		more			: "추가 색상..."
	},

	colors :
	{
		"000" : "검은색",
		"800000" : "적갈색",
		"8B4513" : "진갈색",
		"2F4F4F" : "쥐색",
		"008080" : "청록색",
		"000080" : "짙은 파란색",
		"4B0082" : "남색",
		"696969" : "짙은 회색",
		"B22222" : "벽돌색",
		"A52A2A" : "갈색",
		"DAA520" : "황금색",
		"006400" : "진한 녹색",
		"40E0D0" : "청록색",
		"0000CD" : "중간 파란색",
		"800080" : "보라색",
		"808080" : "회색",
		"F00" : "빨간색",
		"FF8C00" : "짙은 주황색",
		"FFD700" : "금색",
		"008000" : "녹색",
		"0FF" : "청록색",
		"00F" : "파란색",
		"EE82EE" : "보라색",
		"A9A9A9" : "흐린 회색",
		"FFA07A" : "밝은 주황색",
		"FFA500" : "주황색",
		"FFFF00" : "노란색",
		"00FF00" : "라임색",
		"AFEEEE" : "창백한 청록색",
		"ADD8E6" : "밝은 파란색",
		"DDA0DD" : "진자주색",
		"D3D3D3" : "연회색",
		"FFF0F5" : "붉은 연보라색",
		"FAEBD7" : "크림색",
		"FFFFE0" : "밝은 노란색",
		"F0FFF0" : "엷은 녹색",
		"F0FFFF" : "하늘색",
		"F0F8FF" : "회색 띤 연푸른색",
		"E6E6FA" : "연보라색",
		"FFF" : "흰색"
	},

	scayt :
	{
		title			: "입력하는 동안 맞춤법 검사",
		opera_title		: "Opera에서 지원되지 않음",
		enable			: "SCAYT 사용",
		disable			: "SCAYT 사용 안함",
		about			: "SCAYT 정보",
		toggle			: "SCAYT 토글",
		options			: "옵션",
		langs			: "언어",
		moreSuggestions	: "추가 제한사항",
		ignore			: "무시",
		ignoreAll		: "모두 무시",
		addWord			: "단어 추가",
		emptyDic		: "사전 이름은 공백으로 둘 수 없습니다.",

		optionsTab		: "옵션",
		allCaps			: "모든 대문자 단어 무시",
		ignoreDomainNames : "도메인 이름 무시",
		mixedCase		: "대소문자 혼용 단어 무시",
		mixedWithDigits	: "숫자가 포함된 단어 무시",

		languagesTab	: "언어",

		dictionariesTab	: "사전",
		dic_field_name	: "사전 이름",
		dic_create		: "작성",
		dic_restore		: "복원",
		dic_delete		: "삭제",
		dic_rename		: "이름 변경",
		dic_info		: "초기에는 사용자 사전이 쿠키에 저장됩니다. 그러나 쿠키에는 크기 제한이 있습니다. 따라서 사용자 사전이 쿠키에 저장될 수 없는 크기가 되면 저희 서버에 저장될 수 있습니다. 귀하의 개인 사전을 저희 서버에 저장하려면 사전 이름을 지정해야 합니다. 이미 저장된 사전을 갖고 있는 경우, 해당 이름을 입력하고 복원 단추를 클릭하십시오.",

		aboutTab		: "정보"
	},

	about :
	{
		title		: "CKEditor 정보",
		dlgTitle	: "CKEditor 정보",
		help	: "도움말을 보려면 $1을(를) 선택하십시오.",
		userGuide : "CKEditor 사용자 안내서",
		moreInfo	: "라이센스 정보를 보려면 웹 사이트에 방문해 주십시오.",
		copy		: "Copyright &copy; $1. All rights reserved."
	},

	maximize : "최대화",
	minimize : "최소화",

	fakeobjects :
	{
		anchor	: "기준 위치",
		flash	: "플래시 애니메이션",
		iframe		: "IFrame",
		hiddenfield	: "숨겨진 필드",
		unknown	: "알 수 없는 오브젝트"
	},

	resize : "끌어서 크기 조정",

	colordialog :
	{
		title		: "색상 선택",
		options	:	"색상 옵션",
		highlight	: "확대",
		selected	: "선택한 색상",
		clear		: "지우기"
	},

	toolbarCollapse	: "도구 모음 접기",
	toolbarExpand	: "도구 모음 펼치기",

	toolbarGroups :
	{
		document : "문서",
		clipboard : "클립보드/실행 취소",
		editing : "편집 중",
		forms : "양식",
		basicstyles : "기본 스타일",
		paragraph : "단락",
		links : "링크",
		insert : "삽입",
		styles : "스타일",
		colors : "색상",
		tools : "도구"
	},

	bidi :
	{
		ltr : "왼쪽에서 오른쪽 텍스트 방향",
		rtl : "오른쪽에서 왼쪽 텍스트 방향"
	},

	docprops :
	{
		label : "문서 특성",
		title : "문서 특성",
		design : "디자인",
		meta : "메타 태그",
		chooseColor : "선택",
		other : "기타...",
		docTitle :	"페이지 제목",
		charset : 	"문자 세트 인코딩",
		charsetOther : "기타 문자 세트 인코딩",
		charsetASCII : "ASCII",
		charsetCE : "중앙 유럽 언어",
		charsetCT : "중국어 번체(Big5)",
		charsetCR : "키릴 문자",
		charsetGR : "그리스어",
		charsetJP : "일본어",
		charsetKR : "한국어",
		charsetTR : "터키어",
		charsetUN : "유니코드(UTF-8)",
		charsetWE : "서유럽 언어",
		docType : "문서 유형 표제",
		docTypeOther : "기타 문서 유형 표제",
		xhtmlDec : "XHTML 선언 포함",
		bgColor : "배경색",
		bgImage : "배경 이미지 URL",
		bgFixed : "스크롤되지 않은(고정) 배경",
		txtColor : "텍스트 색상",
		margin : "페이지 여백",
		marginTop : "맨 위",
		marginLeft : "왼쪽",
		marginRight : "오른쪽",
		marginBottom : "아래",
		metaKeywords : "문서 색인 작성 키워드(쉼표로 구분됨)",
		metaDescription : "문서 설명",
		metaAuthor : "작성자",
		metaCopyright : "저작권",
		previewHtml : "<p>일부 <strong>샘플 텍스트</strong>입니다. <a href=\"javascript:void(0)\">CKEditor</a>를 사용 중입니다.</p>"
	},

	ibm :
	{

		common :
		{
			widthIn	: "인치",
			widthCm	: "센티미터",
			widthMm	: "밀리미터",
			widthEm	: "em",
			widthEx	: "ex",
			widthPt	: "포인트",
			widthPc	: "파이카",
			required : "필수"
		},
		table :
		{
			createTable : '테이블 삽입',
			heightUnit	: "높이 단위:",
			insertMultipleRows : "행 삽입",
			insertMultipleCols : "열 삽입",
			noOfRows : "행 수:",
			noOfCols : "열 수:",
			insertPosition : "위치:",
			insertBefore : "앞",
			insertAfter : "뒤",
			selectTable : "테이블 선택",
			selectRow : "행 선택",
			columnTitle : "열 너비",
			colProps : "열 특성",
			invalidColumnWidth	: "열 너비는 양수여야 합니다.",
			fixedColWidths : "고정 열 너비"
		},
		cell :
		{
			title : "셀"
		},
		colordialog :
		{
			currentColor	: "현재 색상"
		},
		emoticon :
		{
			angel		: "천사",
			angry		: "화남",
			cool		: "추움",
			crying		: "울음",
			eyebrow		: "눈썹",
			frown		: "찡그림",
			goofy		: "바보",
			grin		: "활짝 웃음",
			half		: "반",
			idea		: "아이디어",
			laughing	: "웃음",
			laughroll	: "뒹굴며 웃기",
			no			: "아니오",
			oops		: "놀람",
			shy			: "수줍음",
			smile		: "미소",
			tongue		: "혀 내밀기",
			wink		: "윙크",
			yes			: "예"
		},

		menu :
		{
			link	: "링크 삽입",
			list	: "목록",
			paste	: "붙여넣기",
			action	: "조치",
			align	: "맞춤",
			emoticon: "이모티콘"
		},

		iframe :
		{
			title	: "IFrame"
		},

		list:
		{
			numberedTitle		: "번호 매기기 목록",
			bulletedTitle		: "글머리 기호 목록",
			description			: "설정은 현재 목록 레벨에 적용됨",
			fontsize			: "글꼴 크기:"
		},

		// Anchor dialog
		anchor :
		{
			description	: "'절 1.2'와 같이 구체적인 책갈피 이름을 입력하십시오. 책갈피를 삽입한 후, '링크' 또는 '문서 책갈피 링크' 아이콘을 클릭하여 링크하십시오.",
			title		: "문서 책갈피 링크",
			linkTo		: "링크 대상:"
		},

		urllink :
		{
			title : "URL 링크",
			linkText : "링크 텍스트:",
			selectAnchor: "기준 위치 선택:",
			nourl: "텍스트 필드에 URL을 입력하십시오.",
			urlhelp: "사용자가 이 링크를 클릭할 때 열리도록 하려면 URL을 입력하거나 붙여넣으십시오. (예: http://www.example.com)",
			displaytxthelp: "링크에 표시할 텍스트를 입력하십시오.",
			openinnew : "새 창에서 링크 열기"
		},

		spellchecker :
		{
			title : "맞춤법 확인",
			replace : "바꾸기",
			suggesstion : "제안:",
			withLabel : "바꿀 내용:",
			replaceButton : "바꾸기",
			replaceallButton:"모두 바꾸기",
			skipButton:"건너뛰기",
			skipallButton: "모두 건너뛰기",
			undochanges: "변경사항 실행 취소",
			complete: "맞춤법 검사 완료",
			problem: "XML 데이터 검색 중에 문제점 발생",
			addDictionary: "사전에 추가",
			editDictionary: "사전 편집"
		},

		status :
		{
			keystrokeForHelp: "도움말: ALT+0 "
		},

		linkdialog :
		{
			label : "링크 대화 상자"
		},

		imagedatauri :
		{
			error : "이미지 붙여넣기는 현재 지원되지 않습니다. 대신 \'이미지 삽입\' 도구 모음 옵션을 사용하십시오."
		},

		image :
		{
			previewText : "텍스트는 예제에서와 같이 사용자가 추가하는 이미지 주변에 표시됩니다.",
			fileUpload : "컴퓨터에서 이미지 파일 선택:"
		}
	}

};