**************************************************************************
*! Copyright by Anjel 
*! 
*! ���������������� ��� ������ � TrXLReport
*! 
**************************************************************************

&& (�� ���������) ����� ����� ��������� � ������ ������ �������� DataArray � NoTableDataArray.
#define trxlrepFlagNamesInFirstRow                    0	

&& ����� ����� ��������� � ��������� ������ �������� DataArray � NoTableDataArray.
#define trxlrepFlagNamesInLastRow                     1

&& ����� ����� ��������� � ������ ������� �������� DataArray � NoTableDataArray.
#define trxlrepFlagNamesInFirstColumn                 2

&& ����� ����� ��������� � ��������� ������� �������� DataArray � NoTableDataArray
#define trxlrepFlagNamesInLastColumn                  4

&& �� ����������� ���� MS Excel �� ����� ���������� ������ CreateReport.
#define trxlrepFlagViewNotMinimizedOnStar             8

&& ��� ������ ������ CreateReport ������ ��������� ����� ��������� ���������� MS Excel.
#define trxlrepFlagExcelNew                          16

&& ��������� �������������� �������������� ������� �������� �� �������. 
&& �������� ������� ����� ����������� ����� ���������� ������ CreateReport.
#define trxlrepFlagPageBreaks                        32

#define trxlrepFlagReportSave                        64
#define trxlrepFlagInsertRows                       128
#define trxlrepFlagRemoveDeepLevelIfEmpty           256
#define trxlrepFlagRemoveReportIfEmpty              512
#define trxlrepFlagAutoFitDeepLevel                1024
#define trxlrepFlagAutoFitNotDeepLevels            2048

&& �� ������������� ���� MS Excel � ����� Default ����� ���������� ������ CreateReport.
#define trxlrepFlagViewNotNormalOnComplet          4096

#define trxlrepFlagTemplateScanOnce                8192
#define trxlrepFlagReportCellsFontSize1OnStart
#define trxlrepFlagReportSaved                    32768

&& ������� MS Excel ����� �������� ������.
#define trxlrepFlagExcelQuitOnComplete            65536
 
#define trxlrepFlagReportProtect                 131072
#define trxlrepFlagPrint                         262144
#define trxlrepFlagPrint2                        524288
