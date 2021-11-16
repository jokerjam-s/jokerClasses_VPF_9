* Генератор перекрестных таблиц er_Xtab
* Разработан Банщиковым Евгением ,
* для работы с генератором отчетов e_report
* (c) Банщиков Е.В. ,г.Курган ,2002 г.
* --------------------------------------------------------------------------
* Параметры:
* cColumnField    -имя поля для постороения столбцов (Column Field)
* [cKeyFieldList] -список ключевых полей ,разделенных запятыми
* [nColumnSort]   -сортировка колонок (1 -нет, 2 -asce ,3- desc) 1 по умолч
* [nRowCalc]      -метод калькуляции по строкам (0 -нет,1 -sum,2 -average,3 -max, 4-min)
* [cEr_dbf ]      -имя файла (курсора) результирующей таблицы ( er_xtab по умолчанию)
* [cCl_dbf ]      -имя файла (курсора)  таблицы имен колонок  ( c_list по умолчанию)
* [lNoCursor]     -создать таблицу (по умолчанию создается курсор)

*-------------------------------------------------------------------------
* На выходе :
* er_xtab		Перекрестная таблица
* c_list		Список имен колонок
* Имя перекрестного поля формируется из номера колонки и номера data field
* ErXFieldPrefix+1_ __3    - 1 поле данных 3 колонки
* т.е. номер колонки = recno('c_list')
*--------------------------------------------------------------------
* Предпологается ,что
* 1. все поля слева от cColumnField образуют строки (Row Field)
* 2. все поля справа от cColumnField являются полями данных (data field)
* 3.Исходная таблица должна быть открыта  в текущей рабочей области
* 4.Row Field могут содержать ,как информационные поля ,так и поля
*   для построения групп отчета
* 5.data field должны иметь числовой тип
* 6.Если пропущен cKeyFieldList ,то все Row Field считаются ключевыми.
*   Указанием cKeyFieldList можно уменьшить время построения таблицы
* 7.По умолчанию пустые ячейки заполняются 0 , для заполнения .Null. определите переменную lErXtIsNull=.t.
*----------------------------------------------------------------------------
#Include er_xtab.h

Lparameters  m.cColumnField,m.cKeyFieldList,m.nColumnSort,m.nRowCalc,m.cER_dbf,m.cCl_Dbf,m.lNoCursor
Local m.oEr_Xtab,m.lOk
m.lOk=.F.
m.oEr_Xtab=Createobject('Er_Xtab',m.cColumnField,m.cKeyFieldList)
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
  If Vartype(m.lNoCursor)='L'
   .lNoCursor=m.lNoCursor
  Endif
  m.lOk=.Gen_XTab()
  *Wait .nTime_of_the_work Window 
 Endwith
Endif
Return m.lOk

*==============================
Define Class er_xtab As Custom
 *==============================
 *---Исходная таблица
 cSource_Table=''
 *---имя поля для постороения столбцов (Column Field)
 cColumnField=''
 *---список ключевых полей ,разделенных запятыми
 cKeyFieldList=''
 *---сортировка колонок (1 -нет, 2 -asce ,3- desc) 1 по умолч
 nColumnSort=1
 *---метод калькуляции по строкам (0 -нет,1 -sum,2 -average,3 -max, 4-min)
 nRowCalc =0
 *---имя файла (курсора) результирующей таблицы ( er_xtab по умолчанию)
 cER_dbf='Er_Xtab'
 *---имя файла (курсора)  таблицы имен колонок  ( c_list по умолчанию)
 cCl_Dbf='C_List'
 *---создать таблицу (по умолчанию создается курсор)
 lNoCursor=.F.
 *---сообщения
 lShowMessage=.T.
 *---предупреждения
 lShowWarning=.T.
 *---флаг ошибки
 lError=.F.
 *---Текст ошибки
 cErrorDescription=''
 *---Null
 lErXtIsNull=.F.
 *---
 nTime_of_the_work=0
 *--- 
 *--------------
 Procedure Init
 *--------------
 Lparameters m.cColumnField,m.cKeyFieldList
 If Vartype(m.cColumnField)='C'
  This.cColumnField=m.cColumnField
 Endif
 If Vartype(m.cKeyFieldList)='C'
  This.cKeyFieldList=m.cKeyFieldList
 Endif

 *---------------------Имя поля
 Procedure  GenFieldName
 *----------------------
 Lparameters  m.nInd1,m.nInd2
 Return  ErXFieldPrefix+Padr(m.nInd2,3,'_')+Padl(m.nInd1,3,'_')

 *----------------Предупреждения
 Procedure  ext_Warning
 *---------------
 Lparameters  m.cWarning
 This.cErrorDescription=m.cWarning
 If This.lShowWarning
  This.On_Warning(m.cWarning)
 Endif

 *----------------на Предупреждения
 Procedure  On_Warning
 *---------------
 Lparameters  m.cWarning
 =Messagebox(m.cWarning,48,ErXt_Info )

 *----------------Сообщения
 Procedure  ext_Message
 *---------------
 Lparameters  m.cMessage
 If This.lShowMessage
  This.On_Message(m.cMessage)
 Endif

 *----------------На Сообщения
 Procedure  On_Message
 *---------------
 Lparameters  m.cMessage
 Wait m.cMessage Wind Nowa

 *-----------------создание перекрестной таблицы
 Procedure Gen_XTab
 *------------------
 Local m_ColumnField,m.cKeyFieldList,m.nColumnSort,m.nRowCalc,m.cER_dbf,m.cCl_Dbf,m.lNoCursor,;
  m.lOk,m.nCFrn,m_OldDelet,m.cDbf,m.cEr_RowpExpres,m.nSFcount,m.nIndex,m.cDest,m_ErXtabCommand,;
  m.cOldCollate,m_GropFilt1,m.cErGrp_2Filter,m.lSeek,m.сNVL1,m.сNVL2,m.cC_list,m.cER_Xtab,m_Order,m.cColumnSort,;
  m.nIndCnt,m.cEr_Index_Expr,m.nPos,m.nValue,m.nIndexJ,m_Cursor,m_OldExact,m_OldAnsi,m.cStructAlias,m.cBlankAlias,m.lIsNull,m.lFox6,m.lFox7,m.nBeginSeconds
 Private m.aBlank_arr,m.aSumRepl,m.aEr_Dbf,m.aSumF
 *---
 m.nBeginSeconds=Seconds()
 *---
 m.lFox6=Val(Substr(Version(),15,2))=6
 m.lFox7=Val(Substr(Version(),15,2))<=7
 If m.lFox6
  m_ReadWrite=''
 Else
  m_ReadWrite='ReadWrite'
 Endif
 *---
 This.ext_Message(InfoMessage)
 *---null
 m.lIsNull=This.lErXtIsNull
 If Type('m.lErXtIsNull')='L'
  m.lIsNull=m.lErXtIsNull
 Endif
 *---
 m_ColumnField=This.cColumnField
 m.cKeyFieldList=This.cKeyFieldList
 m.nColumnSort=This.nColumnSort
 m.nRowCalc=This.nRowCalc
 m.cER_dbf=This.cER_dbf
 m.cCl_Dbf=This.cCl_Dbf
 m.lNoCursor=This.lNoCursor
 m.lOk=.T.
 m.lSeek=.F.
 *---
 m.cOldCollate=Set('Collate')
 m_OldDelet=Set('Delete')
 m_OldExact=Set('Exact')
 m_OldAnsi=Set('Ansi')
 *---
 Set Delet On
 Set Collate To 'MACHINE'
 Set Exact On
 Set Ansi On
 *---курсор
 If m.lNoCursor
  m_Cursor='dbf'
 Else
  m_Cursor='cursor'
 Endif
 *---имена таблиц
 m.cC_list='c_list'
 m.cER_Xtab='er_xtab'
 If Type('m.cCl_Dbf')!='C'
  If Type('m.cER_dbf')='C'
   If m.lNoCursor
    m.cCl_Dbf =Substr(m.cER_dbf,1,Rat(".",m.cER_dbf)-1)+".fld"
    m.cC_list='?'
   Else
    m.cCl_Dbf =Substr(m.cER_dbf,1,Rat(".",m.cER_dbf)-1)
    m.cC_list=m.cCl_Dbf
   Endif
  Else
   If m.lNoCursor
    m.cCl_Dbf='c_list.dbf'
   Else
    m.cCl_Dbf='c_list'
   Endif
  Endif
 Endif
 If Type('m.cER_dbf')!='C'
  If m.lNoCursor
   m.cER_dbf='er_xtab.dbf'
  Else
   m.cER_dbf='er_xtab'
  Endif
 Endif
 *---
 If Used('ErXtab_Data_Struct')
  Use In ErXtab_Data_Struct
 Endif
 *---
 If Used('er_xtab')
  Use In 'er_xtab'
 Endif
 *---
 If Used('c_list')
  Use In 'c_list'
 Endif
 *---ограничение ключевых полей
 m_GropFilt1=''
 m.cErGrp_2Filter='.t.'
 If Type('m.cKeyFieldList')='C' .And. !Empt(m.cKeyFieldList)
  m.cKeyFieldList=Upper(','+Alltrim(m.cKeyFieldList)+',')
  m_GropFilt1="for ','+alltrim(uppe(field_name))+','$m.cKeyFieldList"
  m.cErGrp_2Filter="','+allt(uppe(field(m.nIndex)))+','$m.cKeyFieldList"
 Endif
 *---сортировка колонок
 m.cColumnSort=''
 If Type('m.nColumnSort') ='C'
  m.nPos=At(':',m.nColumnSort)
  m.cColumnSort=Left(m.nColumnSort,m.nPos-1)
  m.nColumnSort=Val(Substr(m.nColumnSort,m.nPos+1,1))
 Endif
 *---
 Do Case
  Case Empt(m.nColumnSort)
   m.nColumnSort=''
  Case m.nColumnSort=1
   m.nColumnSort=''
  Case m.nColumnSort=2
   m.nColumnSort=' asc'
  Case m.nColumnSort=3
   m.nColumnSort=' desc'
 Endcase
 *---
 If !Empty(This.cSource_Table)
  If Used(This.cSource_Table)
   Select (This.cSource_Table)
  Endif 
 Endif 
 *---
 If Used()
  m.cDbf=Alias()
  This.cSource_Table=m.cDbf
  m.cStructAlias=Sys(2015)
  Copy Structure Extended To (m.cStructAlias)
  Sele 0
  Use (m.cStructAlias) Alias ErXtab_Data_Struct Exclusive
  =CursorSetProp('buffering',1,'ErXtab_Data_Struct')
  *---уберем ненужные поля
  Delete  All For Inlist(Alltrim(ErXtab_Data_Struct.field_type),'M','G','W') In ErXtab_Data_Struct
  *---
  If m.lFox7
   Pack
  Else
   Pack In ErXtab_Data_Struct
  Endif
  *---ищем columnField
  Locate For Allt(Upper(ErXtab_Data_Struct.field_name))==Allt(Uppe(m_ColumnField))
  If Found('ErXtab_Data_Struct')
   *---Проверим наличие  RowFields
   If Recno('ErXtab_Data_Struct')>1
    *---ColumnField должна быть определенного типа
    If Inlist(Alltrim(ErXtab_Data_Struct.field_type),'C','D','N','I','B','F','V','T')
     *---фиксируем позицию ColumnField
     m.nCFrn=Recno('ErXtab_Data_Struct')
     Skip 1 In ErXtab_Data_Struct
     *---проверим наличие SumField
     If !Eof('ErXtab_Data_Struct')
      m.nSFcount=0
      *---Тип SumField должен быть числовым (+ дата)
      Scan Rest
       If !Inlist(Alltrim(ErXtab_Data_Struct.field_type),'N','I','B','F','Y')
        m.lOk=.F.
        Exit
       Endif
       m.nSFcount=m.nSFcount+1
      Endscan
      If m.lOk
       *---скопируем SumField
       Go m.nCFrn+1 In ErXtab_Data_Struct
       Dimension m.aSumF(m.nSFcount,4)
       Copy To Array aSumF Rest
       *---удалин ненужные поля
       Go m.nCFrn In ErXtab_Data_Struct
       Delete Rest In ErXtab_Data_Struct
       *---
       If m.lFox7
        Pack
       Else
        Pack In ErXtab_Data_Struct
       Endif
       *---построим выражение для поиска RowField
       m.cEr_RowpExpres=''
       Scan &m_GropFilt1
        m.cEr_RowpExpres=m.cEr_RowpExpres+Iif(Empt(m.cEr_RowpExpres)," ",".and.")+m.cDbf+'.'+Alltrim(field_name)+'='+Alltrim(field_name)
       Endscan
       *---есть ключевые поля ?
       If .T. &&!empt(m.cEr_RowpExpres)
        *---только итоги
        If Empty(m.cEr_RowpExpres)
         m.cEr_RowpExpres=' .t.'
        Endif
        *---сортировка
        m_Order=''
        If !Empty(m.cColumnSort)
         m_Order=' Order by '+m.cColumnSort+m.nColumnSort
        Else
         If  !Empty(m.nColumnSort)
          m_Order=' Order by 1 '+m.nColumnSort
         Endif
        Endif
        *---выберем ColumnField в таблицу c_list
        Select Distin &m_ColumnField As cf From (m.cDbf) Into &m_Cursor (m.cCl_Dbf) &m_ReadWrite  &m_Order
        *---Сгенерируем имена x-field ,и добавим их в шаблон
        If m.cC_list=='?' And m.lNoCursor
         Use
         Use (m.cCl_Dbf) Alias 'c_list'
        Endif
        *---
        m.cC_list=Alias()
        Select(m.cC_list)
        *--
        Scan
         For m.nIndex=1 To m.nSFcount
          Insert Into ErXtab_Data_Struct ;
           (field_name,field_type,field_len,field_dec) ;
           Values ;
           (This.GenFieldName(Recno(m.cC_list),m.nIndex),m.aSumF(m.nIndex,2),Min(m.aSumF(m.nIndex,3)+2,20),m.aSumF(m.nIndex,4))
         Endfor
        Endscan
        *---индекс
        Index On  cf Tag cf
        *---итоги по строкам
        If !Empty(m.nRowCalc)
         For m.nIndex=1 To m.nSFcount
          Insert Into ErXtab_Data_Struct (field_name,field_type,field_len,field_dec);
           Values (Padl(m.nIndex,4,'_'),'N',20,5)
         Endfor
        Endif
        *---
        If Reccount('ErXtab_Data_Struct')<=255
         *---создадим перекрестную таблицу
         Select ErXtab_Data_Struct
         Replace All ErXtab_Data_Struct.FIELD_NULL With .T. In ErXtab_Data_Struct
         *--- 
         Select * From ErXtab_Data_Struct Into Array aEr_Dbf
         *---    
         Use In ErXtab_Data_Struct
         *---пустые значения
         Sele 0
         *Create  (m.cBlankAlias) From (m.cStructAlias)
         *Use In m.cBlankAlias
         *Select 0
         *Use (m.cBlankAlias) Alias ErXtab_Blank_Table
         *=Afields(aEr_Dbf)
         Create  Cursor ErXtab_Blank_Table From Array aEr_Dbf
         Scatter To aBlank_arr
         m.сNVL1=''
         m.сNVL2=''
         If m.lIsNull
          m.aBlank_arr=Null
         Endif
         m.сNVL1='nvl('
         m.сNVL2=',0)'
         Insert Into ErXtab_Blank_Table From Array aBlank_arr
         Release aBlank_arr
         *---
         Select  0
         *---
         If m.lNoCursor
          Create Table (m.cER_dbf) From Array aEr_Dbf
         Else
          Create Cursor (m.cER_dbf) From Array aEr_Dbf
         Endif
         *---
         m.cER_Xtab=Alias()
         Select (m.cER_Xtab)
         *---создадим индексы для ускорения поиска
         m.nIndCnt=0
         For m.nIndex=1 To m.nCFrn-1
          If &cErGrp_2Filter
           m.cEr_Index_Expr= Field(m.nIndex)
           Index On &cEr_Index_Expr Tag (Sys(2015)) Additive
           m.nIndCnt=m.nIndCnt+1
          Endif
         Endfor
         *---одно ключевое поле
         If m.nIndCnt=1
          m.lSeek=.T.
          m.cEr_Index_Expr=m.cDbf+'.'+m.cEr_Index_Expr
         Else
          Set Order To
         Endif
         *---заполним перекрестную таблицу
         Select (m.cDbf)
         Scan
          *---очистим переменные
          Select ErXtab_Blank_Table
          Scatter Memvar &&blan
          Select (m.cDbf)
          *---для вычисления имени x-fielf
          =Seek(Evaluate(m_ColumnField),m.cC_list)
          *---считаем информационные поля
          Scatter Memvar
          Select  (m.cER_Xtab)
          *---поиск строки
          If m.lSeek
           =Seek(Evaluate(m.cEr_Index_Expr))
          Else
           Locate For &cEr_RowpExpres
          Endif
          If Found()
           *---добавим сумму
           m_ErXtabCommand='replace '
           For m.nIndex=1 To m.nSFcount
            m.cDest=This.GenFieldName(Recno(m.cC_list),m.nIndex)
            m_ErXtabCommand=m_ErXtabCommand+Iif(m_ErXtabCommand=='replace ','',',')+m.cDest+' with '+m.сNVL1+m.cDest+m.сNVL2+'+'+m.cDbf+'.'+Alltrim(m.aSumF(m.nIndex,1))
           Endfor
           &m_ErXtabCommand
          Else
           *---добавим строку
           For m.nIndex=1 To m.nSFcount
            m_ErXtabCommand='m.'+This.GenFieldName(Recno(m.cC_list),m.nIndex)+'='+m.cDbf+'.'+m.aSumF(m.nIndex,1)
            &m_ErXtabCommand
           	*m.cVarname='m.'+This.GenFieldName(Recno(m.cC_list),m.nIndex)
           	*Store Evaluate(m.cDbf+'.'+m.aSumF(m.nIndex,1)) To (m.cVarname)
           Endf
           Insert Into (m.cER_Xtab) From Memvar
          Endif
         Endscan
         *---итоги по строкам
         If !Empty(m.nRowCalc)
          This.ext_Message(CalculMessage)
          Select (m.cC_list)
          Set Order To
          Dimension m.aSumRepl(m.nSFcount,Reccount(m.cC_list)+1)
          m.aSumRepl=''
          For m.nIndex=1 To m.nSFcount
           m.aSumRepl(m.nIndex,1)='replace '+Padl(m.nIndex,4,'_')+' with '
           Scan
            If Inlist(m.nRowCalc,1,2)
             m.aSumRepl(m.nIndex,1)=m.aSumRepl(m.nIndex,1)+Iif(Recno()=1,'(','+')+m.сNVL1+This.GenFieldName(Recno(m.cC_list),m.nIndex)+m.сNVL2
            Else
             m.aSumRepl(m.nIndex,Recno(m.cC_list)+1)=m.сNVL1+m.cER_Xtab+'.'+This.GenFieldName(Recno(m.cC_list),m.nIndex)+m.сNVL2
            Endif
           Endscan
           If Inlist(m.nRowCalc,1,2)
            m.aSumRepl(m.nIndex,1) =m.aSumRepl(m.nIndex,1)+')'+Iif(m.nRowCalc=2,'/'+Allt(Str(Reccount(m.cC_list))),'')
           Endif
          Endfor
          *-------------
          Select(m.cER_Xtab)
          *-------------
          Scan
           For m.nIndex=1 To m.nSFcount
            If Inlist(m.nRowCalc,3,4)
             m.nValue=Evaluate(m.aSumRepl(m.nIndex,2))
             For m.nIndexJ=2 To Alen(aSumRepl,2)
              If m.nRowCalc=3
               m.nValue= Max(m.nValue,Evaluate(m.aSumRepl(m.nIndex,m.nIndexJ)))
              Else
               m.nValue=Min(m.nValue,Evaluate(m.aSumRepl(m.nIndex,m.nIndexJ)))
              Endif
             Endfor
             m_ErXtabCommand=m.aSumRepl(m.nIndex,1)+' m.nValue'
            Else
             m_ErXtabCommand=m.aSumRepl(m.nIndex,1)
            Endif
            &m_ErXtabCommand
           Endfor
          Endscan
          Release  m.aSumRepl
         Endif
         *---удалим индексы и временные файлы
         Erase (m.cStructAlias+'.*')
         Use In ErXtab_Blank_Table
         *Erase (m.cBlankAlias+'.*')
         If Used(m.cER_Xtab)
          Select (m.cER_Xtab)
          Delete  Tag All
         Endif
         If Used(m.cC_list)
          Select(m.cC_list)
          Set Order To 
          If !m.lFox6 Or (m.lFox6 And m.lNoCursor)
           Delete Tag All
          Endif  
         Endif
         *---конец
        Else
         m.lOk=.F.
         This.ext_Warning(MaxColumns)
        Endif
       Else
        m.lOk=.F.
        This.ext_Warning(NoKeyFieldFound)
       Endif
      Else
       m.lOk=.F.
       This.ext_Warning(BadDataColumnType)
      Endif
     Else
      m.lOk=.F.
      This.ext_Warning(NoDataField)
     Endif
    Else
     m.lOk=.F.
     This.ext_Warning(BadColumnFieldType)
    Endif
   Else
    m.lOk=.F.
    This.ext_Warning(NoRowField)
   Endif
  Else
   m.lOk=.F.
   This.ext_Warning(NoColumField)
  Endif
 Else
  m.lOk=.F.
  This.ext_Warning(NoOpenDbf)
 Endif

 *---уберем за собой
 If !m.lOk
  If Used('ErXtab_Blank_Table')
   Use In ErXtab_Blank_Table
  Endif
  If Used('ErXtab_Data_Struct')
   Use In ErXtab_Data_Struct
  Endif
  Erase (m.cStructAlias+'.*')
  If Used(m.cC_list)
   Use In (m.cC_list)
  Endif
  If m.lNoCursor
   Erase (m.cCl_Dbf)
  Endif
  If Used(m.cER_Xtab)
   Use In (m.cER_Xtab)
  Endif
  If m.lNoCursor
   Erase (m.cER_dbf)
  Endif
 Endif
 *---
 Set Deleted  &m_OldDelet
 Set Collate To m.cOldCollate
 Set Exact &m_OldExact
 Set Ansi &m_OldAnsi
 *---
 Wait Clear
 This.lError=m.lOk
 This.nTime_of_the_work=Seconds()-m.nBeginSeconds
 Return  m.lOk
 *---
Enddefine