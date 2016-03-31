//
//  TableSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol TableSource : _Table {
    
    // Delegate
    
    func willDisplayCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    func willDisplayHeaderView(view: UIView, forSection section: Int)
    func willDisplayFooterView(view: UIView, forSection section: Int)
    func didEndDisplayingCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    func didEndDisplayingHeaderView(view: UIView, forSection section: Int)
    func didEndDisplayingFooterView(view: UIView, forSection section: Int)
    func heightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat
    func heightForHeaderInSection(section: Int) -> CGFloat
    func heightForFooterInSection(section: Int) -> CGFloat
    func estimatedHeightForRowAtIndexPath(indexPath: NSIndexPath) -> CGFloat
    func estimatedHeightForHeaderInSection(section: Int) -> CGFloat
    func estimatedHeightForFooterInSection(section: Int) -> CGFloat
    func viewForHeaderInSection(section: Int) -> UIView?
    func viewForFooterInSection(section: Int) -> UIView?
    func accessoryButtonTappedForRowWithIndexPath(indexPath: NSIndexPath)
    func shouldHighlightRowAtIndexPath(indexPath: NSIndexPath) -> Bool
    func didHighlightRowAtIndexPath(indexPath: NSIndexPath)
    func didUnhighlightRowAtIndexPath(indexPath: NSIndexPath)
    func willSelectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath?
    func willDeselectRowAtIndexPath(indexPath: NSIndexPath) -> NSIndexPath?
    func didSelectRowAtIndexPath(indexPath: NSIndexPath)
    func didDeselectRowAtIndexPath(indexPath: NSIndexPath)
    func editingStyleForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCellEditingStyle
    func titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath: NSIndexPath) -> String?
    func editActionsForRowAtIndexPath(indexPath: NSIndexPath) -> [UITableViewRowAction]?
    func shouldIndentWhileEditingRowAtIndexPath(indexPath: NSIndexPath) -> Bool
    func willBeginEditingRowAtIndexPath(indexPath: NSIndexPath)
    func didEndEditingRowAtIndexPath(indexPath: NSIndexPath)
    func targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
    func indentationLevelForRowAtIndexPath(indexPath: NSIndexPath) -> Int
    func shouldShowMenuForRowAtIndexPath(indexPath: NSIndexPath) -> Bool
    func canPerformAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
    func performAction(action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
    
    // Data Source
    
    func numberOfRowsInSection(section: Int) -> Int
    func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell
    var numberOfSections: Int { get }
    func titleForHeaderInSection(section: Int) -> String?
    func titleForFooterInSection(section: Int) -> String?
    func canEditRowAtIndexPath(indexPath: NSIndexPath) -> Bool
    func canMoveRowAtIndexPath(indexPath: NSIndexPath) -> Bool
    var sectionIndexTitles: [String]? { get }
    func sectionForSectionIndexTitle(title: String, atIndex index: Int) -> Int
    func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    func moveRowAtIndexPath(sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    
}