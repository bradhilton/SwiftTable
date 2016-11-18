//
//  TableSource+Implementation.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension TableSource {
    
    // Delegate
    
    public func willDisplayCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    public func willDisplayHeaderView(_ view: UIView, forSection section: Int) {}
    public func willDisplayFooterView(_ view: UIView, forSection section: Int) {}
    public func didEndDisplayingCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    public func didEndDisplayingHeaderView(_ view: UIView, forSection section: Int) {}
    public func didEndDisplayingFooterView(_ view: UIView, forSection section: Int) {}
    
    public func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return _parent.rowHeight
    }
    
    public func heightForHeaderInSection(_ section: Int) -> CGFloat {
        return defaultHeightForHeaderInSection(section)
    }
    
    public func heightForFooterInSection(_ section: Int) -> CGFloat {
        return defaultHeightForFooterInSection(section)
    }
    
    public func estimatedHeightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return _parent.estimatedRowHeight
    }
    
    public func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return defaultHeightForHeaderInSection(section)
    }
    
    public func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat {
        return defaultHeightForFooterInSection(section)
    }
    
    func defaultHeightForHeaderInSection(_ section: Int) -> CGFloat {
        return titleForHeaderInSection(section) != nil ? sectionHeightForStyle(_parent.style, header: true) : 0
    }
    
    func defaultHeightForFooterInSection(_ section: Int) -> CGFloat {
        return titleForFooterInSection(section) != nil ? sectionHeightForStyle(_parent.style, header: false) : 0
    }
    
    public func viewForHeaderInSection(_ section: Int) -> UIView? {
        return nil
    }
    
    public func viewForFooterInSection(_ section: Int) -> UIView? {
        return nil
    }
    
    public func accessoryButtonTappedForRowWithIndexPath(_ indexPath: IndexPath) {}
    
    public func shouldHighlightRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func didHighlightRowAtIndexPath(_ indexPath: IndexPath) {}
    public func didUnhighlightRowAtIndexPath(_ indexPath: IndexPath) {}
    
    public func willSelectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    public func willDeselectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    public func didSelectRowAtIndexPath(_ indexPath: IndexPath) {}
    public func didDeselectRowAtIndexPath(_ indexPath: IndexPath) {}
    
    public func editingStyleForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(_ indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    public func editActionsForRowAtIndexPath(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    public func shouldIndentWhileEditingRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func willBeginEditingRowAtIndexPath(_ indexPath: IndexPath) {}
    public func didEndEditingRowAtIndexPath(_ indexPath: IndexPath?) {}
    
    public func targetIndexPathForMoveFromRowAtIndexPath(_ sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath
    }
    
    public func indentationLevelForRowAtIndexPath(_ indexPath: IndexPath) -> Int {
        return 0
    }
    
    public func shouldShowMenuForRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return false
    }
    
    public func canPerformAction(_ action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
    
    public func performAction(_ action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: Any?) {}
    
    // Data Source
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        return 0
    }
    
    public func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public var numberOfSections: Int {
        return 1
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        return nil
    }
    
    public func titleForFooterInSection(_ section: Int) -> String? {
        return nil
    }
    
    public func canEditRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return false
    }
    
    public func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool {
        return false
    }
    
    public var sectionIndexTitles: [String]? {
        return nil
    }
    
    public func sectionForSectionIndexTitle(_ title: String, atIndex index: Int) -> Int {
        return 0
    }
    
    public func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {}
    
    public func moveRowAtIndexPath(_ sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {}
    
}
