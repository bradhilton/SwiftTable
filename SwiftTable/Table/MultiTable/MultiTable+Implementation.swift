//
//  MultiTable+Source.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension MultiTable {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        delegate(indexPath) { $0.willDisplayCell(cell, forRowAtIndexPath: $1) }
    }
    
    public func willDisplayHeaderView(_ view: UIView, forSection section: Int) {
        delegate(section) { $0.willDisplayHeaderView(view, forSection: $1) }
    }
    
    public func willDisplayFooterView(_ view: UIView, forSection section: Int) {
        delegate(section) { $0.willDisplayFooterView(view, forSection: $1) }
    }
    
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        delegate(indexPath) { $0.didEndDisplayingCell(cell, forRowAtIndexPath: $1) }
    }
    
    public func didEndDisplayingHeaderView(_ view: UIView, forSection section: Int) {
        delegate(section) { $0.didEndDisplayingHeaderView(view, forSection: $1) }
    }
    
    public func didEndDisplayingFooterView(_ view: UIView, forSection section: Int) {
        delegate(section) { $0.didEndDisplayingFooterView(view, forSection: $1) }
    }
    
    public func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return delegate(indexPath) { $0.heightForRowAtIndexPath($1) } ?? _parent.rowHeight
    }
    
    public func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return delegate(section) { $0.heightForHeaderInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func heightForFooterInSection(_ section: Int) -> CGFloat {
        return delegate(section) { $0.heightForFooterInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return delegate(indexPath) { $0.estimatedHeightForRowAtIndexPath($1) } ?? _parent.estimatedRowHeight
    }
    
    public func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return delegate(section) { $0.estimatedHeightForHeaderInSection($1) } ?? defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        return delegate(section) { $0.estimatedHeightForFooterInSection($1) } ?? defaultHeightForFooterInSection(section)
    }
    
    public func viewForHeaderInSection(_ section: Int) -> UIView? {
        return delegate(section) { $0.viewForHeaderInSection($1) }
    }
    
    public func viewForFooterInSection(_ section: Int) -> UIView? {
        return delegate(section) { $0.viewForFooterInSection($1) }
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.accessoryButtonTappedForRowWithIndexPath($1) }
    }
    
    public func shouldHighlightRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldHighlightRowAtIndexPath($1) } ?? true
    }
    
    public func didHighlightRowAtIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.didHighlightRowAtIndexPath($1) }
    }
    
    public func didUnhighlightRowAtIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.didUnhighlightRowAtIndexPath($1) }
    }
    
    public func willSelectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        guard let table = tableForSection(indexPath.section),
            let relativePath = table.willSelectRowAtIndexPath(indexPathForTable(table, indexPath: indexPath)) else {
                return indexPath
        }
        return indexPathFromTable(table, indexPath: relativePath)
    }
    
    public func willDeselectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        guard let table = tableForSection(indexPath.section),
            let relativePath = table.willDeselectRowAtIndexPath(indexPathForTable(table, indexPath: indexPath)) else {
                return indexPath
        }
        return indexPathFromTable(table, indexPath: relativePath)
    }
    
    public func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.didSelectRowAtIndexPath($1) }
    }
    
    public func didDeselectRowAtIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.didDeselectRowAtIndexPath($1) }
    }
    
    public func editingStyleForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return delegate(indexPath) { $0.editingStyleForRowAtIndexPath($1) } ?? .none
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        return delegate(indexPath) { $0.titleForDeleteConfirmationButtonForRowAtIndexPath($1) }
    }
    
    public func editActionsForRowAtIndexPath(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
        return delegate(indexPath) { $0.editActionsForRowAtIndexPath($1) }
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldIndentWhileEditingRowAtIndexPath($1) } ?? true
    }
    
    public func willBeginEditingRowAtIndexPath(_ indexPath: IndexPath) {
        delegate(indexPath) { $0.willBeginEditingRowAtIndexPath($1) }
    }
    
    public func didEndEditingRowAtIndexPath(_ indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        delegate(indexPath) { $0.didEndEditingRowAtIndexPath($1) }
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(_ sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        guard let source = tableForSection(sourceIndexPath.section), source === tableForSection(proposedDestinationIndexPath.section) else { return sourceIndexPath }
        return indexPathFromTable(source,
            indexPath: source.targetIndexPathForMoveFromRowAtIndexPath(indexPathForTable(source, indexPath: sourceIndexPath), toProposedIndexPath: indexPathForTable(source, indexPath: proposedDestinationIndexPath)))
    }
    
    public func indentationLevelForRowAtIndexPath(_ indexPath: IndexPath) -> Int {
        return delegate(indexPath) { $0.indentationLevelForRowAtIndexPath($1) } ?? 15
    }
    
    public func shouldShowMenuForRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return delegate(indexPath) { $0.shouldShowMenuForRowAtIndexPath($1) } ?? false
    }
    
    // Data Source
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        return delegate(section) { $0.numberOfRowsInSection($1) } ?? 0
    }
    
    public func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        return delegate(indexPath) { $0.cellForRowAtIndexPath($1) } ?? UITableViewCell()
    }
    
    public var numberOfSections: Int {
        return tables.reduce(0) { $0 + $1.numberOfSections }
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        return delegate(section) { $0.titleForHeaderInSection($1) }
    }
    
    public func titleForFooterInSection(_ section: Int) -> String? {
        return delegate(section) { $0.titleForFooterInSection($1) }
    }
    
    public func canEditRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return delegate(indexPath) { $0.canEditRowAtIndexPath($1) } ?? false
    }
    
    public func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return delegate(indexPath) { $0.canMoveRowAtIndexPath($1) } ?? false
    }
    
    public var sectionIndexTitles: [String]? {
        let sectionIndexTitles = tables.reduce([String]()) {
            $0 + ($1.sectionIndexTitles ?? [])
        }
        return sectionIndexTitles.count > 0 ? sectionIndexTitles : nil
    }
    
    public func sectionForSectionIndexTitle(_ title: String, atIndex index: Int) -> Int {
        guard let source = tableForSectionTitleAtIndex(index) else { return 0 }
        return source.sectionForSectionIndexTitle(title, atIndex: index) + sectionOffsetForTable(source)
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        delegate(indexPath) { $0.commitEditingStyle(editingStyle, forRowAtIndexPath: $1) }
    }
    
    public func moveRowAtIndexPath(_ sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {
        if let source = tableForSection(sourceIndexPath.section), source === tableForSection(destinationIndexPath.section) {
            source.moveRowAtIndexPath(indexPathForTable(source, indexPath: sourceIndexPath), toIndexPath: indexPathForTable(source, indexPath: destinationIndexPath))
        }
    }
    
}
