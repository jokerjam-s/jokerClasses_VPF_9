*---string
#Define ShabNoFound 'Не найден шаблон отчета'
#Define DbfNoOpen 'В текущей рабочей области нет открытых таблиц'
#Define ShabOpenErr 'Ошибка открытия шаблона отчета'
#Define PgHeadNoFound 'Не найден заголовок страницы'
#Define DetalNoFound 'Не найдена полоса detal'
#Define TooManyColumns 'Количество колонок больше 255'
#Define EndColMarkerNoFound 'Не обнаружен маркер последней колонки :'+chr(13)+'слово [End] в полосе [detal] в колонке ,следующей за последней'
#Define EndReportNoFound 'Не найдена граница отчета '
#Define ColumnsNoFound 'В шаблоне не обнаружено колонок'
#Define ReportOpen 'Открытие отчета ...'
#Define DataFormat 'Форматирование данных отчета ...'
#Define PgHeadCreate 'Создание шапки и заголовка страницы отчета...'
#Define CopyPageSetup 'Копирование настроек параметров страницы с шаблона ...'
#Define PageSetupSet 'Настройка параметров страницы ...'
#Define ReadShablon 'Анализ шаблона отчета ...'
#Define CreateGroup 'Создание групп отчета ...'
#Define erNoFindExel 'Необходимо установить Excel!!!'
#Define erCursCreatError 'Ошибка создания промежуточного курсора !!!'
#Define erBadRowCount 'Количество строк превышает 64000 !!!'
#Define erPictureInsert 'Вставка рисунков'
#Define erDisableVBE 'Для правильного отображения отчета '+Chr(13)+'необходимо отметить галку :'+Chr(13)+'Сервис->Параметры->Безопастность->'+Chr(13)+'Безопастность Макросов->Надежные Источники->'+Chr(13)+'Доверять доступ к Visual Basic Projects'


*---excel
#Define xlValues -4163
#Define xlEdgeLeft 7
#Define xlEdgeRight 10
#Define xlAll -4104
#Define xlWorkbookNormal -4143
#Define xlFormulas -4123
#Define xlPasteFormat  -4122
#Define xlShiftToRight -4161
#Define xlMinimized -4140
#Define xlMaximized -4137
#Define xlNormal -4143
#Define xlToLeft -4159
#Define xlDown -4121
#Define xlEdgeTop 8
#Define xlEdgeBottom 9
#Define xlNone -4142
#Define xlInsideVertical 11
#Define xlInsideHorizontal 12
#Define xlPasteComments -4144
#Define xlCellTypeLastCell 11
#Define xlExcel9795	43	
#Define xlByColumns 2
#Define xlByRows 1
#Define xlWhole 1
#Define xlPart 2
#Define xlHtml 44 




#Define mYes 'Да'
#Define mNo 'Нет'
#Define mInfo 'Генератор отчетов <e_report>'



*----группы----
*--------------
#Define iG_Expr 1
#Define iG_Field 2
#Define iG_Height 3
#Define iG_Color 4
#Define iG_FontSize 5
#Define iG_OldField 6
#Define iG_Head_Row 7
#Define iG_OldExpr 8
#Define iG_Row 12
*---font
#Define iG_FontName 10
#Define iG_FontStyle 11
#Define iG_FontColor 13
*---подитоги
#Define iG_SubtRange 14
#Define iG_SubtSubset 15 
*---заголовок
#Define iG_HeaderRange 16
#Define iG_HeaderSubset 17 
*---подвал
#Define iG_FooterRange 18
#Define iG_FooterSubset 39 

#Define iG_Counter 19

*---group 
#Define iG_position 20
#Define iG_ClearFields 36
#Define iG_More_then_one 37
#Define iG_ClearType 38
#Define iG_Subtotal 21
#Define iG_TopText 23
#Define iG_BotText 24
#Define iG_NewPage 40
#Define iG_StartColM 41
#Define iG_AutoFit   42
*---footer
#Define iG_FootRow 22
#Define iG_FootText 25
#Define iG_FootPrtWhen 26
#Define iG_FootMrgCell 27
#Define iG_FootAutoFit 43
*---title
#Define iG_TitRow 30
#Define iG_TitText 31
#Define iG_TitPrtWhen 34
#Define iG_TitMrgCell 35
#Define iG_TitAutoFit 44
#Define iG_RemoveBlank 45



*--------колонки
*---------------
#Define iC_Name 1
#Define iC_Text 2
#Define iC_Width 3
#Define iC_Orient 4
#Define iC_Summed 5
#Define iC_Formula 6
#Define iC_IsFormula 7
#Define iC_Format 8
#Define iC_Color 9
#Define iC_Hidden 9
#Define iC_NoFit 10
#Define iC_Wrap 11
#Define iC_HorizontalAlignment 12
#Define iC_VerticalAlignment 13
#Define iC_Orientation 14
#Define iC_IndentLevel 15
#Define iC_FontDouble 16
#Define iC_Fontsize 17
#Define iC_Fontname 18
#Define iC_ShablonCol 19
#Define iC_GroupFormula 20
#Define iC_CalcFunct 21
#Define iC_ItText 22
#Define iC_Picture 23
#Define iC_PictComment 24
#Define iC_PictSource  25
#Define iC_AutoFit  26
*--
#Define iC_Dimension   26


*--------Графики
*---------------
#Define iD_Type 1
#Define iD_DataIn 2
#Define iD_ChartName 3
#Define iD_Legend 4
#Define iD_NoSumm 5
#Define iD_ColumXname 6
#Define iD_ColumnValues 7
#Define iD_ColumnCount 8

*--------Строки
*---------------
#Define iV_Row 1
#Define iV_Col 2
#Define iV_Value 3
#Define iV_NoFit 4
#Define iV_Wrap 5
#Define iV_FontDouble 6
#Define iV_Fontsize 7
#Define iV_Fontname 8

*--------Рисунки
*---------------
#Define iP_Row 1
#Define iP_Col 2
#Define iP_File 3
#Define iP_LockAspectRatio 4
#Define iP_Height 5
#Define iP_Width 6

*-----vb Модули
#Define iVB_FileName 1
#Define iVB_Component 2
