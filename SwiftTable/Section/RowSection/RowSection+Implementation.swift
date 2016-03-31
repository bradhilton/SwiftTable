//
//  RowSection+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSection {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRow row: Int) {
        rows[row].willDisplayCell(cell)
    }

    public func didEndDisplayingCell(cell: UITableViewCell, forRow row: Int) {
        rows[row].didEndDisplayingCell(cell)
    }
    
    public func heightForRow(row: Int) -> CGFloat {
        return rows[row].height
    }
    
    public func estimatedHeightForRow(row: Int) -> CGFloat {
        return rows[row].estimatedHeight
    }
    
    public func accessoryButtonTappedForRow(row: Int) {
        rows[row].accessoryButtonTapped()
    }
    
    public func shouldHighlightRow(row: Int) -> Bool {
        return rows[row].shouldHighlight
    }
    
    public func didHighlightRow(row: Int) {
        rows[row].didHighlight()
    }
    
    public func didUnhighlightRow(row: Int) {
        rows[row].didUnhighlight()
    }
    
    public func willSelectRow(row: Int) -> Int? {
        return rows[row].willSelect ? row : nil
    }
    
    public func willDeselectRow(row: Int) -> Int? {
        return rows[row].willDeselect ? row : nil
    }
    
    public func didSelectRow(row: Int) {
        rows[row].didSelect()
    }
    
    public func didDeselectRow(row: Int) {
        rows[row].didDeselect()
    }
    
    public func editingStyleForRow(row: Int) -> UITableViewCellEditingStyle {
        return rows[row].editingStyle
    }
    
    public func titleForDeleteConfirmationButtonForRow(row: Int) -> String? {
        return rows[row].titleForDeleteConfirmationButton
    }
    
    public func editActionsForRow(row: Int) -> [UITableViewRowAction]? {
        return rows[row].editActions
    }
    
    public func shouldIndentWhileEditingRow(row: Int) -> Bool {
        return rows[row].shouldIndentWhileEditing
    }
    
    public func willBeginEditingRow(row: Int) {
        rows[row].willBeginEditing()
    }
    
    public func didEndEditingRow(row: Int) {
        rows[row].didEndEditing()
    }
    
    public func indentationLevelForRow(row: Int) -> Int {
        return rows[row].indentationLevel
    }
    
    public func shouldShowMenuForRow(row: Int) -> Bool {
        return rows[row].shouldShowMenu
    }
    
    public func canPerformAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) -> Bool {
        return rows[row].canPerformAction(action, withSender: sender)
    }
    
    public func performAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) {
        rows[row].performAction(action, withSender: sender)
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return rows.count
    }
    
    public func cellForRow(row: Int) -> UITableViewCell {
        return rows[row].cell
    }
    
    public func canEditRow(row: Int) -> Bool {
        return rows[row].canEdit
    }
    
    public func canMoveRow(row: Int) -> Bool {
        return rows[row].canMove
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        rows[row].commitEditingStyle(editingStyle)
    }
    
}
