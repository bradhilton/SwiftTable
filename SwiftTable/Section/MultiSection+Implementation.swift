//
//  MultiSection+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 9/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension MultiSection {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRow row: Int) {
        delegate(row) { $0.willDisplayCell(cell, forRow: $1) }
    }

    public func didEndDisplayingCell(_ cell: UITableViewCell, forRow row: Int) {
        delegate(row) { $0.didEndDisplayingCell(cell, forRow: $1) }
    }
    
    public func didEndDisplayingHeaderView(_ view: UIView) {}
    public func didEndDisplayingFooterView(_ view: UIView) {}
    
    public func heightForRow(_ row: Int) -> CGFloat {
        return delegate(row) { $0.heightForRow($1) } ?? _table._parent.rowHeight
    }
    
    public func estimatedHeightForRow(_ row: Int) -> CGFloat {
        return delegate(row) { $0.estimatedHeightForRow($1) } ?? _table._parent.estimatedRowHeight
    }
    
    public func accessoryButtonTappedForRow(_ row: Int) {
        delegate(row) { $0.accessoryButtonTappedForRow($1) }
    }
    
    public func shouldHighlightRow(_ row: Int) -> Bool {
        return delegate(row) { $0.shouldHighlightRow($1) } ?? true
    }
    
    public func didHighlightRow(_ row: Int) {
        delegate(row) { $0.didHighlightRow($1) }
    }
    
    public func didUnhighlightRow(_ row: Int) {
        delegate(row) { $0.didUnhighlightRow($1) }
    }
    
    public func willSelectRow(_ row: Int) -> Int? {
        guard let section = sectionForRow(row),
            let relativeRow = section.willSelectRow(rowForSection(section, row: row)) else {
                return row
        }
        return rowFromSection(section, row: relativeRow)
    }
    
    public func willDeselectRow(_ row: Int) -> Int? {
        guard let section = sectionForRow(row),
            let relativeRow = section.willDeselectRow(rowForSection(section, row: row)) else {
                return row
        }
        return rowFromSection(section, row: relativeRow)
    }
    
    public func didSelectRow(_ row: Int) {
        delegate(row) { $0.didSelectRow($1) }
    }
    
    public func didDeselectRow(_ row: Int) {
        delegate(row) { $0.didDeselectRow($1) }
    }
    
    public func editingStyleForRow(_ row: Int) -> UITableViewCellEditingStyle {
        return delegate(row) { $0.editingStyleForRow($1) } ?? .none
    }
    
    public func titleForDeleteConfirmationButtonForRow(_ row: Int) -> String? {
        return delegate(row) { $0.titleForDeleteConfirmationButtonForRow($1) }
    }
    
    public func editActionsForRow(_ row: Int) -> [UITableViewRowAction]? {
        return delegate(row) { $0.editActionsForRow($1) }
    }
    
    public func shouldIndentWhileEditingRow(_ row: Int) -> Bool {
        return delegate(row) { $0.shouldIndentWhileEditingRow($1) } ?? true
    }
    
    public func willBeginEditingRow(_ row: Int) {
        delegate(row) { $0.willBeginEditingRow($1) }
    }
    
    public func didEndEditingRow(_ row: Int?) {
        guard let row = row else { return }
        delegate(row) { $0.didEndEditingRow($1) }
    }
    
    public func targetRowForMoveFromRow(_ sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int {
        guard let source = sectionForRow(sourceRow), source === sectionForRow(proposedDestinationRow) else { return sourceRow }
        return rowFromSection(source, row: source.targetRowForMoveFromRow(rowForSection(source, row: sourceRow), toProposedRow: rowForSection(source, row: proposedDestinationRow)))
    }
    
    public func indentationLevelForRow(_ row: Int) -> Int {
        return delegate(row) { $0.indentationLevelForRow($1) } ?? 0
    }
    
    public func shouldShowMenuForRow(_ row: Int) -> Bool {
        return delegate(row) { $0.shouldShowMenuForRow($1) } ?? false
    }
    
    public func canPerformAction(_ action: Selector, forRow row: Int, withSender sender: Any?) -> Bool {
        return delegate(row) { $0.canPerformAction(action, forRow: $1, withSender: sender) } ?? false
    }
    
    public func performAction(_ action: Selector, forRow row: Int, withSender sender: Any?) {
        delegate(row) { $0.performAction(action, forRow: $1, withSender: sender) }
    }
    
    // Data Source
    
    public var numberOfRows: Int {
        return sections.reduce(0) { $0 + $1.numberOfRows }
    }
    
    public func cellForRow(_ row: Int) -> UITableViewCell {
        return delegate(row) { $0.cellForRow($1) } ?? UITableViewCell()
    }
    
    public func canEditRow(_ row: Int) -> Bool {
        return delegate(row) { $0.canEditRow($1) } ?? false
    }
    
    public func canMoveRow(_ row: Int) -> Bool {
        return delegate(row) { $0.canMoveRow($1) } ?? false
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRow row: Int) {
        delegate(row) { $0.commitEditingStyle(editingStyle, forRow: $1) }
    }
    
    public func moveRow(_ sourceRow: Int, toRow destinationRow: Int) {
        if let source = sectionForRow(sourceRow), source === sectionForRow(destinationRow) {
            source.moveRow(rowForSection(source, row: sourceRow), toRow: rowForSection(source, row: destinationRow))
        }
    }
    
}
