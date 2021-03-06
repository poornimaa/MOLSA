﻿/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license


Portions Copyright IBM Corp., 2010-2013.
*/

CKEDITOR.plugins.setLang( "a11yhelp", "ar",
{

	// When translating all fields in accessibilityHelp object, do not translate anything with the form ${xxx}
	accessibilityHelp :
	{
		title : "‏مساعدة‏",
		contents : "محتويات المساعدة.  لاغلاق هذا الحوار، اضغط ESC.",
		legend :
		[
			{
				name : "تعليمات امكانية التوصل",
				items :
				[
					{
						name : "خط أدوات برنامج التحرير",
						legend:
							"اضغط على ${toolbarFocus} للانتقال الى خط الأدوات. " +
							"الانتقال الى مجموعة خط الأدوات التالية والسابقة من خلال TAB و SHIFT-TAB. " +
							"الانتقال الى مفاتيح خط الأدوات التالية والسابقة باستخدام مفاتيح سهم يمين أو سهم يسار. " +
							"اضغط SPACE أو ENTER لتفعيل مفاتيح خط الأدوات."
					},

					{
						name : "حوار برنامج التحرير",
						legend :
							"داخل الحوار، اضغط TAB للانتقال الى مجال الحوار التالي، اضغط SHIFT + TAB للانتقال الى المجال السابق، اضغط ENTER لاحالة حوار، اضغط  ESC لالغاء حوار. " +
							"بالنسبة الى مربعات الحوار التي لها صفحات متعددة، اضغط ALT + F10 للانتقال الى كشف علامات التبويب. " +
							"ثم انتقل الى علامة التبويب التالية باستخدام مفتاح TAB أو سهم يمين. " +
							"انتقل الى علامة التبويب السابقة باستخدام SHIFT + TAB أو سهم يسار. " +
							"اضغط SPACE أو ENTER لتحديد صفحة علامة التبويب."
					},

					{
						name : "القائمة السياقية لبرنامج التحرير",
						legend :
							"اضغط ${contextMenu} أو APPLICATION KEY لفتح القائمة السياقية. " +
							"ثم انتقل الى اختيار القائمة التالي باستخدام مفتاح TAB أو سهم لأسفل. " +
							"انتقل الى الاختيار السابق باستخدام المفاتيح SHIFT+TAB أو سهم لأعلى. " +
							"اضغط SPACE أو ENTER لتحديد اختيار القائمة. " +
							"قم بفتح القائمة الفرعية للاختيار الحالي باستخدام مفتاح SPACE أو ENTER أو سهم يمين. " +
							"ارجع الى بند القائمة الرئيسي باستخدام ESC أو سهم يسار. " +
							"اغلاق القائمة السياقية باستخدام مفتاح ESC."
					},

					{
						name : "مربع اختيار برنامج التحرير",
						legend :
							"داخل مربع الكشف، انتقل الى بند الكشف التالي باستخدام TAB أو السهم الأسفل. " +
							"انتقل الى بند الكشف السابق باستخدام SHIFT + TAB أو السهم لأعلى. " +
							"اضغط SPACE أو ENTER لتحديد اختيار الكشف. " +
							"اضغط ESC لاغلاق مربع الكشف."
					},

					{
						name : "خط مسار عنصر برنامج التحرير (اذا كان متاحا*)",
						legend :
							"اضغط ${elementsPathFocus} للانتقال الى خط مسار العناصر. " +
							"انتقل الى مفتاح العنصر التالي باستخدام مفتاح TAB أو RIGHT ARROW. " +
							"انتقل الى الاختيار السابق باستخدام المفاتيح SHIFT+TAB أو سهم يسار. " +
							"اضغط SPACE أو ENTER لتحديد العنصر في برنامج التحرير."
					}
				]
			},
			{
				name : "الأوامر",
				items :
				[
					{
						name : " الأمر تراجع",
						legend : "اضغط ${undo}"
					},
					{
						name : " الأمر اعادة تنفيذ",
						legend : "اضغط ${redo}"
					},
					{
						name : " الأمر عريض",
						legend : "اضغط ${bold}"
					},
					{
						name : " الأمر مائل",
						legend : "اضغط ${italic}"
					},
					{
						name : " الأمر تحته سطر",
						legend : "اضغط ${underline}"
					},
					{
						name : " الأمر وصلة",
						legend : "اضغط ${link}"
					},
					{
						name : " أمر طي خط الأدوات (اذا كان متاحا*)",
						legend : "اضغط ${toolbarCollapse}"
					},
					{
						name : " مساعدة عن امكانية التوصل",
						legend : "اضغط ${a11yHelp}"
					}
				]
			},

			{	//added by ibm
				name : "ملحوظة",
				items :
				[
					{
						name : "",
						legend : "* يمكن أن يتم الغاء اتاحة بعض الخصائص من خلال المسؤول عن النظام."
					}
				]
			}
		]
	},

	ibm_a11yhelp :
	{
		helpLinkDescription : "فتح المزيد من موضوعات المساعدة في نافذة جديدة",
		helpLink : "المزيد من موضوعات المساعدة"
	}
});
