//
//  Bridge+Delegate.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/12/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

extension Bridge : UITableViewDelegate {
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        table?.willDisplayCell(cell, forRowAtIndexPath: indexPath)
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        table?.willDisplayHeaderView(view, forSection: section)
    }
    
    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        table?.willDisplayFooterView(view, forSection: section)
    }

    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        table?.didEndDisplayingCell(cell, forRowAtIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        table?.didEndDisplayingHeaderView(view, forSection: section)
    }
    
    func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        table?.didEndDisplayingFooterView(view, forSection: section)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return _table.heightForRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return _table.heightForHeaderInSection(section)
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return _table.heightForFooterInSection(section)
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return _table.estimatedHeightForRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return _table.estimatedHeightForHeaderInSection(section)
    }

    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return _table.estimatedHeightForFooterInSection(section)
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return table?.viewForHeaderInSection(section)
    }

    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return table?.viewForFooterInSection(section)
    }

    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        table?.accessoryButtonTappedForRowWithIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return _table.shouldHighlightRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        table?.didHighlightRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        table?.didUnhighlightRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return table?.willSelectRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return table?.willDeselectRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        table?.didSelectRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        table?.didDeselectRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return _table.editingStyleForRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return table?.titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return table?.editActionsForRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return _table.shouldIndentWhileEditingRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        table?.willBeginEditingRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        table?.didEndEditingRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return _table.targetIndexPathForMoveFromRowAtIndexPath(sourceIndexPath, toProposedIndexPath: proposedDestinationIndexPath)
    }
    
    func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return _table.indentationLevelForRowAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return _table.shouldShowMenuForRowAtIndexPath(indexPath)
    }

    func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return _table.canPerformAction(action, forRowAtIndexPath: indexPath, withSender: sender)
    }

    func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        table?.performAction(action, forRowAtIndexPath: indexPath, withSender: sender)
    }
    
}
