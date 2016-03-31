//
//  RowSource+SectionSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSource where Self : SectionSource {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRow row: Int) {
        willDisplayCell(cell)
    }
    
    public func didEndDisplayingCell(cell: UITableViewCell, forRow row: Int) {
        didEndDisplayingCell(cell)
    }
    
    public func heightForRow(row: Int) -> CGFloat {
        return height
    }
    
    public func estimatedHeightForRow(row: Int) -> CGFloat {
        return estimatedHeight
    }
    
    public func accessoryButtonTappedForRow(row: Int) {
        accessoryButtonTapped()
    }
    
    public func shouldHighlightRow(row: Int) -> Bool {
        return shouldHighlight
    }
    
    public func willSelectRow(row: Int) -> Int? {
        return willSelect ? row : nil
    }
    
    public func willDeselectRow(row: Int) -> Int? {
        return willDeselect ? row : nil
    }
    
    public func didSelectRow(row: Int) {
        didSelect()
    }
    
    public func didDeselectRow(row: Int) {
        didDeselect()
    }
    
    public func editingStyleForRow(row: Int) -> UITableViewCellEditingStyle {
        return editingStyle
    }
    
    public func titleForDeleteConfirmationButtonForRow(row: Int) -> String? {
        return titleForDeleteConfirmationButton
    }
    
    public func editActionsForRow(row: Int) -> [UITableViewRowAction]? {
        return editActions
    }
    
    public func shouldIndentWhileEditingRow(row: Int) -> Bool {
        return shouldIndentWhileEditing
    }
    
    public func willBeginEditingRow(row: Int) {
        willBeginEditing()
    }
    
    public func didEndEditingRow(row: Int) {
        didEndEditing()
    }
    
    public func indentationLevelForRow(row: Int) -> Int {
        return indentationLevel
    }
    
    public func shouldShowMenuForRow(row: Int) -> Bool {
        return shouldShowMenu
    }
    
    public func canPerformAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) -> Bool {
        return canPerformAction(action, withSender: sender)
    }
    
    public func performAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) {
        performAction(action, withSender: sender)
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return 1
    }
    
    public func cellForRow(row: Int) -> UITableViewCell {
        return cell
    }
    
    public func canEditRow(row: Int) -> Bool {
        return canEdit
    }
    
    public func canMoveRow(row: Int) -> Bool {
        return canMove
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        commitEditingStyle(editingStyle)
    }
    
}
