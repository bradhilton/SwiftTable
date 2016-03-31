//
//  SectionTable+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension SectionTable {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        sections[indexPath.section].willDisplayCell(cell, forRow: indexPath.row)
    }
    
    public func willDisplayHeaderView(view: UIView, forSection section: Int) {
        sections[section].willDisplayHeaderView(view)
    }
    
    public func willDisplayFooterView(view: UIView, forSection section: Int) {
        sections[section].willDisplayFooterView(view)
    }
    
    public func didEndDisplayingCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        sections[indexPath.section].didEndDisplayingCell(cell, forRow: indexPath.row)
    }
    
    public func didEndDisplayingHeaderView(view: UIView, forSection section: Int) {
        sections[section].didEndDisplayingHeaderView(view)
    }
    
    public func didEndDisplayingFooterView(view: UIView, forSection section: Int) {
        sections[section].didEndDisplayingFooterView(view)
    }
    
    public func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return sections[indexPath.section].heightForRow(indexPath.row)
    }
    
    public func heightForHeaderInSection(section: Int) -> CGFloat {
        return sections[section].heightForHeader
    }
    
    public func heightForFooterInSection(section: Int) -> CGFloat {
        return sections[section].heightForFooter
    }
    
    public func estimatedHeightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return sections[indexPath.section].estimatedHeightForRow(indexPath.row)
    }
    
    public func estimatedHeightForHeaderInSection(section: Int) -> CGFloat {
        return sections[section].estimatedHeightForHeader
    }
    
    public func estimatedHeightForFooterInSection(section: Int) -> CGFloat {
        return sections[section].estimatedHeightForFooter
    }
    
    public func viewForHeaderInSection(section: Int) -> UIView? {
        return sections[section].viewForHeader
    }
    
    public func viewForFooterInSection(section: Int) -> UIView? {
        return sections[section].viewForFooter
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(indexPath: NSIndexPath) {
        sections[indexPath.section].accessoryButtonTappedForRow(indexPath.row)
    }
    
    public func shouldHighlightRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].shouldHighlightRow(indexPath.row)
    }
    
    public func didHighlightRowAtIndexPath(indexPath: NSIndexPath) {
        return sections[indexPath.section].didHighlightRow(indexPath.row)
    }
    
    public func didUnhighlightRowAtIndexPath(indexPath: NSIndexPath) {
        return sections[indexPath.section].didUnhighlightRow(indexPath.row)
    }
    
    public func willSelectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return NSIndexPath(forRow: sections[indexPath.section].willSelectRow(indexPath.row), inSection: indexPath.section)
    }
    
    public func willDeselectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return NSIndexPath(forRow: sections[indexPath.section].willDeselectRow(indexPath.row), inSection: indexPath.section)
    }
    
    public func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        sections[indexPath.section].didSelectRow(indexPath.row)
    }
    
    public func didDeselectRowAtIndexPath(indexPath: NSIndexPath) {
        sections[indexPath.section].didDeselectRow(indexPath.row)
    }
    
    public func editingStyleForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return sections[indexPath.section].editingStyleForRow(indexPath.row)
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath: NSIndexPath) -> String? {
        return sections[indexPath.section].titleForDeleteConfirmationButtonForRow(indexPath.row)
    }
    
    public func editActionsForRowAtIndexPath(indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return sections[indexPath.section].editActionsForRow(indexPath.row)
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].shouldIndentWhileEditingRow(indexPath.row)
    }
    
    public func willBeginEditingRowAtIndexPath(indexPath: NSIndexPath) {
        sections[indexPath.section].willBeginEditingRow(indexPath.row)
    }
    
    public func didEndEditingRowAtIndexPath(indexPath: NSIndexPath) {
        sections[indexPath.section].didEndEditingRow(indexPath.row)
    }
    
    public func targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        guard sourceIndexPath.section == proposedDestinationIndexPath.section else { return sourceIndexPath }
        return NSIndexPath(forRow: sections[sourceIndexPath.section].targetRowForMoveFromRow(sourceIndexPath.row, toProposedRow: proposedDestinationIndexPath.row), inSection: sourceIndexPath.section)
    }
    
    public func indentationLevelForRowAtIndexPath(indexPath: NSIndexPath) -> Int {
        return sections[indexPath.section].indentationLevelForRow(indexPath.row)
    }
    
    public func shouldShowMenuForRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].shouldShowMenuForRow(indexPath.row)
    }
    
    public func canPerformAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return sections[indexPath.section].canPerformAction(action, forRow: indexPath.row, withSender: sender)
    }
    
    public func performAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        sections[indexPath.section].performAction(action, forRow: indexPath.row, withSender: sender)
    }
    
    // Data Source
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    public func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        return sections[indexPath.section].cellForRow(indexPath.row)
    }
    
    public var numberOfSections: Int {
        return sections.count
    }
    
    public func titleForHeaderInSection(section: Int) -> String? {
        return sections[section].titleForHeader
    }
    
    public func titleForFooterInSection(section: Int) -> String? {
        return sections[section].titleForFooter
    }
    
    public func canEditRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].canEditRow(indexPath.row)
    }
    
    public func canMoveRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return sections[indexPath.section].canMoveRow(indexPath.row)
    }
    
    public var sectionIndexTitles: [String]? {
        let sectionIndexTitles = sections.flatMap { $0.sectionIndexTitle }
        return sectionIndexTitles.count > 0 ? sectionIndexTitles : nil
    }
    
    public func sectionForSectionIndexTitle(title: String, atIndex index: Int) -> Int {
        return (0..<sections.count).filter({ sections[$0].sectionIndexTitle != nil })[index]
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        sections[indexPath.section].commitEditingStyle(editingStyle, forRow: indexPath.row)
    }
    
    public func moveRowAtIndexPath(sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        guard sourceIndexPath.section == destinationIndexPath.section else { return }
        sections[sourceIndexPath.section].moveRow(sourceIndexPath.row, toRow: destinationIndexPath.row)
    }
    
}
