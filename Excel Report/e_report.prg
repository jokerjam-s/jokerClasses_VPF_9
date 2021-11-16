**************************************************
*-- Генератор отчетов  v2.75 , (c) Банщиков Е.В. ,Курган ,2002 г.
**************************************************
*
#INCLUDE "e_report.h"
*
Define Class e_report As Custom

 *-- Имя листа
 sheet_name = "Отчет"
 *-- Ориентация листа ( 1 портрет, 2 ландшафт)
 page_orient = 1
 *-- Высота заголовка отчета
 title_height = 1
 *-- Число строк в отчете
 row_count = 0
 *-- Число колонок в отчете
 column_count = 0
 *-- Высота заголовка страницы
 pgtitle_height = 50
 *-- Список полей (для шаблона)
 field_list = ""
 *-- Строка для запроса
 sql_string = ""
 *-- Колисество строк в заголовке страницы
 phrowcount = 1
 *-- Последняя строка отчета
 endrow = .F.
 *-- Смещение строки итогов
 sum_ref = 1
 *-- Смещение строки формул
 formula_ref = 2
 *-- Имя файла xls
 file_name = .F.
 *-- Имя таблицы
 dbf_name = .F.
 *-- ссылка на объект exel
 xl_app = .F.
 *-- Формировать итоги
 lsummed = .F.
 *-- Имя файла отчета
 xlfile = .F.
 *-- Имя шаблона
 shablon = .F.
 *-- Наличие картинок в шаблоне
 copy_picture = .F.
 *-- Строка начала подвала
 footerrow = .F.
 *-- Строка окончания заголовка
 titlerow = .F.
 *-- Граница фиксирования
 splitcolumn = .F.
 *-- Настройки страницы из шаблона
 forcepsshablon = .F.
 *-- Высота строк detal
 row_height = .F.
 *-- Формировать диаграмму
 make_chart = .F.
 *-- Считать данны title,footer ,detal с шаблона
 forceshablondata = .F.
 *-- Строка detal
 detalrow = .F.

 *-- Последняя колонка в шаблоне отчета
 shablonlastcol = .F.
 *-- Перекрестный отчет
 is_xtab = .F.
 *-- Количесво колонок в шаблоне
 scolumnscount = .F.
 *-- Автоформатирование текста
 AutoFit = .F.
 *-- Не показывать окно Excel
 exnovisible = .F.
 col_autofit = .F.
 *-- Счетчик колонок
 ccounter = .F.
 *-- Имя колонки для сортировки строк
 columnsort = .F.
 *-- Вид сортировки =  (1,2)
 typesort = .F.
 *-- Имя функции обработчика событий Excel
 onevent = .F.
 autooutline = .F.
 *-- Не группировать колонки
 noolcolumn = .F.
 *-- первая x колонка
 x_begin = .F.
 *-- Число x -колонок
 x_count = .F.
 x_step = .F.
 *-- codepage
 cp = 866
 *-- разделить на столбцы
 multicolumn = .F.
 *-- количество столбцов
 multicount = .F.
 *-- разделитель
 multidelim = .F.
 auto_filter = .F.
 *-- начальная колонка филтра
 autof_begin = .F.
 *-- конечная колонка фильтра
 autof_end = .F.
 *-- Авто исполняемый макрос
 _autorun = .F.
 *-- Отладка
 _debug = .t.
 *-- Вывести итоги с новой страницы
 totalnewpage = .F.
 *-- файл,в которov будет создан отчет
 destination = .F.
 *-- не показывать отчет
 noshowreport = .F.
 *-- полный путь к файлу
 FullName = .F.
 *-- смещение строки для фильтров
 autof_offset = 0
 *-- Запретить скрытие столбцов
 nohide = .F.
 xlname = .F.
 *-- признак защиты
 Protected = .F.
 *-- пароль защиты
 rpassword = .F.
 *-- Правка в ячейке
 editdirectlyincell = .T.
 *-- не выполнять настройку параметров печати
 nopagesetup = .F.
 *-- Уровень отображения строк для Outline
 ol_row_levels = 0
 *-- Уровень отображения Колонок для OutLine
 ol_column_levels = 0
 *-- Список обработанных графиков
 processed_chart = ""
 *-- Передача данных в excel через массив, иначе через таблицу
 use_array = .F.
 *-- запрет использования функции промежуточные.итоги в excel
 no_subtotal = .F.
 *-- Шаблон для програмных отчетов
 Pattern = .F.
 *-- преобразовывать даты в числа
 convert_array_data = .F.
 *-- Маштаб окна отчета
 Scale = 0
 *-- ссылка на текущий обрабатываемый объект OLE
 temp_reference = .F.
 *-- код ошибки
 error_code = 0
 *-- описание ошибки
 error_description = ""
 *-- метод ,в котором возникла ошибка
 error_method = ""
 *-- Фдаг завершения отчета
 success = .F.
 *-- Имя класса генератора перекрестных таблиц
 xtab_class = "Er_Xtab"
 *-- Флаг создания композитного отчета на 1 листе, иначе на разных листах
 composit_on_one_sheet = .F.
 *-- XML Metadata for customizable properties
 no_delete = .F.
 rightheader = ""
 *-- Работаем с неактивированной копией Оффиса 2007
 isexceldemo = .F.

 *-- масссив своиств колонок отчета
 Dimension column_list[1,1]

 *-- массив групп отчета
 Dimension group_list[1,1]

 *-- Список произвольных строк
 Dimension value_list[1,1]

 *-- Список картинок
 Dimension picture_list[1,1]

 *-- Диаграммы
 Dimension chart_list[1,1]

 *-- Список добавленных строк
 Dimension rowlist[1]
 Dimension module_list[1]


 *-- проверка на повторное открытие файла
 Hidden Procedure is_open
  Lparameters  m.cSheetName
  Local m_OldErrorHandler
  Private  m.oExApp
  m_OldErrorHandler=On('error')
  On Error *
  If Inlist(_vfp.StartMode,0,4)
   =Getobject(,"Excel.application")
  Endif
  On Error &m_OldErrorHandler
  If Type('m.oExApp')!='O'
   Return  .F.
  Else
   On Error *
   If Upper(Alltrim(Substr(m.oExApp.Caption,At('-',m.oExApp.Caption)+1)))=Strtran(Upper(m.cSheetName),'.XLS','')
    With m.oExApp
     .ActiveWorkbook.Saved = .T.
     .Application.Quit()
    Endwith
    Return  .F.
   Else
    *
    Return  .F.
   Endif
   On Error &m_OldErrorHandler
  Endif
  Endproc


  *-- Выбрать строку
 Procedure select_row
 Lparameters  m.nRow,m.nCol,m.oObject
 Local  m.cRange,m.cCol
 If Empty(m.nCol)
  m.cCol='A'
 Else
  m.cCol=This.NumToExcel(m.nCol)
 Endif
 m.cRange=m.cCol+Transform(m.nRow)
 If Type('m.oObject')!='O'
  m.oObject=This.xl_app
 Endif
 m.oObject.WorkSheets(1).Range(m.cRange).Select()
 Return  ''
 Endproc


 *-- Показать отчет
 Procedure show_report
 Local m_OldErrorHandler
 m_OldErrorHandler=On('error')
 This.xl_app.Workbooks(1).Activate()
 *---Прогон страницы в итогах
 If Vartype(This.totalnewpage)='N'
  With This.xl_app.WorkSheets(1)
   .HPageBreaks.Add(.Rows(This.row_count-This.totalnewpage))
  Endwith
 Endif
 *---перехват событий excel
 #If Val(Substr(Version(),15,2))>=7
  If !Empty(This.onevent)
   =This.AddObject('XlEvHandler',"ExcelEvents")
   =Eventhandler(This.xl_app,This.XlEvHandler)
  Endif
 #Endif
 *---расчет формул
 With This.xl_app
  If Vartype('.ErrorCheckingOptions')!='U'
   .ErrorCheckingOptions.InconsistentFormula = .F.
  Endif
  With .WorkSheets(1)
   If .EnableCalculation =.F.
    .EnableCalculation = .T.
   Endif
  Endwith
  *---масштаб
  If This.Scale>0
   .ActiveWindow.Zoom=This.Scale
  Endif
 Endwith
 *---
 If Empty(This.destination) And !This.noshowreport
  With This.xl_app
   With  .WorkSheets(1)
    .Activate()
   Endwith
   This._show_top()
   With .Application
    *!*	   .WindowState = -4140
    *!*	   .Visible = .T.
    *!*	   .WindowState = xlMaximized
    On Error *
    If !Empty(This.onevent) Or This.editdirectlyincell=.F.
     .editdirectlyincell = .F.
    Else
     .editdirectlyincell = .T.
    Endif
    On Error &m_OldErrorHandler
   Endwith
   .ScreenUpdating =.T.
   .Interactive = .T.
   .DisplayAlerts = .T.
   On Error *
   This._show_top(,.T.)
   *!*	  With .Application
   *!*	   .WindowState = xlMaximized
   *!*	   .Visible = .T.
   *!*	  Endwith
   *---
   On Error &m_OldErrorHandler
   This.success=.T.
  Endwith
 Endif
 *---struct
 On Error *
 If This.autooutline
  With This.xl_app.WorkSheets(1)
   .Activate()
   .Range(This.k(1,This.phrowcount+This.title_height+1)+':'+This.k(This.column_count,This.row_count)).autooutline()
   If This.noolcolumn
    With .Range(This.k(1,1)+':'+This.k(This.column_count,1)).Columns
     On Error *
     .Ungroup()
     On Error &m_OldErrorHandler
    Endwith
   Endif
   If This.ol_row_levels+This.ol_column_levels>0
    .Outline.ShowLevels(This.ol_row_levels,This.ol_column_levels)
   Endif
  Endwith
 Endif
 On Error &m_OldErrorHandler
 *---защита
 If This.Protected
  This._protect()
 Endif
 *---
 If Type('This.Xl_App.Workbooks(1)')='O'
  *---копируем в другой файл
  If !Empty(This.destination )
   This.CopyTo()
  Endif
  *---закрыть приложение ?
  If  This.noshowreport Or !Empty(This.destination )
   With This.xl_app
    If This.noshowreport And Empty(This.destination )
     With  .Workbooks(1)
      .SaveAs(This.xlfile,Iif(Lower(Justext(This.xlfile))='html',xlHtml,xlNormal))
      This.FullName=.FullName
     Endwith
    Endif
    .Workbooks(1).Saved=.T.
    .Application.Quit()
   Endwith
   This.success=.T.
  Else
   This.xl_app.Workbooks(1).Saved=.T.
  Endif
 Else
  *---ошибка
  If Type('This.Xl_App.Application')='O'
   With This.xl_app
    .Application.Quit()
   Endwith
  Endif
 Endif
 *---
 Wait Clear
 Return  ''
 Endproc


 *-- Добавить колонку
 Procedure add_column
 Lparameters  m.cName,m.cText,m.nWidth,m.nOrient,m.lsummed,m.cFormula,m.cFormat,m.nColor,m.lNoFit,m.lWrap,m.nHorizontalAlignment,m.nVerticalAlignment,m.nOrientation,m.nIndentLevel,m.lFontDouble,m.nFontsize,m.cFontname,m.nShablonCol,m.lGroupFormula,m.cCalcFunct,m.cItText,m.lPictureFlag,m.lPictInComment
 *!*	1-алиас колонки
 *!*	2-Наименоание колонки
 *!*	3-ширина
 *!*	4-ориентация (0-90)
 *!*	5-суммироание (лог)
 *!*	6-формула
 *!*	7-формат ячеек
 *!*	8-Цвет фона ячеек
 *!*	9-NoFit
 *!*	10-m.lWrap
 *!*	11-выравнивание по горизонтали
 *!*	12-выравнивание по вертикали
 *!*	13-ориентация
 *!*	14-отступ
 *!*	15-жирный фонт
 *!*	16-Размер фонта
 *!*	17-имя фонта
 *!*	18-номер колонки  в шаблоне
 *!*	19-использовать формулы для групп

 If Vartype(m.nOrient)!='N'
  m.nOrient=0
 Endif
 This.column_count=This.column_count+1
 Dimension This.column_list(This.column_count,iC_Dimension)
 *--
 If Empty(m.cName)
  m.cName='_'+Transform(This.column_count)+'_field'
 Endif
 *--
 If Vartype(m.nShablonCol)!='N'
  m.nShablonCol=This.column_count
 Endif

 *---Поле таблицы ?
 If '*'$m.cName
  m.cName=Strtran(m.cName,'*','')
  This.sql_string=This.sql_string+m.cName+','
 Else
  If Vartype(m.cFormula)='C' And Left(m.cFormula,1)='&'
   *---вычисляемое выражение фокса ,
   This.sql_string=This.sql_string+Strtran(m.cFormula,'&','') +" as "+m.cName+","
   m.cFormula=.F.
  Else
   This.sql_string=This.sql_string+"0 as "+m.cName+","
   *---служебн элемент
   This.column_list[this.Column_count,iC_IsFormula]=.T.
  Endif
 Endif
 *---
 This.field_list=This.field_list+m.cName+','
 *---
 This.column_list[this.Column_count,iC_Name]=m.cName
 This.column_list[this.Column_count,iC_Text]=m.cText
 This.column_list[this.Column_count,iC_Width]=m.nWidth
 This.column_list[this.Column_count,iC_Orient]=m.nOrient
 *---
 This.column_list[this.Column_count,iC_Summed]=m.lsummed
 This.lsummed=Max(This.lsummed,m.lsummed)
 *---
 This.column_list[this.Column_count,iC_Formula]=m.cFormula
 *---формат
 This.column_list[this.Column_count,iC_Format]=m.cFormat
 *---цвет фона
 This.column_list[this.Column_count,iC_Color]=m.nColor
 *---
 This.column_list[this.Column_count,iC_NoFit]=m.lNoFit
 This.column_list[this.Column_count,iC_Wrap]=m.lWrap
 *---
 This.column_list[this.Column_count,iC_HorizontalAlignment]=m.nHorizontalAlignment
 This.column_list[this.Column_count,iC_VerticalAlignment]=m.nVerticalAlignment
 This.column_list[this.Column_count,iC_Orientation]=m.nOrientation
 This.column_list[this.Column_count,iC_IndentLevel]=m.nIndentLevel
 *---
 This.column_list[this.Column_count,iC_FontDouble]=m.lFontDouble
 This.column_list[this.Column_count,iC_Fontsize]=m.nFontsize
 This.column_list[this.Column_count,iC_Fontname]=m.cFontname
 *---
 This.column_list[this.Column_count,iC_ShablonCol]=m.nShablonCol
 This.column_list[this.Column_count,iC_GroupFormula]=m.lGroupFormula
 *---функция для расчета итогов
 This.column_list[this.Column_count,iC_CalcFunct]=m.cCalcFunct
 This.column_list[this.Column_count,iC_ItText]=m.cItText
 *---Флаг вставки рисунка в  ячейку
 This.column_list[this.Column_count,iC_Picture]=m.lPictureFlag
 *---Флаг вставки рисунка в  комментарий
 This.column_list[this.Column_count,iC_PictComment]=m.lPictInComment

 *---алиас колонки
 Return  This.column_list[this.Column_count,iC_Name]
 Endproc


 *-- Создать отчет
 Procedure make_report
 Lparameters  m.lNoShowRep
 Local m_SqlList,m_Fldlist,m.nIndex,m.nIndex1,m.cFileName,m_OldErrorHandle,m_CopyType,m.lOk,m.lConvertData,m.dBeginDate,m.cDataArrayType
 Private m.cGroupCellList,m.cSubtCellList,m.nGr_text_col,m.aTmpArray,m.cColumCount,m.lIsGroup,m.lERNoEmpty
 With This
  If Reccount(.dbf_name)<64000
   *---адреса строк групп отчета
   m.cGroupCellList=''
   m.cSubtCellList=''
   *---номер колонки для текста группы
   m.nGr_text_col=1
   *---адрес последнего столбца
   m.cColumCount= .NumToExcel(.column_count)
   *---список добавленных строк
   Dimension .rowlist(1)
   .rowlist(1)=0
   *---массив для анализа формул
   Dimension aTmpArray(Alen(.column_list,1),2)
   For m.nIndex=1 To Alen(.column_list,1)
    m.aTmpArray[m.nIndex,1]=Padl(.column_list[m.nIndex,iC_Name],20,' ')
    m.aTmpArray[m.nIndex,2]=m.nIndex
   Endfor
   =Asort(aTmpArray,1,-1,1)
   For m.nIndex=1 To Alen(aTmpArray,1)
    m.aTmpArray[m.nIndex,1]=Allt(m.aTmpArray[m.nIndex,1])
   Endfor
   *---
   m_SqlList=Left(.sql_string,Len(.sql_string)-1)
   m_Fldlist=Left(.field_list,Len(.field_list)-1)
   *---создать файл отчета
   m.lOk=.F.
   *---массив или таблица
   If This.use_array
    Dimension m.aData_Array(1)
    Select &m_SqlList From (.dbf_name) Into Array aData_Array
    m.lOk=Alen(aData_Array,0)>1
    *---Убрать концевые пробелы,знаки =, пустые даты
    If m.lOk
     *---конвертировать дату в число
     m.lConvertData=This.convert_array_data
     m.dBeginDate =Date(1899,12,30)
     *---
     For m.nIndex =1 To Alen(aData_Array,2)
      m.cDataArrayType=Vartype(m.aData_Array[1,m.nIndex])
      Do Case
       Case  m.cDataArrayType='C'
        *---концевые пробелы и =
        For m.nIndex2 =1 To Alen(aData_Array,1)
         m.aData_Array[m.nIndex2,m.nIndex]="'"+Chrtran(Alltrim(Left(m.aData_Array[m.nIndex2,m.nIndex],900)),Chr(13) + Chr(10), Chr(10))
         *---=
         *If Left(m.aData_Array[m.nIndex2,m.nIndex],1)='='
         * m.aData_Array[m.nIndex2,m.nIndex]='_'+m.aData_Array[m.nIndex2,m.nIndex]
         *Endif
         *---chr(13)
         *m.aData_Array[m.nIndex2,m.nIndex]=Chrtran(m.aData_Array[m.nIndex2,m.nIndex],Chr(13)+Chr(10),'')
        Endfor
       Case  m.cDataArrayType='Y'
        *---в число
        For m.nIndex2 =1 To Alen(aData_Array,1)
         m.aData_Array[m.nIndex2,m.nIndex]=Mton(m.aData_Array[m.nIndex2,m.nIndex])
        Endfor

        *---Пустые даты
       Case  Inlist(m.cDataArrayType,'D','T')
        For m.nIndex2 =1 To Alen(aData_Array,1)
         If Empty(m.aData_Array[m.nIndex2,m.nIndex])
          m.aData_Array[m.nIndex2,m.nIndex]=Null
         Else
          If m.lConvertData
           If m.cDataArrayType='D'
            m.aData_Array[m.nIndex2,m.nIndex]=m.aData_Array[m.nIndex2,m.nIndex]-m.dBeginDate
           Endif
          Endif
         Endif
        Endfor
      Endcase
     Endfor
    Endif
   Else
    Select &m_SqlList From (.dbf_name) Into Curs TmpRepor
    *---
    If Used('TmpRepor')
     m.lOk=.T.
     .row_count=Max(Reccount('TmpRepor'),1)
     *---
     If  Val(Substr(Version(),15,2))>=8
      m_CopyType= ' xl5'
     Else
      If .row_count>15500
       m_CopyType= ' fox2x as '+Alltrim(Str(.cp))
      Else
       m_CopyType= ' xl5'
      Endif
     Endif
     *---
     If .forceshablondata
      m.cFileName='tmpdata.xls'
     Else
      m.cFileName=.xlfile
     Endif
     *---
     Copy To (m.cFileName) Field &m_Fldlist Type &m_CopyType
     *---
     Sele TmpRepor
     Use
    Endif
   Endif
   *---
   If m.lOk
    Select (.dbf_name)
    *---ПУСТО
    Locate
    m.lERNoEmpty=!Eof()
    Release  m_CopyType
    m.nStarttime= Seco()
    =.er_Message(ReportOpen)
    *---
    .xl_app=Null
    m_OldErrorHandle=On('error')
    On Error *
    .xl_app=Createobject("Excel.Application")
    On Error &m_OldErrorHandle
    If Type('.Xl_App')='O' And !Isnull(.xl_app)
     With .xl_app
      .ScreenUpdating =.F.
      .Interactive = .F.
      .DisplayAlerts = .F.
      With .Application
       .UserControl=.T.
      Endwith
     Endwith
     *---есть ли группы
     m.lIsGroup=!Type('this.group_list[1,3]')=='U'
     *---
     If m.lIsGroup
      For m.nIndex=1 To Alen(This.group_list,1)
       *---Служебные элементы
       This.group_list[m.nIndex,iG_OldField]=Null
       This.group_list[m.nIndex,iG_OldExpr]=Null
       This.group_list[m.nIndex,iG_SubtRange]=''
       This.group_list[m.nIndex,iG_SubtSubset]=Null
       This.group_list[m.nIndex,iG_HeaderRange]=''
       This.group_list[m.nIndex,iG_HeaderSubset]=Null
       This.group_list[m.nIndex,iG_FooterRange]=''
       This.group_list[m.nIndex,iG_FooterSubset]=Null
       This.group_list[m.nIndex,iG_Counter]=0
      Endfor
     Endif
     *---
     If .forceshablondata
      =.make_s(m.lNoShowRep)
     Else
      =.make_p(m.lNoShowRep)
     Endif
     *---авто запуск
     If !Empty(._autorun)
      .xl_app.Application.Run(Alltrim(._autorun))
     Endif
     .FullName=.xl_app.Workbooks(1).FullName
     *---показать отчет
     If !m.lNoShowRep
      =.show_report()
     Endif
     Return .T.
    Else
     =This.er_Warning( erNoFindExel,.T.,'Make_Report')
     Return .F.
    Endif
   Else
    =This.er_Warning(erCursCreatError,.T.,'Make_Report')
    Return .F.
   Endif
  Else
   =This.er_Warning(erBadRowCount,.T.,'Make_Report')
   Return .F.
  Endif
 Endwith
 Endproc


 *-- получить номер колонки по имени
 Hidden Procedure nametocol
  Lparameters  m.сCol
  Local m.nIndex,m.cOld_Exact
  If Vartype(m.сCol)='C'
   *m.cOld_Exact=Upper(Set('exact'))
   *Set Exact On
   *m.nIndex=Ascan(This.column_list,m.сCol,1,-1,1,7)
   *If m.cOld_Exact='OFF'
   *  Set Exact Off
   *Endif
   *If !Empty(m.nIndex)
   * m.сCol=Asubscript(This.column_list,m.nIndex,1)
   *Endif
   For m.nIndex=1 To Alen(This.column_list,1)
    If Alltrim(Lower(This.column_list(m.nIndex,1)))==Lower(Alltrim(m.сCol))
     m.сCol=m.nIndex
     Exit
    Endif
   Endfor
  Endif
  Return  m.сCol
  Endproc


  *-- Получить адрес ячейки в формате exl
 Procedure k
 Lparameters  m.nKol,m.nRow,m.cPref
 m.nKol=This.nametocol(m.nKol)
 If Empty(m.cPref)
  m.cPref=''
 Endif
 If Empt(m.nRow)
  m.nRow=1
 Endif
 If Vartype(m.nKol)='C'
  Return  '?'+m.nKol
 Else
  Return  This.NumToExcel(m.nKol)+m.cPref+Transform(m.nRow)
 Endif
 Endproc


 *-- Привести  ссылки в формуле к формату  exel
 Hidden Procedure f_trans
  Lparameters  m.cFormula,m.nRowF,m.nRowSumm
  Local  m.nIndex1,m.nIndex2,m.cFind

  #Define KeySumm '?'
  #Define HeadSumm '@'
  #Define _Title '#'

  If Empty(m.nRowSumm)
   m.nRowSumm=m.nDE+1
  Endif
  If Empt(m.nRowF)
   m.nRowF=1
  Endif
  For m.nIndex1=1 To Alen(aTmpArray,1)
   *---заголовок
   If m.aTmpArray[m.nIndex1,1]+_Title$m.cFormula
    For m.nIndex2=1 To 9
     m.cFind=_Title+Alltrim(Str(m.nIndex2))
     If m.cFind$m.cFormula
      m.cFormula=Strtran(m.cFormula,m.aTmpArray[m.nIndex1,1]+m.cFind,This.k(m.aTmpArray[m.nIndex1,2], m.nDB-m.nIndex2,'$'))
     Endif
    Endf
   Endif
   *---1 строка
   If m.aTmpArray[m.nIndex1,1]+HeadSumm$m.cFormula
    m.cFormula=Strtran(m.cFormula,m.aTmpArray[m.nIndex1,1]+HeadSumm,This.k(m.aTmpArray[m.nIndex1,2], m.nDB,'$'))
   Endif
   *---послед строка
   If m.aTmpArray[m.nIndex1,1]+KeySumm$m.cFormula
    m.cFormula=Strtran(m.cFormula,m.aTmpArray[m.nIndex1,1]+KeySumm,This.k(m.aTmpArray[m.nIndex1,2],m.nRowSumm,'$'))
   Endif
   *---прочее
   If m.aTmpArray[m.nIndex1,1]$m.cFormula
    m.cFormula=Strtran(m.cFormula,m.aTmpArray[m.nIndex1,1],This.k(m.aTmpArray[m.nIndex1,2],m.nRowF))
   Endif
  Endfor
  Return  m.cFormula
  Endproc


  *-- Поместить значение в ячейку по адресу
 Procedure print_value
 Lparameters   m.nRow,m.nCol,m.uValue,m.lNoFit,m.lWrap,m.lFontDouble,m.nFontsize,m.cFontname
 With m.oXlWS1.Cells(m.nRow,m.nCol)
  .Value=m.uValue
  .ShrinkToFit =!m.lNoFit
  .WrapText = m.lWrap
  With .Font
   If m.lFontDouble
    .FontStyle = "полужирный"
   Endif
   If  Vartype(m.nFontsize)='N'
    .Size =m.nFontsize
   Endif
   If Vartype(m.cFontname)='C'
    .Name =m.cFontname
   Endif
  Endwith
 Endwith
 Endproc


 *-- Добавить  значение в список
 Procedure add_value
 Lparameters  m.nRow,m.nCol,m.uValue,m.lNoFit,m.lWrap,m.lFontDouble,m.nFontsize,m.cFontname
 Local m.nCnt
 If Type('this.value_list(1,3)')='U'
  m.nCnt=1
 Else
  m.nCnt=Alen(This.value_list,1)+1
 Endif
 *---
 Dimension  This.value_list(m.nCnt,8)
 *---
 This.value_list[m.nCnt,iV_Row]=m.nRow
 This.value_list[m.nCnt,iV_Col]=m.nCol
 This.value_list[m.nCnt,iV_Value]=m.uValue
 This.value_list[m.nCnt,iV_NoFit]=m.lNoFit
 This.value_list[m.nCnt,iV_Wrap]=m.lWrap
 This.value_list[m.nCnt,iV_FontDouble]=m.lFontDouble
 This.value_list[m.nCnt,iV_Fontsize]=m.nFontsize
 This.value_list[m.nCnt,iV_Fontname]=m.cFontname
 Endproc


 *-- Вставить рисунок
 Procedure insert_picture
 Lparameters  m.nRow,m.nCol,m.cFile,m.LockAspectRatio,m.nHeight,m.nWidth
 Local m.nTop,m.nLeft
 If File(Fullpath(Alltrim(m.cFile)))
  With  m.oXlWS1
   With .Cells(m.nRow,m.nCol)
    m.nTop=.Top
    m.nLeft=.Left
   Endwith
   With .PictureS.Insert(Allt(m.cFile))
    .Top= m.nTop
    .Left= m.nLeft
    With .ShapeRange
     .LockAspectRatio = m.LockAspectRatio
     If !Empt(m.nHeight)
      .Height = m.nHeight
     Endif
     If !m.LockAspectRatio
      If !Empt(m.nWidth)
       .Width = m.nWidth
      Endif
     Endif
    Endwith
   Endwith
  Endwith
 Endif
 Endproc


 *-- Добавить картинку
 Procedure add_picture
 Lparameters  m.nRow,m.nCol,m.cFile,m.LockAspectRatio,m.nHeight,m.nWidth
 Local m.nCnt
 With This
  If Type('.picture_list(1,3)')='U'
   m.nCnt=1
  Else
   m.nCnt=Alen(.picture_list,1)+1
  Endif
  Dimension  .picture_list(m.nCnt,6)
  *---
  .picture_list[m.nCnt,iP_Row]=m.nRow
  .picture_list[m.nCnt,iP_Col]=m.nCol
  .picture_list[m.nCnt,iP_File]=m.cFile
  .picture_list[m.nCnt,iP_LockAspectRatio]=m.LockAspectRatio
  .picture_list[m.nCnt,iP_Height]=m.nHeight
  .picture_list[m.nCnt,iP_Width]=m.nWidth
 Endwith
 Endproc


 *-- Чтение шаблона отчета
 Procedure read_pattern
 Lparameters m.lNoShow,m.lNoMakeReport
 Local m.oShablon,m.nRow,m.nCol,m.nPGHeader,m.nDetail,m.cColumnName,m.nIndex,m.lOk,;
  m.cColumnAlias,m.lNoFit,m.lWrap,m.nMaxRow,m.nMaxColumn ,m.nPHRows,m.cBandText, ;
  m.nLeftMargin ,m.nRightMargin,m.nCrossCount,m.nXFldCount,m.nMargin,m.сSummMarker,m.nXFAlias,m.cItog,;
  m.nFieldIndex,m.cColumn,m.cCAlias,m.cFormulaA,m.nCT,m.aColumnArray,m.nGrTitRow,m.cGrTitText,m.cGrTitPar,;
  m.nGrFootRow,m.cGrFootText,m.cGrFootPar,m_OldError,m.cGroupText,m.cGroupExpr,m.cGroupParam,m.lIsDemo,m.cTmpPattern
 Private m.XSum,m.xExp

 =This.er_Message(ReadShablon)

 m.lOk=.T.
 m_OldError=On('Error')
 m.lIsDemo=.F.
 On Error *
 m.oShablon=Createobject("Excel.Application")
 On Error &m_OldError
 *---
 If Type('m.oShablon')='O'
  This.temp_reference=m.oShablon
  With m.oShablon
   .ScreenUpdating =.F.
   .Interactive = .F.
   .DisplayAlerts = .F.
  Endwith
  *--------------------------
  If Val(m.oShablon.Version)=12
   If Pemstatus(_Screen,'IsExcelDemo',5)
    m.lIsDemo=_Screen.isexceldemo
   Else
    m.lIsDemo=This.isexceldemo
   Endif
  Endif
  If m.lIsDemo
   m.cTmpPattern=Addbs(Sys(2023))+'_Report.xls'
   Copy File (This.shablon) To (m.cTmpPattern)
   This.shablon=m.cTmpPattern
  Endif
  *----------------------------
  m.oShablon.Workbooks.Add(This.shablon)
  If Type("m.oShablon.Workbooks(1).Name")!="C"
   This.er_Warning(ShabOpenErr,,'Read_Pattern')
   m.lOk=.F.
  Endif
 Else
  This.er_Warning('Необходимо установить Excel!!!',,'Read_Pattern')
  m.lOk=.F.
 Endif

 If m.lOk
  With m.oShablon.Workbooks(1).WorkSheets(This.Get_Sheet(m.oShablon.Workbooks(1)))
   .Select()
   .EnableCalculation = .F.
   *---границы
   With .UsedRange
    m.nMaxColumn=.Columns.Count+.Column-1
    m.nMaxRow = .Rows.Count+.Row-1
   Endwith
   *---
   This.scolumnscount=m.nMaxColumn
   .Cells(1,1).Select()
   *---
   m.nRow=1
   m.nPHRows=0
   m.nPGHeader=0
   *---Поиск заголовка страницы
   Do While .T.
    m.cBandText=Upper(Nvl(.Cells(m.nRow,1).Value,''))
    Do Case
     Case  m.cBandText='PGHEAD'
      m.nPGHeader=m.nRow
     Case  Inlist(m.cBandText,'DETAL','DETAIL','GROUP','GRTITLE','GRFOOTER')
      Exit
    Endcase
    If !Empty(m.nPGHeader)
     m.nPHRows=m.nPHRows+1
    Endif
    m.nRow=m.nRow+1
    If m.nRow>m.nMaxRow
     This.er_Warning(PgHeadNoFound,,'Read_Pattern')
     m.lOk=.F.
     Exit
    Endif
   Enddo
   *---первая строка заголовка
   This.titlerow= m.nPGHeader
   *---число строк в заголовке страницы
   This.phrowcount=m.nPHRows
   *---брать данные с шаблона
   This.forceshablondata=.T.
   *---Поиск detal
   If m.lOk
    *m.nRow=m.nRow+1
    Do While .T.
     If Inlist(Upper(Nvl(.Cells(m.nRow,1).Value,'')),'DETAL','DETAIL')
      Exit
     Endif
     m.nRow=m.nRow+1
     If m.nRow>m.nMaxRow
      This.er_Warning(DetalNoFound,,'Read_Pattern')
      m.lOk=.F.
      Exit
     Endif
    Enddo
    *---
    If m.lOk
     m.nDetail=m.nRow
     *---полоса detal
     This.detalrow=m.nDetail
     *---поменять местами строки с формулой и итогами
     If Upper(Nvl(.Cells(This.detalrow+1,1).Value,''))='F'
      This.formula_ref=1
      This.sum_ref=2
     Endif
     *---начало подвала
     This.footerrow= m.nDetail+3
     *---поиск последней колонки отчета
     m.lOk=.F.
     For m.nCol=2 To m.nMaxColumn+2
      *---для однострочного заголовка по пустой ячейке
      If This.phrowcount=1
       If Empty(Nvl(.Cells(This.titlerow,m.nCol).Value,''))
        m.lOk=.T.
        Exit
       Endif
      Else
       If Alltrim(Upper(Nvl(.Cells(m.nDetail,m.nCol).Value,'')))='END'
        m.lOk=.T.
        Exit
       Endif
      Endif
     Endfor
     If m.lOk
      *---последняя колонка в шаблоне
      This.shablonlastcol=m.nCol-1
     Else
      If This.phrowcount=1
       This.er_Warning(TooManyColumns,,'Read_Pattern')
      Else
       This.er_Warning(EndColMarkerNoFound,,'Read_Pattern')
      Endif
     Endif
     *---Поиск последней строки отчета
     If m.lOk
      m.nRow=m.nDetail+3
      Do While .T.
       If Upper(Nvl(.Cells(m.nRow,1).Value,''))='END'
        Exit
       Endif
       m.nRow=m.nRow+1
       If m.nRow>150
        This.er_Warning(EndReportNoFound,,'Read_Pattern')
        m.lOk=.F.
        Exit
       Endif
      Enddo
      *---Заполнение массива колонок
      If m.lOk
       m.nCol=2
       Do While m.nCol<=This.shablonlastcol
        m.cColumnAlias=Nvl(.Cells(m.nDetail,m.nCol).Value,'')
        m.cColumnName=Nvl(.Cells(m.nPGHeader,m.nCol).Value,'')
        *---
        m.nLeftMargin=1
        m.nRightMargin=1
        *---количество перекрестных колонок
        m.nCrossCount=1
        *---количество перекрестных полей
        m.nXFldCount=1
        *---CrossTab ?
        If '#'$ m.cColumnAlias
         *---для x tab (временно)
         This.is_xtab=.T.
         This.x_begin= m.nCol-1
         *---левый отступ
         m.nLeftMargin=Atc('L:',m.cColumnAlias)
         If !Empty(m.nLeftMargin)
          m.nLeftMargin=Val(Substr(m.cColumnAlias,m.nLeftMargin+2,2))+1
         Else
          m.nLeftMargin=m.nCol-1
         Endif
         *---количество полей #
         Do While '#'$Nvl(.Cells(m.nDetail,m.nCol+m.nCrossCount).Value,'')
          m.nCrossCount=m.nCrossCount+1
         Enddo
         This.x_step=m.nCrossCount
         *---правый отступ
         m.nRightMargin=Atc('R:',m.cColumnAlias)
         If !Empty(m.nRightMargin)
          m.nRightMargin=Fcount(This.dbf_name)-Val(Substr(m.cColumnAlias,m.nRightMargin+2,2))
         Else
          Do While !Empty(Nvl(.Cells(m.nPGHeader,m.nCol+m.nRightMargin+1).Value,''))
           m.nRightMargin=m.nRightMargin+1
          Enddo
          m.nRightMargin=Fcount(This.dbf_name)-(m.nRightMargin-(m.nCrossCount-1))
         Endif
         *---
         This.x_count=(m.nRightMargin-m.nLeftMargin)+1
        Endif
        *---массив с данными колонок
        Dimension  m.aColumnArray(m.nCrossCount,24)
        m.aColumnArray=.F.
        If '#'$ m.cColumnAlias
         Dimension m.XSum(m.nCrossCount),m.xExp(m.nCrossCount)
         m.XSum=''
         m.xExp=''
        Endif
        For  m.nIndex=1 To  m.nCrossCount
         m.nMargin= m.nCol+m.nIndex-1
         m.aColumnArray(m.nIndex,1)=Nvl(.Cells(m.nDetail,m.nMargin).Value,'') &&m.cColumnAlias
         m.aColumnArray(m.nIndex,2)=.F.  &&nvl(.Cells(m.nPGHeader,m.nMargin).value,'')   &&m.cColumnName
         m.aColumnArray(m.nIndex,3)=.Columns(m.nMargin).ColumnWidth &&ширина колонки
         m.aColumnArray(m.nIndex,4)=.F. &&.Cells(m.nPGHeader,m.nMargin).orientation &&ориентация
         m.сSummMarker=Nvl(.Cells(m.nDetail+This.sum_ref,m.nMargin).Value,'')
         *---
         Do Case
          Case  Empt(m.сSummMarker)
           m.aColumnArray(m.nIndex,5)=.F.  &&сумм
          Case  Vartype(m.сSummMarker)!='C'
           m.aColumnArray(m.nIndex,5)=.T.  &&сумм
          Case  Len(Alltrim(m.сSummMarker))=1
           m.aColumnArray(m.nIndex,5)=.T.  &&сумм
          Case 'g:'$Lower(m.сSummMarker)
           m.aColumnArray(m.nIndex,20)=.T. && формулы в группах
          Case 's:'$Lower(m.сSummMarker)
           m.aColumnArray(m.nIndex,5)=.F.  &&сумм
           m.aColumnArray(m.nIndex,22)=Alltrim(Strtran(m.сSummMarker,'s:',''))
          Case 'f:'$Lower(m.сSummMarker)
           m.aColumnArray(m.nIndex,5)=.F.  &&сумм
           m.aColumnArray(m.nIndex,9)=.T.
           m.aColumnArray(m.nIndex,21)=Alltrim(Strtran(m.сSummMarker,'f:',''))
          Other
           m.aColumnArray(m.nIndex,5)=.T.
           m.aColumnArray(m.nIndex,21)=Alltrim(m.сSummMarker)
         Endcase
         *---
         m.aColumnArray(m.nIndex,6)=Alltrim(Nvl(.Cells(m.nDetail+This.formula_ref,m.nMargin).Value,'')) &&формула
         m.aColumnArray(m.nIndex,7)=.F. && .Cells(m.nDetail,m.nMargin).NumberFormat &&формат
         *m.aColumnArray(m.nIndex,8)=.f. &&.Cells(m.nDetail,m.nMargin).Interior.ColorIndex &&цвет
         *m.aColumnArray(m.nIndex,9)=.f. &&!.Cells(m.nDetail,m.nMargin).ShrinkToFit &&не впис
         *m.aColumnArray(m.nIndex,10)=.f. &&.Cells(m.nDetail,m.nMargin).WrapText &&перенос слов
         m.aColumnArray(m.nIndex,11)= .F. &&.Cells(m.nDetail,m.nMargin).HorizontalAlignment &&гор
         m.aColumnArray(m.nIndex,12)=.F. && .Cells(m.nDetail,m.nMargin).VerticalAlignment &&вер
         m.aColumnArray(m.nIndex,13)=.F. && .Cells(m.nDetail,m.nMargin).orientation &&ориент
         m.aColumnArray(m.nIndex,14)=.F. && .Cells(m.nDetail,m.nMargin).IndentLevel &&отступ
         m.aColumnArray(m.nIndex,15)=.F. && .Cells(m.nDetail,m.nMargin).font.FontStyle = "полужирный" &&-2 фонт
         m.aColumnArray(m.nIndex,16)=.F. && .Cells(m.nDetail,m.nMargin).font.size &&-фонт size
         m.aColumnArray(m.nIndex,17)=.F. && .Cells(m.nDetail,m.nMargin).font.name &&-фонт
         m.aColumnArray(m.nIndex,18)=m.nMargin
         *---алиас колонки
         m.nXFAlias=Atc('A:', m.aColumnArray(m.nIndex,1))
         m.aColumnArray(m.nIndex,iC_ShablonCol)=Iif(Empty(m.nXFAlias),'',Alltrim(Substr(m.aColumnArray(m.nIndex,1),m.nXFAlias+2)))
         If 'F:'$Upper(m.aColumnArray(m.nIndex,1))
          m.nXFldCount=Max(m.nXFldCount,Val(Substr(m.aColumnArray(m.nIndex,1),Atc('F:',m.aColumnArray(m.nIndex,1))+2,2)))
         Endif
        Endfor
        *---
        If m.nXFldCount>1
         This.x_count=This.x_count/m.nXFldCount
        Endif
        *---
        For m.nIndex=m.nLeftMargin To m.nRightMargin Step m.nXFldCount
         For m.nCT=1 To m.nCrossCount
          *---скрытая колонка
          If 'h:'$m.aColumnArray(m.nCT,1)
           m.aColumnArray(m.nCT,8)=.T.
           m.aColumnArray(m.nCT,1)=Strtran(m.aColumnArray(m.nCT,1),'h:','')
          Endif
          *---загрузить рисунки
          If 'p:'$m.aColumnArray(m.nCT,1)
           m.aColumnArray(m.nCT,23)=.T.
           m.aColumnArray(m.nCT,1)=Strtran(m.aColumnArray(m.nCT,1),'p:','')
          Endif
          *---загрузить рисунки в комментарий
          If 'pc:'$m.aColumnArray(m.nCT,1)
           m.aColumnArray(m.nCT,23)=.T.
           m.aColumnArray(m.nCT,24)=.T.
           m.aColumnArray(m.nCT,1)=Strtran(m.aColumnArray(m.nCT,1),'pc:','')
          Endif
          *---без подитогов
          If 'n:'$m.aColumnArray(m.nCT,1)
           m.aColumnArray(m.nCT,10)=.T.
           m.aColumnArray(m.nCT,1)=Strtran(m.aColumnArray(m.nCT,1),'n:','')
          Endif
          m.cItog=m.aColumnArray(m.nCT,21)
          *---xtab
          If '#'$m.aColumnArray(m.nCT,1)
           m.nFieldIndex=m.nIndex+Max(1,Val(Substr(m.aColumnArray(m.nCT,1),Atc('F:', m.aColumnArray(m.nCT,1))+2,1)))-1
           m.cColumn=Field(m.nFieldIndex,This.dbf_name)
           m.cFormula=Strtran(m.aColumnArray(m.nCT,6),'#',m.cColumn)
           *---вычислим алиас колонки
           Do Case
             *---пустая формула и пустой алиас
            Case Empt(m.cFormula) And Empt(m.aColumnArray(m.nCT,19))
             m.cCAlias='*'+m.cColumn
            Case !Empt(m.cFormula) And Empt(m.aColumnArray(m.nCT,19))
             m.cCAlias=''
            Case Empt(m.cFormula) And !Empt(m.aColumnArray(m.nCT,19))
             m.cCAlias=m.aColumnArray(m.nCT,19)+Padl(Int(m.nIndex),3,'_')
             m.cFormula='&'+m.cColumn
            Case !Empt(m.cFormula) And !Empt(m.aColumnArray(m.nCT,19))
             m.cCAlias=m.aColumnArray(m.nCT,19)+Padl(Int(m.nIndex),3,'_')
            Otherwise
             m.cCAlias=''
           Endcase
           *---пронумеруем ссылки на алиасы других перекрестных полей
           m.cFormula=Strtran(m.cFormula,':',Padl(Int(m.nIndex),3,'_') )
           *---формула в итогах
           If m.aColumnArray(m.nCT,9)
            m.cItog=Strtran(m.cItog,':',Padl(Int(m.nIndex),3,'_') )
           Endif
          Else
           m.cColumn= m.aColumnArray(m.nCT,2)
           m.cCAlias=m.aColumnArray(m.nCT,1)
           m.cFormula=m.aColumnArray(m.nCT,6)
          Endif
          *---
          If !Empt(m.cFormula) .And.  Left(m.cFormula,1)!='&'
           If 'XSTAT('$Uppe(m.cFormula)
            m.cFormula=Evaluate('this.'+m.cFormula)
           Endif
           If 'XSUM('$Upper(m.cFormula)
            m.cFormula=Evaluate(m.cFormula)
           Endif
           m.cFormula='='+m.cFormula
          Endif
          *---
          m.cFormulaA=This.add_column(m.cCAlias,m.cColumn,m.aColumnArray(m.nCT,3),m.aColumnArray(m.nCT,4),m.aColumnArray(m.nCT,5),m.cFormula,m.aColumnArray(m.nCT,7),m.aColumnArray(m.nCT,8),m.aColumnArray(m.nCT,9),m.aColumnArray(m.nCT,10),m.aColumnArray(m.nCT,11),m.aColumnArray(m.nCT,12),m.aColumnArray(m.nCT,13),m.aColumnArray(m.nCT,14),m.aColumnArray(m.nCT,15),m.aColumnArray(m.nCT,16),m.aColumnArray(m.nCT,17),m.aColumnArray(m.nCT,18),m.aColumnArray(m.nCT,20),m.cItog,m.aColumnArray(m.nCT,22),m.aColumnArray(m.nCT,23),m.aColumnArray(m.nCT,24))
          *---
          If '#'$m.aColumnArray(m.nCT,1)
           *---для 1 поля используем функцию sum
           If m.nCrossCount=1
            If m.nIndex=m.nLeftMargin
             m.XSum(m.nCT)=m.XSum(m.nCT)+'SUM('+m.cFormulaA+':'
             m.xExp(m.nCT)=m.xExp(m.nCT)+m.cFormulaA+':'
            Endif
            If  m.nIndex= m.nRightMargin
             m.XSum(m.nCT)=m.XSum(m.nCT)+m.cFormulaA+')'
             m.xExp(m.nCT)=m.xExp(m.nCT)+m.cFormulaA
            Endif
           Else
            m.XSum(m.nCT)=m.XSum(m.nCT)+'+'+m.cFormulaA
            If m.nRightMargin<=30
             m.xExp(m.nCT)=m.xExp(m.nCT)+Iif(Empt(m.xExp(m.nCT)),'',',')+m.cFormulaA
            Endif
           Endif
          Endif
         Endfor
        Endfor
        *---
        m.nCol=m.nCol+m.nCrossCount
       Enddo
       Release  m.cFormula,m.cCAlias,m.cColumn,m.nLeftMargin,m.nRightMargin,m.nCT,m.aColumnArray,m.nFieldIndex
       *----
       *---слишком много полей
       If This.column_count>254
        This.er_Warning(TooManyColumns,,'Read_Pattern')
        m.lOk=.F.
       Else
        *---нет колонок ?
        If Empt(This.column_count)
         This.er_Warning(ColumnsNoFound,,'Read_Pattern')
         m.lOk=.F.
        Else
         *---высота строк
         This.row_height =.Rows(m.nDetail).RowHeight
        Endif
        *---Заполнение массива групп
        If m.lOk
         m.nEndRep=m.nRow
         This.endrow=m.nEndRep
         *----
         m.nGrpcnt=m.nPGHeader+This.phrowcount
         m.nIndex=1
         Do While .T.
          *---
          If Inlist(Uppe(Nvl(.Cells(m.nGrpcnt,1).Value,'')),'GRTITLE','GRFOOTER')
           m.nGrpcnt=m.nGrpcnt+1
          Endif
          *---группы
          If Upper(Nvl(.Cells(m.nGrpcnt,1).Value,''))='GROUP'
           m.cGroupText=''
           m.cGroupExpr=''
           m.cGroupParam=''
           =This.Read_Group_Param(m.nGrpcnt,@m.cGroupText,@m.cGroupExpr,@m.cGroupParam)
           *---GrTitle
           m.nGrTitRow=m.nGrpcnt-1
           m.cGrTitText=''
           m.cGrTitPar=''
           If Uppe(Nvl(.Cells(m.nGrTitRow,1).Value,''))='GRTITLE'
            =This.Read_Group_Param(m.nGrTitRow,@m.cGrTitText,@m.cGrTitPar)
           Else
            m.nGrTitRow=0
           Endif
           *---GrFooter
           m.nGrFootRow=m.nGrpcnt+1
           m.cGrFootText=''
           m.cGrFootPar=''
           If Uppe(Nvl(.Cells(m.nGrFootRow,1).Value,''))='GRFOOTER'
            =This.Read_Group_Param(m.nGrFootRow,@m.cGrFootText,@m.cGrFootPar)
           Else
            m.nGrFootRow=0
           Endif
           *---
           This.add_group(m.cGroupText,m.cGroupExpr,.Rows(m.nGrpcnt).RowHeight,0,0,'','',0,m.nGrpcnt,m.cGroupParam,m.nGrTitRow,m.cGrTitText,m.cGrTitPar,m.nGrFootRow,m.cGrFootText,m.cGrFootPar)
           *---
          Else
           Exit
          Endif
          *----
          m.nGrpcnt=m.nGrpcnt+1
          m.nIndex=m.nIndex+1
         Enddo
        Endif
       Endif
      Endif
     Endif
    Endif
   Endif
   *---
   If m.lOk
    *---высота заголовка отчета
    This.title_height=m.nPGHeader-1
    *---ориентация листа
    This.page_orient=.F.
    *--имя листа
    This.sheet_name=.Name
    *---
    If !m.lIsDemo
     *Try
     m.oShablon.Workbooks(1).SaveAs(This.xlfile,xlWorkbookNormal)
     This.xlfile=m.oShablon.Workbooks(1).FullName
     *Catch
     * If Pemstatus(_Screen,'IsExcelDemo',5)
     *=Set_Ini('Main','ExcelDemo','1',GetExeDir('GlobalSet.Ini'),.t.)
     *_Screen.IsExcelDemo=.t.
     * Endif
     *m.lIsDemo=.f.
     *Endtry
    Endif
    *---
    If m.lIsDemo
     This.no_delete=.T.
     This.xlfile=This.shablon
    Endif
   Endif
  Endwith
 Endif
 *---закроем шаблон
 If Type('m.oShablon')='O' And !Isnull(m.oShablon)
  m.oShablon.Application.Quit()
 Endif
 *---
 This.temp_reference=.F.
 Release m.oShablon
 *---отчет
 If m.lOk .And. !m.lNoMakeReport
  Return  This.make_report(m.lNoShow)
 Else
  Return  m.lOk
 Endif
 Endproc


 *-- Перевод ссылки
 Hidden Procedure NumToExcel
  Lparameters m.nNum
  Local m.nHigh,m.nLow
  m.nHigh=64+Int((m.nNum-0.01)/26)
  m.nLow=64+m.nNum%26
  If m.nLow=64
   m.nLow='Z'
  Else
   m.nLow=Chr(m.nLow)
  Endif
  If m.nHigh=64
   m.nHigh=''
  Else
   m.nHigh=Chr(m.nHigh)
  Endif
  Return   m.nHigh+m.nLow
  Endproc


  *-- Зафиксировать панели
 Procedure freezepanes
 Lparameters  m.nSplitColumn
 If Vartype(m.nSplitColumn)!='N'
  m.nSplitColumn=0
 Endif
 If !Empty(m.nSplitColumn)
  This.splitcolumn=m.nSplitColumn
 Endif
 Endproc


 *-- Вывести диаграмму
 Procedure print_chart
 Local  m.cRange,m.nIndex,m.nDataIn,m.cColStart,m.cColEnd,m.cXValues,m.cColX,m.nColdel,m.oChartFind,m.nChart,m_OldErrorHandler,m.cYValues,m.cNameValues,m.lProcessed_Chart
 m_OldErrorHandler=On('error')
 For m.nIndex=1 To Alen(This.chart_list,1)
  If Type('This.chart_list[m.nIndex,'+Padr(iD_ColumnValues,2)+']')='N' And This.chart_list[m.nIndex,iD_ColumnValues]<0
   This.chart_list[m.nIndex,iD_ColumnValues]=This.column_count+This.chart_list[m.nIndex,iD_ColumnValues]+1
  Endif
  If !Empt(This.chart_list[m.nIndex,iD_ColumXname]) .And. !Empt(This.chart_list[m.nIndex,iD_ColumnValues]) .And. !This.chart_list[m.nIndex,iD_NoSumm]
   m.cColStart=This.nametocol(This.chart_list[m.nIndex,iD_ColumnValues])
   If !Empt(This.chart_list[m.nIndex,iD_ColumnCount])
    m.cColEnd=m.cColStart+This.chart_list[m.nIndex,iD_ColumnCount]-1
   Else
    m.cColEnd=m.cColStart
   Endif
   m.cColX='C'+ Transform(This.nametocol(This.chart_list[m.nIndex,iD_ColumXname]))
   m.cColY='C'+ Transform(This.nametocol(m.cColStart))
   m.cColStart=This.NumToExcel(m.cColStart)
   m.cColEnd =This.NumToExcel(m.cColEnd)
   m.cXValues="='"+Allt(This.sheet_name)+"'!R"+Transform(This.titlerow +This.phrowcount)+m.cColX+":R"+Transform(This.row_count-Iif(This.lsummed,1,0))+m.cColX
   *---
   m.cYValues="='"+Allt(This.sheet_name)+"'!R"+Transform(This.titlerow +This.phrowcount)+m.cColY+":R"+Transform(This.row_count-Iif(This.lsummed,1,0))+m.cColY
   m.cNameValues="='"+Allt(This.sheet_name)+"'!R"+Transform(This.titlerow +This.phrowcount-1)+m.cColY+":R"+Transform(This.titlerow +This.phrowcount-1)+m.cColY
   *---This.title_height+2
  Else
   m.cColStart='A'
   m.nColdel=This.chart_list[m.nIndex,iD_ColumXname]
   If Vartype(m.nColdel)!='N'
    m.nColdel=1
   Endif
   m.cColEnd =Allt(This.NumToExcel(This.column_count-Iif (This.chart_list[m.nIndex,iD_NoSumm],m.nColdel,0)))
  Endif
  *--
  m.cRange=m.cColStart+Transform(This.titlerow +This.phrowcount-1)+':'+ m.cColEnd +Transform(This.row_count-Iif(This.lsummed,1,0))
  *This.title_height+1
  *---
  m.oChartFind=Null
  For m.nChart=1 To  m.oXlWB1.charts.Count
   If m.oXlWB1.charts(m.nChart).Name=This.chart_list[m.nIndex,iD_ChartName]
    m.oChartFind=m.oXlWB1.charts(m.nChart)
    Exit
   Endif
  Endfor
  *---
  If  !Isnul(m.oChartFind)
   m.oChartFind.Select()
  Else
   This.xl_app.charts.Add()
  Endif
  *---флаг обработки графика
  If ','+This.chart_list[m.nIndex,iD_ChartName]+','$This.processed_chart
   m.lProcessed_Chart=.T.
  Else
   This.processed_chart=This.processed_chart+','+This.chart_list[m.nIndex,iD_ChartName]+','
   m.lProcessed_Chart=.F.
  Endif
  *---
  With This.xl_app.ActiveChart
   If .SeriesCollection.Count>0 And !Isnul(m.oChartFind) And m.lProcessed_Chart
    m.oNewSerios=.SeriesCollection.NewSeries()
    With  m.oNewSerios
     .Values=m.cYValues
     .Name=m.cNameValues
    Endwith
   Else
    *---
    If !Empt(This.chart_list[m.nIndex,iD_DataIn])
     m.nDataIn=This.chart_list[m.nIndex,iD_DataIn]
    Else
     m.nDataIn=2
    Endif
    .SetSourceData(This.xl_app.Sheets(This.sheet_name).Range(m.cRange),2)
    .HasDataTable=.F.
    If !Empt(This.chart_list[m.nIndex,iD_ColumXname]) .And. !Empt(This.chart_list[m.nIndex,iD_ColumnValues])
     .SeriesCollection(1).XValues = m.cXValues
    Endif
    *---
    If !Empt(This.chart_list[m.nIndex,iD_Legend])
     .HasTitle = .T.
     .ChartTitle.Characters.Text = This.chart_list[m.nIndex,iD_Legend]
    Endif
    *---!
    If  Isnul(m.oChartFind)
     .PlotBy=m.nDataIn
     *---
     If !Empt(This.chart_list[m.nIndex,iD_ChartName])
      On Error *
      .Name=This.chart_list[m.nIndex,iD_ChartName]
      On Error &m_OldErrorHandler
     Endif
     *---
     .Legend.Font.Size = 8
     .ChartTitle.Font.Size = 8
     If Type('.Axes(1).TickLabels')='O'
      With .Axes(1).TickLabels
       .Font.Size = 8
       .Orientation = -4171
      Endwith
     Endif
     If Type('.Axes(2).TickLabels')='O'
      .Axes(2).TickLabels.Font.Size = 8
     Endif
     .ChartType =This.chart_list[m.nIndex,iD_Type]
    Endif
   Endif
  Endwith
 Endfor
 Endproc


 *-- Добавить диаграмму
 Procedure add_chart
 Lparameters  m.nType,m.nDataIn,m.cChartName,m.cLegend,m.lNoSumm,m.cColumXname,m.cColumnValues,m.nColumnCount
 Local m.nCnt
 *1-тип диаграммы
 *2-порядок данных (1,2)
 *3-имя листа
 *4-Заголовок диаграммы
 *5-исключить последнюю колонку
 *6-Колонка для названий по оси х
 *7-1 Колонка для значений
 *8-количество  Колонок для значений
 With This
  .make_chart=.T.
  *---
  If Type('This.chart_list(1,7)')='U'
   m.nCnt=1
  Else
   m.nCnt=Alen(.chart_list,1)+1
  Endif
  *---
  Dimension .chart_list(m.nCnt,8)
  .chart_list[m.nCnt,iD_Type]=m.nType
  .chart_list[m.nCnt,iD_DataIn]=m.nDataIn
  .chart_list[m.nCnt,iD_ChartName]=m.cChartName
  .chart_list[m.nCnt,iD_Legend]=m.cLegend
  .chart_list[m.nCnt,iD_NoSumm]=m.lNoSumm
  .chart_list[m.nCnt,iD_ColumXname]=m.cColumXname
  .chart_list[m.nCnt,iD_ColumnValues]=m.cColumnValues
  .chart_list[m.nCnt,iD_ColumnCount]=m.nColumnCount
 Endwith
 Return  ' '
 Endproc


 *-- Удалить группы
 Procedure clear_group
 Lparameters m.nRow,m.lRest
 Local m.nRows,m.nColums
 m.nRows=Alen(This.group_list,1)
 If Vartype(m.nRow)='N' And m.nRows>1
  m.nColums=Alen(This.group_list,2)
  If m.lRest
   If m.nRow<m.nRows
    Dimension This.group_list(m.nRow,m.nColums)
   Endif
  Else
   If m.nRows>=m.nRow
    =Adel(This.group_list,m.nRow)
    Dimension This.group_list( m.nRows-1,m.nColums)
   Endif
  Endif
 Else
  *---уберем все группы
  Dimension This.group_list(1)
  This.group_list=.F.
 Endif
 Endproc


 *-- Создать перекрестную таблицу
 Hidden Procedure make_xtab
  * сColumnField  -имя поля для постороения столбцов
  * [cKeyField]    -список ключевых поле ,разделенных запятой
  * [m.nColumnSort]   -сортировка колонок (1 -нет, 2 -asc ,3- desc)
  * [nXCalc]        -итоги по строке (0-4)
  * [cEr_dbf ]      -имя файла результирующей таблицы ( er_xtab.dbf по умолчанию)
  * [cCl_dbf ]      -имя файла таблицы имен колонок  ( c_list.dbf по умолчанию)

  Lparameters  m.cColumnField,m.cKeyFieldList,m.nColumnSort,m.nRowCalc,m.cER_dbf,m.cCl_Dbf
  Local m.oEr_Xtab,m.lOk,m.cModule
  m.lOk=.F.
  If Lower(This.xtab_class)='er_xtab'
   m.cModule='er_xtab.prg'
  Else
   m.cModule=Null
  Endif
  m.oEr_Xtab=Newobject(This.xtab_class,m.cModule,Null,m.cColumnField,m.cKeyFieldList)
  If Vartype(m.oEr_Xtab)='O'
   With m.oEr_Xtab
    If Vartype(m.nColumnSort)='N'
     .nColumnSort=m.nColumnSort
    Endif
    If Vartype(m.nRowCalc)='N'
     .nRowCalc=m.nRowCalc
    Endif
    If Vartype(m.cER_dbf)='C'
     .cER_dbf=m.cER_dbf
    Endif
    If Vartype(m.cCl_Dbf)='C'
     .cCl_Dbf=m.cCl_Dbf
    Endif
    m.lOk=.Gen_XTab()
   Endwith
  Endif
  Return m.lOk
  Endproc


  *-- Получить реальное имя x-field
 Procedure getxfield
 Lparameters  m.cFname,m.cC_list
 Local m.cRet
 If Vartype(m.cC_list)!='C'
  m.cC_list='c_list'
 Endif
 If Used(m.cC_list)
  Goto (Val(Strtran(Substr(m.cFname,5,3),'_',''))) In (m.cC_list)
  m.cRet=Evaluate(m.cC_list+'.cf')
 Else
  m.cRet=m.cFname
  If Type(m.cRet)='L'
   m.cRet=Iif(m.cRet,mYes,mNo)
  Endif
 Endif
 Return Alltrim(Transform(m.cRet))
 Endproc


 *-- стат функции
 Hidden Procedure xstat
  Lparameters  m.nIndex,m.cStatFunct
  If Empty(xExp(m.nIndex))
   Return  ''
  Else
   Return  m.cStatFunct+'('+xExp(m.nIndex)+')'
  Endif
  Endproc


  *-- вернуть ссылку на ячейку с итогами
 Hidden Procedure itog
  Lparameters  m.cAlias,m.lRetValue,m.nRowInc
  Local m.cRet
  If Vartype(m.nRowInc)!='N'
   m.nRowInc=0
  Endif
  m.cRet=This.f_trans(m.cAlias,This.row_count-1-m.nRowInc)
  If Left(m.cRet,1)!='?'
   m.cRet='='+m.cRet
  Endif
  If m.lRetValue
   *---включим расчет
   If !m.oXlWS1.EnableCalculation
    m.oXlWS1.EnableCalculation = .T.
   Endif
   m.cRet=m.oXlWS1.Range(Strtran(m.cRet,'=','')).Value
   *!*	 With m.oXlWS1.cells(This.Row_count+(This.EndRow-This.FooterRow)+1,1)
   *!*	  .NumberFormat = "0.00000"
   *!*	  .Value=0
   *!*	  .Formula=m.cRet
   *!*	  *m.cRet =m.oXlWS1.Range(Strtran(m.cRet,'=','')).Value2
   *!*	   m.cRet =.value
   *!*	  .Value=''
   *!*	 Endwith
   If Vartype(m.cRet)!='N'
    m.cRet=0
   Endif
  Endif

  Return  m.cRet
  Endproc


  *-- Показать сообщение
 Hidden Procedure er_Message
  Lparameters  m.cMessage
  If !(Type('m.lERNoShowMessage')='L' .And. m.lERNoShowMessage)
   This.On_Message(m.cMessage)
  Endif
  Endproc


  *-- Предупреждения
 Hidden Procedure er_Warning
  Lparameters  m.cWarning,m.lForce,m.cMethod
  With This
   If Vartype(m.nError)!='N'
    m.nError=-1
   Endif
   *---
   .error_code= 1
   .error_description=m.cWarning
   If Vartype(m.cMethod)='C'
    .error_method=m.cMethod
   Endif
   *---
   If !(Type('m.lERNoShowWarning')='L' .And. m.lERNoShowWarning) Or m.lForce
    .On_Warning(m.cWarning)
   Endif
  Endwith
  Endproc


  *-- Автоформатировать строки отчета
 Procedure auto_fit
 Lparameters  m.nColFit
 *--
 If Empt(m.nColFit)
  m.nColFit=1
 Endif
 *--
 Do Case
  Case m.nColFit=1
   This.AutoFit=.T.
  Case m.nColFit=2
   This.col_autofit=.T.
  Case m.nColFit=3
   This.col_autofit=.T.
   This.AutoFit=.T.
 Endcase
 Return  ''
 Endproc


 *-- Счетчик колонок
 Procedure col_cnt
 Lparameters  m.uStartCnt
 If Vartype(This.ccounter)='N'
  This.ccounter=This.ccounter+1
 Else
  If Vartype(m.uStartCnt)='N'
   This.ccounter=m.uStartCnt
  Else
   This.ccounter=1
  Endif
 Endif
 Return Transform(This.ccounter)
 Endproc


 *-- Получить номер группы
 Procedure group_cnt
 Lparameters m.lStruct,m.cDelim,m.nGroup
 Local m.cRetValue,m.nGId
 If Vartype(m.nGroup)!='N'
  m.nGroup=m.nItog
 Endif
 *---вся цепочка
 If m.lStruct
  If Vartype(m.cDelim)!='C'
   m.cDelim='.'
  Endif
  m.cRetValue=''
  For m.nGId=1 To m.nGroup
   m.cRetValue=m.cRetValue+Alltrim(Padr(This.group_list[m.nGId,iG_Counter],20))+Iif(m.nGId=m.nGroup,'',m.cDelim)
  Endfor
 Else
  m.cRetValue= Alltrim(Padr(This.group_list[m.nGroup,iG_Counter],20))
 Endif
 Return  m.cRetValue
 Endproc


 *-- Задать сортировку строк
 Procedure Sort
 Lparameters m.cColumnSort,m.nTypeSort
 *-m.cColumnSort имя колонки
 *-m.nTypeSort вид сортировки (1- asce,2 Desce)
 This.columnsort=m.cColumnSort
 If Vartype(m.nTypeSort)!='N'
  m.nTypeSort=2
 Endif
 This.typesort=m.nTypeSort
 Endproc


 Hidden Procedure key_to_str
  Lparameters m.cStr,m.lMacr
  Local m.nLeft,m.nRight,m.cText,m_ValueExpr
  Do While At('{',m.cStr)!=0
   m.nLeft=At('{',m.cStr)
   m.nRight=At('}',m.cStr)
   If m.nRight=0
    Exit
   Endif
   m.cText= Substr(m.cStr,m.nLeft,m.nRight-m.nLeft+1)
   If m.lMacr
    m_ValueExpr=Strtran(Strtran(m.cText,'{',''),'}','')
    m.cStr=Strtran(m.cStr,m.cText,'')
    &m_ValueExpr
   Else
    m_ValueExpr=Eval(Strtran(Strtran(m.cText,'{',''),'}',''))
    m.cStr=Strtran(m.cStr,m.cText,m_ValueExpr)
   Endif
  Enddo
  Return  m.cStr
  Endproc


  *-- Номер функции для подитогов
 Hidden Procedure stf_id
  Lparameters m.cFunct
  Local m.nFunctId
  *---запрет использования функц подитогов ?
  If This.no_subtotal Or '_NoSubt'$m.cFunct
   m.nFunctId=Strtran(m.cFunct,'_NoSubt','')
  Else
   Do Case
    Case Inlist(Upper(m.cFunct),'СРЗНАЧ','AVERAGE')
     m.nFunctId='1'
    Case Inlist(Upper(m.cFunct),'СЧЁТ','COUNT')
     m.nFunctId='2'
    Case Inlist(Upper(m.cFunct),'СЧЁТЗ','COUNTA')
     m.nFunctId='3'
    Case Inlist(Upper(m.cFunct),'МАКС','MAX')
     m.nFunctId='4'
    Case Inlist(Upper(m.cFunct),'МИН','MIN')
     m.nFunctId='5'
    Case Inlist(Upper(m.cFunct),'ПРОИЗВЕД','PRODUCT')
     m.nFunctId='6'
    Case Inlist(Upper(m.cFunct),'СТАНДОТКЛОН','STDEV')
     m.nFunctId='7'
    Case Inlist(Upper(m.cFunct),'СТАНДОТКЛОНП','STDEVP')
     m.nFunctId='8'
    Case Inlist(Upper(m.cFunct),'СУММ','SUM')
     m.nFunctId='9'
    Case Inlist(Upper(m.cFunct),'ДИСП','VAR')
     m.nFunctId='10'
    Case Inlist(Upper(m.cFunct),'ДИСПР','VARP')
     m.nFunctId='11'
    Other
     m.nFunctId='9'
   Endcase
  Endif
  Return m.nFunctId
  Endproc


  *-- Подитоги
 Hidden Procedure subtotal
  Lparameters  m.nStart,m.nEnd,m.nRow ,m.lTotal
  Local m.nIndex,m.cFunct,m.cFormAdd,m.nSpacePos,m.lNoSubt

  m.cSubtCellList=m.cSubtCellList+'$'+Transform(m.nRow)+';'
  If !This.multicolumn
   For m.nIndex=1 To Alen(This.column_list,1)
    If This.column_list[m.nIndex,iC_Summed]
     If !This.column_list[m.nIndex,iC_Wrap] Or m.lTotal Or !This.forceshablondata
      With m.oXlWS1.Cells(m.nRow,m.nIndex)
       m.cFormAdd=''
       If Empty(This.column_list[m.nIndex,iC_CalcFunct])
        m.cFunct='sum'
       Else
        m.cFunct=This.column_list[m.nIndex,iC_CalcFunct]
        m.nSpacePos=At(' ',m.cFunct)
        If m.nSpacePos!=0
         m.cFormAdd=Alltrim(Substr(m.cFunct,m.nSpacePos))
         m.cFunct=Left(m.cFunct,m.nSpacePos)
        Endif
       Endif
       m.cFunct=This.stf_id(m.cFunct)
       If Isdigit(m.cFunct)
        .Formula='=subtotal('+m.cFunct+','+This.k(m.nIndex,m.nStart)+':'+This.k(m.nIndex,m.nEnd)+')'
       Else
        .Formula='='+m.cFunct+'('+This.k(m.nIndex,m.nStart)+':'+This.k(m.nIndex,m.nEnd)+')'
       Endif
       If !Empty(m.cFormAdd)
        m.lNoSubt='@'$m.cFormAdd
        If  m.lNoSubt
         m.cFormAdd=Strtran(m.cFormAdd,'@','')
        Endif
        If m.lTotal Or !m.lNoSubt
         .FormulaR1C1=.FormulaR1C1+m.cFormAdd
        Endif
       Endif
      Endwith
     Endif
    Endif
   Endfor
   *---набор добавленых строк
   If Isnull(m.oUnionSubtotal)
    m.oUnionSubtotal=.Rows(m.nRow)
   Else
    m.oUnionSubtotal=m.oXlApp.Union(m.oUnionSubtotal,.Rows(m.nRow))
   Endif
  Endif
  Endproc


 Hidden Procedure make_group
  Parameters m.lNoTitle
  Local m.lGfooter,m.nPos,m.nPlus,m.nSubt,m.nIsMoreOne,m.nEndClear,m.nStartClear,m.cClearText,m.nSaveRow,m.cGroupText
  Private m.nGr,m.nItog,m.lNoBorder,m.cBase,m.lMegrClear

  m.lMegrClear=.F.

  *---переменные
  m.pnCounter= m.pnCounter+1
  *---группа
  For m.nGr=1 To m.nGroupLen
   *---Смена группы
   m.lGfooter=!Isnull(This.group_list[m.nGr,iG_OldField])
   If  !m.lGfooter Or m.lNoTitle Or This.group_list[m.nGr,iG_OldField]!=Evaluate(This.group_list[m.nGr,iG_Field])
    m.cBase=Alltrim(Str( m.nInd-1))
    This.group_list[m.nGr,iG_Counter]=This.group_list[m.nGr,iG_Counter]+1
    m.lNoBorder=m.nGr==1
    *---group footer
    If m.lGfooter
     For m.nItog=m.nGroupLen  To m.nGr Step -1
      m.nPos= m.nInd
      m.nPlus=This.group_list[m.nItog,iG_Head_Row]+Iif(This.group_list[m.nItog,iG_position]=2,0,1)
      *---число строк в группе более 1
      m.nIsMoreOne=.T.
      If This.group_list[m.nItog,iG_More_then_one] And (m.nPos-m.nPlus)<=1
       m.nIsMoreOne=.F.
      Endif
      *---код группы пустой
      If This.group_list[m.nItog,iG_RemoveBlank] And Empty(This.group_list[m.nItog,iG_OldField]) && !!!!
       m.nIsMoreOne=.F.
      Endif
      If   m.nIsMoreOne
       If  Inlist(This.group_list[m.nItog,iG_position],2,3)
        *---вывести группу
        .Rows( m.nInd).Insert()
        =This.InsRowList(m.nInd)
        Skip -1
        This.print_group( m.nInd,Iif(Empty(This.group_list[m.nItog,iG_BotText]),This.group_list[m.nItog,iG_OldExpr],Eval(This.group_list[m.nItog,iG_BotText])),This.group_list[m.nItog,iG_Height],This.group_list[m.nItog,iG_Color],This.group_list[m.nItog,iG_FontSize],This.group_list[m.nItog,iG_FontName],This.group_list[m.nItog,iG_FontStyle],This.group_list[m.nItog,iG_FontColor],This.group_list[m.nItog,iG_Row],m.lNoTitle,m.cBase,m.nItog)
        Skip 1
        m.nInd= m.nInd+1
       Endif
       *---подитоги
       If This.group_list[m.nItog,iG_Subtotal]!=3 And This.group_list[m.nItog,iG_position]!=4
        m.nSubt=Iif(This.group_list[m.nItog,iG_Subtotal]=2,m.nPos,This.group_list[m.nItog,iG_Head_Row])
        This.subtotal(m.nPlus,m.nPos-1,m.nSubt)
       Endif
      Endif
      *---очистить поля
      If !Empty(This.group_list[m.nItog,iG_ClearFields])
       m.cClearText=''
       If This.group_list[m.nItog,iG_ClearType]=1
        If (m.nPos-m.nPlus)>1
         m.nStartClear=m.nPlus+Iif(This.group_list[m.nItog,iG_position]=4,0,1)
         m.nEndClear =m.nPos-1
        Endif
       Else
        If This.group_list[m.nItog,iG_ClearType]=2
         If (m.nPos-m.nPlus)>1
          m.nStartClear=m.nPlus-Iif(This.group_list[m.nItog,iG_position]=4,1,0)
          m.nEndClear =m.nPos-2
         Endif
        Else
         m.lMegrClear=.T.
         m.cClearText=This.group_list[m.nItog,iG_OldExpr]
         m.nStartClear=m.nPlus-Iif(This.group_list[m.nItog,iG_position]=4,1,0)
         m.nEndClear =m.nPos-1
        Endif
       Endif
       If (m.nPos-m.nPlus)>1 Or This.group_list[m.nItog,iG_ClearType]=3
        This.Clear_Region(This.group_list[m.nItog,iG_ClearFields],m.nStartClear,m.nEndClear,This.group_list[m.nItog,iG_ClearType]==3,m.cClearText,m.nItog)
       Endi
      Endif
      *---Подвал
      If !Empty(This.group_list[m.nItog,iG_FootRow])
       =This.GroupTF(.T.,This.group_list[m.nItog,iG_FootText],This.group_list[m.nItog,iG_FootPrtWhen],m.nItog)
      Endif
     Endfor
    Endif
    *---group title
    For m.nItog= m.nGr To m.nGroupLen
     m.nSaveRow= m.nInd
     *---шапка
     If !Empty(This.group_list[m.nItog,iG_TitRow])
      =This.GroupTF(.F.,This.group_list[m.nItog,iG_TitText],This.group_list[m.nItog,iG_TitPrtWhen],m.nItog)
     Endif
     *---адрес заголовка группы
     This.group_list[m.nItog,iG_Head_Row]=  m.nInd
     *---счетчик
     If m.nItog>m.nGr
      This.group_list[m.nItog,iG_Counter]=1
     Endif
     *---вывести группу
     If !m.lNoTitle And Inlist(This.group_list[m.nItog,iG_position],1,3)
      m.cGroupText=Iif(Empty(This.group_list[m.nItog,iG_TopText]),Evaluate(This.group_list[m.nItog,iG_Expr]),Evaluate(This.group_list[m.nItog,iG_TopText]))
      *---если не пустой текст группы !!!!!
      If !This.group_list[m.nItog,iG_RemoveBlank] Or  !Empty(Evaluate(This.group_list[m.nItog,iG_Field])) &&!!!!!
       .Rows( m.nInd).Insert()
       This.print_group( m.nInd,m.cGroupText,This.group_list[m.nItog,iG_Height],This.group_list[m.nItog,iG_Color],This.group_list[m.nItog,iG_FontSize],This.group_list[m.nItog,iG_FontName],This.group_list[m.nItog,iG_FontStyle],This.group_list[m.nItog,iG_FontColor],This.group_list[m.nItog,iG_Row],.F.,.F.,m.nItog)
       This.InsRowList(m.nInd)
       m.nInd=m.nInd+1
      Endif
     Endif
     *---
     This.group_list[m.nItog,iG_OldExpr]=Evaluate(This.group_list[m.nItog,iG_Expr])
     This.group_list[m.nItog,iG_OldField]=Evaluate(This.group_list[m.nItog,iG_Field])
     *---прогон страницы
     If This.group_list[m.nItog,iG_NewPage] And m.lGfooter And !m.lNoTitle
      .HPageBreaks.Add(.Range(This.k(1,m.nSaveRow)))
     Endif
    Endfor
    *---
    If Type('m.oThermometr')='O'
     This.Update_Thermometer(m.oThermometr,m.pnCounter,This.group_list[m.nGr,iG_OldExpr])
    Endif
    *---выход из цикла
    Exit
   Endif
  Endfor
  Endproc


  *-- Сформировать title или footer
 Hidden Procedure GroupTF
  Lparameters m.lSkip,m.cText,m.cWhen,m.nGroupId
  Local m.lValid,m.cValue ,m.lNoempt25,m.lNoempt26,m.nIn1,m.nIn2
  *--
  m.lValid=.T.
  m.cValue =''
  m.lNoempt25=!Empty(m.cText)
  m.lNoempt26=!Empty(m.cWhen)
  *--если не
  If m.lNoempt25 Or m.lNoempt26
   If m.lSkip
    Skip -1
   Endif
   If m.lNoempt25
    m.cValue =Evaluate(m.cText)
   Endif
   If m.lNoempt26
    m.lValid=Evaluate(m.cWhen)
   Endif
   If m.lSkip
    Skip 1
   Endif
  Endif
  *---
  If (!m.lNoTitle Or (m.lSkip And !Empty(m.cValue ))) And m.lValid
   .Rows(m.nInd).Insert()
   *---
   If m.lSkip
    m.nIn1=iG_FooterRange
    m.nIn2=iG_FooterSubset
   Else
    m.nIn1=iG_HeaderRange
    m.nIn2=iG_HeaderSubset
   Endif
   =This.ins_group(Transform(m.nInd),m.nGroupId,.F.,m.nIn1,m.nIn2)
   *---текст
   If !Empty(m.cValue )
    .Range(This.k(m.nGr_text_col,m.nInd)).Value=m.cValue
   Endif
   *---
   This.InsRowList(m.nInd)
   m.nInd=m.nInd+1
   *---
  Endif
  Endproc


 Procedure add_group
 Lparameters  m.cGRexpr,m.cGRfield,m.nHeight,m.nColor,m.nFontsize,m.cName,m.cStyle,m.nColorIndex,m.nRow,m.cParam,m.nGrTitRow,m.cGrTitText,m.cGrTitPar,m.nGrFootRow,m.cGrFootText,m.cGrFootPar
 Local m.nGrpcnt

 *!*	1-выражение
 *!*	2-поле группы в таблице
 *!*	3-высота
 *!*	4-цвет фона
 *!*	5-размер фонта

 *------парметры шаблона
 *!*	6-фонт
 *!*	7-стиль фонта
 *!*	8-Цвет текста

 If Empty(m.nHeight)
  m.nHeight=14
 Endif
 If Empty(m.nColor)
  m.nColor=15
 Endif
 If Empty(m.nFontsize)
  m.nFontsize=10
 Endif

 If Type('This.group_list(1,3)')='U'
  m.nGrpcnt=1
 Else
  m.nGrpcnt=Alen(This.group_list,1)+1
 Endif
 Dimension This.group_list(m.nGrpcnt,45)

 This.group_list[m.nGrpcnt,iG_Expr]=m.cGRexpr
 This.group_list[m.nGrpcnt,iG_Field]=m.cGRfield
 This.group_list[m.nGrpcnt,iG_Height]=m.nHeight
 This.group_list[m.nGrpcnt,iG_Color]=m.nColor
 This.group_list[m.nGrpcnt,iG_FontSize]=m.nFontsize
 *--Адрес строки для шаблона
 This.group_list[m.nGrpcnt,iG_Row]=m.nRow
 *--фонт
 This.group_list[m.nGrpcnt,iG_FontName]=m.cName
 This.group_list[m.nGrpcnt,iG_FontStyle]=m.cStyle
 This.group_list[m.nGrpcnt,iG_FontColor]=m.nColorIndex

 *---------Group subtotal
 Private m.Position,m.subtotal,m.TopText,m.BottomText,m.ClearFields,m.More_Then_One,m.ClearType,m.New_Page,m.auto_fit,m.RemoveBlank
 m.ClearType=1
 m.ClearFields=''
 m.Position=1
 m.subtotal=1
 m.TopText=''
 m.BottomText=''
 m.More_Then_One=.F.
 m.New_Page=.F.
 m.auto_fit=.F.
 m.RemoveBlank=.F.

 If Vartype(m.cParam)='C'
  This.key_to_str(m.cParam,.T.)
  If Vartype(m.ClearType)!='N'
   m.ClearType=1
  Endif
  If Vartype(m.auto_fit)!='L'
   m.auto_fit=.F.
  Endif
  *---удалять с пустым выражением группы
  If Vartype(m.RemoveBlank)!='L'
   m.RemoveBlank=.F.
  Endif
  If Vartype(m.New_Page)!='L'
   m.New_Page=.F.
  Endif
  If Vartype(m.More_Then_One)!='L'
   m.More_Then_One=.F.
  Endif
  If Vartype(m.ClearFields)!='C'
   m.ClearFields=''
  Endif
  *---
  If Vartype(m.TopText)!='C'
   m.TopText=''
  Endif
  *---
  If Vartype(m.BottomText)!='C'
   m.BottomText=''
  Endif
  *---
  If Vartype(m.Position)!='N' .Or. !Inlist(m.Position,1,2,3,4)
   m.Position=1
  Endif
  *--
  If Vartype(m.subtotal)!='N'
   m.subtotal=1
  Endif
  *--
  If m.Position<3
   If m.subtotal!=3
    m.subtotal=m.Position
   Endif
  Endif
 Endif

 This.group_list[m.nGrpcnt,iG_position]=m.Position
 This.group_list[m.nGrpcnt,iG_ClearFields]=m.ClearFields
 This.group_list[m.nGrpcnt,iG_More_then_one]=m.More_Then_One
 This.group_list[m.nGrpcnt,iG_ClearType]=m.ClearType
 This.group_list[m.nGrpcnt,iG_Subtotal]=m.subtotal
 This.group_list[m.nGrpcnt,iG_TopText]=Strtran(m.TopText,'@','eval(this.group_list[m.nItog,'+Alltrim(Str(iG_Expr))+'])')
 This.group_list[m.nGrpcnt,iG_BotText]=Strtran(m.BottomText,'@','this.group_list[m.nItog,'+Alltrim(Str(iG_OldExpr))+']')
 This.group_list[m.nGrpcnt,iG_NewPage]=m.New_Page
 This.group_list[m.nGrpcnt,iG_AutoFit]=m.auto_fit
 This.group_list[m.nGrpcnt,iG_RemoveBlank]=m.RemoveBlank
 *--
 If This.group_list[m.nGrpcnt,iG_ClearType]=3
  This.group_list[m.nGrpcnt,iG_StartColM]=m.nGrpcnt
 Else
  This.group_list[m.nGrpcnt,iG_StartColM]=1
 Endif
 *-----

 *----GROUP FOOTER
 Private m.PrintWhen ,m.MergeCells,m.auto_fit
 *--
 m.PrintWhen=''
 m.MergeCells=.F.
 m.auto_fit=.F.
 *--
 This.group_list[m.nGrpcnt,iG_FootRow]=m.nGrFootRow
 This.group_list[m.nGrpcnt,iG_FootText]=m.cGrFootText
 *--
 If Vartype(m.cGrFootPar)='C'
  This.key_to_str(m.cGrFootPar,.T.)
  If Vartype(m.auto_fit)!='L'
   m.auto_fit=.F.
  Endif
  If Vartype(m.PrintWhen)!='C'
   m.PrintWhen=''
  Endif
  If Vartype(m.MergeCells)!='L'
   m.MergeCells=.F.
  Endif
  This.group_list[m.nGrpcnt,iG_FootPrtWhen]=m.PrintWhen
  This.group_list[m.nGrpcnt,iG_FootMrgCell]=m.MergeCells
  This.group_list[m.nGrpcnt,iG_FootAutoFit]=m.auto_fit
 Endif
 *-----FOOTER END

 *----GROUP title
 Private m.PrintWhen ,m.MergeCells,m.auto_fit
 *--
 m.PrintWhen=''
 m.MergeCells=.F.
 m.auto_fit=.F.
 *-- 30-35
 This.group_list[m.nGrpcnt,iG_TitRow]=m.nGrTitRow
 This.group_list[m.nGrpcnt,iG_TitText]=m.cGrTitText

 If Vartype(m.cGrTitPar)='C'
  This.key_to_str(m.cGrTitPar,.T.)
  If Vartype(m.auto_fit)!='L'
   m.auto_fit=.F.
  Endif
  If Vartype(m.PrintWhen)!='C'
   m.PrintWhen=''
  Endif
  If Vartype(m.MergeCells)!='L'
   m.MergeCells=.F.
  Endif
  This.group_list[m.nGrpcnt,iG_TitPrtWhen]=m.PrintWhen
  This.group_list[m.nGrpcnt,iG_TitMrgCell]=m.MergeCells
  This.group_list[m.nGrpcnt,iG_TitAutoFit]=m.auto_fit
 Endif
 *-----FOOTER END
 Return m.nGrpcnt
 Endproc


 Hidden Procedure print_group
  Lparameters  m.nRow,m.uValue,m.nHeight,m.nColor,m.nSize,m.cName,m.cStyle,m.nColorIndex,m.nShabRow,m.lNoTitle,m.cBase,m.nGroupId
  Local m.cRange,m.oGroupBand,m.nGrStartCol
  *---диапазон групп
  If !Empt(m.nGroupId)
   =This.ins_group(Transform(m.nRow),m.nGroupId,.F.,iG_SubtRange,iG_SubtSubset)
  Endif
  *---если шаблон,копировать
  If This.forceshablondata
   If !Empty(m.uValue)
    *---начальная колонка
    m.nGrStartCol= Max(This.group_list[m.nGroupId,iG_StartColM],m.nGr_text_col)
    .Range(This.k(m.nGrStartCol,m.nRow)).Value =m.uValue
   Endif
  Else
   *---диапазон
   m.cRange='A'+Transform(m.nRow)+':'+This.NumToExcel(This.column_count)+Transform(m.nRow)
   m.oGroupBand=.Range(m.cRange)
   *---для первой и последней группы восстановим формат ячеек
   If m.nRow= m.nDB
    .Range('A'+Alltrim(Str( m.nDB+1))+':'+This.NumToExcel(This.column_count)+Alltrim(Str( m.nDB+1))).Copy()
    m.oGroupBand.PasteSpecial(xlPasteFormat)
    _Cliptext=''
   Endif
   If  m.lNoTitle
    .Range('A'+m.cBase+':'+This.NumToExcel(This.column_count)+m.cBase).Copy()
    m.oGroupBand.PasteSpecial(xlPasteFormat)
    _Cliptext=''
   Endif
   *---Цвет фона
   m.oGroupBand.Interior.ColorIndex = m.nColor
   *---Высота строки
   If !Empty(m.nHeight)
    .Rows(m.nRow).RowHeight=m.nHeight
   Endif
   *---
   With m.oGroupBand.Font
    .Name = "Arial Cyr"
    .FontStyle = "полужирный"
    .Size =m.nSize
   Endwith
   *---
   If !Empty(m.uValue)
    With .Cells(m.nRow,m.nGr_text_col)
     *---выравнивание текста
     .ShrinkToFit =.F.
     .WrapText=.F.
     .Value =m.uValue
    Endwith
   Else
    With m.oGroupBand
     .NumberFormat = "#,##0.000"
     .ShrinkToFit =.T.
    Endwith
   Endif
  Endif
  Endproc


  *-- Добавить в список добавленных строк
 Hidden Procedure InsRowList
  Lparameters  m.nAddRow
  Local  m.nAlen
  m.cGroupCellList=m.cGroupCellList+'$'+Transform( m.nAddRow)+';'
  m.nAlen=Alen(This.rowlist)+1
  Dimension This.rowlist( m.nAlen)
  This.rowlist( m.nAlen)= m.nAddRow+m.nRowBase
  Endproc


  *-- Перевод строки в Exel в номер записи таблицы
 Procedure rowtorecord
 Lparameters m.nRow
 Local  m.nIndex, m.nCounter
 m.nCounter=m.nRow+1-This.title_height -This.phrowcount
 For  m.nIndex=1 To Alen (This.rowlist)
  Do Case
   Case  This.rowlist( m.nIndex)<m.nRow
    m.nCounter= m.nCounter-1
   Case  This.rowlist( m.nIndex)=m.nRow
    m.nCounter=-1
    Exit
   Otherwise
    Exit
  Endcase
 Endfor
 Return  m.nCounter
 Endproc


 *-- Загрузить VBA модуль *.bas
 Procedure add_module
 Lparameters  m.cModule,m.vVBComponents
 Local m.nAlen
 If Type('this.module_list(1)')='L'
  m.nAlen=1
 Else
  m.nAlen=Alen(This.module_list,1)+1
 Endif
 Dimension  This.module_list( m.nAlen,2)
 This.module_list( m.nAlen,iVB_FileName)= m.cModule
 This.module_list( m.nAlen,iVB_Component)= m.vVBComponents
 Endproc


 Hidden Procedure Get_Sheet
  Lparameters  m.oWb
  Local  m.nChart,m.cNames, m.nNoChart, m.nWs
  m.cNames=';'
  For  m.nChart=1 To  m.oWb.charts.Count
   m.cNames=m.cNames+m.oWb.charts(m.nChart).Name+';'
  Endfor
  m.nNoChart=1
  For   m.nWs=1 To  m.oWb.WorkSheets.Count
   If !(';'+ m.oWb.WorkSheets( m.nWs).Name+';'$m.cNames Or '@'$ m.oWb.WorkSheets( m.nWs).Name)
    m.nNoChart= m.nWs
    Exit
   Endif
  Endfor
  Return m.nNoChart
  Endproc


  *-- Создать структуру
 Procedure add_outline
 Lparameters  m.lNoOLColumn,m.nRowLevels,m.nColumnLevels
 With This
  .noolcolumn= m.lNoOLColumn
  .autooutline=.T.
  If Vartype(m.nRowLevels)!='N'
   m.nRowLevels=0
  Endif
  If Vartype(m.nColumnLevels)!='N'
   m.nColumnLevels=0
  Endif
  .ol_row_levels=m.nRowLevels
  .ol_column_levels=m.nColumnLevels
 Endwith
 Endproc


 *-- Очистить регионы
 Hidden Procedure Clear_Region
  Lparameters  m.cRegion,m.nStartRow,m.nEndRow, m.lMerge,m.cClearText,m.nItog
  m.cRegion=Strtran( m.cRegion,'$',Alltrim(Str(m.nStartRow)))
  m.cRegion=Strtran( m.cRegion,'#',Alltrim(Str(m.nEndRow)))
  With m.oXlWS1.Range( m.cRegion)
   If  m.lMerge
    .MergeCells=.T.
    .Value=m.cClearText
    .Rows.AutoFit()
   Else
    .ClearContents()
    .Interior.ColorIndex = 2
    .BorderS(xlInsideVertical).LineStyle = xlNone
    .BorderS(xlInsideHorizontal).LineStyle = xlNone
   Endif
  Endwith
  Endproc


 Hidden Procedure make_p
  Lparameters  m.lNoShowRep
  Local m.cRange, m.nMaxFixW,m.nMaxFixC,m.nRow, m.nIndex1,m.nIndex2, m.cRanCNT,m.nNumStartValue,m.nFirstRow,m.nColRow,m.d_str,m.nCol,m.nRow,m.cTitleColums,m.cTitleRows
  Private m.oXlApp,m.nGr,m.nInd, m.pnCounter,m.oXlWB1,m.oXlWB1WS1,m.oXlWS1,m.oXlWB2,m.oXlWb2Ws1,m.nRowBase, m.nDB,m.nDE,cDataRange, m.cFormu,m.oUnionGroup,m.oThermometr
  m.nDB=1
  m.nDE=This.row_count +1
  m.nRowBase=This.title_height +This.phrowcount
  *---
  m.nStarttime=Seconds()
  *---отладка
  If This._debug
   With This.xl_app
    .Interactive = .T.
    .DisplayAlerts = .F.
    .Application.Visible =.T.
    .ScreenUpdating =.T.
   Endwith
  Endif
  *---откроем таблицу
  If Empty(This.Pattern)
   *---массив
   If This.use_array
    This.xl_app.Workbooks.Add()
    With This.xl_app.Workbooks(1).WorkSheets(1)
     .Range('A1:'+This.k(Alen(This.column_list,1),This.row_count)).Value=This.get_array('aData_Array')
    Endwith
   Else
    *---таблица
    This.xl_app.Workbooks.Add(Fullp(This.xlfile))
   Endif
  Else
   *---шаблон
   This.open_data(This.Pattern,This.xlfile)
  Endif
  *---ссылки
  m.oXlWB1=This.xl_app.Workbooks(1)
  m.oXlWB1WS1=This.xl_app.Workbooks(1).WorkSheets(1)
  m.oXlWS1=This.xl_app.WorkSheets(1)
  m.oXlApp=This.xl_app
  *---
  m.oXlWS1.EnableCalculation = .F.
  *---загрузить vba модули
  This._Load_Vbm()
  *---
  With m.oXlWS1
   *---удалим имена полей
   If !This.use_array
    .Rows(1).Delete()
   Endif
   *---шапка
   =This.er_Message(DataFormat)
   *---высота строк
   If !Empt(This.row_height)
    .Rows('1:'+Transform(This.row_count)).RowHeight=This.row_height
   Endif
   *---формулы и форматы колонок
   For m.nInd=1 To Alen(This.column_list,1)
    m.cRange=This.k(m.nInd,1)+':'+This.k(m.nInd,This.row_count)
    *---ШИРИНА КОЛОНОК
    .Columns(m.nInd).ColumnWidth = This.column_list[m.nInd,iC_Width]
    *---
    With .Range(m.cRange)
     If !Empt(This.column_list[m.nInd,iC_Formula])
      *---если необходима формула в группе ,отложим
      *---нумератор ?
      If '~'$This.column_list[m.nInd,iC_Formula] .And. m.lERNoEmpty
       *---нумерация в пределах всего отчета ,или нет групп
       If '~1'$This.column_list[m.nInd,iC_Formula] Or !m.lIsGroup
        m.cRanCNT=This.k(m.nInd,2)+':'+This.k(m.nInd,This.row_count)
        m.nNumStartValue=1
        If '$'$This.column_list[m.nInd,iC_Formula]
         m.nNumStartValue=Eval(Substr( This.column_list[m.nInd,iC_Formula],Atc('$',This.column_list[m.nInd,iC_Formula])+1 ))
        Endif
        m.oXlWS1.Cells(1,m.nInd)=m.nNumStartValue
        If This.row_count>1
         m.oXlWS1.Range( m.cRanCNT).FormulaR1C1='=R[-1]+1'
        Endif
       Else
        *---нумерация в пределах групп
        If m.nInd=1
         *---если 1 колонка ,надо сдвигать текст группы
         m.nGr_text_col=2
        Endif
       Endif
      Else
       m.cFormu=This.f_trans(This.column_list[m.nInd,iC_Formula])
       If This.is_r1c1(@m.cFormu)
        .FormulaR1C1=m.cFormu
       Else
        .Formula=m.cFormu
       Endif
      Endif
     Else
      *---если пустая колонка ,очистим
      If This.column_list[m.nInd,iC_IsFormula]
       .ClearContents()
      Endif
     Endif
     *---
     .ShrinkToFit =.T.
     *---выравнивание текста
     If This.column_list[m.nInd,iC_NoFit]
      .ShrinkToFit =.F.
      If This.column_list[m.nInd,iC_Wrap]
       .WrapText=.T.
      Endif
     Endif
     *---формат
     If Empt(This.column_list[m.nInd,iC_Format])
      .NumberFormat ="General"
     Else
      .NumberFormat =This.column_list[m.nInd,iC_Format]
     Endif
     *---цвет фона
     If Type('this.column_list[m.nInd,'+Padr(iC_Color,1)+']')='N'
      .Interior.ColorIndex = This.column_list[m.nInd,iC_Color]
      *.Interior.Pattern = 2
      *.Interior.PatternColor =
     Endif
     *---по горизонтали
     If !Empt(This.column_list[m.nInd,iC_HorizontalAlignment])
      .HorizontalAlignment = This.column_list[m.nInd,iC_HorizontalAlignment]
     Endif
     *---по вертикали
     If !Empt(This.column_list[m.nInd,iC_VerticalAlignment])
      .VerticalAlignment = This.column_list[m.nInd,iC_VerticalAlignment]
     Endif
     *---ориентация текста
     If !Empt(This.column_list[m.nInd,iC_Orientation])
      .Orientation = This.column_list[m.nInd,iC_Orientation]
     Endif
     *---отступ текста
     If !Empt(This.column_list[m.nInd,iC_IndentLevel])
      .IndentLevel = This.column_list[m.nInd,iC_IndentLevel]
     Endif
     *---2 фонт
     With .Font
      If This.column_list[m.nInd,iC_FontDouble]
       .FontStyle = "полужирный"
      Endif
      *--- фонт size
      If !Empty(This.column_list[m.nInd,iC_Fontsize])
       .Size =This.column_list[m.nInd,iC_Fontsize]
      Endif
      *--- фонт
      If !Empty(This.column_list[m.nInd,iC_Fontname])
       .Name =This.column_list[m.nInd,iC_Fontname]
      Endif
     Endwith
    Endwith
   Endfor
   *---автоформат
   This._autofit(.UsedRange)
   This._Fit_Column(1)
   *---Сортировка
   This._sort(.UsedRange)
   *---включим расчет
   If .EnableCalculation
    .EnableCalculation = .F.
   Endif
   *---диапазон добавл строк
   m.oUnionGroup=Null
   m.oUnionSubtotal=Null
   *---
   If m.lIsGroup
    *---заголовки групп и итоги по группам
    m.pnCounter=0
    m.nInd=1
    *---
    Wait Clear
    Sele (This.dbf_name)
    *--кол групп
    m.nGroupLen=Alen(This.group_list,1)
    *---регионы для удаления данных
    For  m.nIndex1=1 To m.nGroupLen
     If !Empty(This.group_list[ m.nIndex1 ,iG_ClearFields])
      *---убрать пробелы
      This.group_list[ m.nIndex1,iG_ClearFields]=Strtran(This.group_list[ m.nIndex1,iG_ClearFields],' ','')
      *---добавим разделитель
      If !(':'$This.group_list[ m.nIndex1,iG_ClearFields])
       This.group_list[ m.nIndex1,iG_ClearFields]=This.group_list[ m.nIndex1,iG_ClearFields]+':'+This.group_list[ m.nIndex1,iG_ClearFields]
      Endif
      For m.nIndex2=1 To Alen(aTmpArray,1)
       If m.aTmpArray[m.nIndex2,1]$This.group_list[ m.nIndex1,iG_ClearFields]
        This.group_list[ m.nIndex1,iG_ClearFields]=Strtran(This.group_list[ m.nIndex1,iG_ClearFields],m.aTmpArray[m.nIndex2,1],This.NumToExcel(This.nametocol(m.aTmpArray[m.nIndex2,2])))
       Endif
      Endfor
      This.group_list[ m.nIndex1,iG_ClearFields]=Strtran(This.group_list[ m.nIndex1,iG_ClearFields],':','$:')
      This.group_list[ m.nIndex1,iG_ClearFields]=Strtran(This.group_list[ m.nIndex1,iG_ClearFields],';','#;')+'#'
     Endif
    Endfor
    *---
    If !(Type('m.lerNoThermom')='L' And m.lerNoThermom)
     m.oThermometr=This.Create_Thermometer(Reccount(), CreateGroup)
    Endif
    *---Создание групп отчета
    Scan
     =This.make_group()
     m.nInd=m.nInd+1
    Endscan
    *---Последняя группа
    =This.make_group(.T.)
    If Type('m.oThermometr')='O'
     This.Close_Thermometer(m.oThermometr)
    Endif
   Else
    m.nInd=This.row_count+1
   Endif
   *---Итоги  по отчету
   If This.lsummed
    =This.select_row(m.nInd)
    =This.subtotal(1,m.nInd-1,m.nInd,.T.)
    =This.print_group(m.nInd,' ',20,15,12)
   Else
    m.nInd=m.nInd-1
   Endif
   *---количество строк в отчете
   This.row_count=m.nInd+1
   *---
   m.cGroupCellList=Left(m.cGroupCellList,Len(m.cGroupCellList)-1)
   m.cSubtCellList=Left(m.cSubtCellList,Len(m.cSubtCellList)-1)
   *---формулы для групп
   m.nFirstRow=Val(Left(m.cSubtCellList,Atc(';',m.cSubtCellList)))
   For  m.nIndex1=1 To Alen(This.column_list,1)
    *---формулы в итогах
    If This.column_list( m.nIndex1,iC_NoFit) And !Empty(This.column_list[ m.nIndex1,iC_CalcFunct]) And !Empt(m.cSubtCellList)
     m.cRange=Strtran(m.cSubtCellList,'$',This.NumToExcel( m.nIndex1))
     m.cFormu='='+This.f_trans(This.column_list[ m.nIndex1,iC_CalcFunct],m.nFirstRow,This.row_count-1)
     If This.is_r1c1(@m.cFormu)
      .Range(m.cRange).FormulaR1C1=m.cFormu
     Else
      .Range(m.cRange).Formula=m.cFormu
     Endif
    Else
     *---
     If !Empt(This.column_list[ m.nIndex1 ,iC_Formula])
      If This.column_list[ m.nIndex1 ,iC_GroupFormula] And !Empt(m.cSubtCellList)
       m.cRange=Strtran(m.cSubtCellList,'$',This.NumToExcel( m.nIndex1))
       m.cFormu=This.f_trans(This.column_list[ m.nIndex1,iC_Formula],m.nFirstRow,This.row_count-1)
       If This.is_r1c1(@m.cFormu)
        .Range(m.cRange).FormulaR1C1=m.cFormu
       Else
        .Range(m.cRange).Formula=m.cFormu
       Endif
      Else
       *---нумератор в пределаг групп ?
       If '~2'$This.column_list[ m.nIndex1,iC_Formula] And m.lIsGroup
        m.cRange=This.k( m.nIndex1,2)+':'+This.k( m.nIndex1,This.row_count-1)
        .Range(m.cRange).FormulaR1C1="=R[-1]+1"
        m.cRange=Strtran(m.cGroupCellList,'$',This.NumToExcel( m.nIndex1))
        .Range(m.cRange).ClearContents()
       Endif
      Endif
     Endif
    Endif
   Endfor
   *---сетка
   m.cRange='A'+Transform(1)+':'+Allt(This.NumToExcel(This.column_count))+Transform(This.row_count-1)
   With .Range(m.cRange)
    .BorderS(1).LineStyle=1
    .BorderS(2).LineStyle=1
    .BorderS(3).LineStyle=1
    .BorderS(4).LineStyle=1
   Endwith
   *---
   =This.er_Message(PgHeadCreate)
   *===колонки
   =This.select_row(1,1)
   m.cRange='1:'+Alltrim(Str(This.phrowcount+This.title_height))
   m.oXlWS1.Rows(m.cRange).Insert()
   *---
   This.titlerow=This.title_height+1
   *---количество строк в отчете
   This.row_count=This.row_count+This.phrowcount+This.title_height
   *---высота заголовка страницы
   .Rows(This.phrowcount+This.title_height).RowHeight=This.pgtitle_height
   m.nMaxFixW=0
   m.nMaxFixC=0
   *---
   For m.nColRow=1 To This.phrowcount
    For m.nInd=1 To Alen(This.column_list,1)
     *---расчет мах широкой колонки из 3 первых для фиксации
     If m.nColRow=1
      If m.nInd<=3
       If m.nMaxFixW<This.column_list[m.nInd,iC_Width]
        m.nMaxFixW=This.column_list[m.nInd,iC_Width]
        m.nMaxFixC=m.nInd
       Endif
      Endif
     Endif
     With  .Cells(This.title_height+1,m.nInd)
      .Font.FontStyle = "полужирный"
      .Orientation = This.column_list[m.nInd,iC_Orient]
      .Value = This.column_list[m.nInd,iC_Text]
      .WrapText = -1
      .HorizontalAlignment =3
      .VerticalAlignment = 2
     Endwith
     m.d_str=This.NumToExcel(m.nInd)+Transform(This.title_height+1)
     With .Range(m.d_str)
      .BorderS(1).Weight=3
      .BorderS(2).Weight=3
      .BorderS(3).Weight=3
      .BorderS(4).Weight=3
     Endwith
    Endfor
   Endfor
   *===колонки конец
   *---имя листа
   .Name=This.sheet_name
   *---разделение панелей
   With This.xl_app.Application.ActiveWindow
    .SplitRow=This.title_height+This.phrowcount
    .splitcolumn=Iif(Empt(This.splitcolumn),0 ,This.splitcolumn)
    .freezepanes = .T.
    .DisplayGridlines =.F.
   Endwith
   *---вывод текста
   *---Вывод строк из массива
   If Type('this.value_list(1,3)')!='U'
    For m.nInd=1 To Alen(This.value_list,1)
     m.nRow =This.value_list(m.nInd,iV_Row)
     If Vartype(m.nRow)='C'
      m.nRow=Evaluate(Strtran(m.nRow,'$',Transform(This.row_count) ))
     Endi
     m.nCol=This.value_list(m.nInd,iV_Col)
     If Vartype(m.nCol)='C'
      m.nCol=Evaluate(Strtran(m.nCol,'#',Transform(This.column_count) ))
     Endif
     *---итоги по колонкам
     If 'ITOG('$Upper(This.value_list(m.nInd,iV_Value))
      This.value_list(m.nInd,iV_Value)=Evaluate('This.'+This.value_list(m.nInd,iV_Value))
     Endif
     *---выражение
     If Left(This.value_list(m.nInd,iV_Value),1)='$'
      This.value_list(m.nInd,iV_Value)=Evaluate(Allt(Strtran(This.value_list(m.nInd,iV_Value),'$','',1,1)))
     Endif
     *---
     This.print_value(m.nRow,m.nCol,This.value_list(m.nInd,iV_Value),This.value_list(m.nInd,iV_NoFit),This.value_list(m.nInd,iV_Wrap),This.value_list(m.nInd,iV_FontDouble),This.value_list(m.nInd,iV_Fontsize),This.value_list(m.nInd,iV_Fontname))
    Endfor
   Endif
   *---вывод РИСУНКОВ из массива
   If Type('this.picture_list(1,3)')!='U'
    For m.nInd=1 To Alen(This.picture_list,iP_Row)
     m.nRow =This.picture_list(m.nInd,iP_Row)
     If Vartype(m.nRow)='C'
      m.nRow=Eval(Strtran(m.nRow,'$',Transform(This.row_count) ))
     Endif
     m.nCol=This.picture_list(m.nInd,iP_Col)
     If Vartype(m.nCol)='C'
      m.nCol=Eval(Strtran(m.nCol,'#',Transform(This.column_count) ))
     Endif
     This.insert_picture(m.nRow,m.nCol,This.picture_list(m.nInd,iP_File),This.picture_list(m.nInd,iP_LockAspectRatio),This.picture_list(m.nInd,iP_Height),This.picture_list(m.nInd,iP_Width))
    Endfor
   Endif
   *---
   m.cTitleColums=''
   m.cTitleRows=''
   *---настройки печати
   =This.er_Message(PageSetupSet)
   *------------------
   With .PageSetup
    If !Empt(m.cTitleRows)
     .PrintTitleRows =m.cTitleRows
    Else
     .PrintTitleRows ='$'+Transform(This.title_height+1)+":"+'$'+Transform(This.title_height+This.phrowcount)
    Endif
    If !Empt(m.cTitleColums)
     .PrintTitleColumns =m.cTitleColums
    Endif
    If !Empty(This.page_orient)
     .Orientation=This.page_orient
    Endif
    If Empty(This.Pattern)
     .PrintGridlines = .F.
     If !This.nopagesetup
      .LeftMargin = 0
      .RightMargin = 0
      .BottomMargin = 0
      .TopMargin = 30
      .HeaderMargin =0
      .FooterMargin =0
      .CenterHorizontally = -1
     Endif
     .Zoom = .F.
     .FitToPagesWide = 1
     .FitToPagesTall = 300
     *.RightHeader = '&""Arial Cyr,bold\&10Лист &P'
     If Isnull(This.rightheader)
      .rightheader =''
     Else
      .rightheader =Evl(This.rightheader,'&""&10Лист &P')
     Endif
    Endif
   Endwith
   *---
   .Activate()
   .Cells(1,1).Select()
   This.row_count=This.row_count-1
   *---диаграммы
   If This.make_chart
    If !.EnableCalculation
     .EnableCalculation = .T.
    Endif
    =This.print_chart()
   Endif
   *---загрузить рисунки в колонки
   This.Load_picture()
   *---автофильтр
   This.make_autofilter()
   *---разбить на колонки
   If This.multicolumn
    This.make_column()
   Endif
   m.oXlApp.Goto(.Range('A1'),.T.)
  Endwith
  *---

  Release m.oXlWB1,m.oXlWB1WS1,m.oXlWS1,m.oXlWB2,m.oXlWb2Ws1,m.oXlApp
  m.cTimeWork=Transform(Seco()-m.nStarttime)
  *Wait  m.cTimeWork Window Nowait
  *_vfp.StatusBar=m.cTimeWork
  Endproc


 Hidden Procedure make_s
  Lparameters  m.lNoShowRep
  Local m.cRange,m.cRanges,m.nIndex_1,m.nIndex_2,m.vValue,m.cValue,m.nStarttime,;
   m.nX_count,m.nStep,m.nAll,m.nNumber3,m.nVpos,m.cEText,m.cRanCNT,m.nNumStartValue,m.cFormulaText,;
   m.nFirstRow,m.oSel,m.lFind,m.oFindCell,m.oFR1,m.oFR2,m.cTmp1,m.cTmp2,m_OldErrorHandler
  *---
  m_OldErrorHandler=On('error')
  *---
  Private  m.nInd,m.pnCounter, m.oXlWB1,m.oXlWB1WS1,m.oXlWS1,m.oXlWB2,m.oXlWb2Ws1,m.oXlApp;
   m.nRowBase,m.nDB,m.nDE,m.cDataRange,m.oUnionGroup,m.nGroupLen,m.nWs,m.nNumber1,m.nNumber2,m.lErrorCopy,m.oThermometr
  *---
  m.nRowBase=0
  *---
  If Type('m.nStarttime')='U'
   m.nStarttime= Seconds()
  Endif
  *---откроем таблицу и скопируем в шаблон
  With This.xl_app.Workbooks
   .Add(This.xlfile)
   If !This.use_array
    .Add(Fullpath('tmpdata.xls'))
   Endif
  Endwith
  *---
  If !This.use_array
   With This.xl_app.Workbooks(2)
    With .WorkSheets(1)
     .EnableCalculation = .F.
     .Rows(1).Delete()
    Endwith
    .Saved=.T.
   Endwith
  Endif
  *---Отладка
  If This._debug
   With This.xl_app
    .Interactive = .T.
    .DisplayAlerts = .F.
    .Application.Visible =.T.
    .ScreenUpdating =.T.
   Endwith
  Endif
  *---
  With This.xl_app.Workbooks(1)
   .Activate()
   m.nWs=This.Get_Sheet(This.xl_app.Workbooks(1))
   m.oXlWS1=.WorkSheets(m.nWs)
   m.oXlWB1WS1=.WorkSheets(m.nWs)
   With m.oXlWS1
    .Select()
    .EnableCalculation = .F.
    .Columns(1).Delete()
    *---удалим низ
    m.nNumber1=This.endrow
    .Rows(Transform(m.nNumber1)+':'+Transform(m.nNumber1+150)).Delete()
    *---для xtab
    If This.is_xtab
     m.nX_count=This.x_count-1
     If  m.nX_count>0
      m.nStep=0
      m.nAll=0
      Do While m.nAll<m.nX_count
       m.nNumber3=2^m.nStep
       If m.nNumber3+m.nAll>m.nX_count
        m.nNumber3=m.nX_count-m.nAll
       Endif
       m.nNumber2=This.detalrow+3
       With This
        m.cRange=.k(.x_begin,.titlerow)+':'+.k(.x_begin+(.x_step*m.nNumber3)-1,m.nNumber2)
       Endwith
       .Range(m.cRange).Insert(xlShiftToRight)
       m.nStep=m.nStep+1
       m.nAll=m.nAll+m.nNumber3
      Enddo
      With This
       m.cRange=.k(.x_begin+(.x_step*m.nX_count),.titlerow)+':'+.k(.x_begin+(.x_step*m.nX_count)+.x_step-1,m.nNumber2)
       m.cRanges=.k(.x_begin,.titlerow)+':'+.k(.x_begin+(.x_step*m.nX_count)-1,m.nNumber2)
      Endwith
      .Range(m.cRange).Copy(.Range(m.cRanges))
     Endif
    Endif
    *---скопируем шаблон
    .Copy(m.oXlWS1)
    *---ссылки на шаблон
    m.oXlWB2=This.xl_app.Workbooks(1)
    m.oXlWb2Ws1=m.oXlWB2.WorkSheets(m.nWs)
    m.oXlWb2Ws1.EnableCalculation = .F.
    *---удалим от заголовка до подала
    m.nNumber1=This.phrowcount+This.title_height+1
    m.nDB= m.nNumber1
    m.nNumber2=This.detalrow +2
    .Rows(Transform(m.nNumber1)+':'+ Transform(m.nNumber2)).Delete()
    *---текст в shapes
    m.oXlWS1.Select()
    For m.nIndex_1=1 To .shapes.Count
     If Inlist(.shapes(m.nIndex_1).Type,1,17)
      .shapes(m.nIndex_1).Select()
      With This.xl_app.Selection
       If Type('.Characters.Text')="C"
        m.cEText=.Characters.Text
        If '$'$m.cEText
         m.nVpos=At('$',m.cEText)
         m.cValue=Null
         m.cValue= Eval(Rtrim(Substr(m.cEText,m.nVpos+1)))
         If Isnull(m.cValue)
          m.cEText='?Ошибка?'
         Else
          m.cEText=Left(m.cEText,m.nVpos-1)+ Alltrim(Padr(m.cValue,240))
         Endif
         .Characters.Text= m.cEText
        Endif
       Endif
      Endwith
     Endif
    Endfor
    *---добавим строки
    m.nDE=This.phrowcount+This.title_height+This.row_count
    m.nNumber2=m.nDE+Iif(This.lsummed,1,0)
    .Rows(Transform(m.nNumber1)+':'+ Transform(m.nNumber2)).Insert()
    *---данные (диапазон)
    m.cDataRange=This.k(1,m.nDB)+':'+This.k(This.column_count,m.nDE)
    *--высота строк
    If !Empt(This.row_height)
     .Rows(Transform(m.nDB)+':'+Transform(m.nDE)).RowHeight=This.row_height
    Endif
    *---форматы
    m.cRanges=This.k(1,This.detalrow)+':'+This.k(This.column_count,This.detalrow)
    With m.oXlWb2Ws1.Range(m.cRanges)
     .ClearContents()
     m.lErrorCopy=.F.
     On Error Store .T. To m.lErrorCopy
     .Copy(m.oXlWS1.Range(m.cDataRange))
     On Error &m_OldErrorHandler
     If m.lErrorCopy
      *---ну очень большой диапазон
      m.nBegin=m.nDB
      m.nEnd=m.nDB+Int((m.nDE-m.nDB)/2)
      m.cDataRange=This.k(1,m.nBegin)+':'+This.k(This.column_count,m.nEnd)
      .Copy(m.oXlWS1.Range(m.cDataRange))
      m.nBegin=m.nEnd+1
      m.nEnd=m.nDE
      m.cDataRange=This.k(1,m.nBegin)+':'+This.k(This.column_count,m.nEnd)
      .Copy(m.oXlWS1.Range(m.cDataRange))
     Endif
    Endwith
    *---вставим данные
    If This.use_array
     *---массив
     .Range(m.cDataRange).Value=This.get_array('aData_Array')
    Else
     m.nNumber1=This.phrowcount+This.title_height+1
     This.xl_app.Workbooks(2).WorkSheets(1).UsedRange.Copy()
     .Range('A'+Transform(m.nNumber1)).PasteSpecial(xlValues)
     _Cliptext=''
    Endif
   Endwith
  Endwith
  If !This.use_array
   *--сохранить
   With This.xl_app.Workbooks(2)
    .Saved=.T.
    .Close()
   Endwith
  Endif
  m.oXlWS1.Select()
  m.oXlApp=This.xl_app
  *---
  If !This.no_delete
   Erase (This.xlfile)
  Endif
  If !This.use_array
   Erase (Fullpath('tmpdata.xls'))
  Endif
  *---загрузить vba модули
  This._Load_Vbm()
  *---ссылки
  m.oXlWB1=This.xl_app.Workbooks(1)
  m.oXlWB1.Activate()
  m.oXlWB1WS1.Select()
  *---
  Release m.nWs,m.nX_count,m.nNumber1,m.nNumber2
  *---
  With m.oXlWS1
   *---шапка
   This.er_Message(DataFormat)
   *---формулы
   For m.nInd=1 To Alen(This.column_list,1)
    m.cRange=This.k(m.nInd,m.nDB)+':'+This.k(m.nInd,m.nDE)
    *---ШИРИНА КОЛОНОК
    If This.is_xtab And .Columns(m.nInd).ColumnWidth!=This.column_list[m.nInd,iC_Width]
     .Columns(m.nInd).ColumnWidth = This.column_list[m.nInd,iC_Width]
    Endif
    *---
    With .Range(m.cRange)
     If !Empty(This.column_list[m.nInd,iC_Formula])
      *---если необходима формула в группе ,отложим
      *---нумератор ?
      If '~'$This.column_list[m.nInd,iC_Formula] .And. lERNoEmpty
       *---нумерация в пределах всего отчета ,или нет групп
       If '~1'$This.column_list[m.nInd,iC_Formula] Or !m.lIsGroup
        m.cRanCNT=This.k(m.nInd,m.nDB+1)+':'+This.k(m.nInd,m.nDE)
        m.nNumStartValue=1
        If '$'$This.column_list[m.nInd,iC_Formula]
         m.nNumStartValue=Eval(Substr(This.column_list[m.nInd,iC_Formula],Atc('$',This.column_list[m.nInd,iC_Formula])+1 ))
        Endif
        m.oXlWS1.Cells(m.nDB,m.nInd)=m.nNumStartValue
        If This.row_count>1
         m.oXlWS1.Range(m.cRanCNT).FormulaR1C1='=R[-1]+1'
        Endif
       Else
        If '~3'$This.column_list[m.nInd,iC_Formula] Or !m.lIsGroup
         m.cRanCNT=This.k(m.nInd,m.nDB)+':'+This.k(m.nInd,m.nDE)
         m.nNumStartValue=1
         If '$'$This.column_list[m.nInd,iC_Formula]
          m.nNumStartValue=Eval(Substr( This.column_list[m.nInd,iC_Formula],Atc('$',This.column_list[m.nInd,iC_Formula])+1 ))
         Endif
         m.oXlWS1.Cells(m.nDB,m.nInd)=m.nNumStartValue
         If This.row_count>1
          m.oXlWS1.Range(m.cRanCNT).DataSeries()
         Endif
        Else
         *---нумерация в пределах групп
         If m.nInd=1
          *---если 1 колонка ,надо сдвигать текст группы
          m.nGr_text_col=2
         Endif
        Endif
       Endif
      Else
       m.cFormulaText=This.f_trans(This.column_list[m.nInd,iC_Formula],m.nDB)
       If This.is_r1c1(@m.cFormulaText)
        .FormulaR1C1=m.cFormulaText
       Else
        .Formula=m.cFormulaText
       Endif
      Endif
     Else
      *---если пустая колонка ,очистим
      If This.column_list[m.nInd,iC_IsFormula]
       .ClearContents()
      Endif
     Endif
    Endwith
   Endfor
   *---
   .Range('A1').Select()
   *---автоформат
   This._autofit(.Range(m.cDataRange))
   This._Fit_Column(1)
   *---Сортировка
   This._sort(.Range(m.cDataRange))
   *---выключим расчет
   If .EnableCalculation
    .EnableCalculation = .F.
   Endif
   *---диапазонв добавл строк
   m.oUnionGroup=Null
   m.oUnionSubtotal=Null
   *---группировка данных
   If m.lIsGroup
    *---заголовки групп и итоги по группам
    m.pnCounter=0
    m.nInd=m.nDB
    *----
    Wait Clear
    Sele (This.dbf_name)
    *---кол групп
    m.nGroupLen=Alen(This.group_list,1)
    *---регионы для удаления данных
    For m.nIndex_1=1 To m.nGroupLen
     If !Empty(This.group_list[m.nIndex_1 ,iG_ClearFields])
      *---убрать пробелы
      This.group_list[m.nIndex_1,iG_ClearFields]=Strtran(This.group_list[m.nIndex_1,iG_ClearFields],' ','')
      *---добавим разделитель
      If !(':'$This.group_list[m.nIndex_1,iG_ClearFields])
       This.group_list[m.nIndex_1,iG_ClearFields]=This.group_list[m.nIndex_1,iG_ClearFields]+':'+This.group_list[m.nIndex_1,iG_ClearFields]
      Endif
      For m.nIndex_2=1 To Alen(aTmpArray,1)
       If m.aTmpArray[m.nIndex_2,1]$This.group_list[m.nIndex_1,iG_ClearFields]
        This.group_list[m.nIndex_1,iG_ClearFields]=Strtran(This.group_list[m.nIndex_1,iG_ClearFields],m.aTmpArray[m.nIndex_2,1],This.NumToExcel(This.nametocol(m.aTmpArray[m.nIndex_2,2])))
       Endif
      Endfo
      This.group_list[m.nIndex_1,iG_ClearFields]=Strtran(This.group_list[m.nIndex_1,iG_ClearFields],':','$:')
      This.group_list[m.nIndex_1,iG_ClearFields]=Strtran(This.group_list[m.nIndex_1,iG_ClearFields],';','#;')+'#'
     Endif
    Endfo
    *---
    If !(Type('m.lerNoThermom')='L' And m.lerNoThermom)
     m.oThermometr=This.Create_Thermometer(Reccount(), CreateGroup)
    Endif
    *---
    Scan
     =This.make_group()
     m.nInd=m.nInd+1
    Endscan
    *---Создание групп отчета
    =This.make_group(.T.)
    *---
    If Type('m.oThermometr')='O'
     This.Close_Thermometer(m.oThermometr)
    Endif
    *---формат подитогов
    This._format_group()
    *--
   Else
    m.nInd=m.nDE+1
   Endif
   *---
   Go Top
   *---Итоги  по отчету
   If This.lsummed
    *---объединим
    This._union(.Rows(m.nInd))
    *---скопировать форматы
    .Rows(m.nInd).RowHeight=m.oXlWb2Ws1.Rows(This.detalrow+This.sum_ref).RowHeight
    m.cRanges=This.k(1,This.detalrow+This.sum_ref)+':'+ This.k(This.column_count,This.detalrow+This.sum_ref)
    m.oXlWb2Ws1.Range(m.cRanges).Copy
    m.cRanges=This.k(1,m.nInd)+':'+ This.k(This.column_count ,m.nInd)
    .Range(m.cRanges).PasteSpecial(xlPasteFormat)
    _Cliptext=''
    *--
    This.subtotal(m.nDB,m.nInd-1,m.nInd,.T.)
    *---текст в итогах
    For nIndIt=1 To Alen(This.column_list,1)
     If !Empt(This.column_list[nIndIt,iC_ItText])
      .Cells(m.nInd,nIndIt)=This.column_list[nIndIt,iC_ItText]
     Endif
    Endfo
    =This.InsRowList(m.nInd)
   Else
    m.nInd=m.nInd-1
   Endif
   *---количество строк в отчете
   This.row_count=m.nInd+1
   *---список ссылок на номера строк групп и подитогов
   m.cGroupCellList=Left(m.cGroupCellList,Len(m.cGroupCellList)-1)
   m.cSubtCellList=Left(m.cSubtCellList,Len(m.cSubtCellList)-1)
   *---формулы для групп
   If !Isnul(m.oUnionSubtotal)
    m.nFirstRow=m.oUnionSubtotal.Row
   Else
    m.nFirstRow=0
   Endif
   For m.nIndex_1=1 To Alen(This.column_list,1)
    *---формулы в итогах
    If This.column_list(m.nIndex_1,iC_NoFit) And !Empty(This.column_list[m.nIndex_1,iC_CalcFunct]) And !Isnul(m.oUnionSubtotal)
     m.oSel=m.oXlApp.Intersect(m.oUnionSubtotal,.Columns(m.nIndex_1))
     m.cFormulaText='='+This.f_trans(This.column_list[m.nIndex_1,iC_CalcFunct],m.nFirstRow,This.row_count-1)
     If This.is_r1c1(@m.cFormulaText)
      m.oSel.FormulaR1C1=m.cFormulaText
     Else
      m.oSel.Formula=m.cFormulaText
     Endif
     Release m.oSel
    Else
     *---
     If !Empt(This.column_list[m.nIndex_1 ,iC_Formula])
      If This.column_list[m.nIndex_1 ,iC_GroupFormula] And !Isnul(m.oUnionSubtotal)
       m.cFormulaText=This.f_trans(This.column_list[m.nIndex_1,iC_Formula],m.nFirstRow,This.row_count-1)
       m.oSel=m.oXlApp.Intersect(m.oUnionSubtotal,.Columns(m.nIndex_1))
       If This.is_r1c1(@m.cFormulaText)
        m.oSel.FormulaR1C1=m.cFormulaText
       Else
        m.oSel.Formula=m.cFormulaText
       Endif
       Release m.oSel
      Else
       *---нумератор в пределаг групп ?
       If '~2'$This.column_list[m.nIndex_1,iC_Formula] And m.lIsGroup
        m.cRange=This.k(m.nIndex_1,m.nDB)+':'+This.k(m.nIndex_1,This.row_count-1)
        .Range(m.cRange).FormulaR1C1="=R[-1]+1"
        If !Isnull(m.oUnionGroup)
         m.oSel=m.oXlApp.Intersect(m.oUnionGroup,.Columns(m.nIndex_1))
         m.oSel.ClearContents()
         Release m.oSel
        Endif
       Endif
      Endif
     Endif
    Endif
   Endfor
   *---заголовок страницы
   =This.er_Message(PgHeadCreate)
   *---
   This.PageHeadCalc()
   *---скрытые колонки
   This._hide_column(1)
   *---вычислить текст в заголовке и подвале отчета
   m.oFR1=Null
   If  This.endrow>This.detalrow+3
    m.oFR1=.Rows(Transform(This.row_count)+':'+Transform(This.row_count+(This.endrow-1-This.footerrow)))
    If This.title_height>0
     m.oFR2=.Rows('1:'+Transform(This.title_height))
     m.oFR1=m.oXlApp.Union(m.oFR1,m.oFR2)
    Endif
   Else
    If This.title_height>0
     m.oFR1=.Rows('1:'+Transform(This.title_height))
    Endif
   Endif
   *---
   Local m.aStringArray
   Dimension aStringArray(1,2)
   If !Isnull(m.oFR1)
    With m.oFR1
     m.lFind=.T.
     Do While m.lFind
      m.oFindCell=.Find('$')
      If Isnull(m.oFindCell)
       m.lFind=.F.
      Else
       m.vValue=Null
       With  m.oFindCell
        *Wait m.vValue Window
        m.cValue=Allt(Strtran(.Value,'$',''))
        If 'this.itog('$Lower(m.cValue)
         m.aStringArray(Alen(aStringArray,1),1)= m.cValue
         m.aStringArray(Alen(aStringArray,1),2)= .Address
         Dimension aStringArray(Alen(aStringArray,1)+1,2)
        Else
         m.vValue=Eval(m.cValue)
        Endif
        *Wait m.vValue Window
        If Empty(m.vValue)
         m.vValue=Null
        Endif
        If Vartype(m.vValue)='C'
         m.vValue=Left(m.vValue,1000)
        Endif
        .Value=m.vValue
       Endwith
      Endif
     Enddo
     *---wait
     For m.nIndex_1=1 To Alen(aStringArray,1)
      If Vartype(aStringArray(m.nIndex_1,1))='C'
       This.xl_app.Range(aStringArray(m.nIndex_1,2)).Value=Evaluate(aStringArray(m.nIndex_1,1))
      Endif
     Endfor
     * Wait Evaluate("This.Itog('saldo',.t.)") Window
     *   Wait This.Xl_App.Range('H85').value  Window
     Release m.lFind,m.oFindCell,m.oFR1,m.oFR2
    Endwith
   Endif

   *---убрать шаблон
   With m.oXlWb2Ws1
    .Delete()
   Endwith
   *---

   =This.er_Message(PageSetupSet)
   *---настройки печати
   On Error *
   With .PageSetup
    m.cTmp1=Alltrim(.LeftHeader)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .LeftHeader=m.cTmp2
    Endif
    m.cTmp1=Alltrim(.CenterHeader)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .CenterHeader=m.cTmp2
    Endif
    *---.RightHeader
    m.cTmp1=Alltrim(.rightheader)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .rightheader=m.cTmp2
    Endif
    *---.LeftFooter
    m.cTmp1=Alltrim(.LeftFooter)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .LeftFooter=m.cTmp2
    Endif
    *---.CenterFooter
    m.cTmp1=Alltrim(.CenterFooter)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .CenterFooter=m.cTmp2
    Endif
    *---.RightFooter
    m.cTmp1=Alltrim(.RightFooter)
    m.cTmp2=This.key_to_str(m.cTmp1)
    If !(m.cTmp2==m.cTmp1)
     .RightFooter=m.cTmp2
    Endif
    *---
    If Empty(.PrintTitleRows)
     .PrintTitleRows ='$'+Transform(This.title_height+1)+":"+'$'+Transform(This.title_height+This.phrowcount)
    Endif
    If !Empty(This.page_orient)
     .Orientation=This.page_orient
    Endif
   Endwith
   *---
   On Error &m_OldErrorHandler
   .Activate()
   .Range('A1').Select()
   *---имя листа
   If !Empty(This.sheet_name)
    .Name=This.sheet_name
   Endif
   This.row_count=This.row_count-1
   *---диаграммы
   If This.make_chart
    If !.EnableCalculation
     .EnableCalculation = .T.
    Endif
    =This.print_chart()
   Endif
   *---загрузить рисунки в колонки
   This.Load_picture()
   *---автофильтр
   This.make_autofilter()
   *---разбить на колонки
   If This.multicolumn
    This.make_column()
   Endif
   m.oXlApp.Goto(.Range('A1'),.T.)
  Endwith
  Release m.oXlWB1,m.oXlWB1WS1,m.oXlWS1,m.oXlWB2,m.oXlWb2Ws1,m.oXlApp,m.oUnionGroup,m.oUnionSubtotal
  *---
  If m.lIsGroup
   For m.nIndex_1=1 To Alen(This.group_list,1)
    This.group_list(m.nIndex_1,iG_SubtSubset)=Null
    This.group_list(m.nIndex_1,iG_HeaderSubset)=Null
    This.group_list(m.nIndex_1,iG_FooterSubset)=Null
   Endfor
  Endif
  *_vfp.StatusBar = str(seco()-m.nStarttime,10,3)
  Endproc


 Hidden Procedure ins_group
  Lparameters  m.cRow,m.nGrpcnt,m.lEnd,m.nNum1,m.nNum2
  Local m.nCnt,m.cRange,m.nLen,m.cText,m.oU2,m.oU1,m.cStartCol

  *---адрес 1
  With This
   m.nCnt=Occurs(';',.group_list[m.nGrpcnt,m.nNum1])
   If m.nCnt>20  .Or. m.lEnd Or Len(.group_list[m.nGrpcnt,m.nNum1])>240
    *---адрес 2
    m.cText=.group_list[m.nGrpcnt,m.nNum1]
    m.nLen=Len(.group_list[m.nGrpcnt,m.nNum1])-1
    m.cRange=Left(m.cText,m.nLen)
    If Isnul(.group_list[m.nGrpcnt,m.nNum2])
     .group_list[m.nGrpcnt,m.nNum2]=m.oXlWB1WS1.Range(m.cRange)
    Else
     m.oU1=.group_list[m.nGrpcnt,m.nNum2]
     m.oU2=m.oXlWB1WS1.Range(m.cRange)
     .group_list[m.nGrpcnt,m.nNum2]=Null
     .group_list[m.nGrpcnt,m.nNum2]= m.oXlApp.Union(m.oU2,m.oU1)
     m.oU1=Null
     m.oU2=Null
     Release  m.oU1,m.oU2
    Endif
    .group_list[m.nGrpcnt,m.nNum1]=''
   Endif
   m.cStartCol=This.NumToExcel(This.group_list[m.nGrpcnt,iG_StartColM])
   If  Vartype(.group_list[m.nGrpcnt,m.nNum1])='C' And Len(.group_list[m.nGrpcnt,m.nNum1])>240
    *Susp
   Endif
   .group_list[m.nGrpcnt,m.nNum1]=.group_list[m.nGrpcnt,m.nNum1]+m.cStartCol+m.cRow+':'+m.cColumCount+m.cRow+';'
  Endwith
  Endproc


  *-- разбить на колонки
 Hidden Procedure make_column
  Local m.nIndex,m.cRange1,m.cRange2,m.nC1,m.nC2,m.nNumber1,m.nNumber2,m.nAllRows,m.nRowsCnt ,;
   m.nNumber3,m.nNumber4,m.cDRange1,m.cDRange2,m.nEndTitle
  *---
  m.nEndTitle= This.titlerow +This.phrowcount-1
  m.cRange1=This.k(1,This.titlerow)+':'+This.k(This.column_count,m.nEndTitle)
  m.nAllRows=This.row_count-(m.nEndTitle)
  This.multicount=Min(This.multicount,m.nAllRows)
  *---
  If This.multicount>1
   m.nRowsCnt=Ceiling(m.nAllRows/This.multicount)
   m.nRowsost=m.nRowsCnt*This.multicount -m.nAllRows
   *---
   For m.nIndex=1 To This.multicount-1
    m.nC1=This.column_count*m.nIndex+1+m.nIndex
    m.nC2=This.column_count*(m.nIndex+1)+m.nIndex
    m.cRange2=This.k(m.nC1,This.titlerow)+':'+This.k(m.nC2,m.nEndTitle)
    .Range(m.cRange1).Copy(.Range(m.cRange2))
    For  m.nInd=m.nC1 To m.nC2
     *---ШИРИНА КОЛОНОК
     .Columns( m.nInd).ColumnWidth = This.column_list[ m.nInd-m.nC1+1,iC_Width]
    Endfor
    .Columns(m.nC1-1).ColumnWidth =This.multidelim
    *---
    m.nNumber1=m.nEndTitle+1+(m.nRowsCnt*m.nIndex )-Iif(m.nIndex ==This.multicount-1,m.nRowsost,0)
    m.nNumber2=m.nNumber1+m.nRowsCnt-Iif(m.nIndex ==This.multicount,m.nRowsost,0)
    m.nNumber3= m.nEndTitle+1
    m.nNumber4=m.nNumber3+m.nRowsCnt-Iif(m.nIndex ==This.multicount,m.nRowsost,0)
    m.cDRange1= This.k(1,m.nNumber1)+':'+This.k(This.column_count,m.nNumber2)
    m.cDRange2= This.k(m.nC1,m.nNumber3)+':'+This.k(m.nC2,m.nNumber4)
    .Range(m.cDRange1).Copy(.Range(m.cDRange2))
    *---СКРЫТЫЕ КОЛОНКИ
    This._hide_column(m.nC1)
   Endfor
   .Rows(Alltrim(Str(m.nEndTitle+1+m.nRowsCnt))+':'+Alltrim(Str(This.row_count))).Delete()
   *---автоформат
   m.cRange1=Transform(m.nEndTitle)+':'+Transform(m.nEndTitle+1+m.nRowsCnt)
   This._autofit(.Range(m.cRange1))
  Endif
  Endproc


  *-- разделить на столбцы
 Procedure multi_column
 Lparameters m.nColumn,m.nWidthDelim
 If m.nColumn>1
  This.multicolumn=.T.
  This.multicount= m.nColumn
  If Empty(m.nWidthDelim)
   m.nWidthDelim=1
  Endif
  This.multidelim=m.nWidthDelim
 Endif
 Return ''
 Endproc


 *-- скрыть колонки
 Hidden Procedure _hide_column
  Lparameters  m.nBase
  Local m.cCellsList, m.nIndex
  If !This.nohide
   m.cCellsList=''
   With This
    For  m.nIndex=1 To .column_count
     If .column_list(m.nIndex,iC_Hidden)
      m.cCellsList=m.cCellsList+Iif(Empty(m.cCellsList),'',';')+.NumToExcel( m.nIndex+nBase-1)+'1'
     Endif
    Endfor
   Endwith
   If !Empty(m.cCellsList)
    .Range(m.cCellsList).EntireColumn.Hidden =.T.
   Endif
  Endif
  Endproc


 Procedure autofilter
 Lparameters m.cBegin,m.cEnd,m.nOffset
 If  Vartype(m.cBegin) ='C' And !Empty(m.cBegin)
  This.autof_begin=m.cBegin
 Endif
 If  Vartype(m.cEnd) ='C' And !Empty(m.cEnd)
  This.autof_end=m.cEnd
 Endif
 If Vartype(m.nOffset)='N'
  This.autof_offset=m.nOffset
 Endif
 This.auto_filter=.T.
 Endproc


 Hidden Procedure make_autofilter
  Local m.cBegin,m.cEnd,m.cRow1,m.cRow2
  If This.auto_filter
   If !Empty(This.autof_begin)
    m.cBegin=This.NumToExcel(This.nametocol(This.autof_begin) )
   Else
    m.cBegin='A'
   Endif
   *---
   If !Empty(This.autof_end)
    m.cEnd=This.NumToExcel(This.nametocol(This.autof_end))
   Else
    m.cEnd= This.NumToExcel(This.column_count)
   Endif
   *---*
   m.cRow1=Alltrim(Str(This.titlerow +This.phrowcount-1-This.autof_offset))
   m.cRow2=Alltrim(Str(This.row_count))
   .Range(m.cBegin+m.cRow1+':'+m.cEnd+m.cRow2).autofilter()
  Endif
  Endproc


 Hidden Procedure _autofit
  Lparameters  m.oDataRange
  If This.AutoFit .Or. This.col_autofit
   *---включим расчет
   If !.EnableCalculation
    .EnableCalculation = .T.
   Endif
   *---
   With m.oDataRange
    If This.AutoFit
     .Rows.AutoFit()
    Endif
    If This.col_autofit
     .Columns.AutoFit()
    Endif
   Endwith
  Endif
  Endproc


 Hidden Procedure _format_group
  Local m.oSelect,m.cRange,m.nStartPos
  Private m.nI
  *-----
  For m.nI=1 To m.nGroupLen
   *---
   If Empty(This.group_list[m.nI,iG_StartColM])
    m.nStartPos=1
   Else
    m.nStartPos=This.group_list[m.nI,iG_StartColM]
   Endif
   *---подитоги
   If !Empty(This.group_list[m.nI ,iG_SubtRange])
    This.ins_group('',m.nI,.T.,iG_SubtRange,iG_SubtSubset)
   Endif
   m.oSelect= This.group_list[m.nI ,iG_SubtSubset]
   If !Isnull(m.oSelect)
    With m.oSelect
     .RowHeight=This.group_list[m.nI ,iG_Height]
     m.cRange=This.k(m.nStartPos,This.group_list[m.nI ,iG_Row])+':'+This.k(This.column_count,This.group_list[m.nI ,iG_Row])
     m.oXlWb2Ws1.Range(m.cRange).Copy()
     .PasteSpecial(xlPasteFormat)
     *---autofit строк группы
     If This.group_list[m.nI ,iG_AutoFit]
      .Rows.AutoFit()
     Endif
    Endwith
    *---объединим группы
    This._union(m.oSelect)
   Endif
   *---заголовок
   This._Format_tf(iG_HeaderRange,iG_HeaderSubset,iG_TitMrgCell,iG_TitRow,m.nStartPos,.T.)
   *--подвал
   This._Format_tf(iG_FooterRange,iG_FooterSubset,iG_FootMrgCell,iG_FootRow)
  Endfor
  Endproc


 Hidden Procedure _Format_tf
  Lparameters  m.nInd1,m.nInd2,m.nMerge,m.nRow,m.nStartPos,m.lIstitle
  Local  m.nTFHeight,m.oSelect,m.cRange,m.cR1,m.cR2
  *---заголовок
  If !Empty(This.group_list[m.nI ,m.nInd1])
   This.ins_group('',m.nI,.T.,m.nInd1,m.nInd2)
  Endif
  m.oSelect= This.group_list[m.nI ,m.nInd2]
  If !Isnull(m.oSelect)
   *---объединение ячеек
   If  This.group_list[m.nI ,m.nMerge]
    m.cRange=This.k(m.nGr_text_col,This.group_list[m.nI ,m.nRow])+':'+This.k(This.column_count,This.group_list[m.nI ,m.nRow])
    With m.oXlWb2Ws1
     If m.nGr_text_col>1
      m.cR1= This.k(1,This.group_list[m.nI ,m.nRow])
      m.cR2=This.k(m.nGr_text_col,This.group_list[m.nI ,m.nRow])
      With .Range(m.cR1)
       .Copy(m.oXlWb2Ws1.Range(m.cR2))
       .NumberFormat = "0"
       .BorderS(xlEdgeRight).LineStyle = xlNone
      Endwith
     Endif
     .Range(m.cRange).MergeCells=.T.
    Endwith
   Endif
   m.cRange=This.k(1,This.group_list[m.nI ,m.nRow])+':'+This.k(This.column_count,This.group_list[m.nI ,m.nRow])
   With m.oSelect
    With  m.oXlWb2Ws1
     .Range(m.cRange).Copy()
     m.nTFHeight=.Range(m.cRange).RowHeight
    Endwith
    .PasteSpecial(xlPasteFormat)
    .RowHeight=m.nTFHeight
    *---autofit
    If m.lIstitle
     If This.group_list[m.nI ,iG_TitAutoFit]
      .Rows.AutoFit()
     Endif
    Else
     If This.group_list[m.nI ,iG_FootAutoFit]
      .Rows.AutoFit()
     Endif
    Endif
    *---end autof
   Endwith
   *---объединим
   This._union(m.oSelect)
   m.oSelect=Null
   Release m.oSelect
  Endif
  Endproc


 Hidden Procedure _union
  *---набор добавленых строк
  Lparameters m.oUnion
  If Isnull(m.oUnionGroup)
   m.oUnionGroup=m.oUnion
  Else
   m.oUnionGroup=m.oXlApp.Union(m.oUnionGroup,m.oUnion)
  Endif
  Endproc


 Hidden Procedure _sort
  Lparameters m.oDatasort
  Local m.cRange
  If Vartype(This.columnsort)='C' .And. !Empty(This.columnsort)
   *---расчитаем заголовок
   This.PageHeadCalc()
   *---включим расчет
   If !.EnableCalculation
    .EnableCalculation = .T.
   Endif
   m.cRange=This.f_trans(This.columnsort, m.nDB)
   m.oDatasort.Sort(.Range(m.cRange),This.typesort)
  Endif
  Endproc


  *-- авто исполняемый макрос
 Procedure autorun
 Lparameters m.cAutorun
 This._autorun=m.cAutorun
 Return ''
 Endproc


 Procedure r
 Lparameters  m.nKol,m.nRow
 Return  'R['+Transform(m.nRow)+']C['+Transform(m.nKol)+']'
 Endproc


 *-- копирование отчета в файл
 Hidden Procedure CopyTo
  Local  m.nWs,m.oWSLast,m.nCopyRows,m.nBeginRow
  With This.xl_app
   m.nWs=This.Get_Sheet(This.xl_app.Workbooks(1))
   *Erase (This.destination)
   .Application.Workbooks.Open(This.destination)
   With  .Workbooks(1)
    .Activate()
    With This.xl_app.Workbooks(2)
     m.nWSCount=.WorkSheets.Count
     m.oWSLast=.WorkSheets(m.nWSCount)
    Endwith
    With .WorkSheets(m.nWs)
     *----на один лист?
     If This.composit_on_one_sheet
      With m.oWSLast.UsedRange
       m.nBeginRow = .Rows.Count+.Row-1+2
      Endwith
      *---
      With .UsedRange
       m.nCopyRows = .Rows.Count+.Row-1
      Endwith
      *---
      .Rows('1:'+Transform(m.nCopyRows)).Copy(m.oWSLast.Rows(Transform(m.nBeginRow)+':'+Transform(m.nBeginRow+m.nCopyRows)))
      _Cliptext=''
     Else
      .Select()
      .Copy(Null,m.oWSLast)
     Endif
    Endwith
    .Saved = .T.
   Endwith
   .Workbooks(2).Save()
  Endwith
  Endproc


  *-- Открыть xls файл
 Procedure open_file
 Lparameters m.cFile
 Local m.oExApp,m.lRetVal
 m.lRetVal=.F.
 m.oExApp =Createobject("Excel.Application")
 If Type('m.oExApp')='O'
  This.temp_reference=m.oExApp
  With m.oExApp
   .Workbooks.Open(m.cFile)
   If Type( "m.oExApp.Workbooks(1).Name" ) == "C"
    This._show_top(m.oExApp)
    m.lRetVal=.T.
   Endif
  Endwith
  This.temp_reference=.F.
 Endif
 Return m.lRetVal
 Endproc


 *-- печать
 Procedure print_sheet
 Lparameters m.cFile,m.nSheet,m.nCopyCount,m.lDescen
 Local m.oExApp,m.lRetVal,m.nWs,m.nBeginSheet,m.nEndSheet,m.nCopy,m.nStep
 m.lRetVal=.F.
 m.oExApp =Createobject("Excel.Application")
 m.nStep=1
 If Type('m.oExApp')='O'
  This.temp_reference=m.oExApp
  With m.oExApp
   .Application.DisplayAlerts = .F.
   .Workbooks.Open(m.cFile)
   If Type( "m.oExApp.Workbooks(1).Name" ) == "C"
    With .Workbooks(1)
     If Vartype(m.nCopyCount)!='N'
      m.nCopyCount=1
     Endif
     If Vartype(m.nSheet)='L' And m.nSheet
      If m.lDescen
       m.nBeginSheet=.WorkSheets.Count
       m.nEndSheet=1
       m.nStep=-1
      Else
       m.nBeginSheet=1
       m.nEndSheet=.WorkSheets.Count
      Endif
     Else
      If Vartype(m.nSheet)!='N'
       m.nSheet=1
      Endif
      m.nBeginSheet=m.nSheet
      m.nEndSheet=m.nSheet
     Endif
     For  m.nWs=m.nBeginSheet To m.nEndSheet Step m.nStep
      For m.nCopy=1 To m.nCopyCount
       .WorkSheets(m.nWs).PrintOut()
      Endfor
     Endfor
     .Application.Quit()
    Endwith
    m.lRetVal=.T.
   Endif
  Endwith
  This.temp_reference=.F.
 Endif
 Return m.lRetVal
 Endproc


 *-- формула в формате r1c1 ?
 Procedure is_r1c1
 Lparameters m.cFormula
 Local m.lRet
 m.lRet=.F.
 If ' R:'$Upper(m.cFormula)
  m.cFormula=Strtran(Upper(m.cFormula),' R:','')
  m.lRet=.T.
 Endif
 Return m.lRet
 Endproc


 *-- сделать колонку скрытой
 Procedure hide_column
 Lparameters m.cColumnName,m.lGroup
 Local m.nColumnId,m.nSetCnt
 m.nSetCnt=0
 With This
  If m.lGroup
   m.nSetCnt=.Set_Column_Prop(m.cColumnName,iC_Hidden,.T.)
  Else
   m.nColumnId= .nametocol(m.cColumnName)
   If Vartype(m.nColumnId)='N'
    .column_list(m.nColumnId ,iC_Hidden)=.T.
    m.nSetCnt=1
   Endif
  Endif
 Endwith
 Return m.nSetCnt
 Endproc


 *-- защита листа отчета от изменений
 Procedure Protect
 Lparameters m.cPassword
 With This
  .Protected=.T.
  .rpassword=m.cPassword
 Endwith
 Endproc


 *-- защита отчета
 Hidden Procedure _protect
  #Define DrawingObjects .T.
  #Define Contents .T.
  #Define Scenarios .T.
  #Define UserInterfaceOnly .T.
  Local m.nWs,m.cPassword
  m.cPassword=Evl(This.rpassword,Null)
  With This.xl_app.Workbooks(1)
   For  m.nWs=1 To .WorkSheets.Count
    With .WorkSheets(m.nWs)
     .EnableOutlining=.T.
     .Protect(m.cPassword, DrawingObjects, Contents, Scenarios, UserInterfaceOnly)
    Endwith
   Endfor
   .Protect(m.cPassword,.T.)
  Endwith
  Endproc


  *-- сброс филтра
 Procedure clear_filter
 This.auto_filter=.F.
 Return ''
 Endproc


 *-- Расчет параметров в заголовке страницы
 Procedure PageHeadCalc
 Local m.nColRow,m.vValue
 For m.nColRow=1 To This.phrowcount
  For  m.nInd=1 To Alen(This.column_list,1)
   With .Cells(This.title_height+m.nColRow, m.nInd)
    m.cText=Nvl(.Value,'')
    If Vartype(m.cText)='C'
     *---техт колонки
     If '#'$m.cText
      m.cText=Strtran(m.cText,'#',This.column_list[ m.nInd,iC_Text])
     Endif
     *---алиас колонки
     If '@'$m.cText
      m.cText=Strtran(m.cText,'@',This.column_list[ m.nInd,iC_Name])
     Endif
     If '$'$m.cText
      m.vValue=Null
      m.cValue =Alltrim(Strtran(m.cText ,'$',''))
      m.vValue=Evaluate(m.cValue )
      If Empty(m.vValue)
       m.vValue=Null
      Endif
      .Value =m.vValue
     Endif
    Endif
   Endwith
  Endfor
 Endfor
 Endproc


 *-- удалить колонку
 Procedure delete_column
 Lparameters m.cColumnName
 Local m.nColumnId
 With This
  m.nColumnId= .nametocol(m.cColumnName)
  If Vartype(m.nColumnId)='N'
   =Adel(.column_list,m.nColumnId)
   Dimension  .column_list(Alen(.column_list,1) -1,Alen(.column_list,2))
  Endif
 Endwith
 Endproc


 *-- открыть на основе шаблона
 Procedure open_data
 Lparameters m.cShablon,m.cFile
 *---откроем таблицу и скопируем в шаблон
 With This.xl_app
  If This.use_array
   With .Workbooks
    .Add(Fullpath(m.cShablon))
   Endwith
   With .Workbooks(1)
    .Activate()
    With .WorkSheets(1)
     .EnableCalculation = .F.
     .Range('A1:'+This.k(Alen(This.column_list,1),This.row_count)).Value=This.get_array('aData_Array')
    Endwith
   Endwith
  Else
   With .Workbooks
    .Add(Fullpath(m.cShablon))
    .Add(Fullpath(m.cFile))
   Endwith
   With .Workbooks(1)
    .Activate()
    With .WorkSheets(1)
     .EnableCalculation = .F.
     This.xl_app.Workbooks(2).WorkSheets(1).UsedRange.Copy()
     .Range('A1').PasteSpecial(xlValues)
    Endwith
    _Cliptext=''
   Endwith
   With .Workbooks(2)
    .Saved=.T.
    .Close()
   Endwith
   Erase (Fullpath(m.cFile))
  Endif
 Endwith
 Endproc


 *-- Загрузить рисунки для колонок с ключом :p
 Procedure Load_picture
 Local m.nBegin,m.nRows,m.nIndex2,m.cFile,m.nHeight,m.nWidth,m.nPictCounter,m.nIndex1,m.lShowTerm,m.nSaveIndex,m.nColumnSource,m.lTestComment,m.lAddCommet,m.cInfoStr,m.oThermometr,m.nTop,m.nLeft

 m.lShowTerm =!(Type('m.lerNoThermom')='L' And m.lerNoThermom)
 With .UsedRange
  m.nBegin=.Row
  m.nRows =.Rows.Count
 Endwith
 For m.nIndex1=1 To Alen(This.column_list,1)
  Wait Clear
  m.lTestComment=.T.
  If !Empty(This.column_list[m.nIndex1,iC_PictSource])
   m.nColumnSource= This.column_list[m.nIndex1,iC_PictSource]
  Else
   m.nColumnSource=m.nIndex1
  Endif
  If This.column_list(m.nIndex1,iC_Picture)
   If m.lShowTerm
    m.oThermometr=This.Create_Thermometer(m.nRows-m.nBegin,erPictureInsert)
   Endif
   m.nPictCounter=0
   m.nSaveIndex=m.nBegin
   For m.nIndex2=m.nBegin To  m.nRows+m.nBegin
    m.cFile=Nvl(.Cells(m.nIndex2,m.nColumnSource).Value,'')
    m.cInfoStr=m.cFile
    m.cFile=This.On_Get_picture_File(m.cFile)
    If Vartype(m.cFile)='C'
     m.cFile=Alltrim(m.cFile)
     If !Empty(m.cFile)
      If File(m.cFile)
       If This.column_list(m.nIndex1,iC_PictComment)
        If m.nIndex2>m.nSaveIndex
         *---Удалим комментарий из пустых ячеек
         .Columns(m.nIndex1).Rows(Transform(m.nSaveIndex)+':'+Transform(m.nIndex2-1)).ClearComments
        Endif
        *---рисунок в комментарий  (комментарий должен быть в наличии)
        With .Cells(m.nIndex2,m.nIndex1)
         If  m.lTestComment
          m.lAddCommet=Type('.Comment.Shape')!='O'
          m.lTestComment=.F.
         Endif
         If m.lAddCommet
          .AddComment
         Endif
         .Comment.Shape.Fill.UserPicture(m.cFile)
        Endwith
        m.nSaveIndex=m.nIndex2+1
       Else
        *---рисунок  в ячейку
        With .Cells(m.nIndex2,m.nIndex1)
         m.nHeight=.Height
         m.nWidth=.Width
         m.nTop=.Top
         m.nLeft=.Left
         *.Select()
        Endwith
        With .PictureS.Insert(m.cFile)
         With .ShapeRange
          .LockAspectRatio = 0
          .Height=m.nHeight
          .Width=m.nWidth
         Endwith
         .Top= m.nTop
         .Left= m.nLeft
         .Placement = 1
        Endwith
       Endif
       m.nPictCounter=m.nPictCounter+1
      Endif
     Endif
    Endif
    *---
    If m.lShowTerm
     This.Update_Thermometer(m.oThermometr,m.nIndex2,m.cInfoStr)
    Endif
   Endfor
   *---
   If This.column_list(m.nIndex1,iC_PictComment)
    *---рисунок в комментарий  (комментарий должен быть в наличии)
    If m.nIndex2>m.nSaveIndex
     *---Удалим комментарий из пустых ячеек
     .Columns(m.nIndex1).Rows(Transform(m.nSaveIndex)+':'+Transform(m.nIndex2-1)).ClearComments()
    Endif
   Endif
   *---
   If m.lShowTerm
    This.Close_Thermometer(m.oThermometr)
   Endif
  Endif
 Endfor
 Endproc


 *-- Загрузить vba модули
 Procedure _Load_Vbm
 Local m.nIndex_1
 *---загрузить vba модули
 If Type('This.module_list(1)')='C'
  If Type('m.oXlApp.VBE.ActiveVBProject')='O'
   With m.oXlApp.VBE.ActiveVBProject
    For m.nIndex_1=1 To Alen(This.module_list,1)
     If Empty(This.module_list(m.nIndex_1,iVB_Component))
      .VBComponents.Import(This.module_list(m.nIndex_1,iVB_FileName))
     Else
      .VBComponents(This.module_list(m.nIndex_1,iVB_Component)).CodeModule.InsertLines(1,Filetostr(This.module_list(m.nIndex_1,iVB_FileName)))
     Endif
    Endfor
   Endwith
  Else
   =This.er_Warning( erDisableVBE,.T.,'_Load_vbm')
  Endif
 Endif
 Endproc


 *-- Установить параметры загрузки картинок для колонки
 Procedure set_column_picture
 Lparameters m.cColumn,m.lPictLoad,m.lUseComment,m.cPathSource
 m.cColumn=This.nametocol(m.cColumn)
 *---Флаг вставки рисунка в  ячейку
 This.column_list[m.cColumn,iC_Picture]=m.lPictLoad
 *---Флаг вставки рисунка в  комментарий
 This.column_list[m.cColumn,iC_PictComment]=m.lUseComment
 *---Колонка содержащая рисунки (по умолчанию m.cColumn)
 If !Empty(m.cPathSource)
  m.cPathSource=This.nametocol(m.cPathSource)
  This.column_list[m.cColumn,iC_PictSource]=m.cPathSource
 Endif
 Endproc


 *-- Событие на получение имени файла рисунка
 Procedure On_Get_picture_File
 Lparameters m.cPictureFileName
 Return m.cPictureFileName
 Endproc


 *-- Вернуть массив по ссылке
 Procedure get_array
 Lparameters  m_RetArrayName
 Return @&m_RetArrayName
 Endproc


 *-- Активировать термометр
 Procedure Create_Thermometer
 Lparameters m.nMaxValue,m.cMessage
 Local m.oThermometr
 m.oThermometr=Null
 If  Pemstatus(_Screen,"StatusBar", 5)
  m.oThermometr=Createobject('Stb_Therm',m.nMaxValue,m.cMessage)
 Else
  If  Type('_Screen.ActiveForm.name')='C'
   If Pemstatus(_Screen.ActiveForm,'Er_Thermometr',5)
    m.oThermometr=_Screen.ActiveForm.Er_Thermometr
    With m.oThermometr
     .Reset(.T.)
     .MaxValue=m.nMaxValue
    Endwith
   Else
    m.oThermometr=Createobject('Thermom',m.nMaxValue,m.cMessage)
   Endif
  Endif
 Endif
 Return m.oThermometr
 Endproc


 *-- обновить термометр
 Procedure Update_Thermometer
 Lparameters m.oThermometer,m.nShowValue,m.cMessage
 m.oThermometer.UpdTherm(m.nShowValue,m.cMessage)
 Endproc


 *-- закрыть термометр
 Procedure Close_Thermometer
 Lparameters m.oThermometer
 m.oThermometer.Reset()
 Endproc


 *-- обработчик сообщений
 Procedure On_Message
 Lparameters  m.cMessage
 If Inlist(_vfp.StartMode,0,4)
  Wait m.cMessage Window  Nowait
 Endif
 Endproc


 *-- обработчик предупреждений
 Procedure On_Warning
 Lparameters m.cWarning
 If Inlist(_vfp.StartMode,0,4)
  =Messagebox(m.cWarning,48,mInfo )
 Endif
 Endproc


 *-- закрыть временные файлы
 Procedure close_tmp_excel
 Lparameters m.oExcel
 Local m_OldErrorHandler
 m_OldErrorHandler=On('error')
 *---
 If Type('m.oExcel')='O' And !Isnull(m.oExcel)
  Local m.nIndex
  With m.oExcel As Excel.Application
   If Type('m.oExcel.Workbooks(1)')='O'
    For m.nIndex=1 To .Workbooks.Count
     *--
     On Error *
     .Workbooks(m.nIndex).Saved = .T.
     On Error &m_OldErrorHandler
     *--
    Endfor
   Endif
   .Application.Quit()
  Endwith
 Endif


 *If Pemstatus(_Screen,'Stop_Enable',5)
 *If _Screen.Stop_Enable
 *Endif
 *Endif
 Endproc


 *-- Задать свойство колнкакм по имени
 Procedure Set_Column_Prop
 Lparameters  m.сColName,m.nProperty,m.uPropValue
 Local m.nIndex,m.cOld_Exact,m.nSetProperty
 m.nSetProperty=0
 If Vartype( m.сColName)='C'
  For m.nIndex=1 To Alen(This.column_list,1)
   If Like(m.сColName,Alltrim(This.column_list(m.nIndex,iC_Name)))
    This.column_list(m.nIndex,m.nProperty)=m.uPropValue
    m.nSetProperty=m.nSetProperty+1
   Endif
  Endfor
 Endif
 Return  m.nSetProperty
 Endproc


 *-- Чтение параметров группы из комментария
 Procedure Read_Group_Param
 Lparameters m.nRow,m.cParam1,m.cParam2,m.cParam3
 Local m.aGroupParam,m.nPcount,m.cGroupParam
 m.nPcount=Pcount()
 *---
 *---параметры группы
 If Type('.cells(m.nRow,1).Comment.text')='C'
  Dimension m.aGroupParam(1)
  *---параметры в комментарии
  Alines(aGroupParam,Alltrim(.Cells(m.nRow,1).Comment.Text))
  *---чтение параметров
  If Alen(aGroupParam,1)>1 Or m.nPcount=3
   m.cParam1=m.aGroupParam(1)
   If m.nPcount=4
    m.cParam2=m.aGroupParam(2)
   Endif
   *--=параметры
   If Alen(aGroupParam,1)>m.nPcount-2
    m.cGroupParam=m.aGroupParam(m.nPcount-1)
    If Alen(aGroupParam,1)>m.nPcount-1
     For m.nIndex=m.nPcount To Alen(aGroupParam,1)
      m.cGroupParam=m.cGroupParam+' '+m.aGroupParam(m.nIndex)
     Endfor
    Endif
    Store m.cGroupParam To ('m.cParam'+Transform(m.nPcount-1))
   Endif
  Endif
 Else
  *---параметры в ячейках
  m.cParam1=Nvl(.Cells(m.nRow,2).Value,'')
  m.cParam2=Nvl(.Cells(m.nRow,3).Value,'')
  If m.nPcount=4
   m.cParam3=Nvl(.Cells(m.nRow,4).Value,'')
  Endif
 Endif
 Endproc


 *-- Авто расчет ширины колонки
 Procedure fit_column
 Lparameters m.cColumnName,m.lGroup
 Local m.nColumnId,m.nSetCnt
 m.nSetCnt=0
 With This
  If m.lGroup
   m.nSetCnt=.Set_Column_Prop(m.cColumnName,iC_AutoFit,.T.)
  Else
   m.nColumnId= .nametocol(m.cColumnName)
   If Vartype(m.nColumnId)='N'
    .column_list(m.nColumnId ,iC_AutoFit)=.T.
    m.nSetCnt=1
   Endif
  Endif
 Endwith
 Return m.nSetCnt
 Endproc


 Procedure _Fit_Column
 Lparameters  m.nBase
 Local m.cCellsList, m.nIndex
 If !This.nohide
  m.cCellsList=''
  With This
   For  m.nIndex=1 To .column_count
    If .column_list(m.nIndex,iC_AutoFit)
     m.cCellsList=m.cCellsList+Iif(Empty(m.cCellsList),'',';')+.NumToExcel( m.nIndex+m.nBase-1)+'1'
    Endif
   Endfor
  Endwith
  If !Empty(m.cCellsList)
   .Range(m.cCellsList).EntireColumn.AutoFit()
  Endif
 Endif
 Endproc


 *-- Вывести экземпляр приложения Excel на передний план
 Procedure _show_top
 Lparameters m.oApplication,m.lNoMin
 If Vartype(m.oApplication)!='O'
  m.oApplication=This.xl_app
 Endif
 If !m.lNoMin
  With m.oApplication
   .WindowState = -4140
   && .WindowState = xlMaximized
   .Visible = .T.
  Endwith
 Endif

 If m.lNoMin
  If Val(Os(3))>5
   Local m.loShell
   m.loShell=Createobject("WScript.Shell")
   If m.loShell.AppActivate(m.oApplication.Caption) = .T.
    m.loShell.SendKeys("% ~")
   Endif
   DoEvents Force
   Wait '' Timeout 0.3
   && m.oApplication.WindowState = xlMaximized
  Endif
 Endif
 Endproc


 Procedure Init
 Lparameters  m.cFile,m.сXLShablon,m.nTHeight,m.cSheetName,m.nOrient,m.cXcolumnName,m.cKeyField,;
  m.nXColumnSort,m.nXCalc,m.cER_dbf,m.cCl_Dbf
 *1-файл
 *2-Шаблон
 *3-Высота заголовка в стороках
 *4-Наименование листа
 *5-Ориентация страниы (1-portret,2-landshaft)
 *-----------
 *6 -имя колонки для x отчета
 *7 -Порядок сортировки колонок
 *8 -метод калькуляции итогов по строке (0,1,2,3,4)
 Local m.lRetValue
 m.lRetValue=.T.
 *---Файл отчета
 This.xlfile =m.cFile
 *---в текущей р\о открыта таблица ?
 If Used()
  If Reccount()<64000
   If !This.is_open(m.cFile)
    *---таблица
    If !Empty(m.cXcolumnName)
     m.lRetValue= This.make_xtab(m.cXcolumnName,m.cKeyField,m.nXColumnSort,m.nXCalc,m.cER_dbf,m.cCl_Dbf)
     If m.lRetValue
      Sele er_xtab
     Endif
    Endif
    If m.lRetValue
     This.dbf_name= Alias()
     This.row_count=Max(Reccount(This.dbf_name),1)
     *---Шаблон
     If Vartype(m.сXLShablon)='C'
      If File(Fullpath(m.сXLShablon))
       This.shablon=Fullpath(m.сXLShablon)
       *---m.nTHeight =.t. (не отображать отчет после создания)
       *---m.nOrient=.t. ('Не выполнять отчет)
       This.forcepsshablon=m.cSheetName
       m.lRetValue=This.read_pattern(m.nTHeight,m.nOrient)
      Else
       This.er_Warning(ShabNoFound+m.сXLShablon,,'Init')
       m.lRetValue= .F.
      Endif
     Else
      *---высота заголовка отчета
      If !Empty(m.nTHeight)
       This.title_height=m.nTHeight
      Endif
      *---ориентация листа
      If !Empty(m.nOrient)
       This.page_orient=m.nOrient
      Endif
      *---имя листа
      If !Empty(m.cSheetName)
       This.sheet_name=m.cSheetName
      Endif
     Endif
    Endif
   Else
    *---отчет уже открыт
    m.lRetValue= .F.
   Endif
  Else
   This.er_Warning(erBadRowCount,,'Init')
   m.lRetValue= .F.
  Endif
 Else
  This.er_Warning(DbfNoOpen,,'Init')
  m.lRetValue= .F.
 Endif
 Return m.lRetValue
 Endproc


 Procedure Destroy
 With This
  #If  Val(Substr(Version(),15,2))>=7
   If Vartype(.XlEvHandler)='O' And !Isnull(.XlEvHandler)
    =Eventhandler(.xl_app,.XlEvHandler,.T.)
    .RemoveObject('XlEvHandler')
    .xl_app=Null
   Endif
  #Endif
  *---
  If !.success
   .close_tmp_excel(.xl_app)
  Endif
  .close_tmp_excel(.temp_reference)
 Endwith
 Endproc

Enddefine
*


*******************************
*-- termometr
Define Class thermom As form
*******************************

 Height = 72
 Width = 383
 Desktop = .T.
 DoCreate = .T.
 AutoCenter = .T.
 BorderStyle = 2
 Caption = ""
 Closable = .F.
 MaxButton = .F.
 MinButton = .F.
 WindowType = 1
 AlwaysOnTop = .T.
 maxvalue = 0
 Name = "thermom"


 Add Object info_str As Label With ;
  Caption = "", ;
  Height = 18, ;
  Left = 27, ;
  Top = 2, ;
  Width = 332, ;
  Name = "Info_str"


 Add Object frame As TextBox With ;
  Alignment = 2, ;
  Enabled = .F., ;
  Height = 24, ;
  Left = 24, ;
  Top = 25, ;
  Width = 336, ;
  DisabledBackColor = Rgb(255,255,255), ;
  DisabledForeColor = Rgb(0,0,0), ;
  Name = "Frame"


 Add Object thermometr As TextBox With ;
  BorderStyle = 0, ;
  Enabled = .F., ;
  Height = 20, ;
  Left = 26, ;
  Top = 27, ;
  Width = 120, ;
  DisabledBackColor = Rgb(128,128,128), ;
  DisabledForeColor = Rgb(0,0,0), ;
  BorderColor = Rgb(255,255,255), ;
  Name = "Thermometr"

 Procedure updtherm
 Lparameters  m.nNewValue,m.cAddStr
 Local m.cPercent
 With This
  m.cPercent=Transform(Int(m.nNewValue/.maxvalue*100 ))+'%'
  .frame.Value=m.cPercent
  With .thermometr
   .Width=(This.frame.Width-4)*m.nNewValue/This.maxvalue
   .Value=Padc(m.cPercent,103)
  Endwith
  If !Empty(m.cAddStr)
   .info_str.Caption=Transform(m.cAddStr)
  Endif
 Endwith
 Endproc

 *-- Сброс
 Procedure Reset
 This.Release()
 Endproc

 Procedure Init
 Lparameters  m.nMaxSize,m.cCaption
 With Thisform
  .maxvalue=m.nMaxSize
  If !Empty(m.cCaption)
   .Caption=m.cCaption
  Endif
  .Visible=.T.
 Endwith
 Endproc

 Procedure Resize
 Nodefa
 Endproc

 Procedure thermometr.Init
 This.Width=0
 Endproc
Enddefine



#If Val(Substr(Version(),15,2))>=7
Define Class ExcelEvents As Session
 Implements AppEvents In 'excel.application'

 Procedure AppEvents_SheetBeforeDoubleClick(Sh As Object, Target As Range, Cancel As Logical) As None
 Cancel=Evaluate(Alltrim(This.Parent.OnEvent)+'(1,this.parent,,Sh,Target,this.parent.RowToRecord(target.row))')
 Endproc

 Procedure AppEvents_SheetBeforeRightClick(Sh As Object, Target As Range, Cancel As Logical) As None
 Cancel=Evaluate(Alltrim(This.Parent.OnEvent)+'(2,this.parent,,Sh,Target,this.parent.RowToRecord(target.row))')
 Endproc

 Procedure AppEvents_WorkbookBeforePrint(Wb As Workbook, Cancel As Logical) As None
 Cancel=Evaluate(Alltrim(This.Parent.OnEvent)+'(3,this.parent,Wb)')
 Endproc

 Procedure AppEvents_WorkbookBeforeClose(Wb As Workbook, Cancel As Logical) As None
 Cancel=Evaluate(Alltrim(This.Parent.OnEvent)+'(4,this.parent,Wb)')
 Endproc

 Procedure AppEvents_NewWorkbook(Wb As Workbook) As None
 Endproc

 Procedure AppEvents_SheetActivate(Sh As Object) As None
 Endproc


 Procedure AppEvents_SheetCalculate(Sh As Object) As None
 Endproc

 Procedure AppEvents_SheetChange(Sh As Object, Target As Range) As None
 Endproc

 Procedure AppEvents_SheetDeactivate(Sh As Object) As None
 Endproc

 Procedure AppEvents_SheetSelectionChange(Sh As Object, Target As Range) As None
 Endproc

 Procedure AppEvents_WindowActivate(Wb As Workbook, Wn As Window) As None
 Endproc

 Procedure AppEvents_WindowDeactivate(Wb As Workbook, Wn As Window) As None
 Endproc

 Procedure AppEvents_WindowResize(Wb As Workbook, Wn As Window) As None
 Endproc

 Procedure AppEvents_WorkbookActivate(Wb As Workbook) As None
 Endproc

 Procedure AppEvents_WorkbookAddinInstall(Wb As Workbook) As None
 Endproc

 Procedure AppEvents_WorkbookAddinUninstall(Wb As Workbook) As None
 Endproc


 Procedure AppEvents_WorkbookBeforeSave(Wb As Workbook, SaveAsUI As Logical, Cancel As Logical) As None
 Endproc

 Procedure AppEvents_WorkbookDeactivate(Wb As Workbook) As None
 Endproc

 Procedure AppEvents_WorkbookNewSheet(Wb As Workbook, Sh As Object) As None
 Endproc

 Procedure AppEvents_WorkbookOpen(Wb As Workbook) As None
 Endproc

 Procedure AppEvents_SheetFollowHyperlink(Sh As VARIANT, Target As VARIANT) As VOID
 Endproc

 *--OFFIC xp
 Procedure AppEvents_SheetPivotTableUpdate(Sh As VARIANT, Target As VARIANT) As VOID
 Endproc
 Procedure AppEvents_WorkbookPivotTableCloseConnection(Wb As Workbook,qwq ) As VOID
 Endproc
 Procedure AppEvents_WorkbookPivotTableOpenConnection(Wb As Workbook,qwq ) As VOID
 Endproc

 *--OFFIC 2003
 Procedure AppEvents_WorkbookSync(Wb As VARIANT, SyncEventType As VARIANT) As VOID
 *add user code here
 Endproc

 Procedure AppEvents_WorkbookBeforeXmlImport(Wb As VARIANT, Map As VARIANT, Url As String, IsRefresh As Logical, Cancel As Logical @) As VOID
 *add user code here
 Endproc

 Procedure AppEvents_WorkbookAfterXmlImport(Wb As VARIANT, Map As VARIANT, IsRefresh As Logical, Result As VARIANT) As VOID
 *add user code here
 Endproc

 Procedure AppEvents_WorkbookBeforeXmlExport(Wb As VARIANT, Map As VARIANT, Url As String, Cancel As Logical @) As VOID
 *add user code here
 Endproc

 Procedure AppEvents_WorkbookAfterXmlExport(Wb As VARIANT, Map As VARIANT, Url As String, Result As VARIANT) As VOID
 *add user code here
 Endproc

 *--OFFIC 2007
 Procedure AppEvents_WorkbookRowsetComplete(Wb As VARIANT, Description As VARIANT,Sheet As VARIANT, Success As VARIANT) As VOID
 Endproc

 Procedure AppEvents_AfterCalculate() As VOID
 Endproc
 
 *--OFFICE 2010
 Procedure AppEvents_SheetPivotTableAfterValueChange(Sh As VARIANT, TargetPivotTable As VARIANT, TargetRange As VARIANT) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_SheetPivotTableBeforeAllocateChanges(Sh As VARIANT, TargetPivotTable As VARIANT, ValueChangeStart As Number, ValueChangeEnd As Number, Cancel As Logical @) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_SheetPivotTableBeforeCommitChanges(Sh As VARIANT, TargetPivotTable As VARIANT, ValueChangeStart As Number, ValueChangeEnd As Number, Cancel As Logical @) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_SheetPivotTableBeforeDiscardChanges(Sh As VARIANT, TargetPivotTable As VARIANT, ValueChangeStart As Number, ValueChangeEnd As Number) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowOpen(Pvw As VARIANT) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowBeforeEdit(Pvw As VARIANT, Cancel As Logical @) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowBeforeClose(Pvw As VARIANT, Reason As VARIANT, Cancel As Logical @) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowResize(Pvw As VARIANT) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowActivate(Pvw As VARIANT) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_ProtectedViewWindowDeactivate(Pvw As VARIANT) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_WorkbookAfterSave(Wb As VARIANT, Success As Logical) As VOID
 * add user code here
 Endproc

 Procedure AppEvents_WorkbookNewChart(Wb As VARIANT, Ch As VARIANT) As VOID
 * add user code here
 Endproc

Enddefine
#Endif


*-------------
*dummy funct
*-------------
Function Set_Ini
Function GetExeDir
