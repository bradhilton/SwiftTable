//
//  SectionTable+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionTable {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        sections[indexPath.section].willDisplayCell(cell, forRow: indexPath.row)
    }
    
    public func willDisplayHeaderView(_ view: UIView, forSection section: Int) {
        sections[section].willDisplayHeaderView(view)
    }
    
    public func willDisplayFooterView(_ view: UIView, forSection section: Int) {
        sections[section].willDisplayFooterView(view)
    }
    
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        sections[indexPath.section].didEndDisplayingCell(cell, forRow: indexPath.row)
    }
    
    public func didEndDisplayingHeaderView(_ view: UIView, forSection section: Int) {
        sections[section].didEndDisplayingHeaderView(view)
    }
    
    public func didEndDisplayingFooterView(_ view: UIView, forSection section: Int) {
        sections[section].didEndDisplayingFooterView(view)
    }
    
    public func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].heightForRow(indexPath.row)
    }
    
    public func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return sections[section].heightForHeader
    }
    
    public func heightForFooterInSection(_ section: Int) -> CGFloat {
        return sections[section].heightForFooter
    }
    
    public func estimatedHeightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].estimatedHeightForRow(indexPath.row)
    }
    
    public func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return sections[section].estimatedHeightForHeader
    }
    
    public func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        return sections[section].estimatedHeightForFooter
    }
    
    public func viewForHeaderInSection(_ section: Int) -> UIView? {
        return sections[section].viewForHeader
    }
    
    public func viewForFooterInSection(_ section: Int) -> UIView? {
        return sections[section].viewForFooter
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(_ indexPath: IndexPath) {
        sections[indexPath.section].accessoryButtonTappedForRow(indexPath.row)
    }
    
    public func shouldHighlightRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].shouldHighlightRow(indexPath.row)
    }
    
    public func didHighlightRowAtIndexPath(_ indexPath: IndexPath) {
        return sections[indexPath.section].didHighlightRow(indexPath.row)
    }
    
    public func didUnhighlightRowAtIndexPath(_ indexPath: IndexPath) {
        return sections[indexPath.section].didUnhighlightRow(indexPath.row)
    }
    
    public func willSelectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return IndexPath(row: sections[indexPath.section].willSelectRow(indexPath.row), section: indexPath.section)
    }
    
    public func willDeselectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return IndexPath(row: sections[indexPath.section].willDeselectRow(indexPath.row), section: indexPath.section)
    }
    
    public func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        sections[indexPath.section].didSelectRow(indexPath.row)
    }
    
    public func didDeselectRowAtIndexPath(_ indexPath: IndexPath) {
        sections[indexPath.section].didDeselectRow(indexPath.row)
    }
    
    public func editingStyleForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return sections[indexPath.section].editingStyleForRow(indexPath.row)
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        return sections[indexPath.section].titleForDeleteConfirmationButtonForRow(indexPath.row)
    }
    
    public func editActionsForRowAtIndexPath(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
        return sections[indexPath.section].editActionsForRow(indexPath.row)
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].shouldIndentWhileEditingRow(indexPath.row)
    }
    
    public func willBeginEditingRowAtIndexPath(_ indexPath: IndexPath) {
        sections[indexPath.section].willBeginEditingRow(indexPath.row)
    }
    
    public func didEndEditingRowAtIndexPath(_ indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        sections[indexPath.section].didEndEditingRow(indexPath.row)
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(_ sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        guard sourceIndexPath.section == proposedDestinationIndexPath.section else { return sourceIndexPath }
        return IndexPath(row: sections[sourceIndexPath.section].targetRowForMoveFromRow(sourceIndexPath.row, toProposedRow: proposedDestinationIndexPath.row), section: sourceIndexPath.section)
    }
    
    public func indentationLevelForRowAtIndexPath(_ indexPath: IndexPath) -> Int {
        return sections[indexPath.section].indentationLevelForRow(indexPath.row)
    }
    
    public func shouldShowMenuForRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].shouldShowMenuForRow(indexPath.row)
    }
    
    // Data Source
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    public func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].cellForRow(indexPath.row)
    }
    
    public var numberOfSections: Int {
        return sections.count
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        return sections[section].titleForHeader
    }
    
    public func titleForFooterInSection(_ section: Int) -> String? {
        return sections[section].titleForFooter
    }
    
    public func canEditRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].canEditRow(indexPath.row)
    }
    
    public func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return sections[indexPath.section].canMoveRow(indexPath.row)
    }
    
    public var sectionIndexTitles: [String]? {
        let sectionIndexTitles = sections.flatMap { $0.sectionIndexTitle }
        return sectionIndexTitles.count > 0 ? sectionIndexTitles : nil
    }
    
    public func sectionForSectionIndexTitle(_ title: String, atIndex index: Int) -> Int {
        return (0..<sections.count).filter({ sections[$0].sectionIndexTitle != nil })[index]
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        sections[indexPath.section].commitEditingStyle(editingStyle, forRow: indexPath.row)
    }
    
    public func moveRowAtIndexPath(_ sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {
        guard sourceIndexPath.section == destinationIndexPath.section else { return }
        sections[sourceIndexPath.section].moveRow(sourceIndexPath.row, toRow: destinationIndexPath.row)
    }
    
}
