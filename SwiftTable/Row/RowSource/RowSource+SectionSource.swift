//
//  RowSource+SectionSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension RowSource where Self : SectionSource {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRow row: Int) {
        willDisplayCell(cell)
    }
    
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRow row: Int) {
        didEndDisplayingCell(cell)
    }
    
    public func heightForRow(_ row: Int) -> CGFloat {
        return height
    }
    
    public func estimatedHeightForRow(_ row: Int) -> CGFloat {
        return estimatedHeight
    }
    
    public func accessoryButtonTappedForRow(_ row: Int) {
        accessoryButtonTapped()
    }
    
    public func shouldHighlightRow(_ row: Int) -> Bool {
        return shouldHighlight
    }
    
    public func willSelectRow(_ row: Int) -> Int? {
        return willSelect ? row : nil
    }
    
    public func willDeselectRow(_ row: Int) -> Int? {
        return willDeselect ? row : nil
    }
    
    public func didSelectRow(_ row: Int) {
        didSelect()
    }
    
    public func didDeselectRow(_ row: Int) {
        didDeselect()
    }
    
    public func editingStyleForRow(_ row: Int) -> UITableViewCellEditingStyle {
        return editingStyle
    }
    
    public func titleForDeleteConfirmationButtonForRow(_ row: Int) -> String? {
        return titleForDeleteConfirmationButton
    }
    
    public func editActionsForRow(_ row: Int) -> [UITableViewRowAction]? {
        return editActions
    }
    
    public func shouldIndentWhileEditingRow(_ row: Int) -> Bool {
        return shouldIndentWhileEditing
    }
    
    public func willBeginEditingRow(_ row: Int) {
        willBeginEditing()
    }
    
    public func didEndEditingRow(_ row: Int?) {
        didEndEditing()
    }
    
    public func indentationLevelForRow(_ row: Int) -> Int {
        return indentationLevel
    }
    
    public func shouldShowMenuForRow(_ row: Int) -> Bool {
        return shouldShowMenu
    }
    
    public func canPerformAction(_ action: Selector, forRow row: Int, withSender sender: Any?) -> Bool {
        return canPerformAction(action, withSender: sender)
    }
    
    public func performAction(_ action: Selector, forRow row: Int, withSender sender: Any?) {
        performAction(action, withSender: sender)
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return 1
    }
    
    public func cellForRow(_ row: Int) -> UITableViewCell {
        return cell
    }
    
    public func canEditRow(_ row: Int) -> Bool {
        return canEdit
    }
    
    public func canMoveRow(_ row: Int) -> Bool {
        return canMove
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        commitEditingStyle(editingStyle)
    }
    
}
