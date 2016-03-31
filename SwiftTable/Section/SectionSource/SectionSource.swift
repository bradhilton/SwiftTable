//
//  SectionSource.swift
//  SwiftTable
//
//  Created by Bradley Hilton on 2/13/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

public protocol SectionSource : _Section {
    
    // Delegate
    
    func willDisplayCell(cell: UITableViewCell, forRow row: Int)
    func willDisplayHeaderView(view: UIView)
    func willDisplayFooterView(view: UIView)
    func didEndDisplayingCell(cell: UITableViewCell, forRow row: Int)
    func didEndDisplayingHeaderView(view: UIView)
    func didEndDisplayingFooterView(view: UIView)
    func heightForRow(row: Int) -> CGFloat
    var heightForHeader: CGFloat { get }
    var heightForFooter: CGFloat { get }
    func estimatedHeightForRow(row: Int) -> CGFloat
    var estimatedHeightForHeader: CGFloat { get }
    var estimatedHeightForFooter: CGFloat { get }
    var viewForHeader: UIView? { get }
    var viewForFooter: UIView? { get }
    func accessoryButtonTappedForRow(row: Int)
    func shouldHighlightRow(row: Int) -> Bool
    func didHighlightRow(row: Int)
    func didUnhighlightRow(row: Int)
    func willSelectRow(row: Int) -> Int?
    func willDeselectRow(row: Int) -> Int?
    func didSelectRow(row: Int)
    func didDeselectRow(row: Int)
    func editingStyleForRow(row: Int) -> UITableViewCellEditingStyle
    func titleForDeleteConfirmationButtonForRow(row: Int) -> String?
    func editActionsForRow(row: Int) -> [UITableViewRowAction]?
    func shouldIndentWhileEditingRow(row: Int) -> Bool
    func willBeginEditingRow(row: Int)
    func didEndEditingRow(row: Int)
    func targetRowForMoveFromRow(sourceRow: Int, toProposedRow proposedDestinationRow: Int) -> Int
    func indentationLevelForRow(row: Int) -> Int
    func shouldShowMenuForRow(row: Int) -> Bool
    func canPerformAction(action: Selector, forRow row: Int, withSender sender: AnyObject?) -> Bool
    func performAction(action: Selector, forRow row: Int, withSender sender: AnyObject?)
    
    // Data Source
    
    var numberOfRows: Int { get }
    func cellForRow(row: Int) -> UITableViewCell
    var titleForHeader: String? { get }
    var titleForFooter: String? { get }
    func canEditRow(row: Int) -> Bool
    func canMoveRow(row: Int) -> Bool
    var sectionIndexTitle: String? { get }
    func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, forRow row: Int)
    func moveRow(sourceRow: Int, toRow destinationRow: Int)
    
}
