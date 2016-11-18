//
//  TableSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol TableSource : _Table {
    
    // Delegate
    
    func willDisplayCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath)
    func willDisplayHeaderView(_ view: UIView, forSection section: Int)
    func willDisplayFooterView(_ view: UIView, forSection section: Int)
    func didEndDisplayingCell(_ cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath)
    func didEndDisplayingHeaderView(_ view: UIView, forSection section: Int)
    func didEndDisplayingFooterView(_ view: UIView, forSection section: Int)
    func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat
    func heightForHeaderInSection(_ section: Int) -> CGFloat
    func heightForFooterInSection(_ section: Int) -> CGFloat
    func estimatedHeightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat
    func estimatedHeightForHeaderInSection(_ section: Int) -> CGFloat
    func estimatedHeightForFooterInSection(_ section: Int) -> CGFloat
    func viewForHeaderInSection(_ section: Int) -> UIView?
    func viewForFooterInSection(_ section: Int) -> UIView?
    func accessoryButtonTappedForRowWithIndexPath(_ indexPath: IndexPath)
    func shouldHighlightRowAtIndexPath(_ indexPath: IndexPath) -> Bool
    func didHighlightRowAtIndexPath(_ indexPath: IndexPath)
    func didUnhighlightRowAtIndexPath(_ indexPath: IndexPath)
    func willSelectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath?
    func willDeselectRowAtIndexPath(_ indexPath: IndexPath) -> IndexPath?
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
    func didDeselectRowAtIndexPath(_ indexPath: IndexPath)
    func editingStyleForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCellEditingStyle
    func titleForDeleteConfirmationButtonForRowAtIndexPath(_ indexPath: IndexPath) -> String?
    func editActionsForRowAtIndexPath(_ indexPath: IndexPath) -> [UITableViewRowAction]?
    func shouldIndentWhileEditingRowAtIndexPath(_ indexPath: IndexPath) -> Bool
    func willBeginEditingRowAtIndexPath(_ indexPath: IndexPath)
    func didEndEditingRowAtIndexPath(_ indexPath: IndexPath?)
    func targetIndexPathForMoveFromRowAtIndexPath(_ sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath
    func indentationLevelForRowAtIndexPath(_ indexPath: IndexPath) -> Int
    func shouldShowMenuForRowAtIndexPath(_ indexPath: IndexPath) -> Bool
    func canPerformAction(_ action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: Any?) -> Bool
    func performAction(_ action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: Any?)
    
    // Data Source
    
    func numberOfRowsInSection(_ section: Int) -> Int
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell
    var numberOfSections: Int { get }
    func titleForHeaderInSection(_ section: Int) -> String?
    func titleForFooterInSection(_ section: Int) -> String?
    func canEditRowAtIndexPath(_ indexPath: IndexPath) -> Bool
    func canMoveRowAtIndexPath(_ indexPath: IndexPath) -> Bool
    var sectionIndexTitles: [String]? { get }
    func sectionForSectionIndexTitle(_ title: String, atIndex index: Int) -> Int
    func commitEditingStyle(_ editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath)
    func moveRowAtIndexPath(_ sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath)
    
}
