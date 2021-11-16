*-параметры : форма,Грид
* do  print_grid with thisform,thisform.Grid1
Lparameters m.oForm,m.oGrid
Local m.oColumn,m.cTxtName,m.aMetaData,m.oHeader,m.cFormat,m.cFieldType,m.cAlias,;
 m.cCSource,m.cCSType,m_SQL_Command,m.nIndex,m.oEReport,m.cTargetFName,m.cSourceFName,m_SourceValues,;
 m_TargetValues,m.nOldRn,m.oText

m_SQL_Command=''
m.nIndex=1
m.cAlias=''
m_SourceValues=''
m_TargetValues=''

*---определяем источник данных
Do Case
 Case m.oGrid.RecordSourceType<3
  m.cAlias=Lower(m.oGrid.RecordSource)
 Other
  m.oGrid.SetFocus
  m.cAlias=Lower(Alias())
Endcase 
*---перебираем все колонки
For Each m.oColumn In m.oGrid.Columns
 With  m.oColumn
  m.cTxtName=.CurrentControl
  m.oText=Evaluate('.'+ .CurrentControl)
  *---если текст или логическое выражение ,включим в отчет
  m.cCSource= ' '+Alltrim(Lower(m.oColumn.ControlSource))
  m.cCSType=Type(m.cCSource)
  If Lower(m.oText.BaseClass)='textbox' Or m.cCSType='L'
   m.cTargetFName='field'+Alltrim(Str(m.nIndex))
   If m.cCSType='L'
    m.cSourceFName='iif('+m.cCSource+',"a","")'
   Else
    m.cSourceFName=m.cCSource
   Endif 
   m_SQL_Command=m_SQL_Command+Iif(m.nIndex=1,' ',',')+m.cSourceFName+' as '+m.cTargetFName
   m_SourceValues=m_SourceValues+Iif(m.nIndex=1,'(',',')+m.cSourceFName
   m_TargetValues=m_TargetValues+Iif(m.nIndex=1,'(',',')+m.cTargetFName
   *---массив метаданных для построения отчета
   Dimension m.aMetaData(m.nIndex,8)
   m.aMetaData(m.nIndex,1)='*field'+Alltrim(Str(m.nIndex))
   *---ищем заголовок грида
   For Each m.oHeader In .Objects
    If m.oHeader.BaseClass='Header'
     m.aMetaData(m.nIndex,2)=m.oHeader.Caption
     Exit
    Endif 
   Endfor 
   *---ширина колонки
   m.aMetaData(m.nIndex,3)=Max(Int(.Width/(Fontmetric(6,.FontName,.FontSize )+3)),2)
   *---параметры фонта
   m.aMetaData(m.nIndex,4)=.FontBold
   m.aMetaData(m.nIndex,5)=.FontSize
   If Type(m.oColumn.ControlSource)='L'
    m.aMetaData(m.nIndex,6)='Webdings'
    m.aMetaData(m.nIndex,4)=.T.
   Else
    m.aMetaData(m.nIndex,6)=.FontName
   Endif 
   *---порядок расположения колонок
   m.aMetaData(m.nIndex,7)=.ColumnOrder
   *---если в поле tag есть ключ s: , вывести итоги по колонке
   m.aMetaData(m.nIndex,8)='s:'$.Tag
   m.nIndex=m.nIndex+1
  Endif   
 Endwith 
Endfor 
*---сначала копируем данные в промежуточную таблицу
If !Empty(m_SQL_Command)
 *---
 If Val(Substr(Version(),15,2))>=7
  m_SQL_Command='select '+m_SQL_Command+' from  '+m.cAlias+' into curs tmpgrid readw where .f.'
 Else
  m_SQL_Command='select '+m_SQL_Command+' from  '+m.cAlias+' into DBF tmpgrid  where .f.'
 Endif
 &m_SQL_Command
 _Cliptext=m_SQL_Command
 *---
 Select (m.cAlias)
 m_SourceValues=m_SourceValues+')'
 m_TargetValues=m_TargetValues +')'
 m.nOldRn=Recno()
 Scan
  Insert Into tmpgrid &m_TargetValues Values &m_SourceValues
 Endsc
 Go (m.nOldRn)
 *---создаем отчет
 If !Eof('tmpgrid')
  Select tmpgrid
  m.oEReport=Createo('e_report',m.oForm.Caption+'.xls',,1,Left(m.oForm.Caption,30),1)
  If Type('m.oEReport')='O'
   With m.oEReport
    *---номер по порядку
    .add_column('npp','N п\п',6,0,,'~1')
    *---порядок колонок в соответствии с columnorder
    =Asort(aMetaData,7)
    *---создание колонок
    For m.nIndex=1 To Alen(aMetaData,1)
     *---формат колонок
     m.cFormat=.F.
     m.cFieldType=Type(Strt(m.aMetaData[m.nIndex,1],'*',''))
     Do Case
      Case m.cFieldType='D'
       m.cFormat="m/d/yy"
      Case m.cFieldType='C'
       m.cFormat="@"
      Case m.cFieldType='T'
       m.cFormat="m/d/yy h:mm"
     Endc
     *---добавляем колонку
     .Add_Column(m.aMetaData[m.nIndex,1],m.aMetaData[m.nIndex,2],m.aMetaData[m.nIndex,3],0,m.aMetaData[m.nIndex,8],,m.cFormat,,,,,,,,m.aMetaData[m.nIndex,4],m.aMetaData[m.nIndex,5],m.aMetaData[m.nIndex,6])
    Endfo
    *---заголовок отчета
    .add_value(1,1,m.oForm.Caption,.T.,.F.,.T.,15)
    *---шаблон
    .Pattern='Журнал.xls'
    .NoPageSetup=.T.
    .AutoFilter()
    *---формирование отчета
    .Make_Report()
   Endwith
  Endif
 Endif 
 Use In tmpgrid
Endif
Select(m.cAlias)