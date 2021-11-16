&& Definitions for MS Word ()

&& WdBorderType Enumeration
#define wdBorderBottom			-3 && A bottom border.
#define wdBorderDiagonalDown	-7 && A diagonal border starting in the upper-left corner.
#define wdBorderDiagonalUp		-8 && A diagonal border starting in the lower-left corner.
#define wdBorderHorizontal		-5 && Horizontal borders.
#define wdBorderLeft				-2 && A left border.
#define wdBorderRight			-4 && A right border.
#define wdBorderTop				-1 && A top border.
#define wdBorderVertical		-6 && Vertical borders.

&& WdLineStyle Enumeration
#define wdLineStyleDashDot						5	&& A dash followed by a dot.
#define wdLineStyleDashDotDot					6	&& A dash followed by two dots.
#define wdLineStyleDashDotStroked			20	&& A dash followed by a dot stroke, thus rendering a border similar to a barber pole.
#define wdLineStyleDashLargeGap 				4	&& A dash followed by a large gap.
#define wdLineStyleDashSmallGap 				3	&& A dash followed by a small gap.
#define wdLineStyleDot							2	&& Dots.
#define wdLineStyleDouble						7	&& Double solid lines.
#define wdLineStyleDoubleWavy					19	&& Double wavy solid lines.
#define wdLineStyleEmboss3D					21	&& The border appears to have a 3-D embossed look.
#define wdLineStyleEngrave3D					22	&& The border appears to have a 3-D engraved look.
#define wdLineStyleInset						24	&& The border appears to be inset.
#define wdLineStyleNone							0	&& No border.
#define wdLineStyleOutset						23	&& The border appears to be outset.
#define wdLineStyleSingle						1	&& A single solid line.
#define wdLineStyleSingleWavy					18	&& A single wavy solid line.
#define wdLineStyleThickThinLargeGap		16	&& An internal single thick solid line surrounded by a single thin solid line with a large gap between them.
#define wdLineStyleThickThinMedGap			13	&& An internal single thick solid line surrounded by a single thin solid line with a medium gap between them.
#define wdLineStyleThickThinSmallGap		10	&& An internal single thick solid line surrounded by a single thin solid line with a small gap between them.
#define wdLineStyleThinThickLargeGap		15	&& An internal single thin solid line surrounded by a single thick solid line with a large gap between them.
#define wdLineStyleThinThickMedGap			12	&& An internal single thin solid line surrounded by a single thick solid line with a medium gap between them.
#define wdLineStyleThinThickSmallGap		9	&& An internal single thin solid line surrounded by a single thick solid line with a small gap between them.
#define wdLineStyleThinThickThinLargeGap	17	&& An internal single thin solid line surrounded by a single thick solid line surrounded by a single thin solid line with a large gap between all lines.
#define wdLineStyleThinThickThinMedGap		14	&& An internal single thin solid line surrounded by a single thick solid line surrounded by a single thin solid line with a medium gap between all lines.
#define wdLineStyleThinThickThinSmallGap	11	&& An internal single thin solid line surrounded by a single thick solid line surrounded by a single thin solid line with a small gap between all lines.
#define wdLineStyleTriple						8	&& Three solid thin lines.

&& WdUnits Enumeration
#define wdCell						12	&& A cell.
#define wdCharacter				1	&& A character.
#define wdCharacterFormatting	13	&& Character formatting.
#define wdColumn					9	&& A column.
#define wdItem						16	&& The selected item.
#define wdLine						5	&& A line.
#define wdParagraph				4	&& A paragraph.
#define wdParagraphFormatting	14	&& Paragraph formatting.
#define wdRow						10	&& A row.
#define wdScreen					7	&& The screen dimensions.
#define wdSection					8	&& A section.
#define wdSentence				3	&& A sentence.
#define wdStory					6	&& A story.
#define wdTable					15	&& A table.
#define wdWindow					11	&& A window.
#define wdWord						2	&& A word.

&& WdMovementType Enumeration 
#define wdExtend	1	&& The end of the selection is extended to the end of the specified unit. 
#define wdMove		0	&& The selection is collapsed to an insertion point and moved to the end of the specified unit. Default. 

&& WdBreakType Enumeration
#define wdColumnBreak				8	&& Column break at the insertion point.
#define wdLineBreak					6	&& Line break.
#define wdLineBreakClearLeft		9	&& Line break.
#define wdLineBreakClearRight		10	&& Line break.
#define wdPageBreak					7	&& Page break at the insertion point.
#define wdSectionBreakContinuous	3	&& New section without a corresponding page break.
#define wdSectionBreakEvenPage	4	&& Section break with the next section beginning on the next even-numbered page. If the section break falls on an even-numbered page, Word leaves the next odd-numbered page blank.
#define wdSectionBreakNextPage	2	&& Section break on next page.
#define wdSectionBreakOddPage		5	&& Section break with the next section beginning on the next odd-numbered page. If the section break falls on an odd-numbered page, Word leaves the next even-numbered page blank.
#define wdTextWrappingBreak		11	&& Ends the current line and forces the text to continue below a picture, table, or other item. The text continues on the next blank line that does not contain a table aligned with the left or right margin.

&& WdRecoveryType Enumeration
#define wdChart												14	&& Pastes a Microsoft Office Excel chart as an embedded OLE object.
#define wdChartLinked										15	&& Pastes an Excel chart and links it to the original Excel spreadsheet.
#define wdChartPicture										13	&& Pastes an Excel chart as a picture.
#define wdFormatOriginalFormatting						16	&& Preserves original formatting of the pasted material.
#define wdFormatPlainText									22	&& Pastes as plain, unformatted text.
#define wdFormatSurroundingFormattingWithEmphasis	20	&& Matches the formatting of the pasted text to the formatting of surrounding text.
#define wdListCombineWithExistingList					24	&& Merges a pasted list with neighboring lists.
#define wdListContinueNumbering							7	&& Continues numbering of a pasted list from the list in the document.
#define wdListDontMerge										25	&& Not supported.
#define wdListRestartNumbering							8	&& Restarts numbering of a pasted list.
#define wdPasteDefault										0	&& Not supported.
#define wdSingleCellTable									6	&& Pastes a single cell table as a separate table.
#define wdSingleCellText									5	&& Pastes a single cell as text.
#define wdTableAppendTable									10	&& Merges pasted cells into an existing table by inserting the pasted rows between the selected rows.
#define wdTableInsertAsRows								11	&& Inserts a pasted table as rows between two rows in the target table.
#define wdTableOriginalFormatting						12	&& Pastes an appended table without merging table styles.
#define wdTableOverwriteCells								23	&& Pastes table cells and overwrites existing table cells.
#define wdUseDestinationStylesRecovery					19	&& Uses the styles that are in use in the destination document.

&& WdSaveOptions Enumeration 
#define wdDoNotSaveChanges		 0	&& Do not save pending changes. 
#define wdPromptToSaveChanges	-2	&& Prompt the user to save pending changes. 
#define wdSaveChanges			-1	&& Save pending changes automatically without prompting the user. 

&& WdParagraphAlignment Enumeration
#define wdAlignParagraphCenter		1	&& Center-aligned. 
#define wdAlignParagraphDistribute	4	&& Paragraph characters are distributed to fill the entire width of the paragraph. 
#define wdAlignParagraphJustify		3	&& Fully justified. 
#define wdAlignParagraphJustifyHi	7	&& Justified with a high character compression ratio. 
#define wdAlignParagraphJustifyLow	8	&& Justified with a low character compression ratio. 
#define wdAlignParagraphJustifyMed	5	&& Justified with a medium character compression ratio. 
#define wdAlignParagraphLeft			0	&& Left-aligned. 
#define wdAlignParagraphRight			2	&& Right-aligned. 
#define wdAlignParagraphThaiJustify	9	&& Justified according to Thai formatting layout. 
