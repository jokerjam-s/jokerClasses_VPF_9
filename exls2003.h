**************************************************************************
*! Copyright by Anjel 
*! 
*! Описание констант для работы с MS Excel 2003
*! 
**************************************************************************

&& Boolean ReDefine
#define True  .T.
#define False .F.

&& XlApplicationInternational

#define xl24HourClock  33
#define xl4DigitYears  43
#define xlAlternateArraySeparator  16
#define xlColumnSeparator  14
#define xlCountryCode  1
#define xlCountrySetting  2
#define xlCurrencyBefore  37
#define xlCurrencyCode  25
#define xlCurrencyDigits  27
#define xlCurrencyLeadingZeros  40
#define xlCurrencyMinusSign  38
#define xlCurrencyNegative  28
#define xlCurrencySpaceBefore  36
#define xlCurrencyTrailingZeros  39
#define xlDateOrder  32
#define xlDateSeparator  17
#define xlDayCode  21
#define xlDayLeadingZero  42
#define xlDecimalSeparator  3
#define xlGeneralFormatName  26
#define xlHourCode  22
#define xlLeftBrace  12
#define xlLeftBracket  10
#define xlListSeparator  5
#define xlLowerCaseColumnLetter  9
#define xlLowerCaseRowLetter  8
#define xlMDY  44
#define xlMetric  35
#define xlMinuteCode  23
#define xlMonthCode  20
#define xlMonthLeadingZero  41
#define xlMonthNameChars  30
#define xlNoncurrencyDigits  29
#define xlNonEnglishFunctions  34
#define xlRightBrace  13
#define xlRightBracket  11
#define xlRowSeparator  15
#define xlSecondCode  24
#define xlThousandsSeparator  4
#define xlTimeLeadingZero  45
#define xlTimeSeparator  18
#define xlUpperCaseColumnLetter  7
#define xlUpperCaseRowLetter  6
#define xlWeekdayNameChars  31
#define xlYearCode  19       

&& XlApplyNamesOrder

#define xlColumnThenRow  2
#define xlRowThenColumn  1

&& XlArabicModes

#define xlArabicBothStrict  3
#define xlArabicNone  0
#define xlArabicStrictAlefHamza  1
#define xlArabicStrictFinalYaa  2

&& XlArrangeStyle

#define Constant Value
#define xlArrangeStyleCascade  7
#define xlArrangeStyleHorizontal  -4128
#define xlArrangeStyleTiled  1
#define xlArrangeStyleVertical  -4166

&& XlArrowHeadLength

#define xlArrowHeadLengthLong  3
#define xlArrowHeadLengthMedium  -4138
#define xlArrowHeadLengthShort  1

&& XlArrowHeadStyle

#define xlArrowHeadStyleClosed  3
#define xlArrowHeadStyleDoubleClosed  5
#define xlArrowHeadStyleDoubleOpen  4
#define xlArrowHeadStyleNone  -4142
#define xlArrowHeadStyleOpen  2

&& XlArrowHeadWidth

#define xlArrowHeadWidthMedium  -4138
#define xlArrowHeadWidthNarrow  1
#define xlArrowHeadWidthWide  3

&& XlAutoFillType

#define xlFillCopy  1
#define xlFillDays  5
#define xlFillDefault  0
#define xlFillFormats  3
#define xlFillMonths  7
#define xlFillSeries  2
#define xlFillValues  4
#define xlFillWeekdays  6
#define xlFillYears  8
#define xlGrowthTrend  10
#define xlLinearTrend  9

&& XlAutoFilterOperator

#define xlAnd  1
#define xlBottom10Items  4
#define xlBottom10Percent  6
#define xlOr  2
#define xlTop10Items  3
#define xlTop10Percent  5

&& XlAxisCrosses

#define xlAxisCrossesAutomatic  -4105
#define xlAxisCrossesCustom  -4114
#define xlAxisCrossesMaximum  2
#define xlAxisCrossesMinimum  4

&& XlAxisGroup

#define xlPrimary  1
#define xlSecondary  2

&& XlAxisType

#define xlCategory  1
#define xlSeriesAxis  3
#define xlValue  2

&& XlBackground

#define xlBackgroundAutomatic  -4105
#define xlBackgroundOpaque  3
#define xlBackgroundTransparent  2

&& XlBarShape

#define xlBox  0
#define xlConeToMax  5
#define xlConeToPoint  4
#define xlCylinder  3
#define xlPyramidToMax  2
#define xlPyramidToPoint  1

&& XlBordersIndex

#define xlDiagonalDown  5
#define xlDiagonalUp  6
#define xlEdgeBottom  9
#define xlEdgeLeft  7
#define xlEdgeRight  10
#define xlEdgeTop  8
#define xlInsideHorizontal  12
#define xlInsideVertical  11

&& XlBorderWeight

#define xlHairline  1
#define xlMedium  -4138
#define xlThick  4
#define xlThin  2

&& XlBuiltInDialog

#define _xlDialogChartSourceData  541
#define _xlDialogPhonetic  538
#define xlDialogActivate  103
#define xlDialogActiveCellFont  476
#define xlDialogAddChartAutoformat  390
#define xlDialogAddinManager  321
#define xlDialogAlignment  43
#define xlDialogApplyNames  133
#define xlDialogApplyStyle  212
#define xlDialogAppMove  170
#define xlDialogAppSize  171
#define xlDialogArrangeAll  12
#define xlDialogAssignToObject  213
#define xlDialogAssignToTool  293
#define xlDialogAttachText  80
#define xlDialogAttachToolbars  323
#define xlDialogAutoCorrect  485
#define xlDialogAxes  78
#define xlDialogBorder  45
#define xlDialogCalculation  32
#define xlDialogCellProtection  46
#define xlDialogChangeLink  166
#define xlDialogChartAddData  392
#define xlDialogChartLocation  527
#define xlDialogChartOptionsDataLabelMultiple  724
#define xlDialogChartOptionsDataLabels  505
#define xlDialogChartOptionsDataTable  506
#define xlDialogChartSourceData  540
#define xlDialogChartTrend  350
#define xlDialogChartType  526
#define xlDialogChartWizard  288
#define xlDialogCheckboxProperties  435
#define xlDialogClear  52
#define xlDialogColorPalette  161
#define xlDialogColumnWidth  47
#define xlDialogCombination  73
#define xlDialogConditionalFormatting  583
#define xlDialogConsolidate  191
#define xlDialogCopyChart  147
#define xlDialogCopyPicture  108
#define xlDialogCreateList  796
#define xlDialogCreateNames  62
#define xlDialogCreatePublisher  217
#define xlDialogCustomizeToolbar  276
#define xlDialogCustomViews  493
#define xlDialogDataDelete  36
#define xlDialogDataLabel  379
#define xlDialogDataLabelMultiple  723
#define xlDialogDataSeries  40
#define xlDialogDataValidation  525
#define xlDialogDefineName  61
#define xlDialogDefineStyle  229
#define xlDialogDeleteFormat  111
#define xlDialogDeleteName  110
#define xlDialogDemote  203
#define xlDialogDisplay  27
#define xlDialogEditboxProperties  438
#define xlDialogEditColor  223
#define xlDialogEditDelete  54
#define xlDialogEditionOptions  251
#define xlDialogEditSeries  228
#define xlDialogErrorbarX  463
#define xlDialogErrorbarY  464
#define xlDialogErrorChecking  732
#define xlDialogEvaluateFormula  709
#define xlDialogExternalDataProperties  530
#define xlDialogExtract  35
#define xlDialogFileDelete  6
#define xlDialogFileSharing  481
#define xlDialogFillGroup  200
#define xlDialogFillWorkgroup  301
#define xlDialogFilter  447
#define xlDialogFilterAdvanced  370
#define xlDialogFindFile  475
#define xlDialogFont  26
#define xlDialogFontProperties  381
#define xlDialogFormatAuto  269
#define xlDialogFormatChart  465
#define xlDialogFormatCharttype  423
#define xlDialogFormatFont  150
#define xlDialogFormatLegend  88
#define xlDialogFormatMain  225
#define xlDialogFormatMove  128
#define xlDialogFormatNumber  42
#define xlDialogFormatOverlay  226
#define xlDialogFormatSize  129
#define xlDialogFormatText  89
#define xlDialogFormulaFind  64
#define xlDialogFormulaGoto  63
#define xlDialogFormulaReplace  130
#define xlDialogFunctionWizard  450
#define xlDialogGallery3dArea  193
#define xlDialogGallery3dBar  272
#define xlDialogGallery3dColumn  194
#define xlDialogGallery3dLine  195
#define xlDialogGallery3dPie  196
#define xlDialogGallery3dSurface  273
#define xlDialogGalleryArea  67
#define xlDialogGalleryBar  68
#define xlDialogGalleryColumn  69
#define xlDialogGalleryCustom  388
#define xlDialogGalleryDoughnut  344
#define xlDialogGalleryLine  70
#define xlDialogGalleryPie  71
#define xlDialogGalleryRadar  249
#define xlDialogGalleryScatter  72
#define xlDialogGoalSeek  198
#define xlDialogGridlines  76
#define xlDialogImportTextFile  666
#define xlDialogInsert  55
#define xlDialogInsertHyperlink  596
#define xlDialogInsertNameLabel  496
#define xlDialogInsertObject  259
#define xlDialogInsertPicture  342
#define xlDialogInsertTitle  380
#define xlDialogLabelProperties  436
#define xlDialogListboxProperties  437
#define xlDialogMacroOptions  382
#define xlDialogMailEditMailer  470
#define xlDialogMailLogon  339
#define xlDialogMailNextLetter  378
#define xlDialogMainChart  85
#define xlDialogMainChartType  185
#define xlDialogMenuEditor  322
#define xlDialogMove  262
#define xlDialogMyPermission  834
#define xlDialogNew  119
#define xlDialogNewWebQuery  667
#define xlDialogNote  154
#define xlDialogObjectProperties  207
#define xlDialogObjectProtection  214
#define xlDialogOpen  1
#define xlDialogOpenLinks  2
#define xlDialogOpenMail  188
#define xlDialogOpenText  441
#define xlDialogOptionsCalculation  318
#define xlDialogOptionsChart  325
#define xlDialogOptionsEdit  319
#define xlDialogOptionsGeneral  356
#define xlDialogOptionsListsAdd  458
#define xlDialogOptionsME  647
#define xlDialogOptionsTransition  355
#define xlDialogOptionsView  320
#define xlDialogOutline  142
#define xlDialogOverlay  86
#define xlDialogOverlayChartType  186
#define xlDialogPageSetup  7
#define xlDialogParse  91
#define xlDialogPasteNames  58
#define xlDialogPasteSpecial  53
#define xlDialogPatterns  84
#define xlDialogPermission  832
#define xlDialogPhonetic  656
#define xlDialogPivotCalculatedField  570
#define xlDialogPivotCalculatedItem  572
#define xlDialogPivotClientServerSet  689
#define xlDialogPivotFieldGroup  433
#define xlDialogPivotFieldProperties  313
#define xlDialogPivotFieldUngroup  434
#define xlDialogPivotShowPages  421
#define xlDialogPivotSolveOrder  568
#define xlDialogPivotTableOptions  567
#define xlDialogPivotTableWizard  312
#define xlDialogPlacement  300
#define xlDialogPrint  8
#define xlDialogPrinterSetup  9
#define xlDialogPrintPreview  222
#define xlDialogPromote  202
#define xlDialogProperties  474
#define xlDialogPropertyFields  754
#define xlDialogProtectDocument  28
#define xlDialogProtectSharing  620
#define xlDialogPublishAsWebPage  653
#define xlDialogPushbuttonProperties  445
#define xlDialogReplaceFont  134
#define xlDialogRoutingSlip  336
#define xlDialogRowHeight  127
#define xlDialogRun  17
#define xlDialogSaveAs  5
#define xlDialogSaveCopyAs  456
#define xlDialogSaveNewObject  208
#define xlDialogSaveWorkbook  145
#define xlDialogSaveWorkspace  285
#define xlDialogScale  87
#define xlDialogScenarioAdd  307
#define xlDialogScenarioCells  305
#define xlDialogScenarioEdit  308
#define xlDialogScenarioMerge  473
#define xlDialogScenarioSummary  311
#define xlDialogScrollbarProperties  420
#define xlDialogSearch  731
#define xlDialogSelectSpecial  132
#define xlDialogSendMail  189
#define xlDialogSeriesAxes  460
#define xlDialogSeriesOptions  557
#define xlDialogSeriesOrder  466
#define xlDialogSeriesShape  504
#define xlDialogSeriesX  461
#define xlDialogSeriesY  462
#define xlDialogSetBackgroundPicture  509
#define xlDialogSetPrintTitles  23
#define xlDialogSetUpdateStatus  159
#define xlDialogShowDetail  204
#define xlDialogShowToolbar  220
#define xlDialogSize  261
#define xlDialogSort  39
#define xlDialogSortSpecial  192
#define xlDialogSplit  137
#define xlDialogStandardFont  190
#define xlDialogStandardWidth  472
#define xlDialogStyle  44
#define xlDialogSubscribeTo  218
#define xlDialogSubtotalCreate  398
#define xlDialogSummaryInfo  474
#define xlDialogTable  41
#define xlDialogTabOrder  394
#define xlDialogTextToColumns  422
#define xlDialogUnhide  94
#define xlDialogUpdateLink  201
#define xlDialogVbaInsertFile  328
#define xlDialogVbaMakeAddin  478
#define xlDialogVbaProcedureDefinition  330
#define xlDialogView3d  197
#define xlDialogWebOptionsBrowsers  773
#define xlDialogWebOptionsEncoding  686
#define xlDialogWebOptionsFiles  684
#define xlDialogWebOptionsFonts  687
#define xlDialogWebOptionsGeneral  683
#define xlDialogWebOptionsPictures  685
#define xlDialogWindowMove  14
#define xlDialogWindowSize  13
#define xlDialogWorkbookAdd  281
#define xlDialogWorkbookCopy  283
#define xlDialogWorkbookInsert  354
#define xlDialogWorkbookMove  282
#define xlDialogWorkbookName  386
#define xlDialogWorkbookNew  302
#define xlDialogWorkbookOptions  284
#define xlDialogWorkbookProtect  417
#define xlDialogWorkbookTabSplit  415
#define xlDialogWorkbookUnhide  384
#define xlDialogWorkgroup  199
#define xlDialogWorkspace  95
#define xlDialogZoom  256

&& XlCalculatedMemberType

#define xlCalculatedMember  0
#define xlCalculatedSet  1

&& XlCalculation

#define xlCalculationAutomatic  -4105
#define xlCalculationManual  -4135
#define xlCalculationSemiautomatic  2

&& XlCalculationInterruptKey

#define xlAnyKey  2
#define xlEscKey  1
#define xlNoKey  0

&& XlCalculationState

#define xlCalculating  1
#define xlDone  0
#define xlPending  2

&& XlCategoryType

#define xlAutomaticScale  -4105
#define xlCategoryScale  2
#define xlTimeScale  3

&& XlCellInsertionMode

#define xlInsertDeleteCells  1
#define xlInsertEntireRows  2
#define xlOverwriteCells  0

&& XlCellType

#define xlCellTypeAllFormatConditions  -4172
#define xlCellTypeAllValidation  -4174
#define xlCellTypeBlanks  4
#define xlCellTypeComments  -4144
#define xlCellTypeConstants  2
#define xlCellTypeFormulas  -4123
#define xlCellTypeLastCell  11
#define xlCellTypeSameFormatConditions  -4173
#define xlCellTypeSameValidation  -4175
#define xlCellTypeVisible  12

&& XlChartGallery

#define xlAnyGallery  23
#define xlBuiltIn  21
#define xlUserDefined  22

&& XlChartItem

#define xlAxis  21
#define xlAxisTitle  17
#define xlChartArea  2
#define xlChartTitle  4
#define xlCorners  6
#define xlDataLabel  0
#define xlDataTable  7
#define xlDisplayUnitLabel  30
#define xlDownBars  20
#define xlDropLines  26
#define xlErrorBars  9
#define xlFloor  23
#define xlHiLoLines  25
#define xlLeaderLines  29
#define xlLegend  24
#define xlLegendEntry  12
#define xlLegendKey  13
#define xlMajorGridlines  15
#define xlMinorGridlines  16
#define xlNothing  28
#define xlPivotChartDropZone  32
#define xlPivotChartFieldButton  31
#define xlPlotArea  19
#define xlRadarAxisLabels  27
#define xlSeries  3
#define xlSeriesLines  22
#define xlShape  14
#define xlTrendline  8
#define xlUpBars  18
#define xlWalls  5
#define xlXErrorBars  10
#define xlYErrorBars  11

&& XlChartLocation

#define xlLocationAsNewSheet  1
#define xlLocationAsObject  2
#define xlLocationAutomatic  3

&& XlChartPicturePlacement

#define xlAllFaces  7
#define xlEnd  2
#define xlEndSides  3
#define xlFront  4
#define xlFrontEnd  6
#define xlFrontSides  5
#define xlSides  1

&& XlChartPictureType

#define xlStack  2
#define xlStackScale  3
#define xlStretch  1

&& XlChartSplitType

#define xlSplitByCustomSplit  4
#define xlSplitByPercentValue  3
#define xlSplitByPosition  1
#define xlSplitByValue  2

&& XlChartType

#define xl3DArea  -4098
#define xl3DAreaStacked  78
#define xl3DAreaStacked100  79
#define xl3DBarClustered  60
#define xl3DBarStacked  61
#define xl3DBarStacked100  62
#define xl3DColumn  -4100
#define xl3DColumnClustered  54
#define xl3DColumnStacked  55
#define xl3DColumnStacked100  56
#define xl3DLine  -4101
#define xl3DPie  -4102
#define xl3DPieExploded  70
#define xlArea  1
#define xlAreaStacked  76
#define xlAreaStacked100  77
#define xlBarClustered  57
#define xlBarOfPie  71
#define xlBarStacked  58
#define xlBarStacked100  59
#define xlBubble  15
#define xlBubble3DEffect  87
#define xlColumnClustered  51
#define xlColumnStacked  52
#define xlColumnStacked100  53
#define xlConeBarClustered  102
#define xlConeBarStacked  103
#define xlConeBarStacked100  104
#define xlConeCol  105
#define xlConeColClustered  99
#define xlConeColStacked  100
#define xlConeColStacked100  101
#define xlCylinderBarClustered  95
#define xlCylinderBarStacked  96
#define xlCylinderBarStacked100  97
#define xlCylinderCol  98
#define xlCylinderColClustered  92
#define xlCylinderColStacked  93
#define xlCylinderColStacked100  94
#define xlDoughnut  -4120
#define xlDoughnutExploded  80
#define xlLine  4
#define xlLineMarkers  65
#define xlLineMarkersStacked  66
#define xlLineMarkersStacked100  67
#define xlLineStacked  63
#define xlLineStacked100  64
#define xlPie  5
#define xlPieExploded  69
#define xlPieOfPie  68
#define xlPyramidBarClustered  109
#define xlPyramidBarStacked  110
#define xlPyramidBarStacked100  111
#define xlPyramidCol  112
#define xlPyramidColClustered  106
#define xlPyramidColStacked  107
#define xlPyramidColStacked100  108
#define xlRadar  -4151
#define xlRadarFilled  82
#define xlRadarMarkers  81
#define xlStockHLC  88
#define xlStockOHLC  89
#define xlStockVHLC  90
#define xlStockVOHLC  91
#define xlSurface  83
#define xlSurfaceTopView  85
#define xlSurfaceTopViewWireframe  86
#define xlSurfaceWireframe  84
#define xlXYScatter  -4169
#define xlXYScatterLines  74
#define xlXYScatterLinesNoMarkers  75
#define xlXYScatterSmooth  72
#define xlXYScatterSmoothNoMarkers  73

&& XlClipboardFormat

#define xlClipboardFormatBIFF  8
#define xlClipboardFormatBIFF2  18
#define xlClipboardFormatBIFF3  20
#define xlClipboardFormatBIFF4  30
#define xlClipboardFormatBinary  15
#define xlClipboardFormatBitmap  9
#define xlClipboardFormatCGM  13
#define xlClipboardFormatCSV  5
#define xlClipboardFormatDIF  4
#define xlClipboardFormatDspText  12
#define xlClipboardFormatEmbeddedObject  21
#define xlClipboardFormatEmbedSource  22
#define xlClipboardFormatLink  11
#define xlClipboardFormatLinkSource  23
#define xlClipboardFormatLinkSourceDesc  32
#define xlClipboardFormatMovie  24
#define xlClipboardFormatNative  14
#define xlClipboardFormatObjectDesc  31
#define xlClipboardFormatObjectLink  19
#define xlClipboardFormatOwnerLink  17
#define xlClipboardFormatPICT  2
#define xlClipboardFormatPrintPICT  3
#define xlClipboardFormatRTF  7
#define xlClipboardFormatScreenPICT  29
#define xlClipboardFormatStandardFont  28
#define xlClipboardFormatStandardScale  27
#define xlClipboardFormatSYLK  6
#define xlClipboardFormatTable  16
#define xlClipboardFormatText  0
#define xlClipboardFormatToolFace  25
#define xlClipboardFormatToolFacePICT  26
#define xlClipboardFormatVALU  1
#define xlClipboardFormatWK1  10

&& XlCmdType

#define xlCmdCube  1
#define xlCmdDefault  4
#define xlCmdList  5
#define xlCmdSql  2
#define xlCmdTable  3

&& XlColorIndex

#define xlColorIndexAutomatic  -4105
#define xlColorIndexNone  -4142

&& XlColumnDataType

#define xlDMYFormat  4
#define xlDYMFormat  7
#define xlEMDFormat  10
#define xlGeneralFormat  1
#define xlMDYFormat  3
#define xlMYDFormat  6
#define xlSkipColumn  9
#define xlTextFormat  2
#define xlYDMFormat  8
#define xlYMDFormat  5

&& XlCommandUnderlines

#define xlCommandUnderlinesAutomatic  -4105
#define xlCommandUnderlinesOff  -4146
#define xlCommandUnderlinesOn  1

&& XlCommentDisplayMode

#define xlCommentAndIndicator  1
#define xlCommentIndicatorOnly  -1
#define xlNoIndicator  0

&& XlConsolidationFunction

#define xlAverage  -4106
#define xlCount  -4112
#define xlCountNums  -4113
#define xlMax  -4136
#define xlMin  -4139
#define xlProduct  -4149
#define xlStDev  -4155
#define xlStDevP  -4156
#define xlSum  -4157
#define xlUnknown  1000
#define xlVar  -4164
#define xlVarP  -4165

&& XlCopyPictureFormat

#define xlBitmap  2
#define xlPicture  -4147

&& XlCorruptLoad

#define xlExtractData  2
#define xlNormalLoad  0
#define xlRepairFile  1

&& XlCreator

#define xlCreatorCode  1480803660

&& XlCubeFieldType

#define xlHierarchy  1
#define xlMeasure  2
#define xlSet  3

&& XlCutCopyMode

#define xlCopy  1
#define xlCut  2

&& XlCVError

#define xlErrDiv0  2007
#define xlErrNA  2042
#define xlErrName  2029
#define xlErrNull  2000
#define xlErrNum  2036
#define xlErrRef  2023
#define xlErrValue  2015

&& XlDataLabelPosition

#define xlLabelPositionAbove  0
#define xlLabelPositionBelow  1
#define xlLabelPositionBestFit  5
#define xlLabelPositionCenter  -4108
#define xlLabelPositionCustom  7
#define xlLabelPositionInsideBase  4
#define xlLabelPositionInsideEnd  3
#define xlLabelPositionLeft  -4131
#define xlLabelPositionMixed  6
#define xlLabelPositionOutsideEnd  2
#define xlLabelPositionRight  -4152

&& XlDataLabelSeparator

#define xlDataLabelSeparatorDefault  1

&& XlDataLabelsType

#define xlDataLabelsShowBubbleSizes  6
#define xlDataLabelsShowLabel  4
#define xlDataLabelsShowLabelAndPercent  5
#define xlDataLabelsShowNone  -4142
#define xlDataLabelsShowPercent  3
#define xlDataLabelsShowValue  2

&& XlDataSeriesDate

#define xlDay  1
#define xlMonth  3
#define xlWeekday  2
#define xlYear  4

&& XlDataSeriesType

#define xlAutoFill  4
#define xlChronological  3
#define xlDataSeriesLinear  -4132
#define xlGrowth  2

&& XlDeleteShiftDirection

#define xlShiftToLeft  -4159
#define xlShiftUp  -4162

&& XlDirection

#define xlDown  -4121
#define xlToLeft  -4159
#define xlToRight  -4161
#define xlUp  -4162

&& XlDisplayBlanksAs

#define xlInterpolated  3
#define xlNotPlotted  1
#define xlZero  2

&& XlDisplayDrawingObjects

#define xlDisplayShapes  -4104
#define xlHide  3
#define xlPlaceholders  2

&& XlDisplayUnit

#define xlHundredMillions  -8
#define xlHundreds  -2
#define xlHundredThousands  -5
#define xlMillionMillions  -10
#define xlMillions  -6
#define xlTenMillions  -7
#define xlTenThousands  -4
#define xlThousandMillions  -9
#define xlThousands  -3

&& XlDVAlertStyle

#define xlValidAlertInformation  3
#define xlValidAlertStop  1
#define xlValidAlertWarning  2

&& XlDVType

#define xlValidateCustom  7
#define xlValidateDate  4
#define xlValidateDecimal  2
#define xlValidateInputOnly  0
#define xlValidateList  3
#define xlValidateTextLength  6
#define xlValidateTime  5
#define xlValidateWholeNumber  1

&& XlEditionFormat

#define xlBIFF  2
#define xlPICT  1
#define xlRTF  4
#define xlVALU  8

&& XlEditionOptionsOption

#define xlAutomaticUpdate  4
#define xlCancel  1
#define xlChangeAttributes  6
#define xlManualUpdate  5
#define xlOpenSource  3
#define xlSelect  3
#define xlSendPublisher  2
#define xlUpdateSubscriber  2

&& XlEditionType

#define xlPublisher  1
#define xlSubscriber  2

&& XlEnableCancelKey

#define xlDisabled  0
#define xlErrorHandler  2
#define xlInterrupt  1

&& XlEnableSelection

#define xlNoRestrictions  0
#define xlNoSelection  -4142
#define xlUnlockedCells  1

&& XlEndStyleCap

#define xlCap  1
#define xlNoCap  2

&& XlErrorBarDirection

#define xlX  -4168
#define xlY  1

&& XlErrorBarInclude

#define xlErrorBarIncludeBoth  1
#define xlErrorBarIncludeMinusValues  3
#define xlErrorBarIncludeNone  -4142
#define xlErrorBarIncludePlusValues  2

&& XlErrorBarType

#define xlErrorBarTypeCustom  -4114
#define xlErrorBarTypeFixedValue  1
#define xlErrorBarTypePercent  2
#define xlErrorBarTypeStDev  -4155
#define xlErrorBarTypeStError  4

&& XlErrorChecks

#define xlEmptyCellReferences  7
#define xlEvaluateToError  1
#define xlInconsistentFormula  4
#define xlListDataValidation  8
#define xlNumberAsText  3
#define xlOmittedCells  5
#define xlTextDate  2
#define xlUnlockedFormulaCells  6

&& XlFileAccess

#define xlReadOnly  3
#define xlReadWrite  2

&& XlFileFormat

#define xlAddIn  18
#define xlCSV  6
#define xlCSVMac  22
#define xlCSVMSDOS  24
#define xlCSVWindows  23
#define xlCurrentPlatformText  -4158
#define xlDBF2  7
#define xlDBF3  8
#define xlDBF4  11
#define xlDIF  9
#define xlExcel2  16
#define xlExcel2FarEast  27
#define xlExcel3  29
#define xlExcel4  33
#define xlExcel4Workbook  35
#define xlExcel5  39
#define xlExcel7  39
#define xlExcel9795  43
#define xlHtml  44
#define xlIntlAddIn  26
#define xlIntlMacro  25
#define xlSYLK  2
#define xlTemplate  17
#define xlText	-4158
#define xlTextMac  19
#define xlTextMSDOS  21
#define xlTextPrinter  36
#define xlTextWindows  20
#define xlUnicodeText  42
#define xlWebArchive  45
#define xlWJ2WD1  14
#define xlWJ3  40
#define xlWJ3FJ3  41
#define xlWK1  5
#define xlWK1ALL  31
#define xlWK1FMT  30
#define xlWK3  15
#define xlWK3FM3  32
#define xlWK4  38
#define xlWKS  4
#define xlWorkbookNormal  -4143
#define xlWorks2FarEast  28
#define xlWQ1  34
#define xlXMLData  47
#define xlXMLSpreadsheet  46

&& XlFillWith

#define xlFillWithAll  -4104
#define xlFillWithContents  2
#define xlFillWithFormats  -4122

&& XlFilterAction

#define xlFilterCopy  2
#define xlFilterInPlace  1

&& XlFindLookIn

#define xlComments  -4144
#define xlFormulas  -4123
#define xlValues  -4163

&& XlFormatConditionOperator

#define xlBetween  1
#define xlEqual  3
#define xlGreater  5
#define xlGreaterEqual  7
#define xlLess  6
#define xlLessEqual  8
#define xlNotBetween  2
#define xlNotEqual  4

&& XlFormatConditionType

#define xlCellValue  1
#define xlExpression  2

&& XlFormControl

#define xlButtonControl  0
#define xlCheckBox  1
#define xlDropDown  2
#define xlEditBox  3
#define xlGroupBox  4
#define xlLabel  5
#define xlListBox  6
#define xlOptionButton  7
#define xlScrollBar  8
#define xlSpinner  9

&& XlFormulaLabel

#define xlColumnLabels  2
#define xlMixedLabels  3
#define xlNoLabels  -4142
#define xlRowLabels  1

&& XlHAlign

#define xlHAlignCenter  -4108
#define xlHAlignCenterAcrossSelection  7
#define xlHAlignDistributed  -4117
#define xlHAlignFill  5
#define xlHAlignGeneral  1
#define xlHAlignJustify  -4130
#define xlHAlignLeft  -4131
#define xlHAlignRight  -4152

&& XlHebrewModes

#define xlHebrewFullScript  0
#define xlHebrewMixedAuthorizedScript  3
#define xlHebrewMixedScript  2
#define xlHebrewPartialScript  1

&& XlHighlightChangesTime

#define xlAllChanges  2
#define xlNotYetReviewed  3
#define xlSinceMyLastSave  1

&& XlHtmlType

#define xlHtmlCalc  1
#define xlHtmlChart  3
#define xlHtmlList  2
#define xlHtmlStatic  0

&& XlIMEMode

#define xlIMEModeAlpha  8
#define xlIMEModeAlphaFull  7
#define xlIMEModeDisable  3
#define xlIMEModeHangul  10
#define xlIMEModeHangulFull  9
#define xlIMEModeHiragana  4
#define xlIMEModeKatakana  5
#define xlIMEModeKatakanaHalf  6
#define xlIMEModeNoControl  0
#define xlIMEModeOff  2
#define xlIMEModeOn  1

&& XlImportDataAs

#define xlPivotTableReport  1
#define xlQueryTable  0

&& XlInsertFormatOrigin

#define xlFormatFromLeftOrAbove  0
#define xlFormatFromRightOrBelow  1

&& XlInsertShiftDirection

#define xlShiftDown  -4121
#define xlShiftToRight  -4161

&& XlLayoutFormType

#define xlOutline  1
#define xlTabular  0

&& XlLegendPosition

#define xlLegendPositionBottom  -4107
#define xlLegendPositionCorner  2
#define xlLegendPositionLeft  -4131
#define xlLegendPositionRight  -4152
#define xlLegendPositionTop  -4160

&& XlLineStyle

#define xlContinuous  1
#define xlDash  -4115
#define xlDashDot  4
#define xlDashDotDot  5
#define xlDot  -4118
#define xlDouble  -4119
#define xlLineStyleNone  -4142
#define xlSlantDashDot  13

&& XlLink

#define xlExcelLinks  1
#define xlOLELinks  2
#define xlPublishers  5
#define xlSubscribers  6

&& XlLinkInfo

#define xlEditionDate  2
#define xlLinkInfoStatus  3
#define xlUpdateState  1
#define
#define XlLinkInfoType
#define
#define Constant Value
#define xlLinkInfoOLELinks  2
#define xlLinkInfoPublishers  5
#define xlLinkInfoSubscribers  6

&& XlLinkStatus

#define xlLinkStatusCopiedValues  10
#define xlLinkStatusIndeterminate  5
#define xlLinkStatusInvalidName  7
#define xlLinkStatusMissingFile  1
#define xlLinkStatusMissingSheet  2
#define xlLinkStatusNotStarted  6
#define xlLinkStatusOK  0
#define xlLinkStatusOld  3
#define xlLinkStatusSourceNotCalculated  4
#define xlLinkStatusSourceNotOpen  8
#define xlLinkStatusSourceOpen  9

&& XlLinkType

#define xlLinkTypeExcelLinks  1
#define xlLinkTypeOLELinks  2

&& XlListConflict

#define xlListConflictDialog  0
#define xlListConflictDiscardAllConflicts  2
#define xlListConflictError  3
#define xlListConflictRetryAllConflicts  1

&& XlListDataType

#define xlListDataTypeCheckbox  9
#define xlListDataTypeChoice  6
#define xlListDataTypeChoiceMulti  7
#define xlListDataTypeCounter  11
#define xlListDataTypeCurrency  4
#define xlListDataTypeDateTime  5
#define xlListDataTypeHyperLink  10
#define xlListDataTypeListLookup  8
#define xlListDataTypeMultiLineRichText  12
#define xlListDataTypeMultiLineText  2
#define xlListDataTypeNone  0
#define xlListDataTypeNumber  3
#define xlListDataTypeText  1

&& XlListObjectSourceType

#define xlSrcExternal  0
#define xlSrcRange  1
#define xlSrcXml  2

&& XlLocationInTable

#define xlColumnHeader  -4110
#define xlColumnItem  5
#define xlDataHeader  3
#define xlDataItem  7
#define xlPageHeader  2
#define xlPageItem  6
#define xlRowHeader  -4153
#define xlRowItem  4
#define xlTableBody  8

&& XlLookAt

#define xlPart  2
#define xlWhole  1

&& XlMailSystem

#define xlMAPI  1
#define xlNoMailSystem  0
#define xlPowerTalk  2

&& XlMarkerStyle

#define xlMarkerStyleAutomatic  -4105
#define xlMarkerStyleCircle  8
#define xlMarkerStyleDash  -4115
#define xlMarkerStyleDiamond  2
#define xlMarkerStyleDot  -4118
#define xlMarkerStyleNone  -4142
#define xlMarkerStylePicture  -4147
#define xlMarkerStylePlus  9
#define xlMarkerStyleSquare  1
#define xlMarkerStyleStar  5
#define xlMarkerStyleTriangle  3
#define xlMarkerStyleX  -4168

&& XlMouseButton

#define xlNoButton  0
#define xlPrimaryButton  1
#define xlSecondaryButton  2

&& XlMousePointer

#define xlDefault  -4143
#define xlIBeam  3
#define xlNorthwestArrow  1
#define xlWait  2

&& XlMSApplication

#define xlMicrosoftAccess  4
#define xlMicrosoftFoxPro  5
#define xlMicrosoftMail  3
#define xlMicrosoftPowerPoint  2
#define xlMicrosoftProject  6
#define xlMicrosoftSchedulePlus  7
#define xlMicrosoftWord  1

#define XlObjectSize

#define xlFitToPage  2
#define xlFullPage  3
#define xlScreenSize  1

&& XlOLEType

#define xlOLEControl  2
#define xlOLEEmbed  1
#define xlOLELink  0

&& XlOLEVerb

#define xlVerbOpen  2
#define xlVerbPrimary  1

&& XlOrder

#define xlDownThenOver  1
#define xlOverThenDown  2

&& XlOrientation

#define xlDownward  -4170
#define xlHorizontal  -4128
#define xlUpward  -4171
#define xlVertical  -4166

&& XlPageBreak

#define xlPageBreakAutomatic  -4105
#define xlPageBreakManual  -4135
#define xlPageBreakNone  -4142

&& XlPageBreakExtent

#define xlPageBreakFull  1
#define xlPageBreakPartial  2

&& XlPageOrientation

#define xlLandscape  2
#define xlPortrait  1

&& XlPaperSize

#define xlPaper10x14  16
#define xlPaper11x17  17
#define xlPaperA3  8
#define xlPaperA4  9
#define xlPaperA4Small  10
#define xlPaperA5  11
#define xlPaperB4  12
#define xlPaperB5  13
#define xlPaperCsheet  24
#define xlPaperDsheet  25
#define xlPaperEnvelope10  20
#define xlPaperEnvelope11  21
#define xlPaperEnvelope12  22
#define xlPaperEnvelope14  23
#define xlPaperEnvelope9  19
#define xlPaperEnvelopeB4  33
#define xlPaperEnvelopeB5  34
#define xlPaperEnvelopeB6  35
#define xlPaperEnvelopeC3  29
#define xlPaperEnvelopeC4  30
#define xlPaperEnvelopeC5  28
#define xlPaperEnvelopeC6  31
#define xlPaperEnvelopeC65  32
#define xlPaperEnvelopeDL  27
#define xlPaperEnvelopeItaly  36
#define xlPaperEnvelopeMonarch  37
#define xlPaperEnvelopePersonal  38
#define xlPaperEsheet  26
#define xlPaperExecutive  7
#define xlPaperFanfoldLegalGerman  41
#define xlPaperFanfoldStdGerman  40
#define xlPaperFanfoldUS  39
#define xlPaperFolio  14
#define xlPaperLedger  4
#define xlPaperLegal  5
#define xlPaperLetter  1
#define xlPaperLetterSmall  2
#define xlPaperNote  18
#define xlPaperQuarto  15
#define xlPaperStatement  6
#define xlPaperTabloid  3
#define xlPaperUser  256

&& XlParameterDataType

#define xlParamTypeBigInt  -5
#define xlParamTypeBinary  -2
#define xlParamTypeBit  -7
#define xlParamTypeChar  1
#define xlParamTypeDate  9
#define xlParamTypeDecimal  3
#define xlParamTypeDouble  8
#define xlParamTypeFloat  6
#define xlParamTypeInteger  4
#define xlParamTypeLongVarBinary  -4
#define xlParamTypeLongVarChar  -1
#define xlParamTypeNumeric  2
#define xlParamTypeReal  7
#define xlParamTypeSmallInt  5
#define xlParamTypeTime  10
#define xlParamTypeTimestamp  11
#define xlParamTypeTinyInt  -6
#define xlParamTypeUnknown  0
#define xlParamTypeVarBinary  -3
#define xlParamTypeVarChar  12
#define xlParamTypeWChar  -8

&& XlParameterType

#define xlConstant  1
#define xlPrompt  0
#define xlRange  2

&& XlPasteSpecialOperation

#define xlPasteSpecialOperationAdd  2
#define xlPasteSpecialOperationDivide  5
#define xlPasteSpecialOperationMultiply  4
#define xlPasteSpecialOperationNone  -4142
#define xlPasteSpecialOperationSubtract  3

&& XlPasteType

#define xlPasteAll  -4104
#define xlPasteAllExceptBorders  7
#define xlPasteColumnWidths  8
#define xlPasteComments  -4144
#define xlPasteFormats  -4122
#define xlPasteFormulas  -4123
#define xlPasteFormulasAndNumberFormats  11
#define xlPasteValidation  6
#define xlPasteValues  -4163
#define xlPasteValuesAndNumberFormats  12

&& XlPattern

#define xlPatternAutomatic  -4105
#define xlPatternChecker  9
#define xlPatternCrissCross  16
#define xlPatternDown  -4121
#define xlPatternGray16  17
#define xlPatternGray25  -4124
#define xlPatternGray50  -4125
#define xlPatternGray75  -4126
#define xlPatternGray8  18
#define xlPatternGrid  15
#define xlPatternHorizontal  -4128
#define xlPatternLightDown  13
#define xlPatternLightHorizontal  11
#define xlPatternLightUp  14
#define xlPatternLightVertical  12
#define xlPatternNone  -4142
#define xlPatternSemiGray75  10
#define xlPatternSolid  1
#define xlPatternUp  -4162
#define xlPatternVertical  -4166

&& XlPhoneticAlignment

#define xlPhoneticAlignCenter  2
#define xlPhoneticAlignDistributed  3
#define xlPhoneticAlignLeft  1
#define xlPhoneticAlignNoControl  0

&& XlPhoneticCharacterType

#define xlHiragana  2
#define xlKatakana  1
#define xlKatakanaHalf  0
#define xlNoConversion  3

&& XlPictureAppearance

#define xlPrinter  2
#define xlScreen  1

&& XlPictureConvertorType

#define xlBMP  1
#define xlCGM  7
#define xlDRW  4
#define xlDXF  5
#define xlEPS  8
#define xlHGL  6
#define xlPCT  13
#define xlPCX  10
#define xlPIC  11
#define xlPLT  12
#define xlTIF  9
#define xlWMF  2
#define xlWPG  3

&& XlPivotCellType

#define xlPivotCellBlankCell  9
#define xlPivotCellCustomSubtotal  7
#define xlPivotCellDataField  4
#define xlPivotCellDataPivotField  8
#define xlPivotCellGrandTotal  3
#define xlPivotCellPageFieldItem  6
#define xlPivotCellPivotField  5
#define xlPivotCellPivotItem  1
#define xlPivotCellSubtotal  2
#define xlPivotCellValue  0

&& XlPivotFieldCalculation

#define xlDifferenceFrom  2
#define xlIndex  9
#define xlNoAdditionalCalculation  -4143
#define xlPercentDifferenceFrom  4
#define xlPercentOf  3
#define xlPercentOfColumn  7
#define xlPercentOfRow  6
#define xlPercentOfTotal  8
#define xlRunningTotal  5

&& XlPivotFieldDataType

#define xlDate  2
#define xlNumber  -4145
#define xlText  -4158

&& XlPivotFieldOrientation

#define xlColumnField  2
#define xlDataField  4
#define xlHidden  0
#define xlPageField  3
#define xlRowField  1

&& XlPivotFormatType

#define xlPTClassic  20
#define xlPTNone  21
#define xlReport1  0
#define xlReport10  9
#define xlReport2  1
#define xlReport3  2
#define xlReport4  3
#define xlReport5  4
#define xlReport6  5
#define xlReport7  6
#define xlReport8  7
#define xlReport9  8
#define xlTable1  10
#define xlTable10  19
#define xlTable2  11
#define xlTable3  12
#define xlTable4  13
#define xlTable5  14
#define xlTable6  15
#define xlTable7  16
#define xlTable8  17
#define xlTable9  18

&& XlPivotTableMissingItems

#define xlMissingItemsDefault  -1
#define xlMissingItemsMax  32500
#define xlMissingItemsNone  0

&& XlPivotTableSourceType

#define xlConsolidation  3
#define xlDatabase  1
#define xlExternal  2
#define xlPivotTable  -4148
#define xlScenario  4

&& XlPivotTableVersionList

#define xlPivotTableVersion10  1
#define xlPivotTableVersion2000  0
#define xlPivotTableVersionCurrent  -1

&& XlPlacement

#define xlFreeFloating  3
#define xlMove  2
#define xlMoveAndSize  1

&& XlPlatform

#define xlMacintosh  1
#define xlMSDOS  3
#define xlWindows  2

&& XlPrintErrors

#define xlPrintErrorsBlank  1
#define xlPrintErrorsDash  2
#define xlPrintErrorsDisplayed  0
#define xlPrintErrorsNA  3

&& XlPrintLocation

#define xlPrintInPlace  16
#define xlPrintNoComments  -4142
#define xlPrintSheetEnd  1

&& XlPriority

#define xlPriorityHigh  -4127
#define xlPriorityLow  -4134
#define xlPriorityNormal  -4143

&& XlPTSelectionMode

#define xlBlanks  4
#define xlButton  15
#define xlDataAndLabel  0
#define xlDataOnly  2
#define xlFirstRow  256
#define xlLabelOnly  1
#define xlOrigin  3

&& XlQueryType

#define xlADORecordset  7
#define xlDAORecordset  2
#define xlODBCQuery  1
#define xlOLEDBQuery  5
#define xlTextImport  6
#define xlWebQuery  4

&& XlRangeAutoFormat

#define xlRangeAutoFormat3DEffects1  13
#define xlRangeAutoFormat3DEffects2  14
#define xlRangeAutoFormatAccounting1  4
#define xlRangeAutoFormatAccounting2  5
#define xlRangeAutoFormatAccounting3  6
#define xlRangeAutoFormatAccounting4  17
#define xlRangeAutoFormatClassic1  1
#define xlRangeAutoFormatClassic2  2
#define xlRangeAutoFormatClassic3  3
#define xlRangeAutoFormatClassicPivotTable  31
#define xlRangeAutoFormatColor1  7
#define xlRangeAutoFormatColor2  8
#define xlRangeAutoFormatColor3  9
#define xlRangeAutoFormatList1  10
#define xlRangeAutoFormatList2  11
#define xlRangeAutoFormatList3  12
#define xlRangeAutoFormatLocalFormat1  15
#define xlRangeAutoFormatLocalFormat2  16
#define xlRangeAutoFormatLocalFormat3  19
#define xlRangeAutoFormatLocalFormat4  20
#define xlRangeAutoFormatNone  -4142
#define xlRangeAutoFormatPTNone  42
#define xlRangeAutoFormatReport1  21
#define xlRangeAutoFormatReport10  30
#define xlRangeAutoFormatReport2  22
#define xlRangeAutoFormatReport3  23
#define xlRangeAutoFormatReport4  24
#define xlRangeAutoFormatReport5  25
#define xlRangeAutoFormatReport6  26
#define xlRangeAutoFormatReport7  27
#define xlRangeAutoFormatReport8  28
#define xlRangeAutoFormatReport9  29
#define xlRangeAutoFormatSimple  -4154
#define xlRangeAutoFormatTable1  32
#define xlRangeAutoFormatTable10  41
#define xlRangeAutoFormatTable2  33
#define xlRangeAutoFormatTable3  34
#define xlRangeAutoFormatTable4  35
#define xlRangeAutoFormatTable5  36
#define xlRangeAutoFormatTable6  37
#define xlRangeAutoFormatTable7  38
#define xlRangeAutoFormatTable8  39
#define xlRangeAutoFormatTable9  40

&& XlRangeValueDataType

#define xlRangeValueDefault  10
#define xlRangeValueMSPersistXML  12
#define xlRangeValueXMLSpreadsheet  11

&& XlReferenceStyle

#define xlA1  1
#define xlR1C1  -4150

&& XlReferenceType

#define xlAbsolute  1
#define xlAbsRowRelColumn  2
#define xlRelative  4
#define xlRelRowAbsColumn  3

&& XlRobustConnect

#define xlAlways  1
#define xlAsRequired  0
#define xlNever  2

&& XlRoutingSlipDelivery

#define xlAllAtOnce  2
#define xlOneAfterAnother  1

&& XlRoutingSlipStatus

#define xlNotYetRouted  0
#define xlRoutingComplete  2
#define xlRoutingInProgress  1

&& XlRowCol

#define xlColumns  2
#define xlRows  1

&& XlRunAutoMacro

#define xlAutoActivate  3
#define xlAutoClose  2
#define xlAutoDeactivate  4
#define xlAutoOpen  1

&& XlSaveAction

#define xlDoNotSaveChanges  2
#define xlSaveChanges  1

&& XlSaveAsAccessMode

#define xlExclusive  3
#define xlNoChange  1
#define xlShared  2

&& XlSaveConflictResolution

#define xlLocalSessionChanges  2
#define xlOtherSessionChanges  3
#define xlUserResolution  1

&& XlScaleType

#define xlScaleLinear  -4132
#define xlScaleLogarithmic  -4133

&& XlSearchDirection

#define xlNext  1
#define xlPrevious  2

&& XlSearchOrder

#define xlByColumns  2
#define xlByRows  1

&& XlSearchWithin

#define xlWithinSheet  1
#define xlWithinWorkbook  2

&& XlSheetType

#define xlChart  -4109
#define xlDialogSheet  -4116
#define xlExcel4IntlMacroSheet  4
#define xlExcel4MacroSheet  3
#define xlWorksheet  -4167

&& XlSheetVisibility

#define xlSheetHidden  0
#define xlSheetVeryHidden  2
#define xlSheetVisible  -1

&& XlSizeRepresents

#define xlSizeIsArea  1
#define xlSizeIsWidth  2

&& XlSmartTagControlType

#define xlSmartTagControlActiveX  13
#define xlSmartTagControlButton  6
#define xlSmartTagControlCheckbox  9
#define xlSmartTagControlCombo  12
#define xlSmartTagControlHelp  3
#define xlSmartTagControlHelpURL  4
#define xlSmartTagControlImage  8
#define xlSmartTagControlLabel  7
#define xlSmartTagControlLink  2
#define xlSmartTagControlListbox  11
#define xlSmartTagControlRadioGroup  14
#define xlSmartTagControlSeparator  5
#define xlSmartTagControlSmartTag  1
#define xlSmartTagControlTextbox  10

&& XlSmartTagDisplayMode

#define xlButtonOnly  2
#define xlDisplayNone  1
#define xlIndicatorAndButton  0

&& XlSortDataOption

#define xlSortNormal  0
#define xlSortTextAsNumbers  1

&& XlSortMethod

#define xlPinYin  1
#define xlStroke  2

&& XlSortMethodOld

#define xlCodePage  2
#define xlSyllabary  1

&& XlSortOrder

#define xlAscending  1
#define xlDescending  2

&& XlSortOrientation

#define xlSortColumns  1
#define xlSortRows  2

&& XlSortType

#define xlSortLabels  2
#define xlSortValues  1

&& XlSourceType

#define xlSourceAutoFilter  3
#define xlSourceChart  5
#define xlSourcePivotTable  6
#define xlSourcePrintArea  2
#define xlSourceQuery  7
#define xlSourceRange  4
#define xlSourceSheet  1
#define xlSourceWorkbook  0

&& XlSpeakDirection

#define xlSpeakByColumns  1
#define xlSpeakByRows  0

&& XlSpecialCellsValue

#define xlErrors  16
#define xlLogical  4
#define xlNumbers  1
#define xlTextValues  2

&& XlSubscribeToFormat

#define xlSubscribeToPicture  -4147
#define xlSubscribeToText  -4158

&& XlSubtototalLocationType

#define xlAtBottom  2
#define xlAtTop  1

&& XlSummaryColumn

#define xlSummaryOnLeft  -4131
#define xlSummaryOnRight  -4152

&& XlSummaryReportType

#define xlStandardSummary  1
#define xlSummaryPivotTable  -4148

&& XlSummaryRow

#define xlSummaryAbove  0
#define xlSummaryBelow  1

&& XlTabPosition

#define xlTabPositionFirst  0
#define xlTabPositionLast  1

&& XlTextParsingType

#define xlDelimited  1
#define xlFixedWidth  2

&& XlTextQualifier

#define xlTextQualifierDoubleQuote  1
#define xlTextQualifierNone  -4142
#define xlTextQualifierSingleQuote  2

&& XlTextVisualLayoutType

#define xlTextVisualLTR  1
#define xlTextVisualRTL  2

&& XlTickLabelOrientation

#define xlTickLabelOrientationAutomatic  -4105
#define xlTickLabelOrientationDownward  -4170
#define xlTickLabelOrientationHorizontal  -4128
#define xlTickLabelOrientationUpward  -4171
#define xlTickLabelOrientationVertical  -4166

&& XlTickLabelPosition

#define xlTickLabelPositionHigh  -4127
#define xlTickLabelPositionLow  -4134
#define xlTickLabelPositionNextToAxis  4
#define xlTickLabelPositionNone  -4142

&& XlTickMark

#define xlTickMarkCross  4
#define xlTickMarkInside  2
#define xlTickMarkNone  -4142
#define xlTickMarkOutside  3

&& XlTimeUnit

#define xlDays  0
#define xlMonths  1
#define xlYears  2

&& XlToolbarProtection

#define xlNoButtonChanges  1
#define xlNoChanges  4
#define xlNoDockingChanges  3
#define xlNoShapeChanges  2
#define xlToolbarProtectionNone  -4143

&& XlTotalsCalculation

#define xlTotalsCalculationAverage  2
#define xlTotalsCalculationCount  3
#define xlTotalsCalculationCountNums  4
#define xlTotalsCalculationMax  6
#define xlTotalsCalculationMin  5
#define xlTotalsCalculationNone  0
#define xlTotalsCalculationStdDev  7
#define xlTotalsCalculationSum  1
#define xlTotalsCalculationVar  8

&& XlTrendlineType

#define xlExponential  5
#define xlLinear  -4132
#define xlLogarithmic  -4133
#define xlMovingAvg  6
#define xlPolynomial  3
#define xlPower  4

&& XlUnderlineStyle

#define xlUnderlineStyleDouble  -4119
#define xlUnderlineStyleDoubleAccounting  5
#define xlUnderlineStyleNone  -4142
#define xlUnderlineStyleSingle  2
#define xlUnderlineStyleSingleAccounting  4

&& XlUpdateLinks

#define xlUpdateLinksAlways  3
#define xlUpdateLinksNever  2
#define xlUpdateLinksUserSetting  1

&& XlVAlign

#define xlVAlignBottom  -4107
#define xlVAlignCenter  -4108
#define xlVAlignDistributed  -4117
#define xlVAlignJustify  -4130
#define xlVAlignTop  -4160

&& XlWBATemplate

#define xlWBATChart  -4109
#define xlWBATExcel4IntlMacroSheet  4
#define xlWBATExcel4MacroSheet  3
#define xlWBATWorksheet  -4167

&& XlWebFormatting

#define xlWebFormattingAll  1
#define xlWebFormattingNone  3
#define xlWebFormattingRTF  2

&& XlWebSelectionType

#define xlAllTables  2
#define xlEntirePage  1
#define xlSpecifiedTables  3

&& XlWindowState

#define xlMaximized  -4137
#define xlMinimized  -4140
#define xlNormal  -4143

&& XlWindowType

#define xlChartAsWindow  5
#define xlChartInPlace  4
#define xlClipboard  3
#define xlInfo  -4129
#define xlWorkbook  1

&& XlWindowView

#define xlNormalView  1
#define xlPageBreakPreview  2

&& XlXLMMacroType

#define xlCommand  2
#define xlFunction  1
#define xlNotXLM  3

&& XlXmlExportResult

#define xlXmlExportSuccess  0
#define xlXmlExportValidationFailed  1

&& XlXmlImportResult

#define xlXmlImportElementsTruncated  1
#define xlXmlImportSuccess  0
#define xlXmlImportValidationFailed  2

&& XlXmlLoadOption

#define xlXmlLoadImportToList  2
#define xlXmlLoadMapXml  3
#define xlXmlLoadOpenXml  1
#define xlXmlLoadPromptUser  0

&& XlYesNoGuess

#define xlGuess  0
#define xlNo  2
#define xlYes  1















