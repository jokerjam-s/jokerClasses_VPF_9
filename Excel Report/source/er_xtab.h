#Define CalculMessage 'Расчет итогов по строкам...'
#Define NoOpenDbf 'Не обнаружено открытой таблицы в текущей рабочей области '
#Define NoColumField 'Не наидено поле для создания колонок'
#Define NoRowField  'Не обнаружено полей для создания строк'
#Define BadColumnFieldType  'Неверный тип поля для построения колонок'
#Define NoDataField  'Не обнаружено полей для данных x-таблицы'
#Define BadDataColumnType 'Неверный тип полей данных'
#Define MaxColumns  'Количество результирующих колонок превышает 255'
#Define NoKeyFieldFound 'Ключевые поля ,заданные в cKeyFieldList не найдены'
#Define InfoMessage  'Создание перекрестной таблицы ...'
#Define ErXt_Info  'Генератор перекрестных таблиц er_Xtab'

#If Val(Substr(Version(),15,2))<=7
 #Define ErXFieldPrefix  'x'
#Else 
 #Define ErXFieldPrefix  '_'
#EndIf 