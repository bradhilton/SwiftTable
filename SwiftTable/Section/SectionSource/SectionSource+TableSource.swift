//
//  SectionSource+TableSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionSource where Self : TableSource {
    
    public func willDisplayCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        willDisplayCell(cell, forRow: indexPath.row)
    }
    
    public func willDisplayHeaderView(view: UIView, forSection section: Int) {
        willDisplayHeaderView(view)
    }
    
    public func willDisplayFooterView(view: UIView, forSection section: Int) {
        willDisplayFooterView(view)
    }
    
    public func didEndDisplayingCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        didEndDisplayingCell(cell, forRow: indexPath.row)
    }
    
    public func didEndDisplayingHeaderView(view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(view)
    }
    
    public func didEndDisplayingFooterView(view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(view)
    }
    
    public func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return heightForRow(indexPath.row)
    }
    
    public func heightForHeaderInSection(section: Int) -> CGFloat {
        return heightForHeader
    }
    
    public func heightForFooterInSection(section: Int) -> CGFloat {
        return heightForFooter
    }
    
    public func estimatedHeightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return estimatedHeightForRow(indexPath.row)
    }
    
    public func estimatedHeightForHeaderInSection(section: Int) -> CGFloat {
        return estimatedHeightForHeader
    }
    
    public func estimatedHeightForFooterInSection(section: Int) -> CGFloat {
        return estimatedHeightForFooter
    }
    
    public func viewForHeaderInSection(section: Int) -> UIView? {
        return viewForHeader
    }
    
    public func viewForFooterInSection(section: Int) -> UIView? {
        return viewForFooter
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(indexPath: NSIndexPath) {
        accessoryButtonTappedForRow(indexPath.row)
    }
    
    public func shouldHighlightRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return shouldHighlightRow(indexPath.row)
    }
    
    public func didHighlightRowAtIndexPath(indexPath: NSIndexPath) {
        didHighlightRow(indexPath.row)
    }
    
    public func didUnhighlightRowAtIndexPath(indexPath: NSIndexPath) {
        didUnhighlightRow(indexPath.row)
    }
    
    public func willSelectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return NSIndexPath(forRow: willSelectRow(indexPath.row), inSection: 0)
    }
    
    public func willDeselectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return NSIndexPath(forRow: willDeselectRow(indexPath.row), inSection: 0)
    }
    
    public func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        didSelectRow(indexPath.row)
    }
    
    public func didDeselectRowAtIndexPath(indexPath: NSIndexPath) {
        didDeselectRow(indexPath.row)
    }
    
    public func editingStyleForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return editingStyleForRow(indexPath.row)
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath: NSIndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRow(indexPath.row)
    }
    
    public func editActionsForRowAtIndexPath(indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return editActionsForRow(indexPath.row)
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return shouldIndentWhileEditingRow(indexPath.row)
    }
    
    public func willBeginEditingRowAtIndexPath(indexPath: NSIndexPath) {
        willBeginEditingRow(indexPath.row)
    }
    
    public func didEndEditingRowAtIndexPath(indexPath: NSIndexPath) {
        didEndEditingRow(indexPath.row)
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return NSIndexPath(forRow: targetRowForMoveFromRow(sourceIndexPath.row, toProposedRow: proposedDestinationIndexPath.row), inSection: 0)
    }
    
    public func indentationLevelForRowAtIndexPath(indexPath: NSIndexPath) -> Int {
        return indentationLevelForRow(indexPath.row)
    }
    
    public func shouldShowMenuForRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return shouldShowMenuForRow(indexPath.row)
    }
    
    public func canPerformAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return canPerformAction(action, forRow: indexPath.row, withSender: sender)
    }
    
    public func performAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        performAction(action, forRow: indexPath.row, withSender: sender)
    }
    
    // Data Source
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return numberOfRows
    }
    
    public func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRow(indexPath.row)
    }
    
    public var numberOfSections: Int {
        return 1
    }
    
    public func titleForHeaderInSection(section: Int) -> String? {
        return titleForHeader
    }
    
    public func titleForFooterInSection(section: Int) -> String? {
        return titleForFooter
    }
    
    public func canEditRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return canEditRow(indexPath.row)
    }
    
    public func canMoveRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return canMoveRow(indexPath.row)
    }
    
    public var sectionIndexTitles: [String]? {
        guard let sectionIndexTitle = sectionIndexTitle else { return nil }
        return [sectionIndexTitle]
    }
    
    public func sectionForSectionIndexTitle(title: String, atIndex index: Int) -> Int {
        return 0
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        commitEditingStyle(editingStyle, forRow: indexPath.row)
    }
    
    public func moveRowAtIndexPath(sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        moveRow(sourceIndexPath.row, toRow: destinationIndexPath.row)
    }
    
}
