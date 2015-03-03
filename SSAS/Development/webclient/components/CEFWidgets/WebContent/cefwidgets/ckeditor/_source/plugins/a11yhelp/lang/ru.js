﻿/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license


Portions Copyright IBM Corp., 2010-2013.
*/

CKEDITOR.plugins.setLang( "a11yhelp", "ru",
{

	// When translating all fields in accessibilityHelp object, do not translate anything with the form ${xxx}
	accessibilityHelp :
	{
		title : "Справка",
		contents : "Оглавление справки. Нажмите ESC, чтобы закрыть это окно.",
		legend :
		[
			{
				name : "Инструкции по работе со специальными возможностями",
				items :
				[
					{
						name : "Панель инструментов редактора",
						legend:
							"Нажмите ${toolbarFocus} для перехода в панель инструментов. " +
							"Для перехода к следующей и предыдущей группе панели инструментов нажмите TAB и SHIFT-TAB. " +
							"Для перехода к следующей и предыдущей кнопке панели инструментов нажмите стрелку Вправо и стрелку Влево. " +
							"Нажмите SPACE или ENTER для активации кнопки панели инструментов."
					},

					{
						name : "Окно редактора",
						legend :
							"В открытом окне нажмите TAB для перехода к следующему полю, SHIFT + TAB для перехода к предыдущему полю, ENTER для отправки данных или ESC для закрытия окна. " +
							"Если окно содержит несколько страниц, нажмите ALT + F10 для перехода к списку вкладок. " +
							"Затем для перехода к следующей вкладке нажмите TAB или стрелку Вправо. " +
							"Для перехода к предыдущей вкладке нажмите SHIFT + TAB или стрелку Влево. " +
							"Нажмите SPACE или ENTER для выбора страницы вкладки."
					},

					{
						name : "Контекстное меню редактора",
						legend :
							"Нажмите ${contextMenu} или APPLICATION KEY для открытия контекстного меню. " +
							"Затем перейдите к следующей опции меню с помощью TAB или стрелки Вниз. " +
							"Перейдите к предыдущей опции с помощью SHIFT+TAB или стрелки Вправо. " +
							"Нажмите SPACE или ENTER для выбора опции меню. " +
							"Для того чтобы открыть вложенное меню выбранного пункта основного меню нажмите Пробел, ENTER или стрелку Вправо. " +
							"Для того чтобы вернуться к пункту основного меню, нажмите ESC или стрелку Влево. " +
							"Нажмите ESC, чтобы закрыть контекстное меню."
					},

					{
						name : "Список в редакторе",
						legend :
							"Для перехода к следующему элементу внутри списка нажмите TAB или клавишу Вниз " +
							"Для перехода к предыдущему элементу списка нажмите SHIFT + TAB или клавишу Вверх. " +
							"Для выбора пункта списка нажмите Пробел или ENTER. " +
							"Для того чтобы закрыть список, нажмите ESC."
					},

					{
						name : "Строка пути элементов редактора (если доступна*)",
						legend :
							"Нажмите ${elementsPathFocus} для перехода в панель пути элементов. " +
							"Для перехода к кнопке следующего элемента нажмите TAB или стрелку Вправо. " +
							"Перейдите к предыдущей кнопке с помощью SHIFT+TAB или стрелки Влево. " +
							"Нажмите SPACE или ENTER для выбора элемента в редакторе."
					}
				]
			},
			{
				name : "Команды",
				items :
				[
					{
						name : " Команда Отменить",
						legend : "Нажмите ${undo}"
					},
					{
						name : " Команда Повторить",
						legend : "Нажмите ${redo}"
					},
					{
						name : " Команда Полужирный",
						legend : "Нажмите ${bold}"
					},
					{
						name : " Команда Курсив",
						legend : "Нажмите ${italic}"
					},
					{
						name : " Команда Подчеркнутый",
						legend : "Нажмите ${underline}"
					},
					{
						name : " Команда Ссылка",
						legend : "Нажмите ${link}"
					},
					{
						name : " Команда Свернуть панель инструментов (если доступна*)",
						legend : "Нажмите ${toolbarCollapse}"
					},
					{
						name : " Справка по специальным возможностям",
						legend : "Нажмите ${a11yHelp}"
					}
				]
			},

			{	//added by ibm
				name : "Примечание",
				items :
				[
					{
						name : "",
						legend : "* Некоторые функции могут быть выключены администратором."
					}
				]
			}
		]
	},

	ibm_a11yhelp :
	{
		helpLinkDescription : "Открыть дополнительные разделы справки в новом окне",
		helpLink : "Дополнительные разделы справки"
	}

});