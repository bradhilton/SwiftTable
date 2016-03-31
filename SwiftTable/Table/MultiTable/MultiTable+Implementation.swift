//
//  MultiTable+Source.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension MultiTable {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        delegate(indexPath) { $0.willDisplayCell(cell, forRowAtIndexPath: $1) }
    }
    
    public func willDisplayHeaderView(view: UIView, forSection section: Int) {
        delegate(section) { $0.willDisplayHeaderView(view, forSection: $1) }
    }
    
    public func willDisplayFooterView(view: UIView, forSection section: Int) {
        delegate(section) { $0.willDisplayFooterView(view, forSection: $1) }
    }
    
    public func didEndDisplayingCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didEndDisplayingCell(cell, forRowAtIndexPath: $1) }
    }
    
    public func didEndDisplayingHeaderView(view: UIView, forSection section: Int) {
        delegate(section) { $0.didEndDisplayingHeaderView(view, forSection: $1) }
    }
    
    public func didEndDisplayingFooterView(view: UIView, forSection section: Int) {
        delegate(section) { $0.didEndDisplayingFooterView(view, forSection: $1) }
    }
    
    public func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return delegate(indexPath) { $0.heightForRowAtIndexPath($1) } ?? _parent.rowHeight
    }
    
    public func heightForHeaderInSection(section: Int) -> CGFloat {
        return delegate(section) { $0.heightForHeaderInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func heightForFooterInSection(section: Int) -> CGFloat {
        return delegate(section) { $0.heightForFooterInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return delegate(indexPath) { $0.estimatedHeightForRowAtIndexPath($1) } ?? _parent.estimatedRowHeight
    }
    
    public func estimatedHeightForHeaderInSection(section: Int) -> CGFloat {
        return delegate(section) { $0.estimatedHeightForHeaderInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForFooterInSection(section: Int) -> CGFloat {
        return delegate(section) { $0.estimatedHeightForFooterInSection($1) } ?? defaultHeightForFooterInSection(section)
    }
    
    public func viewForHeaderInSection(section: Int) -> UIView? {
        return delegate(section) { $0.viewForHeaderInSection($1) }
    }
    
    public func viewForFooterInSection(section: Int) -> UIView? {
        return delegate(section) { $0.viewForFooterInSection($1) }
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.accessoryButtonTappedForRowWithIndexPath($1) }
    }
    
    public func shouldHighlightRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldHighlightRowAtIndexPath($1) } ?? true
    }
    
    public func didHighlightRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didHighlightRowAtIndexPath($1) }
    }
    
    public func didUnhighlightRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didUnhighlightRowAtIndexPath($1) }
    }
    
    public func willSelectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        guard let table = tableForSection(indexPath.section),
            relativePath = table.willSelectRowAtIndexPath(indexPathForTable(table, indexPath: indexPath)) else {
                return indexPath
        }
        return indexPathFromTable(table, indexPath: relativePath)
    }
    
    public func willDeselectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        guard let table = tableForSection(indexPath.section),
            relativePath = table.willDeselectRowAtIndexPath(indexPathForTable(table, indexPath: indexPath)) else {
                return indexPath
        }
        return indexPathFromTable(table, indexPath: relativePath)
    }
    
    public func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didSelectRowAtIndexPath($1) }
    }
    
    public func didDeselectRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didDeselectRowAtIndexPath($1) }
    }
    
    public func editingStyleForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return delegate(indexPath) { $0.editingStyleForRowAtIndexPath($1) } ?? .None
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath: NSIndexPath) -> String? {
        return delegate(indexPath) { $0.titleForDeleteConfirmationButtonForRowAtIndexPath($1) }
    }
    
    public func editActionsForRowAtIndexPath(indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return delegate(indexPath) { $0.editActionsForRowAtIndexPath($1) }
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldIndentWhileEditingRowAtIndexPath($1) } ?? true
    }
    
    public func willBeginEditingRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.willBeginEditingRowAtIndexPath($1) }
    }
    
    public func didEndEditingRowAtIndexPath(indexPath: NSIndexPath) {
        delegate(indexPath) { $0.didEndEditingRowAtIndexPath($1) }
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        guard let source = tableForSection(sourceIndexPath.section) where source === tableForSection(proposedDestinationIndexPath.section) else { return sourceIndexPath }
        return indexPathFromTable(source,
            indexPath: source.targetIndexPathForMoveFromRowAtIndexPath(indexPathForTable(source, indexPath: sourceIndexPath), toProposedIndexPath: indexPathForTable(source, indexPath: proposedDestinationIndexPath)))
    }
    
    public func indentationLevelForRowAtIndexPath(indexPath: NSIndexPath) -> Int {
        return delegate(indexPath) { $0.indentationLevelForRowAtIndexPath($1) } ?? 15
    }
    
    public func shouldShowMenuForRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldShowMenuForRowAtIndexPath($1) } ?? false
    }
    
    public func canPerformAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return delegate(indexPath) { $0.canPerformAction(action, forRowAtIndexPath: $1, withSender: sender) } ?? false
    }
    
    public func performAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        delegate(indexPath) { $0.performAction(action, forRowAtIndexPath: $1, withSender: sender) }
    }
    
    // Data Source
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return delegate(section) { $0.numberOfRowsInSection($1) } ?? 0
    }
    
    public func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        return delegate(indexPath) { $0.cellForRowAtIndexPath($1) } ?? UITableViewCell()
    }
    
    public var numberOfSections: Int {
        return tables.reduce(0) { $0 + $1.numberOfSections }
    }
    
    public func titleForHeaderInSection(section: Int) -> String? {
        return delegate(section) { $0.titleForHeaderInSection($1) }
    }
    
    public func titleForFooterInSection(section: Int) -> String? {
        return delegate(section) { $0.titleForFooterInSection($1) }
    }
    
    public func canEditRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return delegate(indexPath) { $0.canEditRowAtIndexPath($1) } ?? false
    }
    
    public func canMoveRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return delegate(indexPath) { $0.canMoveRowAtIndexPath($1) } ?? false
    }
    
    public var sectionIndexTitles: [String]? {
        let sectionIndexTitles = tables.reduce([String]()) {
            $0 + ($1.sectionIndexTitles ?? [])
        }
        return sectionIndexTitles.count > 0 ? sectionIndexTitles : nil
    }
    
    public func sectionForSectionIndexTitle(title: String, atIndex index: Int) -> Int {
        guard let source = tableForSectionTitleAtIndex(index) else { return 0 }
        return source.sectionForSectionIndexTitle(title, atIndex: index) + sectionOffsetForTable(source)
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        delegate(indexPath) { $0.commitEditingStyle(editingStyle, forRowAtIndexPath: $1) }
    }
    
    public func moveRowAtIndexPath(sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        if let source = tableForSection(sourceIndexPath.section) where source === tableForSection(destinationIndexPath.section) {
            source.moveRowAtIndexPath(indexPathForTable(source, indexPath: sourceIndexPath), toIndexPath: indexPathForTable(source, indexPath: destinationIndexPath))
        }
    }
    
}
