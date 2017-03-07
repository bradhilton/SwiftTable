//
//  SectionSource+TableSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionSource where Self : TableSource {
    
    public func willDisplayCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        willDisplayCell(cell, forRow: indexPath.row)
    }
    
    public func willDisplayHeaderView(_ view: UIView, forSection section: Int) {
        willDisplayHeaderView(view)
    }
    
    public func willDisplayFooterView(_ view: UIView, forSection section: Int) {
        willDisplayFooterView(view)
    }
    
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        didEndDisplayingCell(cell, forRow: indexPath.row)
    }
    
    public func didEndDisplayingHeaderView(_ view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(view)
    }
    
    public func didEndDisplayingFooterView(_ view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(view)
    }
    
    public func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return heightForRow(indexPath.row)
    }
    
    public func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return heightForHeader
    }
    
    public func heightForFooterInSection(_ section: Int) -> CGFloat {
        return heightForFooter
    }
    
    public func estimatedHeightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return estimatedHeightForRow(indexPath.row)
    }
    
    public func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return estimatedHeightForHeader
    }
    
    public func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        return estimatedHeightForFooter
    }
    
    public func viewForHeaderInSection(_ section: Int) -> UIView? {
        return viewForHeader
    }
    
    public func viewForFooterInSection(_ section: Int) -> UIView? {
        return viewForFooter
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(_ indexPath: IndexPath) {
        accessoryButtonTappedForRow(indexPath.row)
    }
    
    public func shouldHighlightRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return shouldHighlightRow(indexPath.row)
    }
    
    public func didHighlightRowAtIndexPath(_ indexPath: IndexPath) {
        didHighlightRow(indexPath.row)
    }
    
    public func didUnhighlightRowAtIndexPath(_ indexPath: IndexPath) {
        didUnhighlightRow(indexPath.row)
    }
    
    public func willSelectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return IndexPath(row: willSelectRow(indexPath.row), section: 0)
    }
    
    public func willDeselectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return IndexPath(row: willDeselectRow(indexPath.row), section: 0)
    }
    
    public func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        didSelectRow(indexPath.row)
    }
    
    public func didDeselectRowAtIndexPath(_ indexPath: IndexPath) {
        didDeselectRow(indexPath.row)
    }
    
    public func editingStyleForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return editingStyleForRow(indexPath.row)
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRow(indexPath.row)
    }
    
    public func editActionsForRowAtIndexPath(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
        return editActionsForRow(indexPath.row)
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return shouldIndentWhileEditingRow(indexPath.row)
    }
    
    public func willBeginEditingRowAtIndexPath(_ indexPath: IndexPath) {
        willBeginEditingRow(indexPath.row)
    }
    
    public func didEndEditingRowAtIndexPath(_ indexPath: IndexPath?) {
        didEndEditingRow(indexPath?.row)
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(_ sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return IndexPath(row: targetRowForMoveFromRow(sourceIndexPath.row, toProposedRow: proposedDestinationIndexPath.row), section: 0)
    }
    
    public func indentationLevelForRowAtIndexPath(_ indexPath: IndexPath) -> Int {
        return indentationLevelForRow(indexPath.row)
    }
    
    public func shouldShowMenuForRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return shouldShowMenuForRow(indexPath.row)
    }
    
    // Data Source
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        return numberOfRows
    }
    
    public func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(indexPath.row)
    }
    
    public var numberOfSections: Int {
        return 1
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        return titleForHeader
    }
    
    public func titleForFooterInSection(_ section: Int) -> String? {
        return titleForFooter
    }
    
    public func canEditRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return canEditRow(indexPath.row)
    }
    
    public func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return canMoveRow(indexPath.row)
    }
    
    public var sectionIndexTitles: [String]? {
        guard let sectionIndexTitle = sectionIndexTitle else { return nil }
        return [sectionIndexTitle]
    }
    
    public func sectionForSectionIndexTitle(_ title: String, atIndex index: Int) -> Int {
        return 0
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        commitEditingStyle(editingStyle, forRow: indexPath.row)
    }
    
    public func moveRowAtIndexPath(_ sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {
        moveRow(sourceIndexPath.row, toRow: destinationIndexPath.row)
    }
    
}
