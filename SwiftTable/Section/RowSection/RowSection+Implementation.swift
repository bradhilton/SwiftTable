//
//  RowSection+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSection {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRow row: Int) {
        rows[row].willDisplayCell(cell)
    }

    public func didEndDisplayingCell(_ cell: UITableViewCell, forRow row: Int) {
        rows[row].didEndDisplayingCell(cell)
    }
    
    public func heightForRow(_ row: Int) -> CGFloat {
        return rows[row].height
    }
    
    public func estimatedHeightForRow(_ row: Int) -> CGFloat {
        return rows[row].estimatedHeight
    }
    
    public func accessoryButtonTappedForRow(_ row: Int) {
        rows[row].accessoryButtonTapped()
    }
    
    public func shouldHighlightRow(_ row: Int) -> Bool {
        return rows[row].shouldHighlight
    }
    
    public func didHighlightRow(_ row: Int) {
        rows[row].didHighlight()
    }
    
    public func didUnhighlightRow(_ row: Int) {
        rows[row].didUnhighlight()
    }
    
    public func willSelectRow(_ row: Int) -> Int? {
        return rows[row].willSelect ? row : nil
    }
    
    public func willDeselectRow(_ row: Int) -> Int? {
        return rows[row].willDeselect ? row : nil
    }
    
    public func didSelectRow(_ row: Int) {
        rows[row].didSelect()
    }
    
    public func didDeselectRow(_ row: Int) {
        rows[row].didDeselect()
    }
    
    public func editingStyleForRow(_ row: Int) -> UITableViewCellEditingStyle {
        return rows[row].editingStyle
    }
    
    public func titleForDeleteConfirmationButtonForRow(_ row: Int) -> String? {
        return rows[row].titleForDeleteConfirmationButton
    }
    
    public func editActionsForRow(_ row: Int) -> [UITableViewRowAction]? {
        return rows[row].editActions
    }
    
    public func shouldIndentWhileEditingRow(_ row: Int) -> Bool {
        return rows[row].shouldIndentWhileEditing
    }
    
    public func willBeginEditingRow(_ row: Int) {
        rows[row].willBeginEditing()
    }
    
    public func didEndEditingRow(_ row: Int?) {
        guard let row = row else { return }
        rows[row].didEndEditing()
    }
    
    public func indentationLevelForRow(_ row: Int) -> Int {
        return rows[row].indentationLevel
    }
    
    public func shouldShowMenuForRow(_ row: Int) -> Bool {
        return rows[row].shouldShowMenu
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return rows.count
    }
    
    public func cellForRow(_ row: Int) -> UITableViewCell {
        return rows[row].cell
    }
    
    public func canEditRow(_ row: Int) -> Bool {
        return rows[row].canEdit
    }
    
    public func canMoveRow(_ row: Int) -> Bool {
        return rows[row].canMove
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        rows[row].commitEditingStyle(editingStyle)
    }
    
}
