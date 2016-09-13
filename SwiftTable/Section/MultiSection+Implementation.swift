//
//  MultiSection+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 9/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import AssociatedValues

extension MultiSection {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRow row: Int) {
        delegate(row) { $0.willDisplayCell(cell, forRow: $1) }
    }

    public func didEndDisplayingCell(cell: UITableViewCell, forRow row: Int) {
        delegate(row) { $0.didEndDisplayingCell(cell, forRow: $1) }
    }
    
    public func didEndDisplayingHeaderView(view: UIView) {}
    public func didEndDisplayingFooterView(view: UIView) {}
    
    public func heightForRow(row: Int) -> CGFloat {
        return delegate(row) { $0.heightForRow($1) } ?? _table._parent.rowHeight
    }
    
    public func estimatedHeightForRow(row: Int) -> CGFloat {
        return delegate(row) { $0.estimatedHeightForRow($1) } ?? _table._parent.estimatedRowHeight
    }
    
    public func accessoryButtonTappedForRow(row: Int) {
        delegate(row) { $0.accessoryButtonTappedForRow($1) }
    }
    
    public func shouldHighlightRow(row: Int) -> Bool {
        return delegate(row) { $0.shouldHighlightRow($1) } ?? true
    }
    
    public func didHighlightRow(row: Int) {
        delegate(row) { $0.didHighlightRow($1) }
    }
    
    public func didUnhighlightRow(row: Int) {
        delegate(row) { $0.didUnhighlightRow($1) }
    }
    
    public func willSelectRow(row: Int) -> Int? {
        return delegate(row) { $0.willSelectRow($1) }
    }
    
    public func willDeselectRow(row: Int) -> Int? {
        return delegate(row) { $0.willDeselectRow($1) }
    }
    
    public func didSelectRow(row: Int) {
        delegate(row) { $0.didSelectRow($1) }
    }
    
    public func didDeselectRow(row: Int) {
        delegate(row) { $0.didDeselectRow($1) }
    }
    
    public func editingStyleForRow(row: Int) -> UITableViewCellEditingStyle {
        return delegate(row) { $0.editingStyleForRow($1) } ?? .None
    }
    
    public func titleForDeleteConfirmationButtonForRow(row: Int) -> String? {
        return delegate(row) { $0.titleForDeleteConfirmationButtonForRow($1) }
    }
    
    public func editActionsForRow(row: Int) -> [UITableViewRowAction]? {
        return delegate(row) { $0.editActionsForRow($1) }
    }
    
    public func shouldIndentWhileEditingRow(row: Int) -> Bool {
        return delegate(row) { $0.shouldIndentWhileEditingRow($1) } ?? true
    }
    
    public func willBeginEditingRow(row: Int) {
        delegate(row) { $0.willBeginEditingRow($1) }
    }
    
    public func didEndEditingRow(row: Int) {
        delegate(row) { $0.didEndEditingRow($1) }
    }
    
    public func targetRowForMoveFromRow(sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int {
        guard let source = sectionForRow(sourceRow) where source === sectionForRow(proposedDestinationRow) else { return sourceRow }
        return rowFromSection(source, row: source.targetRowForMoveFromRow(rowForSection(source, row: sourceRow), toProposedRow: rowForSection(source, row: proposedDestinationRow)))
    }
    
    public func indentationLevelForRow(row: Int) -> Int {
        return delegate(row) { $0.indentationLevelForRow($1) } ?? 0
    }
    
    public func shouldShowMenuForRow(row: Int) -> Bool {
        return delegate(row) { $0.shouldShowMenuForRow($1) } ?? false
    }
    
    public func canPerformAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) -> Bool {
        return delegate(row) { $0.canPerformAction(action, forRow: $1, withSender: sender) } ?? false
    }
    
    public func performAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) {
        delegate(row) { $0.performAction(action, forRow: $1, withSender: sender) }
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return sections.reduce(0) { $0 + $1.numberOfRows }
    }
    
    public func cellForRow(row: Int) -> UITableViewCell {
        return delegate(row) { $0.cellForRow($1) } ?? UITableViewCell()
    }
    
    public func canEditRow(row: Int) -> Bool {
        return delegate(row) { $0.canEditRow($1) } ?? false
    }
    
    public func canMoveRow(row: Int) -> Bool {
        return delegate(row) { $0.canMoveRow($1) } ?? false
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        delegate(row) { $0.commitEditingStyle(editingStyle, forRow: $1) }
    }
    
    public func moveRow(sourceRow: Int, toRow destinationRow: Int) {
        if let source = sectionForRow(sourceRow) where source === sectionForRow(destinationRow) {
            source.moveRow(rowForSection(source, row: sourceRow), toRow: rowForSection(source, row: destinationRow))
        }
    }
    
}
