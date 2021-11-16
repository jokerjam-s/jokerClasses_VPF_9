**************************************************************************
*! Copyright by Anjel 
*! 
*! Макроопределения для работы с TrXLReport
*! 
**************************************************************************

&& (по умолчанию) Имена полей находятся в первой строке массивов DataArray и NoTableDataArray.
#define trxlrepFlagNamesInFirstRow                    0	

&& Имена полей находятся в последней строке массивов DataArray и NoTableDataArray.
#define trxlrepFlagNamesInLastRow                     1

&& Имена полей находятся в первом столбце массивов DataArray и NoTableDataArray.
#define trxlrepFlagNamesInFirstColumn                 2

&& Имена полей находятся в последнем столбце массивов DataArray и NoTableDataArray
#define trxlrepFlagNamesInLastColumn                  4

&& Не сворачивать окно MS Excel во время выполнения метода CreateReport.
#define trxlrepFlagViewNotMinimizedOnStar             8

&& При вызове метода CreateReport всегда создавать новый экземпляр приложения MS Excel.
#define trxlrepFlagExcelNew                          16

&& Учитывать горизонтальные принудительные разрывы страницы на шаблоне. 
&& Передача данного флага увеличивает время выполнения метода CreateReport.
#define trxlrepFlagPageBreaks                        32

#define trxlrepFlagReportSave                        64
#define trxlrepFlagInsertRows                       128
#define trxlrepFlagRemoveDeepLevelIfEmpty           256
#define trxlrepFlagRemoveReportIfEmpty              512
#define trxlrepFlagAutoFitDeepLevel                1024
#define trxlrepFlagAutoFitNotDeepLevels            2048

&& Не разворачивать окно MS Excel в режим Default после выполнения метода CreateReport.
#define trxlrepFlagViewNotNormalOnComplet          4096

#define trxlrepFlagTemplateScanOnce                8192
#define trxlrepFlagReportCellsFontSize1OnStart
#define trxlrepFlagReportSaved                    32768

&& Закрыть MS Excel после создания отчёта.
#define trxlrepFlagExcelQuitOnComplete            65536
 
#define trxlrepFlagReportProtect                 131072
#define trxlrepFlagPrint                         262144
#define trxlrepFlagPrint2                        524288
