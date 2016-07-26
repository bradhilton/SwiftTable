//
//  TableSource+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension TableSource {
    
    // Delegate
    
    public func willDisplayCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {}
    public func willDisplayHeaderView(view: UIView, forSection section: Int) {}
    public func willDisplayFooterView(view: UIView, forSection section: Int) {}
    public func didEndDisplayingCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {}
    public func didEndDisplayingHeaderView(view: UIView, forSection section: Int) {}
    public func didEndDisplayingFooterView(view: UIView, forSection section: Int) {}
    
    public func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return _parent.rowHeight
    }
    
    public func heightForHeaderInSection(section: Int) -> CGFloat {
        return defaultHeightForHeaderInSection(section)
    }
    
    public func heightForFooterInSection(section: Int) -> CGFloat {
        return defaultHeightForFooterInSection(section)
    }
    
    public func estimatedHeightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat {
        return _parent.estimatedRowHeight
    }
    
    public func estimatedHeightForHeaderInSection(section: Int) -> CGFloat {
        return defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForFooterInSection(section: Int) -> CGFloat {
        return defaultHeightForFooterInSection(section)
    }
    
    func defaultHeightForHeaderInSection(section: Int) -> CGFloat {
        return titleForHeaderInSection(section) != nil ? sectionHeightForStyle(_parent.style, header: true) : 0
    }
    
    func defaultHeightForFooterInSection(section: Int) -> CGFloat {
        return titleForFooterInSection(section) != nil ? sectionHeightForStyle(_parent.style, header: false) : 0
    }
    
    public func viewForHeaderInSection(section: Int) -> UIView? {
        return nil
    }
    
    public func viewForFooterInSection(section: Int) -> UIView? {
        return nil
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(indexPath: NSIndexPath) {}
    
    public func shouldHighlightRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func didHighlightRowAtIndexPath(indexPath: NSIndexPath) {}
    public func didUnhighlightRowAtIndexPath(indexPath: NSIndexPath) {}
    
    public func willSelectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    public func willDeselectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    public func didSelectRowAtIndexPath(indexPath: NSIndexPath) {}
    public func didDeselectRowAtIndexPath(indexPath: NSIndexPath) {}
    
    public func editingStyleForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath: NSIndexPath) -> String? {
        return "Delete"
    }
    
    public func editActionsForRowAtIndexPath(indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func willBeginEditingRowAtIndexPath(indexPath: NSIndexPath) {}
    public func didEndEditingRowAtIndexPath(indexPath: NSIndexPath) {}
    
    public func targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return proposedDestinationIndexPath
    }
    
    public func indentationLevelForRowAtIndexPath(indexPath: NSIndexPath) -> Int {
        return 0
    }
    
    public func shouldShowMenuForRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func canPerformAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    public func performAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {}
    
    // Data Source
    
    public func numberOfRowsInSection(section: Int) -> Int {
        return 0
    }
    
    public func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public var numberOfSections: Int {
        return 1
    }
    
    public func titleForHeaderInSection(section: Int) -> String? {
        return nil
    }
    
    public func titleForFooterInSection(section: Int) -> String? {
        return nil
    }
    
    public func canEditRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func canMoveRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public var sectionIndexTitles: [String]? {
        return nil
    }
    
    public func sectionForSectionIndexTitle(title: String, atIndex index: Int) -> Int {
        return 0
    }
    
    public func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func moveRowAtIndexPath(sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {}
    
}
